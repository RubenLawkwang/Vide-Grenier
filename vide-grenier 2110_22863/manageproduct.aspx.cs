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

namespace vide_grenier_2110_22863
{
    public partial class manageproduct : System.Web.UI.Page
    {

        private string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id"] == null)
            {
                Response.Redirect("~/uc/login");
            }

            else 
            { 
            if (!Page.IsPostBack)
            {

                BindProductdata();
                Scategory();
                ListItem li = new ListItem("Select Category", "-1");
                ddlcat.Items.Insert(0, li);




            }

            }


        }

        private void BindProductdata()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblProduct";
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
       
        private void Scategory()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT cat_type, cat_id FROM tblCategory";
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
       

        protected void btncancel_Click(object sender, EventArgs e)
        {

            ResetAll();



        }

        protected void btndelete_Click(object sender, EventArgs e)
        {

            //check whether the txtmoviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtPname.Text))
            {
                lblMsg.Text = "Please select record to delete";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsDeleted = false;
            //get the movieid from the textbox
            int productid = Convert.ToInt32(txtProductid.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected movie
            cmd.CommandText = " delete from tblProduct where P_id=@pid ";
            //Create a parametererized query
            cmd.Parameters.AddWithValue("@pid", productid);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsDeleted)
            {
                lblMsg.Text = txtPname.Text + " Product deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindMovieData()
                BindProductdata();
            }

            else
            {
                lblMsg.Text = "Error while deleting movie " + txtPname.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }





        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {

            //check whether the moviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtPname.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            //get the movieid from the textbox
            int productid = Convert.ToInt32(txtProductid.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update the movie
            cmd.CommandText = "update tblProduct set P_name=@pname, P_brand=@pbrand, P_cost=@pcost, P_description=@pdesc, P_image=@pimage, P_status=@pstatus  where P_id=@pid";
            //Create the parameterized queries
            
            
            cmd.Parameters.AddWithValue("@pname", txtPname.Text.Trim());
            cmd.Parameters.AddWithValue("@pdesc", txtPdesc.Text.Trim());
            cmd.Parameters.AddWithValue("@pbrand", txtPbrand.Text.Trim());
            cmd.Parameters.AddWithValue("@pcost", txtprice.Text.Trim());

            cmd.Parameters.AddWithValue("@pstatus", chkstatus.Checked);
            //cmd.Parameters.AddWithValue("@catid", ddlcat.SelectedValue);
            cmd.Parameters.AddWithValue("@pid", productid);
            String filen = Image1.ImageUrl.Substring(8);
            if (fuimage.HasFile)
            {
                filen = Path.GetFileName(fuimage.PostedFile.FileName);
                fuimage.PostedFile.SaveAs(Server.MapPath("~/image/") + filen);
            }
            cmd.Parameters.AddWithValue("@pimage", filen);


            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = txtPname.Text + " movie updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindMovieData()
                BindProductdata();
            }
            else
            {
                lblMsg.Text = "Error while updating movie " + txtPname.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }





        }



        protected void gvs_SelectedIndexChanged(object sender, EventArgs e)
        {
            try { 
            lblMsg.Text = "";
            Image1.Visible = true;

            txtProductid.Text =
            (gvs.DataKeys[gvs.SelectedIndex].Value.ToString());

            txtPname.Text =
            ((Label)gvs.SelectedRow.FindControl("lblproductname")).Text;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //create the movieid parameter
            cmd.Parameters.AddWithValue("@pid", txtProductid.Text);
            //assign the parameter to the sql statement
            cmd.CommandText = "SELECT * FROM tblProduct where P_id = @pid";
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                //retrieving FIELD values and assign the form controls
                ddlcat.SelectedValue = dr["Category_cat_id"].ToString();
                txtPbrand.Text = dr["P_brand"].ToString();
                txtPdesc.Text = dr["P_description"].ToString();
                txtprice.Text = dr["P_cost"].ToString();
                chkstatus.Checked = (Boolean)dr["P_status"];
                Image1.ImageUrl = "../image/" + dr["P_image"].ToString();
            }
            con.Close();
            btnupdate.Visible = true;
            btndelete.Visible = true;
            btncancel.Visible = true;
            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }


        private void ResetAll()
        {
            btncancel.Visible = false;
            btndelete.Visible = false;
            btnupdate.Visible = false;
            ddlcat.SelectedIndex = 0;
            txtPname.Text = "";
            txtprice.Text = "";
            txtPbrand.Text = "";
            txtPdesc.Text = "";
            chkstatus.Checked = false;
            Image1.ImageUrl = "";
        }








    }
}