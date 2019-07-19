using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendenceRecordingApplication
{
    public partial class Web : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("../Login/Login.aspx");
            }
            else
            {
                var user = Session["username"];
            }
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../Login/Login.aspx");
        }
    }
}