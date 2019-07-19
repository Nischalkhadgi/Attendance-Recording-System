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
    public partial class Course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendenceString"].ConnectionString);

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            conn.Open();
            var NAME = nameTxt.Text;
            var HOURS = RadioButtonList1.SelectedValue;
            var LEADER = leaderTxt.Text;
            var LEADERID = leaderList.SelectedValue;
            var CNAME = cNameTxt.Text;
            var CID = cidList.SelectedValue;

            SqlCommand sql = new SqlCommand("INSERT INTO MODULE (MODULENAME, CREDITHOURS, MODULELEADER, MODULELEADERID, COURSENAME, COURSEID)" +
                " VALUES ('" + NAME + "', '" + HOURS + "', '" + LEADER + "', '" + LEADERID + "', '"+CNAME+"', '"+CID+"')", conn);
            sql.ExecuteNonQuery();
            conn.Close();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void cidList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void reBtnCourse_Click(object sender, ImageClickEventArgs e)
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
                cNameTxt.Text = nam;
            }
            conn.Close();
        }

        protected void reBtnLeader_Click(object sender, ImageClickEventArgs e)
        {
            conn.Open();
            var ID = leaderList.SelectedValue;

            SqlCommand sql = new SqlCommand("SELECT NAME FROM TEACHER " +
                "WHERE ID = '" + ID + "' ", conn);
            sql.ExecuteNonQuery();

            SqlDataReader dr;
            dr = sql.ExecuteReader();
            while (dr.Read())
            {
                string nam = (string)dr["NAME"].ToString();
                leaderTxt.Text = nam;
            }
            conn.Close();
        }
    }
}