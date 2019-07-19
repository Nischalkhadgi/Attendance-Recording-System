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
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendenceString"].ConnectionString);
        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            conn.Open();
            var UNAME = unameTxt.Text;
            var PASSWORD = passwordTxt.Text;
           
            string query = "SELECT COUNT(1) FROM [User] WHERE [UserName]='"+UNAME+"' AND [Password]='"+PASSWORD+"'";
            SqlCommand sql = new SqlCommand(query, conn);
            int count = Convert.ToInt32(sql.ExecuteScalar());
            if (count == 1)
            {
                Session["username"] = unameTxt.Text.ToString();
                Page.Response.Redirect("../Login/Home.aspx");
            }
            else
            {
                string query1 = "SELECT COUNT(1) FROM [Admin] WHERE [Username]='" + UNAME + "' AND [Password]='" + PASSWORD + "'";
                SqlCommand sql1 = new SqlCommand(query1, conn);
                int count1 = Convert.ToInt32(sql1.ExecuteScalar());
                if(count1 == 1)
                {
                    Session["username"] = "Admin";
                    Page.Response.Redirect("../Login/Home.aspx");
                }
                else
                {
                    
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Invalid User');</script>");
                }
       
            }
        }
    }
}