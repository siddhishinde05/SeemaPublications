using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Publication.BL;

namespace SeemaPublications.User
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        BLmaster objbl = new BLmaster();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDetails();
            }
        }
        public void BindDetails()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = objbl.GetBookDetails();
                if (dt != null && dt.Rows.Count > 0)
                {
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
                else 
                {
                    Repeater1.DataSource = null;
                    Repeater1.DataBind();
                }
            }
            catch (Exception ex)
            { 
            
            }
        }
        
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnAuthors_Click(object sender, EventArgs e)
        {
            Response.Redirect("Authors.aspx");
        }
    }
}