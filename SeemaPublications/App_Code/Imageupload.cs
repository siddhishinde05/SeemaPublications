using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;


namespace SeemaPublications.App_Code
{
    public class Imageupload
    {
        public Imageupload()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public string UploadFile(System.Web.UI.WebControls.FileUpload fileUpload, string path, int width, string filestatrt)
        {
            string filename = "";
            // First we check to see if the user has selected a file
            if (fileUpload.HasFile)
            {
                // Find the fileUpload control
                //string filename = fileUpload.FileName;
                string fileext = Path.GetExtension(fileUpload.FileName);
                filename = filestatrt + database_process.GetCurrentIndianDate().ToString("yyyyddMMHHmmss") + fileext;
                // Check if the directory we want the image uploaded to actually exists or not
                if (!Directory.Exists(HttpContext.Current.Server.MapPath(path)))
                {
                    // If it doesn't then we just create it before going any further
                    Directory.CreateDirectory(HttpContext.Current.Server.MapPath(path));
                }
                // Specify the upload directory
                string directory = HttpContext.Current.Server.MapPath(path + @"\");
                // Create a bitmap of the content of the fileUpload control in memory
                Bitmap originalBMP = new Bitmap(fileUpload.FileContent);
                // Calculate the new image dimensions
                int origWidth = originalBMP.Width;
                int origHeight = originalBMP.Height;
                //int sngRatio = origWidth / origHeight;
                int newWidth = width;
                //int newHeight = newWidth / sngRatio;
                int newHeight = (int)((origHeight * newWidth) / origWidth);
                // Create a new bitmap which will hold the previous resized bitmap
                Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);
                // Create a graphic based on the new bitmap
                Graphics oGraphics = Graphics.FromImage(newBMP);
                // Set the properties for the new graphic file
                oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                // Draw the new graphic based on the resized bitmap
                oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);
                // Save the new graphic file to the server
                newBMP.Save(directory + filename);
                // Once finished with the bitmap objects, we deallocate them.
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();
            }
            else
            {
                filename = "";
            }
            return filename;
        }
    }
}