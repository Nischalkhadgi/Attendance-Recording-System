using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendenceRecordingApplication
{
    public partial class Class : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendenceString"].ConnectionString);

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            conn.Open();
            var TYPE = ctypeList.SelectedValue;
            var STARTTIME = startTimeTxt.Text;
            var DURATION = durationTxt.Text;
            var DAY = dayList.SelectedValue;
            var ROOM = roomTxt.Text;
            var MNAME = mnameTxt.Text;
            var MID = moduleList.SelectedValue;
            var TNAME = tnameTxt.Text;
            var TID = teacherList.SelectedValue;

            SqlCommand sql = new SqlCommand("INSERT INTO CLASS (CLASSTYPE, STARTTIME, DURATION, DAYS, ROOM, MODULENAME, MODULEID, TEACHERNAME, TEACHERID)" +
                " VALUES ('" + TYPE + "', '" + STARTTIME + "', '" + DURATION + "', '" + DAY + "', '" + ROOM + "', '" + MNAME + "', '" + MID + "', '" + TNAME + "','" + TID + "')", conn);
            sql.ExecuteNonQuery();
            conn.Close();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            idTxt.Text = "";
            ctypeList.SelectedIndex = 0;
            startTimeTxt.Text = "";
            durationTxt.Text = "";
            dayList.SelectedIndex = 0;
            roomTxt.Text = "";
            mnameTxt.Text = "";
            tnameTxt.Text = "";

        }

        protected void teacherList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void reBtnModule_Click(object sender, ImageClickEventArgs e)
        {
            conn.Open();
            var MID = moduleList.SelectedValue;

            SqlCommand sql = new SqlCommand("SELECT MODULENAME FROM TEACHERMODULE " +
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

        protected void reBtnTeacher_Click(object sender, ImageClickEventArgs e)
        {
            conn.Open();
            var TID = teacherList.SelectedValue;

            SqlCommand sql = new SqlCommand("SELECT TEACHERNAME FROM TEACHERMODULE " +
                "WHERE TEACHERID = '" + TID + "' ", conn);
            sql.ExecuteNonQuery();

            SqlDataReader dr;
            dr = sql.ExecuteReader();
            while (dr.Read())
            {
                string nam = (string)dr["TEACHERNAME"].ToString();
                tnameTxt.Text = nam;
            }
            conn.Close();
        }

        protected void reBtnTID_Click(object sender, ImageClickEventArgs e)
        {
            conn.Open();
            var MID = moduleList.SelectedValue;

            SqlCommand sql = new SqlCommand("SELECT TEACHERID FROM TEACHERMODULE WHERE MODULEID='"+ MID +"'", conn);
            teacherList.DataSource = sql.ExecuteReader();
            teacherList.DataTextField = "TEACHERID";
            teacherList.DataValueField = "TEACHERID";
            teacherList.DataBind();
            conn.Close();
        }
    }
}