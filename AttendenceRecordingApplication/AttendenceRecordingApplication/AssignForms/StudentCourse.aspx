<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="StudentCourse.aspx.cs" Inherits="AttendenceRecordingApplication.AssignForms.StudentCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <table class="formTbl">
        <tr>
            <td>
                Student ID:
            </td>
            <td>
                <asp:DropDownList ID="sidList" runat="server" DataSourceID="SqlDataSource1" DataTextField="ID" DataValueField="ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT [ID] FROM [Student]"></asp:SqlDataSource>
            </td>
            <td>
                Student Name:
            </td>
            <td>
                <asp:TextBox ID="snameTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
                <asp:ImageButton ID="reBtnSname" runat="server" Height="26px" ImageUrl="~/Images/refresh-icon-30.png" OnClick="reBtnSname_Click" />
            </td>
        </tr>
        <tr>
            <td>
                Course ID:
            </td>
            <td>
                <asp:DropDownList ID="cidList" runat="server" DataSourceID="SqlDataSource2" DataTextField="CourseID" DataValueField="CourseID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT [CourseID] FROM [Course]"></asp:SqlDataSource>
            </td>
            <td>
                Course Name:
            </td>
            <td>
                <asp:TextBox ID="cnameTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
                <asp:ImageButton ID="reBtnCname" runat="server" Height="26px" ImageUrl="~/Images/refresh-icon-30.png" OnClick="reBtnCname_Click" />
            </td>
        </tr>
        <tr>
            <td>
                Enrolled Date:
            </td>
            <td>
                <asp:TextBox ID="dateTxt" TextMode="Date" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <table class="btnTbl">
        <tr>
            <td>
                <asp:Button class="btn" ID="AddBtn" runat="server" Height="54px" Text="Add" Width="110px" OnClick="AddBtn_Click" />
			</td>
            <td>
                <asp:Button class="btn" ID="ResetBtn" runat="server" Height="54px" Text="Reset" Width="110px" OnClick="ResetBtn_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tableContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
    <Columns>
        <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
        <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
        <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
        <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
        <asp:BoundField DataField="EnrolledDate" HeaderText="EnrolledDate" SortExpression="EnrolledDate" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT * FROM [StudentCourse]"></asp:SqlDataSource>
</asp:Content>
