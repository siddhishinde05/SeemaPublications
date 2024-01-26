using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using Publication.DL;

namespace Publication.BL
{
    public class BLmaster
    {
        DLmaster objdl = new DLmaster();
        ///LOGIN
        public DataTable GetLoginDetails(string Username, string Password)
        {
            return objdl.GetLoginDetails(Username, Password);
        }
        ///REGISTRATION
        public DataTable GetRegDetails(string FirstName, string LastName, string Contact, string Email, string Address, string State, string District, string Pincode, string Username, string Password, string UserType)
        {
            return objdl.GetRegDetails(FirstName, LastName, Contact, Email, Address, State, District, Pincode, Username, Password, UserType);
        }
        ///BOOK DETAILS
        public DataTable GetBookDetails()
        {
            return objdl.GetBookDetails();
        } 
        public bool InsertBookDetails(string BookTitle, string AuthorName, string ISBN, string PublishingYear, string Genre, string Stock, string Price,string UploadPath)
        {
            return objdl.InsertBookDetails(BookTitle, AuthorName, ISBN, PublishingYear, Genre, Stock, Price, UploadPath);
        } 
        public bool DeleteBookDetails(string BookId)
        {
            return objdl.DeleteBookDetails(BookId);
        }
        public bool UpdateBookDetails(string BookTitle, string AuthorName, string ISBN, string PublishingYear, string Genre, string Stock, string Price,string BookId)
        {
            return objdl.UpdateBookDetails(BookTitle, AuthorName, ISBN, PublishingYear, Genre, Stock, Price, BookId);
        }
        public DataTable GetBookDetailsById(int id)
        {
            return objdl.GetBookDetailsById(id);
        }
        ///AUTHOR 
        public DataTable InsertAuthorDetails(string AuthorImg, string AuthorName, string AuthorDescrip)
        {
            return objdl.InsertAuthorDetails(AuthorImg, AuthorName, AuthorDescrip);
        }
        public bool UpdateAuthorDetails(string AuthorName, string AuthorDescrip, string AuthorId)
        {
            return objdl.UpdateAuthorDetails(AuthorName,AuthorDescrip,AuthorId);
        }
        public DataTable GetAuthorDetailsById(int AuthorId)
        {
            return objdl.GetAuthorDetailsById(AuthorId);
        }
        public DataTable GetAuthorDetails()
        {
            return objdl.GetAuthorDetails();
        }

        public bool DeleteAuthorDetails(int AuthorId)
        {
            return objdl.DeleteAuthorDetails(AuthorId);
        }
    }
}
