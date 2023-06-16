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
    public partial class stats : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["vgrenierdb"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id"] == null)
            {
                Response.Redirect("~/uc/login");
            }


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
    }
}