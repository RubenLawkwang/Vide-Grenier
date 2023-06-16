using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vide_grenier_2110_22863
{
    public partial class deleteuser : System.Web.UI.Page
    {

        private string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"].ConnectionString;



        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Admin_id"] == null)
            {
                Response.Redirect("~/uc/login");
            }

            else { 
            if (!Page.IsPostBack)
            {
                viewUser();


            }

            }

        }

        protected void gvs_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            Image1.Visible = true;

            txtUid.Text =
            (gvs.DataKeys[gvs.SelectedIndex].Value.ToString());

            txtUfname.Text =
            ((Label)gvs.SelectedRow.FindControl("lblUsername")).Text;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //create the movieid parameter
            cmd.Parameters.AddWithValue("@uid", txtUid.Text);
            //assign the parameter to the sql statement
            cmd.CommandText = "SELECT * FROM tblUsers where User_id = @uid ";
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                //retrieving FIELD values and assign the form controls
                
                txtUname.Text = dr["U_username"].ToString();
                txtUfname.Text = dr["U_fname"].ToString();
                txtUlname.Text = dr["U_lname"].ToString();
                Image1.ImageUrl = "../image/" + dr["U_profile_img"].ToString();
            }
            con.Close();
         
            btndelete.Visible = true;
  

        }








        private void viewUser()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblUsers";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a DataTable
            DataTable dt = new DataTable();

            using (da)
            {
                //Populate the DataTable
                da.Fill(dt);
            }

            //Set the DataTable as the DataSource
            gvs.DataSource = dt;
            gvs.DataBind();


        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            try { 
            //check whether the txtusername textbox is empty
            if (string.IsNullOrWhiteSpace(txtUfname.Text))
            {
                lblMsg.Text = "Please select record to delete";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsDeleted = false;
            //get the movieid from the textbox
            int userid = Convert.ToInt32(txtUid.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected movie
            cmd.CommandText = " delete from tblUsers where User_id=@uid ";
            //Create a parametererized query
            cmd.Parameters.AddWithValue("@uid", userid);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsDeleted)
            {
                lblMsg.Text = txtUfname.Text + " User deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindMovieData()
                viewUser();
            }

            else
            {
                lblMsg.Text = "Error while deleting User " + txtUfname.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }

            }

            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }



        }
    }
}