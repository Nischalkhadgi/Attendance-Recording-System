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
    public partial class Teacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendenceString"].ConnectionString);


        protected void AddBtn_Click(object sender, EventArgs e)
        {
            conn.Open();
            var NAME = nameTxt.Text;
            var ADDRESS = addressTxt.Text;
            var CONTACT = contactTxt.Text;
            var EMAIL = emailTxt.Text;
            var DOB = dobTxt.Text;

            SqlCommand sql = new SqlCommand("INSERT INTO TEACHER (NAME, ADDRESS, CONTACT, EMAIL)" +
                " VALUES ('" + NAME + "', '" + ADDRESS + "', '" + CONTACT + "', '" + EMAIL + "')", conn);
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