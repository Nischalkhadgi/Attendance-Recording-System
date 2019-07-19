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
    public partial class StudentCourse : System.Web.UI.Page
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
            var CNAME = cnameTxt.Text;
            var DATE = dateTxt.Text;

            SqlCommand sql = new SqlCommand("INSERT INTO STUDENTCOURSE (STUDENTID, STUDENTNAME, COURSEID, COURSENAME, ENROLLEDDATE)" +
                " VALUES ('" + SID + "', '" + SNAME + "', '" + CID + "', '" + CNAME + "', '"+ DATE +"')", conn);
            sql.ExecuteNonQuery();
            conn.Close();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            snameTxt.Text = "";
            cnameTxt.Text = "";
            dateTxt.Text = "";
        }

        protected void reBtnSname_Click(object sender, ImageClickEventArgs e)
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

        protected void reBtnCname_Click(object sender, ImageClickEventArgs e)
        {
            conn.Open();
            var CID = cidList.SelectedValue;

            SqlCommand sql = new SqlCommand("SELECT COURSENAME FROM COURSE " +
                "WHERE COURSEID = '" + CID + "' ", conn);
            sql.ExecuteNonQuery();

            SqlDataReader dr;
            dr = sql.ExecuteReader();
            while (dr.Read())
            {
                string nam = (string)dr["COURSENAME"].ToString();
                cnameTxt.Text = nam;
            }
            conn.Close();
        }
    }
}