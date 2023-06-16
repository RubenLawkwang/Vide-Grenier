using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Configuration;
using System.Net.Configuration;
using System.Net.Mail;
using System.Net;
using System.Text;

namespace vide_grenier_2110_22863
{
    public partial class approveuser : System.Web.UI.Page
    {

        private static string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"].ConnectionString;
        SqlConnection con = new SqlConnection(_conString);


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Admin_id"] == null)
            {
                Response.Redirect("~/uc/login.aspx");
            }

            else
            {
                getUserMovieDetails();

            }

        }

        void getUserMovieDetails()
        {
            SqlConnection con = new SqlConnection(_conString);
            con.Open();
            SqlCommand ccmd = con.CreateCommand();
            ccmd.CommandType = CommandType.Text;
            ccmd.CommandText = "Select tu.User_id as user_id, ";
            ccmd.CommandText += "tu.U_fname as fname, ";
            ccmd.CommandText += "tu.U_lname as lname, ";
            ccmd.CommandText += "tu.U_username as uname, ";
            ccmd.CommandText += "tu.U_profile_img as image, ";
            ccmd.CommandText += "tu.U_status as ustatus, ";
            ccmd.CommandText += "tum.P_id as pid, ";
            ccmd.CommandText += "tum.accessdate as accdate, ";
            ccmd.CommandText += "tum.Status as tumstatus, ";
            ccmd.CommandText += "tm.P_name as pname, ";
            ccmd.CommandText += "tm.P_status as pstatus ";
            ccmd.CommandText += "from tblUsers tu, tblProductUser tum, tblProduct tm ";
            ccmd.CommandText += "where tu.User_id = tum.user_id ";
            ccmd.CommandText += "and tum.P_id = tm.P_id ";
            ccmd.CommandText += "and tu.U_status = '1' ";
            ccmd.CommandText += "and tm.P_status = '1' ";
            SqlDataAdapter sqlda = new SqlDataAdapter(ccmd.CommandText, con);
            DataTable dta = new DataTable();
            sqlda.Fill(dta);
            con.Close();
            gvs.DataSource = dta;
            gvs.DataBind();
        }

        protected void lnkgrant_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            GridViewRow grvRow = (GridViewRow)lnk.NamingContainer;
            HiddenField hf = grvRow.FindControl("hidmov") as HiddenField;
            int p_id = Convert.ToInt32(hf.Value);
            int user_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            SqlConnection con = new SqlConnection(_conString);
            con.Open();
            SqlCommand ucmd = con.CreateCommand();
            ucmd.CommandType = CommandType.Text;
            ucmd.CommandText = "update tblProductUser set status='1' Where user_id ='"
           + user_id + "' and P_id ='" + p_id + "'";
            ucmd.ExecuteNonQuery();
            con.Close();
            getUserMovieDetails();
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

        protected void lnkdeny_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            GridViewRow grvRow = (GridViewRow)lnk.NamingContainer;
            HiddenField hf = grvRow.FindControl("HiddenField1") as HiddenField;
            int p_id = Convert.ToInt32(hf.Value);
            int user_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            SqlConnection con = new SqlConnection(_conString);
            con.Open();
            SqlCommand ucmd = con.CreateCommand();
            ucmd.CommandType = CommandType.Text;
            ucmd.CommandText = "update tblProductUser set status='0' Where user_id ='"
           + user_id + "' and P_id ='" + p_id + "'";
            ucmd.ExecuteNonQuery();
            con.Close();
            getUserMovieDetails();



        }





        ///////send email





    }
}