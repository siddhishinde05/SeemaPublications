using Publication.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SeemaPublications
{
    public partial class Registration : System.Web.UI.Page
    {
        BLmaster objbl = new BLmaster();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string FirstName = TxtFirstName.Text.Trim();
                string LastName = TxtLastname.Text.Trim();
                string Contact = TxtContact.Text.Trim();
                string Email = TxtEmail.Text.Trim();
                string Address = TxtAddress.Text.Trim();
                string State = ddlState.SelectedValue.ToString();
                string District = ddlDistrict.SelectedValue.ToString();
                string Pincode = TxtPincode.Text.Trim();
                string Username = TxtUsername.Text.Trim();
                string Password = TxtPassword.Text.Trim();
                string UserType = "2";
                DataTable dt = new DataTable();
                dt = objbl.GetRegDetails(FirstName, LastName, Contact, Email, Address, State, District, Pincode, Username, Password, UserType);
            }
            catch(Exception ex)
            {

            }
            Response.Write("<script LANGUAGE='JavaScript'>alert('Registration Successful')</script>");
            Response.Redirect("Login.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            TxtFirstName.Text = "";
            TxtLastname.Text = "";
            TxtContact.Text = "";
            TxtEmail.Text = "";
            TxtAddress.Text = "";
            ddlState.SelectedValue = "";
            ddlDistrict.SelectedValue = "";
            TxtPincode.Text = "";
            TxtUsername.Text = "";
            TxtPassword.Text = "";
        }
    }
}