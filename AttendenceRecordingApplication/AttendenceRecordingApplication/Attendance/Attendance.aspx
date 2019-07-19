<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="AttendenceRecordingApplication.Attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <table class="formTbl">
        <tr>
            <td>
                Select one of your class:
            </td>
            <td>
                <asp:DropDownList ID="classList" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="listStudent" runat="server" Text="List Students" OnClick="listStudent_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tableContent" runat="server">
    <asp:GridView ID="attendanceGrid" AutoGenerateColumns="false" runat="server"
            ShowHeaderWhenEmpty="true" >
        
        <Columns>
            <asp:TemplateField HeaderText="Student ID">
                <ItemTemplate>
                    <asp:Label ID="sID" Text='<%# Eval("STUDENTID") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Student Name">
                <ItemTemplate>
                    <asp:Label ID="sName" Text='<%# Eval("STUDENTNAME") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:DropDownList ID="statusList" runat="server">
                        <asp:ListItem>P</asp:ListItem>
                        <asp:ListItem>L</asp:ListItem>
                        <asp:ListItem>A</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
    <br />
    <br />
    <asp:Button ID="saveBtn" runat="server" Text="Save Class Attendence" OnClick="saveBtn_Click" />
    <br />
                <asp:Label ID="Userlbl" runat="server" Text="Label"></asp:Label>
            <br />
                <asp:Label ID="Userlbl0" runat="server" Text="Label"></asp:Label>
            <br />
                <asp:Label ID="Userlbl1" runat="server" Text="Label"></asp:Label>
            <br />
                <asp:Label ID="Userlbl2" runat="server" Text="Label"></asp:Label>
            <br />
                <asp:Label ID="Userlbl3" runat="server" Text="Label"></asp:Label>
            <br />
                <asp:Label ID="Userlbl4" runat="server" Text="Label"></asp:Label>
            <br />
</asp:Content>
