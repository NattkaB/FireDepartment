using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace GroupProject
{
    public partial class administrator : System.Web.UI.Page

    {
        SqlConnection conn;
        string connstring = "Server=den1.mssql2.gear.host;" +
        "Initial Catalog=firedep1;" +
        "User ID=firedep1;" +
        "Password=Fr6ed-V2ip!2;" +
        "Integrated Security=false";

        protected void Page_Load(object sender, EventArgs e)
        {
            {
                try
                {
                    //conn = new SqlConnection(connstring);
                    //SqlCommand comm = new SqlCommand("ShowAllRecords1", conn);
                    //sqlDataReader reader;
                   // comm.CommandType = CommandType.StoredProcedure;
                    //conn.Open();
                    //SqlDataReader reader = comm.ExecuteReader();
                    //while (reader.Read())
                    //{
                    //    showResults.InnerHtml += reader["fname"];
                    //    showResults.InnerHtml += reader["lname"];
                    //    showResults.InnerHtml += reader["phone"];
                     //   showResults.InnerHtml += reader["email"];
                     //   showResults.InnerHtml += reader["prefmethod"];
                     //   showResults.InnerHtml += reader["besttime"];
                     //   showResults.InnerHtml += "<a target = new href=deleteme.aspx?ID=";
                    //    showResults.InnerHtml += reader[ID].ToString();
                     //   showResults.InnerHtml += ">DELETE</";

                    //}
                   

                }
                catch (Exception exc)
                {
                    Response.Write(exc.Message);
                }
                finally
                {
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }
            }



        }
    }
}