using Publication.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SeemaPublications.Admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        BLmaster objbl = new BLmaster();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAuthorGridview();
            }
        }
        public void BindAuthorGridview()
        {
            //string Authorimg = UploadAuthor();
            //string AuthorName = txtAName.Text;
            //string AuthorDescrip = txtAuthorDescrip.Text;
            //DataTable Dt = new DataTable();
            //Dt = objbl.InsertAuthorDetails(Authorimg, AuthorName, AuthorDescrip);
            DataTable Dt = new DataTable();
            Dt = objbl.GetAuthorDetails();
            if (Dt != null && Dt.Rows.Count > 0)
            {
                AuthorDetails.DataSource = Dt;
                AuthorDetails.DataBind();
            }
            else
            {
                AuthorDetails.DataSource = null;
                AuthorDetails.DataBind();
            }
        }
        private string UploadAuthor()
        {
            string Savepath = "";
            if (FileUpload2.HasFile)
            {
                try
                {
                    string folderPath = Server.MapPath("~/ProjectImages/");
                    string fileName = Path.GetFileName(FileUpload2.PostedFile.FileName);
                    string Date = DateTime.Now.ToString("ddMMyyyyhhmm");
                    string ext = Path.GetExtension(fileName);
                    string RenameFile = fileName + Date + ext;
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }
                    Savepath = "~/ProjectImages/" + RenameFile;
                    FileUpload2.PostedFile.SaveAs(Server.MapPath(Savepath));
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Uploading ERROR", "alert('" + ex.ToString() + "');", true);
                }
            }
            else
            {

            }
            return Savepath;
        }

        protected void btnAuthorInsert_Click(object sender, EventArgs e)
        {
            try
            {
                string AAuthorName = txtAName.Text.Trim();
                string AuthorDescrip = txtAuthorDescrip.Text.Trim();
                string UploadPath = UploadAuthor();
                DataTable dt = new DataTable();
                 dt= objbl.InsertAuthorDetails(UploadPath, AAuthorName, AuthorDescrip);

                Response.Write("<script LANGUAGE='JavaScript'>alert('Book deleted Successfully')</script>");
                cancel();
            }
            catch (Exception ex)
            {

            }
            BindAuthorGridview();
        }
        protected void cancel()
        {
            txtAName.Text = "";
            txtAuthorDescrip.Text = "";
            btnAuthorInsert.Visible = true;

            btnAuthorUpdate.Visible = true;
            btnAuthorCancel.Visible = false;
        }
        protected void ibDelete_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ImageButton ib = (ImageButton)sender;
                int AuthorId = Convert.ToInt32(ib.CommandArgument.ToString());
                bool Flag = objbl.DeleteAuthorDetails(AuthorId);
                if (Flag)
                {
                    Response.Write("<script LANGUAGE='JavaScript'>alert('Author deleted Successfully')</script>");
                    cancel();
                }
                else
                {

                }
                BindAuthorGridview();
            }
            catch (Exception ex)
            {

            }
        }
        protected void ibEdit_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ImageButton ib = (ImageButton)sender;
                int Id = Convert.ToInt32(ib.CommandArgument.ToString());
                ViewState["AuthorId"] = Id.ToString();
                DataTable dt = new DataTable();
                dt = objbl.GetAuthorDetailsById(Id);
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtAName.Text = dt.Rows[0]["AuthorName"].ToString();
                    txtAuthorDescrip.Text = dt.Rows[0]["AuthorDescrip"].ToString();

                    btnAuthorUpdate.Visible = true;
                    btnAuthorInsert.Visible = false;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnAuthorUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string AuthorName = txtAName.Text;
                string AuthorDescrip = txtAuthorDescrip.Text;
                string AuthorId = ViewState["AuthorId"].ToString();
                bool flag = objbl.UpdateAuthorDetails(AuthorName, AuthorDescrip, AuthorId);
                if (flag)
                {
                    Response.Write("<script LANGUAGE='JavaScript'>alert('Author Updated Successfully')</script>");
                    cancel();
                }
                else
                {
                    Response.Write("<script LANGUAGE='JavaScript'>alert('Please try Again')</script>");
                }
            }
            catch (Exception ex)
            {

            }
            BindAuthorGridview();
        }

        protected void btnAuthorCancel_Click(object sender, EventArgs e)
        {
            cancelAuthor();
        }
        protected void cancelAuthor()
        {
            txtAName.Text = "";
            txtAuthorDescrip.Text = "";

            btnAuthorUpdate.Visible = false;
            btnAuthorInsert.Visible = true;
            btnAuthorCancel.Visible = true;
        }
    }
}
