using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SeemaPublications.App_Code
{
    public class database_process
    {
        public static string connectionString = "";
        SqlConnection sqlcon;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        DataRow tableRow;
        DataView dv;

        public void setSQLConnection()
        {
            try
            {

                connectionString = ConfigurationManager.ConnectionStrings["InternshipConnectionString"].ToString();
                sqlcon = new SqlConnection(connectionString);
                sqlcon.Open();
            }
            catch (Exception Ex)
            {
                Ex.Message.ToString();
            }
        }

        public void closeSQLConnection()
        {
            if (sqlcon.State == ConnectionState.Open)
            {
                sqlcon.Close();
            }
        }
        public DataTable SelectProcedureWithId(string ProcedureName, Hashtable ProcedureParameters)
        {
            setSQLConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = ProcedureName;
            cmd.Connection = sqlcon;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandTimeout = 90;
            foreach (DictionaryEntry hash in ProcedureParameters)
            {
                cmd.Parameters.AddWithValue(hash.Key.ToString(), hash.Value);
            }
            SqlDataAdapter objDA = new SqlDataAdapter(cmd);
            DataSet objDS = new DataSet();
            objDA.Fill(objDS, "Data");
            closeSQLConnection();
            return objDS.Tables["Data"];
        }


        public bool ExecuteNonQuery(string Query)
        {
            bool flag = false;
            try
            {
                setSQLConnection();
                cmd = new SqlCommand(Query, sqlcon);
                cmd.ExecuteNonQuery();
                flag = true;
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                closeSQLConnection();
            }
            return flag;
        }
        public static DateTime GetCurrentIndianDate()
        {
            DateTime dt = DateTime.UtcNow;
            dt = dt.AddHours(6);
            dt = dt.AddMinutes(-30);
            return dt;
        }
        public static DateTime GetCurrentIndianDateddmmyyyy()
        {
            string strDate = "";
            DateTime finalDate = new DateTime();
            DateTime dt = DateTime.UtcNow;
            dt = dt.AddHours(6);
            dt = dt.AddMinutes(-30);
            string date = Convert.ToString(dt);

            char[] splitChar = { '/', '-', ' ' };
            string[] words = date.Split(splitChar);
            if (words.Length >= 3)
            {
                strDate = Convert.ToString(words[1]) + "-" + Convert.ToString(words[0]) + "-" + Convert.ToString(words[2]);
                finalDate = Convert.ToDateTime(strDate);
            }

            return finalDate;
        }
        public object Execute_ScalarQuery(string Query)
        {
            object objData = "";
            try
            {
                setSQLConnection();

                cmd = new SqlCommand();
                cmd.CommandText = Query;
                cmd.CommandType = CommandType.Text;
                cmd.Connection = sqlcon;
                objData = cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                closeSQLConnection();
            }
            return objData;
        }
        public DateTime GetCurrentIndianDates()
        {
            DateTime dt = DateTime.UtcNow;
            dt = dt.AddHours(6);
            dt = dt.AddMinutes(-30);
            return dt;
        }
        public DateTime getddmmyydatestring(string inputdt)
        {
            DateTime resdt = DateTime.Now.Date;
            char[] splitChar = { '/', '-' };
            if (inputdt != "")
            {
                string[] words = inputdt.Split(splitChar);
                if (words.Length >= 3)
                {
                    //resdt = Convert.ToString(words[1]) + "/" + Convert.ToString(words[0]) + "/" + Convert.ToString(words[2]);
                    resdt = new DateTime(Convert.ToInt32(words[2]), Convert.ToInt32(words[1]), Convert.ToInt32(words[0]));
                }
            }
            return resdt;
        }
        public DataTable GetDataFromQuery(string query)
        {
            DataSet dt = new DataSet();
            try
            {
                setSQLConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = sqlcon;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt, "Data");
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                closeSQLConnection();
            }
            return dt.Tables["Data"];
        }
    }
}
