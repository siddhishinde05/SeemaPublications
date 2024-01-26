using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Publication.DL
{
    public class DLmaster
    {
        Connection con = new Connection();
        //lOGIN
        public DataTable GetLoginDetails(string Username, string Password)
        {
            DataTable Dt = new DataTable();
            try
            {
                string Queary = "select * from RegistrationMaster where Username='" + Username + "' and Password='" + Password + "'";
                Dt = con.GetDataFromQuery(Queary);
            }
            catch (Exception ex)
            {

            }
            return Dt;
        }
        //REGISTRATION
        public DataTable GetRegDetails(string FirstName, string LastName, string Contact, string Email, string Address, string State, string District, string Pincode, string Username, string Password, string UserType)
        {
            DataTable Dt = new DataTable();
            try
            {
                string Query = @"Insert into RegistrationMaster(FirstName, LastName, Contact, Email, Address, State, District, Pincode, Username, Password, UserType)
                Values('" + FirstName + "', '" + LastName + "', '" + Contact + "', '" + Email + "', '" + Address + "', '" + State + "', '" + District + "', '" + Pincode + "', '" + Username + "', '" + Password + "', '" + UserType + "')";
                Dt = con.GetDataFromQuery(Query);
            }
            catch (Exception ex)
            {

            }
            return Dt;
        }
        //BOOK DETAILS
        public bool DeleteBookDetails(string BookId)
        {
            bool Flag = false;
            try
            {
                string Query = "update BookMaster set IsDeleted='Y' where BookId=" + BookId;
                Flag = con.ExecuteNonQuery(Query);

            }

            catch (Exception ex)
            {

            }
            return Flag;
        }
        public DataTable GetBookDetailsById(int id)
        {
            DataTable Dt = new DataTable();
            try
            {
                string Query = "select * from BookMaster where BookId=" + id;
                Dt = con.GetDataFromQuery(Query);

            }
            catch (Exception ex)
            {

            }
            return Dt;
        }
        public DataTable GetBookDetails()
        {
            DataTable Dt = new DataTable();
            try
            {
                string Query = "select * from BookMaster where  isnull(IsDeleted,'')!='Y'";
                Dt = con.GetDataFromQuery(Query);
            }
            catch (Exception ex)
            {

            }
            return Dt;
        }
        public bool InsertBookDetails(string BookTitle, string AuthorName, string ISBN, string PublishingYear, string Genre, string Stock, string Price, string UploadPath)
        {
            bool flag = false;
            try
            {
                string Query = @"Insert into BookMaster(BookTitle, AuthorName, ISBN, PublishingYear, Genre, Stock, Price,IsDeleted,CreatedBy,CreatedOn,[BookImg])
                Values('" + BookTitle + "', '" + AuthorName + "', '" + ISBN + "', '" + PublishingYear + "', '" + Genre + "', '" + Stock + "', '" + Price + "','N','Seema',dbo.getIndianDate(),'" + UploadPath + "')";
                flag = con.ExecuteNonQuery(Query);
            }
            catch (Exception ex)
            {

            }
            return flag;
        }
        public bool UpdateBookDetails( string BookTitle, string AuthorName, string ISBN, string PublishingYear, string Genre, string Stock, string Price, string BookId)
        {
            bool flag = false;
            try
            {
                string Query = "update BookMaster set BookTitle='" + BookTitle + "',AuthorName='" + AuthorName + "',ISBN='" + ISBN + "',PublishingYear='" + PublishingYear + "',Genre='" + Genre + "',Stock='" + Stock + "',Price='" + Price + "'  where BookId=" + BookId;
                flag = con.ExecuteNonQuery(Query);
            }
            catch (Exception ex)
            {

            }
            return flag;
        }
        //AUTHOR DETAILS
        public DataTable GetAuthorDetailsById(int AuthorId)
        {
            DataTable Dt = new DataTable();
            try
            {
                string Query = "select * from AuthorMaster where AuthorId=" + AuthorId;
                Dt = con.GetDataFromQuery(Query);
            }
            catch (Exception ex)
            {

            }
            return Dt;
        }
        public bool DeleteAuthorDetails(int AuthorId)
        {
            bool Flag = false;
            try
            {
                string Query = "update AuthorMaster set IsDeleted='Y' where AuthorId=" + AuthorId;
                Flag = con.ExecuteNonQuery(Query);
            }
            catch (Exception ex)
            {

            }
            return Flag;
        }
        public DataTable InsertAuthorDetails(string AuthorImg, string AuthorName, string AuthorDescrip)
        {
            DataTable Dt = new DataTable();
            try
            {
                bool flag = false;
                string Query = @"Insert into AuthorMaster(AuthorImg,AuthorName,AuthorDescrip)
                Values('" + AuthorImg + "','" + AuthorName + "','" + AuthorDescrip + "')";
                flag = con.ExecuteNonQuery(Query);

                string Qry = "select * from AuthorMaster WHERE isnull(IsDeleted,'')!='Y'";
                Dt = con.GetDataFromQuery(Qry);
            }
            catch (Exception ex)
            {

            }
            return Dt;
        }
        public bool UpdateAuthorDetails(string AuthorName, string AuthorDescrip, string AuthorId)
        {
            bool flag = false;
            try
            {
                string Query = "update AuthorMaster set AuthorName='" + AuthorName + "',AuthorDescrip='" + AuthorDescrip + "' where AuthorId=" + AuthorId;
                flag = con.ExecuteNonQuery(Query);
            }
            catch (Exception ex)
            {

            }
            return flag;
        }
        public DataTable GetAuthorDetails()
        {
            DataTable Dt = new DataTable();
            try
            {
                string Query = "select * from AuthorMaster where isnull(IsDeleted,'')!='Y'";
                Dt = con.GetDataFromQuery(Query);
            }
            catch (Exception ex)
            {

            }
            return Dt;
        }
    }
}


