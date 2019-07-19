<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="AttendenceRecordingApplication.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <table class="formTbl">
        <tr>
            <td>
                <asp:Label class="lbl" ID="Label8" runat="server" Text="ID (Auto-generated)"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="idTxt" runat="server" ReadOnly="True" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:Label class="lbl" ID="Label1" runat="server" Text="Name:" style=""></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="nameTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label class="lbl" ID="Label2" runat="server" Text="Address:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="addressTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:Label class="lbl" ID="Label3" runat="server" Text="Contact no.:" ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="contactTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label class="lbl" ID="Label4" runat="server" Text="E-mail:" ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="emailTxt" TextMode="Email" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:Label class="lbl" ID="Label5" runat="server" Text="Date of Birth"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="dobTxt" TextMode="Date" runat="server" Height="26px" Width="220px"></asp:TextBox>
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

    <asp:GridView ID="studentGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceTable" AllowSorting="True"
        >
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
        <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="DateofBirth" HeaderText="DateofBirth" SortExpression="DateofBirth" ReadOnly="True" />
        
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceTable" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT ID, Name, Address, Contact, Email, CONVERT(VARCHAR(10), DateOfBirth, 101) AS DateofBirth FROM Student" DeleteCommand="DELETE FROM [Student] WHERE [ID] = @ID" UpdateCommand="UPDATE [Student] SET [Name] = @Name, [Address] = @Address, [Contact] = @Contact, [Email] = @Email, [DateOfBirth] = CONVERT(DATE, @DateOfBirth) WHERE [ID] = @ID" InsertCommand="INSERT INTO [Student] ([Name], [Address], [Contact], [Email], [DateOfBirth]) VALUES (@Name, @Address, @Contact, @Email, @DateOfBirth)">
    <DeleteParameters>
        <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="Contact" Type="Int64" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter DbType="Date" Name="DateOfBirth" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="Contact" Type="Int64" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter DbType="Date" Name="DateOfBirth" />
        <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
