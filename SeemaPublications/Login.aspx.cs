using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Publication.BL;
using System.Data;

namespace SeemaPublications
{
    public partial class Login : System.Web.UI.Page
    {

        BLmaster objbl = new BLmaster();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string UserName = TxtUsername.Text.Trim();
                string Password = TxtPassword.Text.Trim();
                DataTable dt = new DataTable();
                dt = objbl.GetLoginDetails(UserName, Password);
                if (dt != null && dt.Rows.Count > 0)
                {
                    string UserType = dt.Rows[0]["UserType"].ToString();

                    if (UserType == "1")
                    {
                        Response.Redirect("~/Admin/AdminHomePage.aspx");
                    }
                    else if (UserType == "2")
                    {
                        Response.Redirect("~/User/UserhomePage.aspx");
                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
                else
                {
                    Response.Write("<script LANGUAGE='JavaScript'>alert('Please Try Again')</script>");
                }
            }
            catch (Exception ex)
            { 
            
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            TxtUsername.Text = "";
            TxtPassword.Text = "";
        }
    }
}