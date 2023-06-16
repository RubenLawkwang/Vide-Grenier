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
    public partial class productdetails : System.Web.UI.Page
    {


        private string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            getProductDetails();



        }

        private void getProductDetails()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand scmd = new SqlCommand();

            int qs = Convert.ToInt32(Request.QueryString["id"]);

            scmd.CommandText = "SELECT * FROM tblProduct WHERE P_id = " + qs;
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
            DetailsView1.DataSource = dt;
            DetailsView1.DataBind();
        }



    }
}