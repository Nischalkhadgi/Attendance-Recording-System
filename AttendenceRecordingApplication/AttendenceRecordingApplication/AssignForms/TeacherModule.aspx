<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="TeacherModule.aspx.cs" Inherits="AttendenceRecordingApplication.AssignForms.TeacherModule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <table class="formTbl">
        <tr>
            <td>
                Teacher ID:
            </td>
            <td>
                <asp:DropDownList ID="tidList" runat="server" DataSourceID="SqlDataSource1" DataTextField="ID" DataValueField="ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT [ID] FROM [Teacher]"></asp:SqlDataSource>
            </td>
            <td>
                Teacher Name:
            </td>
            <td>
                <asp:TextBox ID="tnameTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="reBtnTeacher" runat="server" Height="26px" ImageUrl="~/Images/refresh-icon-30.png" OnClick="reBtnTeacher_Click" />
            </td>
        </tr>
        <tr>
            <td>
                Module ID:
            </td>
            <td>
                <asp:DropDownList ID="midList" runat="server" DataSourceID="SqlDataSource2" DataTextField="ModuleID" DataValueField="ModuleID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT [ModuleID] FROM [Module]"></asp:SqlDataSource>
            </td>
            <td>
                Module Name:
            </td>
            <td>
                <asp:TextBox ID="mnameTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="reBtnModule" runat="server" Height="26px" ImageUrl="~/Images/refresh-icon-30.png" OnClick="reBtnModule_Click" />
            </td>
        </tr>
        <tr>
            <td>
                Hours Per Week:
            </td>
            <td>
                <asp:TextBox ID="hpwTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
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
        <asp:BoundField DataField="TeacherID" HeaderText="TeacherID" SortExpression="TeacherID" />
        <asp:BoundField DataField="TeacherName" HeaderText="TeacherName" SortExpression="TeacherName" />
        <asp:BoundField DataField="ModuleID" HeaderText="ModuleID" SortExpression="ModuleID" />
        <asp:BoundField DataField="ModuleName" HeaderText="ModuleName" SortExpression="ModuleName" />
        <asp:BoundField DataField="HoursPerWeek" HeaderText="HoursPerWeek" SortExpression="HoursPerWeek" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT * FROM [TeacherModule]"></asp:SqlDataSource>
</asp:Content>
