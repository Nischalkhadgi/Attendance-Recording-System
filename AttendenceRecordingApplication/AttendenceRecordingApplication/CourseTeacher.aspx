<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="CourseTeacher.aspx.cs" Inherits="AttendenceRecordingApplication.CourseTeacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    
    <div class="selector">
        <asp:Label class="lbl" ID="Label1" runat="server" Text="Select a Course: "></asp:Label>
        <asp:DropDownList ID="courseList" runat="server" Height="26px" Width="200px">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="listBtn" runat="server" Text="List Teachers" />
        <br />
    </div>
    
    <br />

    <table class="complexTbl">
        <tr>
            <td>
                <asp:Label class="lbl" ID="Label2" runat="server" Text="Course ID: "></asp:Label>
            </td>
            <td>
                <asp:Label class="lbl" ID="IDlbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label class="lbl" ID="Label3" runat="server" Text="Course Name: "></asp:Label>
            </td>
            <td>
                <asp:Label class="lbl" ID="Namelbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label class="lbl" ID="Label4" runat="server" Text="Credit Hours: "></asp:Label>
            </td>
            <td>
                <asp:Label class="lbl" ID="hourslbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label class="lbl" ID="Label5" runat="server" Text="Course Leader: "></asp:Label>
            </td>
            <td>
                <asp:Label class="lbl" ID="cleaderlbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label class="lbl" ID="Label6" runat="server" Text="Course Leader ID: "></asp:Label>
            </td>
            <td>
                <asp:Label class="lbl" ID="cleaderIDlbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

    <br />
    <br />

    <asp:Label class="lbl" ID="Label7" runat="server" Text="List of Teachers teaching this course:"></asp:Label>
    <br />
</asp:Content>
