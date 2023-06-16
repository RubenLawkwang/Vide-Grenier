using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace vide_grenier_2110_22863
{
    public partial class managelocation : System.Web.UI.Page
    {

        private string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["Admin_id"] == null)
            {
                Response.Redirect("~/uc/login");
            }
            BindLocationData();



        }



        private void BindLocationData()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblLocation";
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

        protected void btnAddmovies_Click(object sender, EventArgs e)
        {
            Boolean IsAdded = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //add INSERT statement to create new movie
            cmd.CommandText = "insert into tblLocation (District_name) values (@dis)";
            //create Parameterized query to prevent sql injection by

            cmd.Parameters.AddWithValue("@dis", txtlocname.Text.Trim());
            cmd.Connection = con;
            con.Open();
            //use Command method to execute INSERT statement and return
            //Boolean true if number of records inserted is greater than zero
            IsAdded = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsAdded)
            {
                lblMsg.Text = txtlocname.Text + " Location added successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindMovieData()
                BindLocationData();
            }
            else
            {
                lblMsg.Text = "Error while adding Location " + txtlocname.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();


        }





        private void ResetAll()
        {
            btnAddmovies.Visible = true;
            btncancel.Visible = false;
            btnupdate.Visible = true;
            btndelete.Visible = true;
            txtlocname.Text = "";

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {

            //check whether the moviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtlocname.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            //get the movieid from the textbox
            int movieid = Convert.ToInt32(txtloc_id.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update the movie
            cmd.CommandText = "update tblLocation set District_name=@dname where Loc_id=@lid";
            //Create the parameterized queries
            cmd.Parameters.AddWithValue("@lid", movieid);
            cmd.Parameters.AddWithValue("@dname", txtlocname.Text.Trim());

            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;

            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = txtlocname.Text + " Location updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the
                BindLocationData();
            }
            else
            {
                lblMsg.Text = "Error while updating Location " + txtlocname.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();



        }

        protected void btndelete_Click(object sender, EventArgs e)
        {

            //check whether the txtmoviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtlocname.Text))
            {
                lblMsg.Text = "Please select record to delete";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsDeleted = false;
            //get the movieid from the textbox
            int movieid = Convert.ToInt32(txtloc_id.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected movie
            cmd.CommandText = " delete from tblLocation where Loc_id=@cid ";
            //Create a parametererized query
            cmd.Parameters.AddWithValue("@cid", movieid);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsDeleted)
            {
                lblMsg.Text = txtlocname.Text + " Location deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the
                BindLocationData();
            }

            else
            {
                lblMsg.Text = "Error while deleting Location " + txtlocname.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();


        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            
                ResetAll();
            
        }

        protected void gvs_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMsg.Text = "";


            txtloc_id.Text =
            (gvs.DataKeys[gvs.SelectedIndex].Value.ToString());

            txtlocname.Text =
            ((Label)gvs.SelectedRow.FindControl("lblProductname")).Text;

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //create the movieid parameter
            cmd.Parameters.AddWithValue("@cid", txtloc_id.Text);
            //assign the parameter to the sql statement
            cmd.CommandText = "SELECT * FROM tblLocation where Loc_id = @cid";
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())

            {
                //retrieving FIELD values and assign the form controls

                txtlocname.Text = dr["District_name"].ToString();

            }
            con.Close();
            btnAddmovies.Visible = false;
            btnupdate.Visible = true;
            btndelete.Visible = true;
            btncancel.Visible = true;






        }












    }
}