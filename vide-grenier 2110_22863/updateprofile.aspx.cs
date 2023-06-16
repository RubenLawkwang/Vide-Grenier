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

namespace vide_grenier_2110_22863
{
    public partial class updateprofile : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"]
.ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            //checks whether the session variable has been created
            //from the login page and if null redirect to login page
            //else grant access to the page and display username
            if (string.IsNullOrEmpty(Convert.ToString(Session["U_username"])))
            {
                Response.Redirect("/uc/login.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    // Create Connection
                    SqlConnection con = new SqlConnection(_conString);
                    // Create Command
                    SqlCommand cmd = new SqlCommand();

                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    //To replace the txtusername.Text by the session variable
                    cmd.CommandText = "SELECT * FROM tblUsers WHERE U_username='" + Session["U_username"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();

                    using (da)
                    {
                        da.Fill(dt);
                    }

                    DetailsView1.DataSource = dt;
                    DetailsView1.DataBind();
                    con.Open();
                    //Create DataReader
                    SqlDataReader reader;

                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        //retrieve the values using the reader[“fieldname”] and
                        //store in corresponding Textboxes
                        txtFname.Text = (String)reader["U_fname"];
                        txtLname.Text = (String)reader["U_lname"];
                        txtEmail.Text = (String)reader["U_email"];

                        

                    }
                    reader.Close();
                    //create a dataadapter
                    //create a datatable
                    //populate the datatable
                    //bind the datatable to the repeater control
                    con.Close();

                  
                }
            }

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string updateSQL;
            updateSQL = "update tblUsers set U_fname=@fname,U_lname=@lname, U_email=@email WHERE U_username =@un";
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = updateSQL;
            cmd.Connection = con;
            //Create a parameter for the Session username
            cmd.Parameters.AddWithValue("@un", Session["U_username"]);
            // Add the 3 parameters for firstname, lastname and email

            cmd.Parameters.AddWithValue("@fname", txtFname.Text.Trim());
            cmd.Parameters.AddWithValue("@lname", txtLname.Text.Trim());
            cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
            int updated = 0;
            //Add a “try – catch” block to handle any exceptions thrown during
            //program execution and displays the error Message if any
            con.Open();
            updated = cmd.ExecuteNonQuery();
            lblmsg.Text = updated.ToString() + " Your profile has been updated.";
            //lblmsg.Text = "Error updating. ";
            con.Close();

     
        }
    }
}