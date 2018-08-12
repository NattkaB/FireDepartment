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
    public partial class volunteer : System.Web.UI.Page
    {
        SqlConnection conn;
        string connstring = "Server=den1.mssql2.gear.host;" +
        "Initial Catalog=firedep1;" +
        "User ID=firedep1;" +
        "Password=Fr6ed-V2ip!2;" +
        "Integrated Security=false";

        protected void Page_Load(object sender, EventArgs e)
       {

           if (!this.IsPostBack)
                {
                ddlThings.Items.Add(new ListItem("By E-mail"));
                ddlThings.Items.Add(new ListItem("By Phone"));
               }
            if (!this.IsPostBack)
                 {
                ddlbesttime.Items.Add(new ListItem("6.00 am - 9.00 am"));
                ddlbesttime.Items.Add(new ListItem("9.00 am - 12.00 pm"));
                ddlbesttime.Items.Add(new ListItem("12.00 pm - 3.00 pm"));
                ddlbesttime.Items.Add(new ListItem("3.00 pm - 6.00 pm"));
                ddlbesttime.Items.Add(new ListItem("6.00 pm - 9.00 pm"));
                 }
            
            try
            {
                conn = new SqlConnection();
                conn.ConnectionString = connstring;
                conn.Open();
                string strCommand = "Select * from tblMeetings;";
                SqlCommand comm = new SqlCommand(strCommand, conn);
                SqlDataReader dr = comm.ExecuteReader();

                divMeetings.InnerHtml = "<ul>";
                while (dr.Read())
                {
                    divMeetings.InnerHtml += "<li>" + Convert.ToDateTime(dr["mdate"]).ToString("MM/dd/yyyy") + "</li>";
                    divMeetings.InnerHtml += "<li>" + dr["mtime"].ToString() + "<li>" +"<br/>";
                }
                divMeetings.InnerHtml += "</ul>";

            }

            catch (Exception erProblem)
            {
                Response.Write(erProblem.Message.ToString());
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }
        protected void ddlThings_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlThings.SelectedItem.Text =="By Phone")
            {
                Showtime.Visible = true;
                ddlbesttime.Visible = true;
            }
            else
            {
                Showtime.Visible = false;
                ddlbesttime.Visible = false;
            }
        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                conn = new SqlConnection(connstring);
                SqlCommand comm = new SqlCommand("CreateVolunteer1", conn);
                comm.CommandType = CommandType.StoredProcedure;

                SqlParameter sparamName1 = new SqlParameter("@fname", SqlDbType.VarChar);
                SqlParameter sparamName2 = new SqlParameter("@lname", SqlDbType.VarChar);
                SqlParameter sparamName3 = new SqlParameter("@phone", SqlDbType.VarChar);
                SqlParameter sparamName4 = new SqlParameter("@email", SqlDbType.VarChar);
                SqlParameter sparamName5 = new SqlParameter("@prefmethod", SqlDbType.VarChar);
                SqlParameter sparamName6 = new SqlParameter("@besttime", SqlDbType.VarChar);

                sparamName1.Value = fname.Text;
                sparamName2.Value = lname.Text;
                sparamName3.Value = phone.Text;
                sparamName4.Value = email.Text;
                sparamName5.Value = ddlThings.Text;
                sparamName6.Value = ddlbesttime.Text;

                comm.Parameters.Add(sparamName1);
                comm.Parameters.Add(sparamName2);
                comm.Parameters.Add(sparamName3);
                comm.Parameters.Add(sparamName4);
                comm.Parameters.Add(sparamName5);
                comm.Parameters.Add(sparamName6);

                if (ddlThings.SelectedItem.Text == "By E-mail")
                {
                    sparamName6.Value = "n/a";
                }

                conn.Open();
                //object oID = comm.ExecuteScalar();
                //int iID = Convert.ToInt16(oID);
                lblID.Text = "Thank you, "+ fname.Text + ", Your Info was successfully submitted.";

                //Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (Exception elvis)
            {
                Response.Write(elvis.Message);
            }
            finally
            {
                if (conn!= null)
                {
                    conn.Close();
                }
            }
        }
    }
}