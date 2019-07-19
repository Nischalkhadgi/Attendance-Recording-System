<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="AttendenceRecordingApplication.Course1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <table class="formTbl">
        <tr>
            <td>
                Name:
            </td>
            <td>
                <asp:TextBox ID="nameTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                Year to Complete:
            </td>
            <td>
                <asp:TextBox ID="yearTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
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
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CourseID" DataSourceID="SqlDataSource1">
        <AlternatingRowStyle BackColor="#66CCFF" BorderColor="#666666" ForeColor="Black" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="CourseID" HeaderText="Course ID" InsertVisible="False" ReadOnly="True" SortExpression="CourseID" />
            <asp:BoundField DataField="CourseName" HeaderText="Course Name" SortExpression="CourseName" />
            <asp:BoundField DataField="Year" HeaderText="Total Years" SortExpression="Year" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" DeleteCommand="DELETE FROM [Course] WHERE [CourseID] = @CourseID" InsertCommand="INSERT INTO [Course] ([CourseName], [Year]) VALUES (@CourseName, @Year)" SelectCommand="SELECT * FROM [Course]" UpdateCommand="UPDATE [Course] SET [CourseName] = @CourseName, [Year] = @Year WHERE [CourseID] = @CourseID">
        <DeleteParameters>
            <asp:Parameter Name="CourseID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CourseName" Type="String" />
            <asp:Parameter Name="Year" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CourseName" Type="String" />
            <asp:Parameter Name="Year" Type="Int32" />
            <asp:Parameter Name="CourseID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

