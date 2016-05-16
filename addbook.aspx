<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addbook.aspx.cs" Inherits="addbook"  validateRequest="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="style/addbook.css" rel="stylesheet" />
    <title>添加图书</title>
    <script src="javascript/jquery-1.7.2.min.js"></script>
    <script src="javascript/jquery-ui-1.8.21.custom.min.js"></script>
    <link href="style/smoothness/jquery-ui-1.8.21.custom.css" rel="stylesheet" />
   
    <script src="kindeditor/kindeditor.js"></script>
    <script src="kindeditor/lang/zh_CN.js"></script>
    <script>
        KindEditor.ready(function (K) {
            window.editor = K.create('#txtDescription', {
                uploadJson: 'fileupload/upload_json.ashx',
                fileManagerJson: 'fileupload/file_manager_json.ashx',
                allowFileManager: true,
                width: "600px",
                height: "350px",
               

            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="dt1">
                <div class="img">
                    <p>
                        <asp:Image ID="imgBook" runat="server" width="160" height="200" />
                        
                    </p>
                    <p><asp:FileUpload ID="file" runat="server" Width="50%" /><asp:Button ID="btnUpload" runat="server" Text="上传" onclick="btnUpload_Click" UseSubmitBehavior="False" CssClass="btnliulan"/>
                        <asp:HiddenField ID="hdfFile" runat="server" />
                    </p>
                </div>
                <div class="detail">
                    <asp:Label ID="lblResult" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    <div class="item">
                        <label for="txtName">书名：</label>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </div>
                    <div class="item">
                        <label for="txtNo">豆瓣编号：</label>
                        <asp:TextBox ID="txtNo" runat="server"></asp:TextBox>
                    </div>
                    <div class="item">
                        <label for="txtAuthor">作者：</label>
                        <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
                    </div>
                    <div class="item">
                        <label for="txtPress">出版社：</label>
                        <asp:TextBox ID="txtPress" runat="server"></asp:TextBox>
                    </div>
                    <div class="item">
                        <label for="txtPrice">价格：</label>
                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    </div>
                    <div class="item">
                        <label for="txtScore">豆瓣评分：</label>
                        <asp:TextBox ID="txtScore" runat="server"></asp:TextBox>
                    </div>
                    <div class="item">
                        <label for="txtDate">日期：</label>
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="item">
                        <label for="ddlType">类型： </label>
                        <asp:DropDownList ID="ddlType" runat="server" DataSourceID="sdsType" DataTextField="name" DataValueField="id" Style="margin-left: 10px; width: 160px">
                        </asp:DropDownList>

                        <asp:SqlDataSource ID="sdsType" runat="server" ConnectionString="<%$ ConnectionStrings:localhost-sqlserver %>" SelectCommand="SELECT * FROM [type]"></asp:SqlDataSource>

                        &nbsp;
                    </div>
                </div>
            </div>
            <div class="dt2">
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine">在此输入书籍详细介绍。</asp:TextBox>
            </div>
            <div class="submit">
                <asp:Button ID="btnSuccess" runat="server" Text="提交" CssClass="btnSuccess" onclick="btnSuccess_Click"/>
            </div>
        </div>
       
            
            
            
         
        

    </form>
</body>
</html>
