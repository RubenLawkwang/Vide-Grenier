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
    public partial class homepage : System.Web.UI.Page
    {
        private static string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"].ConnectionString;
        SqlConnection con = new SqlConnection(_conString);

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadCategory();
                TextBox1_TextChanged(sender, null);
            }




        }


        private void LoadCategory()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(_conString))
            {
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter("SELECT * from tblCategory", _conString);
                    da.Fill(dt);

                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "Cat_type";
                    ddlCategory.DataValueField = "Cat_id";
                    ddlCategory.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
            ddlCategory.Items.Insert(0, new ListItem("Select Category", "-1"));
        }


        protected void lvMovies_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvMovies.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            TextBox1_TextChanged(TextBox1, null);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Session["User_id"] == null)
            {
                Response.Redirect("~/uc/login");
            }
            else
            {
                LinkButton btn = (LinkButton)sender;
                int x = Convert.ToInt32(btn.CommandArgument.ToString());
                if (chkexist(x))
                {

                    lblmsg.Text = "Already sent request for this product";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    btn.Text = "Already Requested";
                    btn.CssClass = "btn btn-danger";
                }
                else
                {

                    SqlConnection con = new SqlConnection(_conString);
                    SqlCommand cmd = new SqlCommand();
                    //add INSERT statement to request access to movie
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "insert into tblProductUser(P_id, user_id,accessdate, status) " + "values (@mid, @uid, @dateaccess, @status)";
                    cmd.Parameters.AddWithValue("@uid", Session["User_id"]);
                    cmd.Parameters.AddWithValue("@mid", x);
                    cmd.Parameters.AddWithValue("@dateaccess", DateTime.Now);
                    cmd.Parameters.AddWithValue("@status", 0);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    btn.Text = "Request sent";
                    lblmsg.Text = "Request sent!";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                }
            }
        }

        private Boolean chkexist(int x)
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //search for user
            cmd.CommandText = "select * from tblProductUser where P_id=@mid and user_id = @uid";
            cmd.Connection = con;
            //create a parameterized query
            cmd.Parameters.AddWithValue("@uid", Session["User_id"]);
            cmd.Parameters.AddWithValue("@mid", x);
            //Create DataReader
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            //Check if user subscription already exists in the table
            if (dr.HasRows)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            String CatIDs = ddlCategory.SelectedValue;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            String sqlParam = "";
            String sqlParamCat = "";

            if (TextBox1.Text.Trim() != null)
                sqlParam = " and P_name LIKE '%' + @pname + '%'";
            if (CatIDs != "-1")
                sqlParamCat = " and tblProduct.Category_cat_id = @CatID";
            cmd.CommandText = "SELECT P_id, P_name, P_description, P_brand, P_cost, P_image FROM tblProduct WHERE P_status = 1 " + sqlParam +
sqlParamCat;
            cmd.Parameters.AddWithValue("@pname", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@CatID", CatIDs);
            DataTable table = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(table);
            lvMovies.DataSource = table;
            lvMovies.DataBind();
        }


    }
}

