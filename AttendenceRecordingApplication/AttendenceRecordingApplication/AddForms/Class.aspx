<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Class.aspx.cs" Inherits="AttendenceRecordingApplication.Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    
    <table class="formTbl">
        <tr>
            <td>
                Class ID
                <br />
                (Auto-generated):
            </td>
            <td >
                <asp:TextBox ID="idTxt" runat="server" ReadOnly="True" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                Class Type:
            </td>
            <td>
                <asp:DropDownList ID="ctypeList" runat="server" Height="26px" Width="220px">
                    <asp:ListItem>Lecture</asp:ListItem>
                    <asp:ListItem>Turtorial</asp:ListItem>
                    <asp:ListItem>Workshop</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Start Time:
                <br /> 
                (HH:Mi AM) 
            </td>
            <td>
                <asp:TextBox ID="startTimeTxt" TextMode="Time" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                Duration
                <br /> 
                (minutes)
            </td>
            <td>
                <asp:TextBox ID="durationTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Day:
            </td>
            <td>
                <asp:DropDownList ID="dayList" runat="server" Height="26px" Width="220px">
                    <asp:ListItem>Monday</asp:ListItem>
                    <asp:ListItem>Tuesday</asp:ListItem>
                    <asp:ListItem>Wednesday</asp:ListItem>
                    <asp:ListItem>Thursday</asp:ListItem>
                    <asp:ListItem>Friday</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                Room:
            </td>
            <td>
                <asp:TextBox ID="roomTxt" runat="server" Height="26px" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Module ID:
            </td>
            <td>
                <asp:DropDownList ID="moduleList" runat="server" Height="26px" Width="220px" DataSourceID="SqlDataSource2" DataTextField="ModuleID" DataValueField="ModuleID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" SelectCommand="SELECT DISTINCT ModuleID FROM TeacherModule"></asp:SqlDataSource>
            </td>
            <td>
                Module Name:
            </td>
            <td>
                <asp:TextBox ID="mnameTxt" runat="server" ReadOnly="True" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="reBtnModule" runat="server" Height="26px" ImageUrl="~/Images/refresh-icon-30.png" OnClick="reBtnModule_Click" />
            </td>
        </tr>
        <tr>
            <td>
                Teacher ID:
            </td>
            <td>
                <asp:DropDownList ID="teacherList" runat="server" Height="26px" Width="220px" OnSelectedIndexChanged="teacherList_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:ImageButton ID="reBtnTID" runat="server" Height="26px" ImageUrl="~/Images/refresh-icon-30.png" OnClick="reBtnTID_Click" />
            </td>
            <td>
                Teacher Name:
            </td>
            <td>
                <asp:TextBox ID="tnameTxt" runat="server" ReadOnly="True" Height="26px" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="reBtnTeacher" runat="server" Height="26px" ImageUrl="~/Images/refresh-icon-30.png" OnClick="reBtnTeacher_Click" />
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
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ClassID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ClassID" HeaderText="ClassID" InsertVisible="False" ReadOnly="True" SortExpression="ClassID" />
            <asp:BoundField DataField="ClassType" HeaderText="ClassType" SortExpression="ClassType" />
            <asp:BoundField DataField="StartTime" HeaderText="StartTime" SortExpression="StartTime" />
            <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
            <asp:BoundField DataField="Days" HeaderText="Days" SortExpression="Days" />
            <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
            <asp:BoundField DataField="TeacherID" HeaderText="TeacherID" SortExpression="TeacherID" />
            <asp:BoundField DataField="TeacherName" HeaderText="TeacherName" SortExpression="TeacherName" />
            <asp:BoundField DataField="ModuleID" HeaderText="ModuleID" SortExpression="ModuleID" />
            <asp:BoundField DataField="ModuleName" HeaderText="ModuleName" SortExpression="ModuleName" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AttendenceString %>" DeleteCommand="DELETE FROM [Class] WHERE [ClassID] = @ClassID" InsertCommand="INSERT INTO [Class] ([ClassType], [StartTime], [Duration(min)], [Days], [Room], [TeacherID], [TeacherName], [ModuleID], [ModuleName]) VALUES (@ClassType, @StartTime, @column1, @Days, @Room, @TeacherID, @TeacherName, @ModuleID, @ModuleName)" SelectCommand="SELECT * FROM [Class]" UpdateCommand="UPDATE [Class] SET [ClassType] = @ClassType, [StartTime] = @StartTime, [Duration(min)] = @column1, [Days] = @Days, [Room] = @Room, [TeacherID] = @TeacherID, [TeacherName] = @TeacherName, [ModuleID] = @ModuleID, [ModuleName] = @ModuleName WHERE [ClassID] = @ClassID">
        <DeleteParameters>
            <asp:Parameter Name="ClassID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ClassType" Type="String" />
            <asp:Parameter DbType="Time" Name="StartTime" />
            <asp:Parameter Name="column1" Type="Int32" />
            <asp:Parameter Name="Days" Type="String" />
            <asp:Parameter Name="Room" Type="String" />
            <asp:Parameter Name="TeacherID" Type="Int32" />
            <asp:Parameter Name="TeacherName" Type="String" />
            <asp:Parameter Name="ModuleID" Type="Int32" />
            <asp:Parameter Name="ModuleName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ClassType" Type="String" />
            <asp:Parameter DbType="Time" Name="StartTime" />
            <asp:Parameter Name="column1" Type="Int32" />
            <asp:Parameter Name="Days" Type="String" />
            <asp:Parameter Name="Room" Type="String" />
            <asp:Parameter Name="TeacherID" Type="Int32" />
            <asp:Parameter Name="TeacherName" Type="String" />
            <asp:Parameter Name="ModuleID" Type="Int32" />
            <asp:Parameter Name="ModuleName" Type="String" />
            <asp:Parameter Name="ClassID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
