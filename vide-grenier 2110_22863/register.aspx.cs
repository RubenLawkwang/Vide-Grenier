using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Net.Configuration;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Xml.Linq;

namespace vide_grenier_2110_22863
{
    public partial class register : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"]
.ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                rvdob.MaximumValue = DateTime.Now.AddYears(-18).ToShortDateString();
                rvdob.MinimumValue = DateTime.Now.AddYears(-45).ToShortDateString();
                rvdob.Type = ValidationDataType.Date;
                // invoke the getCountry method
                getCountry();
                // Insert a default item in Dropdown
                ListItem LI = new ListItem("Select Location", "-1");
                ddlDistrict.Items.Insert(0, LI);

            }



        }

        public void getCountry()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tbllocation";
            cmd.Connection = con;
            //Create DataAdapter
            SqlDataAdapter dad = new SqlDataAdapter(cmd);
            //Create a Datatable or a DataSet
            DataTable dt = new DataTable();
            //Fill the Dataset and ensure the DB Connection is closed
            using (dad)
            {
                dad.Fill(dt);
            }
            //To load country names in dropdown
            ddlDistrict.DataSource = dt;
            //assign a field name and id to ddl
            ddlDistrict.DataTextField = "District_name";
            ddlDistrict.DataValueField = "Loc_id";
            ddlDistrict.DataBind();
        }

        protected void lnkexit_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/home.aspx");
        }


        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length >= 7 && args.Value.Length <= 12)
                args.IsValid = true;
            else
                args.IsValid = false;
        }


        //check file format before uploading
        bool CheckFileType(string fileName)
        {
            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".gif":
                    return true;
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                default:
                    return false;
            }

        }
        public string Encrypt(string clearText)
        {
            // defining encrytion key
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new
                byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    // encoding using key
                    using (CryptoStream cs = new CryptoStream(ms,
                    encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        private void sendemail()
        {
            SmtpSection smtpSection =
            (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            using (MailMessage m = new MailMessage(smtpSection.From,txtEmail.Text.Trim()))
            {
                SmtpClient sc = new SmtpClient();
                try
                {
                    m.Subject = "Welcome to vide grenier";
                    m.IsBodyHtml = true;
                    StringBuilder msgBody = new StringBuilder();
                    msgBody.Append("Dear " + txtUname.Text + ", your registration is                  successful, thank you for signing up on videgrenier.");
                    //msgBody.Append(txtbody.Text.Trim());
                    msgBody.Append("<a href='https://" +
                    HttpContext.Current.Request.Url.Authority + "/uc/login'>Click               here to login to...</ a > ");
                    m.Body = msgBody.ToString();
                    sc.Host = smtpSection.Network.Host;
                    sc.EnableSsl = smtpSection.Network.EnableSsl;
                    NetworkCredential networkCred = new
                    NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                    sc.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                    sc.Credentials = networkCred;
                    sc.Port = smtpSection.Network.Port;
                    sc.Send(m);
                    Response.Write("Email Sent successfully");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void btnregister_Click1(object sender, EventArgs e)
        {
           
            string filen = "dprofile.png";
            //Check whether the fileupload contains a file
            if (profilepic.HasFile)
            {
                if (CheckFileType(profilepic.FileName))
                {
                    filen = Path.GetFileName(profilepic.PostedFile.FileName);
                    profilepic.PostedFile.SaveAs(Server.MapPath("~/image/") +
                    filen);
                }
            }
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            //create a parameterized query for the username
            //search for username from tbluser
            cmd.CommandText = "select * from tblUsers where U_username=@un";
            cmd.Parameters.AddWithValue("@un", txtUname.Text.Trim());
            //Create DataReader
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            //Check if username already exists in the DB
            if (dr.HasRows)
            {
                lblMsg.Text = "Username Already Exist, Please Choose Another";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                txtFname.Focus();
            }
            else
            {
                //Ensure the DataReader is closed
                dr.Close();
                string strDate = txtdob.Text;
                //DateTime dt = Convert.ToDateTime(strDate);
                // Create another Command object for the insert statement
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandText = "insert into tblUsers(U_fname, U_lname, U_dob, U_address, U_email, U_phone_number, U_username, U_password, U_profile_img, U_status, Loc_id) values(@ufname, @ulname, @udob, @uadd, @uemail, @upn, @usern, @upass, @up, @status, @location)";
                cmd1.Parameters.AddWithValue("@ufname", txtFname.Text);
                cmd1.Parameters.AddWithValue("@ulname", txtLname.Text);

                //retrieve the country dropdown list value
                cmd1.Parameters.AddWithValue("@udob", strDate);
                cmd1.Parameters.AddWithValue("@uadd", txtAddress.Text);
                cmd1.Parameters.AddWithValue("@uemail", txtEmail.Text);
                cmd1.Parameters.AddWithValue("@upn", txtmob.Text);

                cmd1.Parameters.AddWithValue("@usern", txtUname.Text);



                //add a method to encrypt your password
                cmd1.Parameters.AddWithValue("@upass", Encrypt(txtpassword.Text));
                cmd1.Parameters.AddWithValue("@up", filen);
                //set the status to active or inactive
                cmd1.Parameters.AddWithValue("@status", 1);
                cmd1.Parameters.AddWithValue("@location", ddlDistrict.SelectedValue);
                cmd1.CommandType = CommandType.Text;

                cmd1.ExecuteNonQuery();
                //call the sendemail method
                sendemail();
                Response.Redirect("~/uc/login.aspx");
                con.Close();
            }
            



        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            txtFname.Text = "";
            txtLname.Text = "";
        }
    }

}