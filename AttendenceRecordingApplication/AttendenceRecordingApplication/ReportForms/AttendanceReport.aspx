<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="AttendanceReport.aspx.cs" Inherits="AttendenceRecordingApplication.ReportForms.AttendanceReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <table class="formTbl">
        <tr>
            <td>
                Select a student:
            </td>
            <td>
                <asp:DropDownList ID="studentList" runat="server" DataSourceID="SqlDataSource1" DataTextField="StudentName" DataValueField="StudentID" >
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT [StudentID], [StudentName] FROM [StudentClass]"></asp:SqlDataSource>
            </td>
            
        </tr>
        <tr>
            <td>
                Select duration:
            </td>
            <td>
                <asp:DropDownList ID="durationList" runat="server" >
                    <asp:ListItem>Daily</asp:ListItem>
                    <asp:ListItem>Weekly</asp:ListItem>
                    <asp:ListItem>Monthly</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="viewAttendance" runat="server" Text="View Attendance" OnClick="viewAttendance_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tableContent" runat="server">
    <asp:GridView ID="attendanceGrid" runat="server">
    </asp:GridView>
</asp:Content>
