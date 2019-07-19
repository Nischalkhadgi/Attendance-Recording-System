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
    public partial class Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                createList();
            }
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendenceString"].ConnectionString);

        protected void createList()
        {
            conn.Open();
            var user = Session["username"].ToString();
            if (user != "Admin")
            {
                SqlCommand sql = new SqlCommand("SELECT C.CLASSID AS CID FROM CLASS C, [USER] U " +
                "WHERE C.TEACHERID=U.TEACHERID AND U.USERNAME='" + user + "'", conn);
                classList.DataSource = sql.ExecuteReader();
                classList.DataTextField = "CID";
                classList.DataValueField = "CID";
                classList.DataBind();
            }
            conn.Close();
        }
        

        protected void listStudent_Click(object sender, EventArgs e)
        {
            PopulateGridview();
            //populateGrid();
        }

        public void populateGrid()
        {
            var CID = classList.SelectedValue;

            DataTable dt = new DataTable();
            dt.Columns.Add("Student ID");
            dt.Columns.Add("Student Name");

            conn.Open();

            SqlCommand cmdID = new SqlCommand("SELECT STUDENTID, STUDENTNAME FROM STUDENTCLASS WHERE CLASSID='"+CID+"'", conn);
            SqlDataReader rdr = cmdID.ExecuteReader();
            while (rdr.Read())
            {
                DataRow dr = dt.NewRow();
                dr["Student ID"] = rdr["STUDENTID"];
                dr["Student Name"] = rdr["STUDENTNAME"];

                dt.Rows.Add(dr);
            }
            attendanceGrid.DataSource = dt;
            attendanceGrid.DataBind();
            conn.Close();

        }

        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            var CID = classList.SelectedValue;

            conn.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT STUDENTID, STUDENTNAME FROM STUDENTCLASS WHERE CLASSID='" + CID + "'", conn);
            sqlDa.Fill(dtbl);
            
            if (dtbl.Rows.Count > 0)
            {
                attendanceGrid.DataSource = dtbl;
                attendanceGrid.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                attendanceGrid.DataSource = dtbl;
                attendanceGrid.DataBind();
                attendanceGrid.Rows[0].Cells.Clear();
                attendanceGrid.Rows[0].Cells.Add(new TableCell());
                attendanceGrid.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                attendanceGrid.Rows[0].Cells[0].Text = "No Data Found ..!";
                attendanceGrid.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in attendanceGrid.Rows)
            {
                var SID = ((Label)row.FindControl("sID")).Text;
                var SNAME = ((Label)row.FindControl("sName")).Text;
                var STATUS = ((DropDownList)row.Cells[2].FindControl("statusList")).SelectedValue;
                var DATE = DateTime.Now;
                var CID = classList.SelectedValue;

                conn.Open();

                SqlCommand sql = new SqlCommand("INSERT INTO ATTENDENCE (STUDENTID, STUDENTNAME, CLASSID, DATE, STATUS)" +
                    " VALUES ('" + SID + "', '" + SNAME + "', '" + CID + "', '" + DATE + "', '" + STATUS + "' )", conn);
                sql.ExecuteNonQuery();
                conn.Close();

                Userlbl.Text = "Success";
            }
        }

    }
}