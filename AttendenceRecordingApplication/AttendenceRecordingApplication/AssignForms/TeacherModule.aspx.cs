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
    public partial class TeacherModule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendenceString"].ConnectionString);

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            conn.Open();
            var TID = tidList.SelectedValue;
            var TNAME = tnameTxt.Text;
            var MID = midList.SelectedValue;
            var MNAME = mnameTxt.Text;
            var HPW = hpwTxt.Text;

            SqlCommand sql = new SqlCommand("INSERT INTO TEACHERMODULE (TEACHERID, TEACHERNAME, MODULEID, MODULENAME, HOURSPERWEEK)" +
                " VALUES ('" + TID + "', '" + TNAME + "', '" + MID + "', '" + MNAME + "', '" + HPW + "')", conn);
            sql.ExecuteNonQuery();
            conn.Close();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            tnameTxt.Text = "";
            mnameTxt.Text = "";
            hpwTxt.Text = "";
        }

        protected void reBtnTeacher_Click(object sender, ImageClickEventArgs e)
        {
            conn.Open();
            var TID = tidList.SelectedValue;

            SqlCommand sql = new SqlCommand("SELECT NAME FROM TEACHER " +
                "WHERE ID = '" + TID + "' ", conn);
            sql.ExecuteNonQuery();

            SqlDataReader dr;
            dr = sql.ExecuteReader();
            while (dr.Read())
            {
                string nam = (string)dr["NAME"].ToString();
                tnameTxt.Text = nam;
            }
            conn.Close();
        }

        protected void reBtnModule_Click(object sender, ImageClickEventArgs e)
        {
            conn.Open();
            var MID = midList.SelectedValue;

            SqlCommand sql = new SqlCommand("SELECT MODULENAME FROM MODULE " +
                "WHERE MODULEID = '" + MID + "' ", conn);
            sql.ExecuteNonQuery();

            SqlDataReader dr;
            dr = sql.ExecuteReader();
            while (dr.Read())
            {
                string nam = (string)dr["MODULENAME"].ToString();
                mnameTxt.Text = nam;
            }
            conn.Close();
        }
    }
}