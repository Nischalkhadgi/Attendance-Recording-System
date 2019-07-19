<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="EnrolledStudents.aspx.cs" Inherits="AttendenceRecordingApplication.ReportForms.EnrolledStudents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <table class="formTbl">
        <tr>
            <td>
                Select a course:
            </td>
            <td>
                <asp:DropDownList ID="courseList" runat="server" DataSourceID="SqlDataSource1" DataTextField="CourseName" DataValueField="CourseID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT [CourseName], [CourseID] FROM [StudentCourse]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="filterStudent" runat="server" Text="Filter Students" OnClick="filterStudent_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tableContent" runat="server">
    <asp:GridView ID="enrolledStudentGrid" runat="server">
    </asp:GridView>
</asp:Content>
