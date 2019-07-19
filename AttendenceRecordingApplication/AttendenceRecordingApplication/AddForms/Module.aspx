<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Module.aspx.cs" Inherits="AttendenceRecordingApplication.Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">

    <table class="formTbl">
        <tr>
            <td>
                ID (Auto-generate):     
            </td>
            <td>
                <asp:TextBox ID="idTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                Name:
            </td>
            <td>
                <asp:TextBox ID="nameTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Credit Hours:
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="199px" Height="33px">
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            
        </tr>
        <tr>
            <td>
                Course ID:
            </td>
            <td>
                <asp:DropDownList ID="cidList" runat="server" DataSourceID="SqlDataSource1" DataTextField="CourseID" DataValueField="CourseID" CssClass="auto-style4" Height="26px" Width="220px" OnSelectedIndexChanged="cidList_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT [CourseID] FROM [Course]"></asp:SqlDataSource>
            </td>
            <td>
                Course Name:
            </td>
            <td>
                <asp:TextBox ID="cNameTxt" runat="server" ReadOnly="True" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="reBtnCourse" runat="server" Height="26px" ImageUrl="~/Images/refresh-icon-30.png" OnClick="reBtnCourse_Click" />
            </td>
        </tr>
        <tr>
            <td>
                Module Leader ID:
            </td>
            <td>
                <asp:DropDownList ID="leaderList" runat="server" DataSourceID="SqlDataSource2" DataTextField="ID" DataValueField="ID" CssClass="auto-style4" Height="26px" Width="220px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT [ID] FROM [Teacher]"></asp:SqlDataSource>
            </td>
            <td>
                Module Leader Name:
            </td>
            <td>
                <asp:TextBox ID="leaderTxt" runat="server" ReadOnly="True" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="reBtnLeader" runat="server" Height="26px" ImageUrl="~/Images/refresh-icon-30.png" OnClick="reBtnLeader_Click" />
            </td>
        </tr>
    </table>
        
    <br />
            
    <br />
    <table class="btnTbl">
        <tr>
            <td>
                <asp:Button class="btn" ID="AddBtn" runat="server" Height="54px" Text="Add" Width="110px" OnClick="AddBtn_Click" />
			</td>
            <td>
                <asp:Button class="btn" ID="ResetBtn" runat="server" Height="54px" Text="Reset" Width="110px" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tableContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ModuleID" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ModuleID" HeaderText="ModuleID" InsertVisible="False" ReadOnly="True" SortExpression="ModuleID" />
            <asp:BoundField DataField="ModuleName" HeaderText="ModuleName" SortExpression="ModuleName" />
            <asp:BoundField DataField="CreditHours" HeaderText="CreditHours" SortExpression="CreditHours" />
            <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
            <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
            <asp:BoundField DataField="ModuleLeaderID" HeaderText="ModuleLeaderID" SortExpression="ModuleLeaderID" />
            <asp:BoundField DataField="ModuleLeader" HeaderText="ModuleLeader" SortExpression="ModuleLeader" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" DeleteCommand="DELETE FROM [Module] WHERE [ModuleID] = @ModuleID" InsertCommand="INSERT INTO [Module] ([ModuleName], [CreditHours], [CourseID], [CourseName], [ModuleLeaderID], [ModuleLeader]) VALUES (@ModuleName, @CreditHours, @CourseID, @CourseName, @ModuleLeaderID, @ModuleLeader)" SelectCommand="SELECT * FROM [Module]" UpdateCommand="UPDATE [Module] SET [ModuleName] = @ModuleName, [CreditHours] = @CreditHours, [CourseID] = @CourseID, [CourseName] = @CourseName, [ModuleLeaderID] = @ModuleLeaderID, [ModuleLeader] = @ModuleLeader WHERE [ModuleID] = @ModuleID">
        <DeleteParameters>
            <asp:Parameter Name="ModuleID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ModuleName" Type="String" />
            <asp:Parameter Name="CreditHours" Type="Int32" />
            <asp:Parameter Name="CourseID" Type="Int32" />
            <asp:Parameter Name="CourseName" Type="String" />
            <asp:Parameter Name="ModuleLeaderID" Type="Int32" />
            <asp:Parameter Name="ModuleLeader" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ModuleName" Type="String" />
            <asp:Parameter Name="CreditHours" Type="Int32" />
            <asp:Parameter Name="CourseID" Type="Int32" />
            <asp:Parameter Name="CourseName" Type="String" />
            <asp:Parameter Name="ModuleLeaderID" Type="Int32" />
            <asp:Parameter Name="ModuleLeader" Type="String" />
            <asp:Parameter Name="ModuleID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
