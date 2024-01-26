using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections;
using System.IO;
namespace Publication.DL
{
    class Connection
    {
        public static string constr = "";
        SqlConnection con;

        public object Execute_ScalarQuery(string Query)
        {
            object objData = "";
            try
            {
                SetSQLconnection();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = Query;
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                objData = cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                CloseSqlConnection();
            }
            return objData;
        }
        public bool Execute_Procedure(string ProcedureName, Hashtable ProcedureParameters)
        {
            bool flag = false;
            try
            {
                SetSQLconnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = ProcedureName;
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                foreach (DictionaryEntry hash in ProcedureParameters)
                {
                    cmd.Parameters.AddWithValue(hash.Key.ToString(), hash.Value);
                }
                cmd.ExecuteNonQuery();
                flag = true;
            }
            catch (Exception ex) { }
            finally { CloseSqlConnection(); }
            return flag;
        }
        public int Execute_Query(string ProcedureName, Hashtable ProcedureParameters)
        {
            int i = 0;
            try
            {
                SetSQLconnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = ProcedureName;
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                foreach (DictionaryEntry hash in ProcedureParameters)
                {
                    cmd.Parameters.AddWithValue(hash.Key.ToString(), hash.Value);
                }
                i = cmd.ExecuteNonQuery();
            }
            catch (Exception ex) { }
            finally { CloseSqlConnection(); }
            return i;
        }
        public SqlConnection SetSQLconnection()
        {
            try
            {

                constr = ConfigurationManager.ConnectionStrings["SeemaPublicationsConnectionString"].ToString();
                con = new SqlConnection(constr);
                con.Open();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return con;
        }
        public SqlConnection CloseSqlConnection()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            return con;
        }

