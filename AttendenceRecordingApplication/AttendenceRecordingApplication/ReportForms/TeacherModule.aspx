<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="TeacherModule.aspx.cs" Inherits="AttendenceRecordingApplication.ReportForms.TeacherModule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <table class="formTbl">
        <tr>
            <td>
                Select a module:
            </td>
            <td>
                <asp:DropDownList ID="moduleList" runat="server" DataSourceID="SqlDataSource1" DataTextField="ModuleID" DataValueField="ModuleID" >
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT DISTINCT(ModuleID), ModuleName FROM TeacherModule"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="filterTeacher" runat="server" Text="Filter Teacher" OnClick="filterTeacher_Click" />
            </td>
        </tr>
    </table>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tableContent" runat="server">
    <asp:GridView ID="teacherModuleGrid" runat="server">
    </asp:GridView>
</asp:Content>
