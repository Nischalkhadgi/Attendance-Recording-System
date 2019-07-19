<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="AttendenceRecordingApplication.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="formTbl">
                <tr>
                    <td>
                        <asp:Label class="lbl" ID="Label8" runat="server" Text="Username:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="unameTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label class="lbl" ID="Label2" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="passwordTxt" TextMode="Password" runat="server" Height="26px" Width="220px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button class="btn" ID="LoginBtn" runat="server" Height="54px" Text="Log in" Width="110px" OnClick="LoginBtn_Click"/>
        </div>
    </form>
</body>
</html>
