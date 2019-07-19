using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendenceRecordingApplication.AssignForms
{
    public partial class StudentClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendenceString"].ConnectionString);

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            conn.Open();
            var SID = sidList.SelectedValue;
            var SNAME = snameTxt.Text;
            var CID = cidList.SelectedValue;

            SqlCommand sql = new SqlCommand("INSERT INTO STUDENTCLASS (STUDENTID, STUDENTNAME, CLASSID)" +
                " VALUES ('" + SID + "', '" + SNAME + "', '" + CID + "')", conn);
            sql.ExecuteNonQuery();
            conn.Close();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            snameTxt.Text = "";
        }

        protected void reBtnStudent_Click(object sender, ImageClickEventArgs e)
        {
            conn.Open();
            var SID = sidList.SelectedValue;

            SqlCommand sql = new SqlCommand("SELECT NAME FROM STUDENT " +
                "WHERE ID = '" + SID + "' ", conn);
            sql.ExecuteNonQuery();

            SqlDataReader dr;
            dr = sql.ExecuteReader();
            while (dr.Read())
            {
                string nam = (string)dr["NAME"].ToString();
                snameTxt.Text = nam;
            }
            conn.Close();
        }

        protected void reBtnClass_Click(object sender, ImageClickEventArgs e)
        {
            conn.Open();
            var SID = sidList.SelectedValue;

            SqlCommand sql = new SqlCommand("SELECT C.CLASSID AS CID FROM CLASS C, STUDENTCOURSE SC, MODULE M " +
                "WHERE C.MODULEID=M.MODULEID AND M.COURSEID=SC.COURSEID AND SC.STUDENTID='"+ SID +"'", conn);
            cidList.DataSource = sql.ExecuteReader();
            cidList.DataTextField = "CID";
            cidList.DataValueField = "CID";
            cidList.DataBind();
            conn.Close();
        }

        protected void sidList_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}