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
    public partial class WebForm1 : System.Web.UI.Page
    {
        BLmaster objbl = new BLmaster();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridview();
            }
        }
        public void BindGridview()
        {
            DataTable Dt = new DataTable();
            Dt = objbl.GetBookDetails();
            if (Dt != null && Dt.Rows.Count > 0)
            {
                BookDetails.DataSource = Dt;
                BookDetails.DataBind();
            }
            else
            {
                BookDetails.DataSource = null;
                BookDetails.DataBind();
            }
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);
            int fileSize = postedFile.ContentLength;
        }
        private string UploadPhoto()
        {
            string Savepath = "";
            if (FileUpload1.HasFile)
            {
                try
                {
                    string folderPath = Server.MapPath("~/ProjectImages/");
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string Date = DateTime.Now.ToString("ddMMyyyyhhmm");
                    string ext = Path.GetExtension(fileName);
                    string RenameFile = fileName + Date + ext;
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }
                    Savepath = "~/ProjectImages/" + RenameFile;
                    FileUpload1.PostedFile.SaveAs(Server.MapPath(Savepath));
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
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                string BookTitle = txtTitle.Text.Trim();
                string AuthorName = txtAuthorName.Text.Trim();
                string ISBN = txtISBN.Text.Trim();
                string PublishingYear = txtPblYear.Text.Trim();
                string Genre = txtGenre.Text.Trim();
                string Stock = txtStock.Text.Trim();
                string Price = txtPrice.Text.Trim();
                bool flag = false;
                string UploadPath = UploadPhoto();
                flag = objbl.InsertBookDetails(BookTitle, AuthorName, ISBN, PublishingYear, Genre, Stock, Price, UploadPath);
                if (flag)
                {
                    Response.Write("<script LANGUAGE='JavaScript'>alert('Book Inserted Successfully')</script>");
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
            BindGridview();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string BookTitle = txtTitle.Text;
                string AuthorName = txtAuthorName.Text;
                string ISBN = txtISBN.Text;
                string PublishingYear = txtPblYear.Text;
                string Genre = txtGenre.Text;
                string Stock = txtStock.Text;
                string Price = txtPrice.Text;
                string BookId = ViewState["BookId"].ToString();
                bool flag = objbl.UpdateBookDetails(BookTitle, AuthorName, ISBN, PublishingYear, Genre, Stock, Price, BookId);
                if (flag)
                {
                    Response.Write("<script LANGUAGE='JavaScript'>alert('Book Updated Successfully')</script>");
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
            BindGridview();
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            cancel();
        }
        protected void cancel()
        {
            txtTitle.Text = "";
            txtAuthorName.Text = "";
            txtISBN.Text = "";
            txtPblYear.Text = "";
            txtGenre.Text = "";
            txtPrice.Text = "";
            txtStock.Text = "";
            btnUpdate.Visible = false;
            btnInsert.Visible = true;
        }
        protected void ibEdit_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ImageButton ib = (ImageButton)sender;
                int Id = Convert.ToInt32(ib.CommandArgument.ToString());
                ViewState["BookId"] = Id.ToString();
                DataTable dt = new DataTable();
                dt = objbl.GetBookDetailsById(Id);
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtTitle.Text = dt.Rows[0]["BookTitle"].ToString();
                    txtAuthorName.Text = dt.Rows[0]["AuthorName"].ToString();
                    txtISBN.Text = dt.Rows[0]["ISBN"].ToString();
                    txtPblYear.Text = dt.Rows[0]["PublishingYear"].ToString();
                    txtGenre.Text = dt.Rows[0]["Genre"].ToString();
                    txtPrice.Text = dt.Rows[0]["Price"].ToString();
                    txtStock.Text = dt.Rows[0]["Stock"].ToString();
                    btnUpdate.Visible = true;
                    btnInsert.Visible = false;
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void ibDelete_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ImageButton ib = (ImageButton)sender;
                string BookId = Convert.ToString(ib.CommandArgument.ToString());
                bool Flag = objbl.DeleteBookDetails(BookId);
                if (Flag)
                {
                    cancel();
                }
                else
                {

                }
                BindGridview();
            }
            catch (Exception ex)
            {

            }
        }

    }
}
