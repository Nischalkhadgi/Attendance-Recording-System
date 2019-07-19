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
    public partial class TeacherModule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populateGrid();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendenceString"].ConnectionString);

        void populateGrid()
        {
            conn.Open();
            SqlCommand sql = new SqlCommand("SELECT T.ID, T.NAME, T.ADDRESS, T.CONTACT, T.EMAIL, TM.MODULEID, TM.MODULENAME, TM.HOURSPERWEEK" +
                "FROM TEACHER T, TEACHERMODULE TM WHERE T.ID=TM.TEACHERID", conn);
            sql.ExecuteNonQuery();

            SqlDataReader dr;
            dr = sql.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            teacherModuleGrid.DataSource = dt.DefaultView;
            teacherModuleGrid.DataBind();
            dr.Close();
            conn.Close();
        }

        protected void filterTeacher_Click(object sender, EventArgs e)
        {
            conn.Open();
            var MID = moduleList.SelectedValue;

            SqlCommand sql = new SqlCommand("SELECT T.ID, T.NAME, T.ADDRESS, T.CONTACT, T.EMAIL, TM.MODULEID, TM.MODULENAME, TM.HOURSPERWEEK" +
                "FROM TEACHER T, TEACHERMODULE TM WHERE T.ID=TM.TEACHERID AND TM.MODULEID='"+ MID +"'", conn);
            sql.ExecuteNonQuery();

            SqlDataReader dr;
            dr = sql.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            teacherModuleGrid.DataSource = dt.DefaultView;
            teacherModuleGrid.DataBind();
            dr.Close();
            conn.Close();
        }
    }
}