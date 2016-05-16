<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fileUpload.aspx.cs" Inherits="fileUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>上传文件</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        测试文件上传：将文件上传到fileupload目录下<br />
        <br />
        目标目录：<asp:DropDownList ID="ddlFolder" runat="server">
            <asp:ListItem>book</asp:ListItem>
            <asp:ListItem>news</asp:ListItem>
            <asp:ListItem>users</asp:ListItem>
            <asp:ListItem>other</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:CheckBox ID="cbAutoName" runat="server" Checked="True" Text="勾选后文件名将随机生成" />
        <br />
        <br />
        文件：<asp:FileUpload ID="fulFile" runat="server" />
        <br />
        <br />
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="上传" />
        <br />
        <br />
        <asp:Label ID="lblResult" runat="server"></asp:Label>
        <asp:HyperLink ID="hlOpen" runat="server" Target="_blank" Visible="False">打开文件</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>
