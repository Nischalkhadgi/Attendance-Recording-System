<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="AttendenceRecordingApplication.UserManagement.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <table class="formTbl">
        <tr>
            <td>
                <asp:Label class="lbl" ID="Label2" runat="server" Text="Username:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="usernameTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:Label class="lbl" ID="Label3" runat="server" Text="Password:" ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="passwordTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
           <td>
                <asp:Label class="lbl" ID="Label1" runat="server" Text="Teacher ID:" ></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="tidList" runat="server" DataSourceID="SqlDataSource1" DataTextField="ID" DataValueField="ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT [ID] FROM [Teacher]"></asp:SqlDataSource>
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
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UserName" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="UserName" HeaderText="Username" ReadOnly="True" SortExpression="UserName" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:BoundField DataField="TeacherID" HeaderText="Teacher ID" SortExpression="TeacherID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" DeleteCommand="DELETE FROM [User] WHERE [UserName] = @original_UserName AND [Password] = @original_Password AND (([TeacherID] = @original_TeacherID) OR ([TeacherID] IS NULL AND @original_TeacherID IS NULL))" InsertCommand="INSERT INTO [User] ([UserName], [Password], [TeacherID]) VALUES (@UserName, @Password, @TeacherID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [User]" UpdateCommand="UPDATE [User] SET [Password] = @Password, [TeacherID] = @TeacherID WHERE [UserName] = @original_UserName AND [Password] = @original_Password AND (([TeacherID] = @original_TeacherID) OR ([TeacherID] IS NULL AND @original_TeacherID IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_UserName" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_TeacherID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="TeacherID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="TeacherID" Type="Int32" />
            <asp:Parameter Name="original_UserName" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_TeacherID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
