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
    public partial class EnrolledStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populateGrid();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendenceString"].ConnectionString);

        void populateGrid()
        {
            conn.Open();
            SqlCommand sql = new SqlCommand("SELECT STUDENTID, STUDENTNAME, COURSEID, COURSENAME, ENROLLEDDATE" +
                "FROM STUDENTCOURSE ORDER BY ENROLLEDDATE ", conn);
            sql.ExecuteNonQuery();

            SqlDataReader dr;
            dr = sql.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            enrolledStudentGrid.DataSource = dt.DefaultView;
            enrolledStudentGrid.DataBind();
            dr.Close();
            conn.Close();
        }

        protected void filterStudent_Click(object sender, EventArgs e)
        {
            conn.Open();
            var CID = courseList.SelectedValue;

            SqlCommand sql = new SqlCommand("SELECT STUDENTID, STUDENTNAME, COURSEID, COURSENAME, ENROLLEDDATE" +
                "FROM STUDENTCOURSE WHERE COURSEID = '" + CID + "' ORDER BY ENROLLEDDATE ", conn);
            sql.ExecuteNonQuery();

            SqlDataReader dr;
            dr = sql.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            enrolledStudentGrid.DataSource = dt.DefaultView;
            enrolledStudentGrid.DataBind();
            dr.Close();
            conn.Close();
        }
    }
}