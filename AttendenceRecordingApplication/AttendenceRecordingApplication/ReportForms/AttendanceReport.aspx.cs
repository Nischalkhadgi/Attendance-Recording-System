using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendenceRecordingApplication.ReportForms
{
    public partial class AttendanceReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendenceString"].ConnectionString);


        protected void viewAttendance_Click(object sender, EventArgs e)
        {
            var DURATION = durationList.SelectedValue;

            if (DURATION == "Daily")
            {
                var Date = DateTime.Now;

            }
            else if (DURATION == "Weekly")
            {

                var week = DateTime.Now.Month;
                var year = DateTime.Now.Year;
                var MONDAY = DateTime.Now.AddDays(((int)DateTime.Now.DayOfWeek * -1) + 1);
                MONDAY = new DateTime(MONDAY.Year, MONDAY.Month, MONDAY.Day, 00, 0, 0);

                var FRIDAY = MONDAY.AddDays(4);
                FRIDAY = new DateTime(FRIDAY.Year, FRIDAY.Month, FRIDAY.Day, 23, 0, 0);

            }
            else
            {

            }

            conn.Open();
            var SID = studentList.SelectedValue;
            SqlCommand sql = new SqlCommand("SELECT STUDENTID, STUDENTNAME, CLASSID, DATE, STATUS" +
                "FROM ATTENDENCE WHERE STUDENTID='"+SID+"'", conn);
            sql.ExecuteNonQuery();

            SqlDataReader dr;
            dr = sql.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            attendanceGrid.DataSource = dt.DefaultView;
            attendanceGrid.DataBind();
            dr.Close();
            conn.Close();
        }
    }
}