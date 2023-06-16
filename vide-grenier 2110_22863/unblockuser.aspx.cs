using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vide_grenier_2110_22863
{
    public partial class unblockuser : System.Web.UI.Page
    {
        private static string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"].ConnectionString;
        SqlConnection con = new SqlConnection(_conString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id"] == null)
            {
                Response.Redirect("~/uc/login");
            }

            getActiveUsers();

        }


        void getActiveUsers()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select User_id, U_fname, U_lname, U_username,U_profile_img from tblUsers where U_status = 0";
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvs.DataSource = dt;
            gvs.DataBind();
        }


        protected void gvs_PreRender(object sender, EventArgs e)
        {
            if (gvs.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvs.UseAccessibleHeader = true;
                //This will add the <thead> and <tbody> elements
                gvs.HeaderRow.TableSection =
                TableRowSection.TableHeader;
            }
        }

        protected void lnkunblock_Click(object sender, EventArgs e)
        {
            //Retrieving the UserID from the command argument link button
            //open Connection
            int uid = Convert.ToInt32((sender as LinkButton).CommandArgument);
            con.Open();
            //Create Command
            SqlCommand ucmd = new SqlCommand();
            ucmd.CommandType = CommandType.Text;
            ucmd.CommandText = "update tblUsers set U_status='1' where User_id = " + uid;
            ucmd.Connection = con;
            ucmd.ExecuteNonQuery();
            con.Close();
            getActiveUsers();
        }
    }
}