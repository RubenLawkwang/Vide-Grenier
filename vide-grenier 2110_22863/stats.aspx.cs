using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vide_grenier_2110_22863
{
    public partial class stats1 : System.Web.UI.Page
    {

        private string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Admin_id"] == null)
            {
                Response.Redirect("~/homepage");
            }

            else
            {

                if (!IsPostBack)
                {
                    //prodstats();
                    //userstats();

                    string query = "select * from tblCategory";
                    DataTable dt = GetData(query);
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "Cat_type";
                    ddlCategory.DataValueField = "Cat_Id";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("Select", "-1"));
                }
            }

        }

        private static DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string constr =
           WebConfigurationManager.ConnectionStrings["vgrenierdb"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {


            //add an SQL statement to search for moviename and 
            //boxofficetotals as per category chosen from dropdown
            string query = string.Format("select * from tblProduct Where Category_cat_id =  {0}",ddlCategory.SelectedValue);
            DataTable dt = GetData(query);
            //Loop and add each datatable row to the Pie Chart Values
            foreach (DataRow row in dt.Rows)
            {
                PieChart1.PieChartValues.Add(new
               AjaxControlToolkit.PieChartValue
                {
                    Category = row["P_name"].ToString(),
                    Data = Convert.ToDecimal(row["P_cost"])
                });
            }










        }


        //private void prodstats()
        //{
        //    SqlConnection dbconn = new SqlConnection(_conString);
        //    SqlCommand scmd = new SqlCommand();
        //    scmd.CommandType = CommandType.StoredProcedure;
        //    scmd.CommandText = "prodcount";
        //    scmd.Connection = dbconn;
        //    dbconn.Open();
        //    hyprod.Text = scmd.ExecuteScalar().ToString();
        //    dbconn.Close();
        //}

        //private void userstats()
        //{
        //    SqlConnection dbconn = new SqlConnection(_conString);
        //    SqlCommand scmd = new SqlCommand();
        //    scmd.CommandType = CommandType.StoredProcedure;
        //    scmd.CommandText = "usercount";
        //    scmd.Connection = dbconn;
        //    dbconn.Open();
        //    hyuser.Text = scmd.ExecuteScalar().ToString();
        //    dbconn.Close();
        //}









    }
}