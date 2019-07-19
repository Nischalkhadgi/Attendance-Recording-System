<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="StudentClass.aspx.cs" Inherits="AttendenceRecordingApplication.AssignForms.StudentClass" %>
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
                <asp:DropDownList ID="sidList" runat="server" DataSourceID="SqlDataSource1" DataTextField="ID" DataValueField="ID" OnSelectedIndexChanged="sidList_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT [ID] FROM [Student]"></asp:SqlDataSource>
            </td>
            <td>
                Student Name:
            </td>
            <td>
                <asp:TextBox ID="snameTxt" runat="server" Height="26px" Width="220px" ReadOnly="True"></asp:TextBox>
                <asp:ImageButton ID="reBtnStudent" runat="server" Height="26px" ImageUrl="~/Images/refresh-icon-30.png" OnClick="reBtnStudent_Click" />
            </td>
        </tr>
        <tr>
            <td>
                Class ID:
            </td>
            <td>
                <asp:DropDownList ID="cidList" runat="server">
                </asp:DropDownList>
                <asp:ImageButton ID="reBtnClass" runat="server" Height="26px" ImageUrl="~/Images/refresh-icon-30.png" OnClick="reBtnClass_Click" />
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
    <Columns>
        <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
        <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
        <asp:BoundField DataField="ClassID" HeaderText="ClassID" SortExpression="ClassID" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT * FROM [StudentClass]"></asp:SqlDataSource>
</asp:Content>
