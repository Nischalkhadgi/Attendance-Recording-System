<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="AttendenceRecordingApplication.Teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    
    <table class="formTbl">
        <tr>
            <td>
                ID (Auto generated):
            </td>
            <td>
                <asp:TextBox ID="idTxt" runat="server" ReadOnly="True" Height="26px" Width="220px"></asp:TextBox>
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
                Address:
            </td>
            <td>
                <asp:TextBox ID="addressTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                Contact No.:
            </td>
            <td>
                <asp:TextBox ID="contactTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                E-mail:
            </td>
            <td>
                <asp:TextBox ID="emailTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                Date of Birth
                <br />
                (DD/MM/YYYY):
            </td>
            <td>
                <asp:TextBox ID="dobTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
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
                <asp:Button class="btn" ID="ResetBtn" runat="server" Height="54px" Text="Reset" Width="110px" OnClick="ResetBtn_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tableContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" DeleteCommand="DELETE FROM [Teacher] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Teacher] ([Name], [Address], [Contact], [Email]) VALUES (@Name, @Address, @Contact, @Email)" SelectCommand="SELECT * FROM [Teacher]" UpdateCommand="UPDATE [Teacher] SET [Name] = @Name, [Address] = @Address, [Contact] = @Contact, [Email] = @Email WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Contact" Type="Int64" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Contact" Type="Int64" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