        public DataSet GetDataSet(string ProcedureName, Hashtable ProcedureParameters)
        {
            SetSQLconnection();
            SqlCommand objCmd = new SqlCommand(ProcedureName, con);
            objCmd.CommandType = CommandType.StoredProcedure;
            foreach (DictionaryEntry hash in ProcedureParameters)
            {
                objCmd.Parameters.AddWithValue(hash.Key.ToString(), hash.Value);
            }
            SqlDataAdapter objDA = new SqlDataAdapter(objCmd);
            DataSet objDS = new DataSet();
            objDA.Fill(objDS);
            CloseSqlConnection();
            return objDS;
        }
        public DataTable GetDataFromSP(string ProceDureName, Hashtable ht)
        {
            DataSet dt = new DataSet();
            try
            {
                SetSQLconnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = ProceDureName;
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                foreach (DictionaryEntry hash in ht)
                    cmd.Parameters.AddWithValue(hash.Key.ToString(), hash.Value);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt, "Data");
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                CloseSqlConnection();
            }
            return dt.Tables["Data"];
        }
        public DataTable GetDataFromSPWithoutParam(string ProceDureName)
        {

            DataSet dt = new DataSet();
            try
            {
                SetSQLconnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = ProceDureName;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt, "Data");
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                CloseSqlConnection();
            }
            return dt.Tables["Data"];
        }
        public DataTable GetDataFromQuery(string query)
        {
            DataSet dt = new DataSet();
            try
            {
                SetSQLconnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt, "Data");
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                CloseSqlConnection();
            }
            return dt.Tables["Data"];
        }
        public DataSet GetDataFromQueryDataset(string query)
        {
            DataSet dt = new DataSet();
            try
            {
                SetSQLconnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt, "Data");
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                CloseSqlConnection();
            }
            return dt;
        }
        public DataSet SelectProceduredatasetwithids(string ProcedureName, Hashtable ProcedureParameters)
        {
            SetSQLconnection();
            SqlCommand objCmd = new SqlCommand(ProcedureName, con);
            objCmd.CommandType = CommandType.StoredProcedure;
            foreach (DictionaryEntry hash in ProcedureParameters)
            {
                objCmd.Parameters.AddWithValue(hash.Key.ToString(), hash.Value);
            }
            SqlDataAdapter objDA = new SqlDataAdapter(objCmd);
            DataSet objDS = new DataSet();
            objDA.Fill(objDS);
            CloseSqlConnection();
            return objDS;
        }

        public int SetDataFromSP(string ProceDureName, Hashtable ht)
        {
            DataSet dt = new DataSet();
            int i = 0;
            try
            {
                SetSQLconnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = ProceDureName;
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                foreach (DictionaryEntry hash in ht)
                    cmd.Parameters.AddWithValue(hash.Key.ToString(), hash.Value);
                i = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                CloseSqlConnection();
            }
            return i;
        }
        public bool SetDataUsingQuery(string qry)
        {
            bool returnvalue;
            try
            {
                DataTable dt = new DataTable();
                SetSQLconnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = qry;
                cmd.Connection = con;
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                    returnvalue = true;
                else
                    returnvalue = false;
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
                returnvalue = false;
            }
            finally { CloseSqlConnection(); }
            return returnvalue;
        }
        public int SetDataUsingQueryInt(string qry)
        {
            int returnvalue;
            try
            {
                DataTable dt = new DataTable();
                SetSQLconnection();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = qry;
                cmd.Connection = con;
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                    returnvalue = i;
                else
                    returnvalue = i;
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
                returnvalue = 0;
            }
            finally { CloseSqlConnection(); }
            return returnvalue;
        }
        public DateTime GetCurrentIndianDate()
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
                    // resdt = Convert.ToString(words[1]) + "/" + Convert.ToString(words[0]) + "/" + Convert.ToString(words[2]);
                    resdt = new DateTime(Convert.ToInt32(words[2]), Convert.ToInt32(words[1]), Convert.ToInt32(words[0]));
                }
            }
            return resdt;
        }
        public bool ExecuteNonQuery(string Query)
        {
            bool flag = false;
            try
            {
                SetSQLconnection();
                SqlCommand cmd = new SqlCommand();
                cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                flag = true;
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                CloseSqlConnection();
            }
            return flag;
        }
        public DateTime getddmmyydatestringForACTC(string inputdt)
        {
            DateTime resdt = DateTime.Now.Date;
            try
            {

                char[] splitChar = { '/', '-', ' ' };
                if (inputdt != "")
                {
                    string[] words = inputdt.Split(splitChar);
                    if (words.Length >= 3)
                    {
                        resdt = Convert.ToDateTime(Convert.ToString(words[1]) + "/" + Convert.ToString(words[0]) + "/" + Convert.ToString(words[2]));
                        //resdt = new DateTime(Convert.ToInt32(words[2]), Convert.ToInt32(words[1]), Convert.ToInt32(words[0]));
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return resdt;
        }
        public int GetCurrentRowNumber(string Query)
        {

            int currentRow = 0;
            try
            {
                SetSQLconnection();
                SqlDataAdapter da = new SqlDataAdapter(Query, con);
                //   da = new SqlDataAdapter(Query, con);
                DataSet ds = new DataSet();
                // ds = new DataSet();
                da.Fill(ds, "DataTable");
                DataTable dt = ds.Tables[0];
                for (currentRow = 0; currentRow <= dt.Rows.Count;)
                {
                    currentRow++;
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return currentRow;
        }

        public string GetCurrentFinancialYear(DateTime dt)
        {
            int CurrentYear = dt.Year;
            int PreviousYear = dt.Year - 1;
            int NextYear = dt.Year + 1;
            string PreYear = PreviousYear.ToString();
            string NexYear = NextYear.ToString();
            string CurYear = CurrentYear.ToString();
            string FinYear = null;

            if (dt.Month > 3)
                FinYear = CurYear + "-" + NexYear;
            else
                FinYear = PreYear + "-" + CurYear;
            return FinYear.Trim();

        }
        public string textConvert(string S)
        {
            if (S == null) { return null; }
            try
            {
                System.Text.Encoding encFrom = System.Text.Encoding.UTF8;
                System.Text.Encoding encTo = System.Text.Encoding.UTF8;
                string str = S;
                Byte[] b = encFrom.GetBytes(str);
                return encTo.GetString(b);
            }
            catch { return null; }
        }
        public string ConvertNumbertoWords(int number)
        {
            if (number == 0)
                return "ZERO";
            if (number < 0)
                return "minus " + ConvertNumbertoWords(Math.Abs(number));
            string words = "";
            if ((number / 1000000) > 0)
            {
                words += ConvertNumbertoWords(number / 1000000) + " MILLION ";
                number %= 1000000;
            }
            if ((number / 1000) > 0)
            {
                words += ConvertNumbertoWords(number / 1000) + " THOUSAND ";
                number %= 1000;
            }
            if ((number / 100) > 0)
            {
                words += ConvertNumbertoWords(number / 100) + " HUNDRED ";
                number %= 100;
            }
            if (number > 0)
            {
                if (words != "")
                    words += "AND ";
                var unitsMap = new[] { "ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN", "NINETEEN" };
                var tensMap = new[] { "ZERO", "TEN", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY" };

                if (number < 20)
                    words += unitsMap[number];
                else
                {
                    words += tensMap[number / 10];
                    if ((number % 10) > 0)
                        words += " " + unitsMap[number % 10];
                }
            }
            return words;


        }
    }
}

