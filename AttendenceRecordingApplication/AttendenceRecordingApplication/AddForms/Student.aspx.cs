using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendenceRecordingApplication
{
    public partial class Student : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendenceString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            conn.Open();
            var NAME = nameTxt.Text;
            var ADDRESS = addressTxt.Text;
            var CONTACT = contactTxt.Text;
            var EMAIL = emailTxt.Text;
            var DOB = dobTxt.Text;

            SqlCommand sql = new SqlCommand("INSERT INTO STUDENT (NAME, ADDRESS, CONTACT, EMAIL, DATEOFBIRTH)" +
                " VALUES ('" + NAME + "', '" + ADDRESS + "', '" + CONTACT + "', '" + EMAIL + "', '" + DOB + "')", conn);
            sql.ExecuteNonQuery();
            conn.Close();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            idTxt.Text = "";
            nameTxt.Text = "";
            addressTxt.Text = "";
            contactTxt.Text = "";
            emailTxt.Text = "";
            dobTxt.Text = "";
           
        }
    }
}