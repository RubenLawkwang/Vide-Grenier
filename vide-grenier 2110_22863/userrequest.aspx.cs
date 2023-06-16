using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace vide_grenier_2110_22863
{
    public partial class userrequest : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"].ConnectionString;
      

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["User_id"] == null)
            {
                Response.Redirect("~/uc/login");
            }

            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblProductUser INNER JOIN tblProduct ON tblProductUser.P_id = tblProduct.P_id INNER JOIN tblUsers ON tblProductUser.user_id = tblUsers.User_id  WHERE tblProductUser.user_id='" + Session["User_id"] + "'";
            //Create DataReader
            SqlDataReader dr;
            //open connection
            con.Open();
            //execute sql statememt
            dr = cmd.ExecuteReader();
            //Bind the reader to the repeater control
            rptMovies.DataSource = dr;
            rptMovies.DataBind();
            con.Close();





        }

       
    }
}