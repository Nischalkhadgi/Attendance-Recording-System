using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendenceRecordingApplication.UserManagement
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendenceString"].ConnectionString);


        protected void AddBtn_Click(object sender, EventArgs e)
        {
            conn.Open();
            var NAME = usernameTxt.Text;
            var PASSWORD = passwordTxt.Text;
            var TID = tidList.SelectedValue;
           
            SqlCommand sql = new SqlCommand("INSERT INTO USERS (USERNAME, PASSWORD, TEACHERID)" +
                " VALUES ('" + NAME + "', '" + PASSWORD + "', '" + TID + "')", conn);
            sql.ExecuteNonQuery();
            conn.Close();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            usernameTxt.Text = "";
            passwordTxt.Text = "";
        }
    }
}