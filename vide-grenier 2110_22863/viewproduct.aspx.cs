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
    public partial class viewproduct : System.Web.UI.Page
    {

        private string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"]
.ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Admin_id"] == null)
            {
                Response.Redirect("~/uc/login");
            }


            else { 
            if (!Page.IsPostBack)
            {
                GetProductList();

            }
            }



        }


        private void GetProductList()
        {

            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand scmd = new SqlCommand();
            scmd.CommandText = "select * from tblProduct p, tblCategory tc where p.Category_cat_id=tc.Cat_id";
            scmd.Connection = con;
            // Create DataAdapter named dad (Refer to slide 7)
            SqlDataAdapter da = new SqlDataAdapter(scmd);
            //Create DataSet/DataTable named dtMovies
            DataTable dt = new DataTable();
            //Populate the datatable using the Fill()
            using (da)
            {
                da.Fill(dt);
            }
            //Bind datatable to gridview
            GrdView1.DataSource = dt;
            GrdView1.DataBind();



        }


        protected void GrdView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            GrdView1.PageIndex = e.NewPageIndex;
            GetProductList();
        }
    }
}