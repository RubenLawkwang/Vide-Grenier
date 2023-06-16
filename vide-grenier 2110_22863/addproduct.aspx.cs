using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static System.Net.WebRequestMethods;

namespace vide_grenier_2110_22863
{ 
    public partial class addproduct : System.Web.UI.Page
    {

        private string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"].ConnectionString;





        protected void Page_Load(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(Convert.ToString(Session["U_username"])))
            {
                Response.Redirect("~/uc/login.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
            }

            else { 

            if (!Page.IsPostBack)
            {
                BindCategory();

                ListItem li = new ListItem("Select Category", "-1");
                ddlcat.Items.Insert(0, li);

                }
            }
        }

        protected void btnAddProd_Click(object sender, EventArgs e)
        {
            try { 
            String filen = "dproduct.png";
            //check if the fileupload contains a file before uploading
            if (fupimage.HasFile)
            {
                filen = Path.GetFileName(fupimage.PostedFile.FileName);
                fupimage.PostedFile.SaveAs(Server.MapPath("~/image/") + filen);
            }

            //check if the fileupload contains a file before uploading
            /*if (fuschedule.HasFile)
            {
                fileshe = Path.GetFileName(fuschedule.PostedFile.FileName);
                fuschedule.PostedFile.SaveAs(Server.MapPath("~/images/") +
                fileshe);
            }*/
            Boolean IsAdded = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //add INSERT statement to create new movie
            cmd.CommandText = "insert into tblProduct (P_name ,P_brand , P_status, P_image , P_expired_date, P_cost, P_description, Category_cat_id, Users_user_id)  values (@pname,@pbrand,@pstatus, @pimage,@pexdate,@pcost, @pdescription, @catid, @uid)";
         
            //create Parameterized query to prevent sql injection by
            cmd.Parameters.AddWithValue("@pname", txtProdName.Text.Trim());
            cmd.Parameters.AddWithValue("@pdescription", txtProdDesc.Text.Trim());
            cmd.Parameters.AddWithValue("@pbrand", txtpBrand.Text.Trim());
            cmd.Parameters.AddWithValue("@pcost", txtPprice.Text.Trim());
            cmd.Parameters.AddWithValue("@pexdate", txtexdate.Text.Trim());
            cmd.Parameters.AddWithValue("@pstatus", pcheck.Checked);
            cmd.Parameters.AddWithValue("@pimage", filen);
            cmd.Parameters.AddWithValue("@catid", ddlcat.SelectedValue);
            cmd.Parameters.AddWithValue("@uid", Session["User_id"]);

                cmd.Connection = con;
            con.Open();
            //use Command method to execute INSERT statement and return
            //Boolean true if number of records inserted is greater than zero
            IsAdded = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsAdded)
            {
                lblMsg.Text = txtProdName.Text + " product added successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindMovieData()
                //BindproductData();
            }
            else
            {
                lblMsg.Text = "Error while adding product " + txtProdName.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
                //ResetAll();
            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);
                
            }

        }


        private void BindCategory()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblCategory";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a DataTable
            DataTable dt = new DataTable();
            using (da)
            {
                //Populate the DataTable
                da.Fill(dt);
            }
            //Set the DataTable as the DataSource
            ddlcat.DataSource = dt;
            //assign the FIELD values to the dropdown
            ddlcat.DataTextField = "Cat_type";
            ddlcat.DataValueField = "Cat_id";
            ddlcat.DataBind();
        }







    }




}






