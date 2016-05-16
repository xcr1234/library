<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/header.master" AutoEventWireup="true" CodeFile="comment.aspx.cs" Inherits="comment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>犀利书评</title>
     <link href="style/newsdetail.css" rel="stylesheet" />
        <script src="kindeditor/kindeditor.js"></script>
    <script src="kindeditor/lang/zh_CN.js"></script>
      <asp:Literal ID="ltlKindeditor" runat="server"></asp:Literal>
    <style>
        .t{
            margin:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHMain" Runat="Server">
    <asp:ListView ID="lvComment" runat="server" DataSourceID="sdsComment" ItemPlaceholderID="newsdetail" OnItemEditing="lvComment_ItemEditing">
        <LayoutTemplate>
             <div id="newsdetail" runat="server"></div>
        </LayoutTemplate>
        <ItemTemplate>
            <h2><%#Eval("title") %></h2>
            <div class="sp">
                &nbsp;&nbsp;<%# ((DateTime)Eval("time")).ToString("yyyy年MM月dd日") %>
                 <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <asp:LinkButton ID="lnbEdit" runat="server" ForeColor="#62068E" CommandName="Edit">编辑</asp:LinkButton>
                        <asp:LinkButton ID="lnbDel" runat="server" ForeColor="#0F33D6" CommandName="Delete" OnClientClick="return confirm('是否确认删除？');">删除</asp:LinkButton>
                    </LoggedInTemplate>
                      <AnonymousTemplate>
                        <a href="javascript:;" onclick="alert('请先登录！');login()" style="color:#62068E">编辑</a> 
                        <a href="javascript:;" onclick="alert('请先登录！');login()" style="color:#0F33D6">删除</a>
                    </AnonymousTemplate>
                </asp:LoginView>

            </div><p></p>
            <p><%#Eval("contents") %></p>
        </ItemTemplate>
        <EmptyDataTemplate>
             <center><span style="font-size:30px;">删除成功！</span><br /><br />
                        <a href="Default.aspx" style="color:blue">返回首页</a></center>
        </EmptyDataTemplate>
        <EditItemTemplate>
            <div style="height:20px;"></div>
            <span style="text-align:center;    display: block;">
                标题：<asp:TextBox ID="txtTitle" runat="server" Text='<%#Bind("title") %>' CssClass="editinput" style="text-align:left;"></asp:TextBox></span>
            <div class="sp" style="text-align: center">
                &nbsp;&nbsp;日期：<asp:TextBox ID="txtDate" CssClass="t" runat="server" Font-Overline="False" TextMode="Date" Text='<%# Bind("time", "{0:yyyy-MM-dd}") %>' ></asp:TextBox>
                
               
            </div>

            <p></p>
            <asp:TextBox ID="txtContents" runat="server" TextMode="MultiLine" Text='<%#Bind("contents") %>' Style="width: 700px; height: 400px; visibility: hidden;"></asp:TextBox>
         <p> <div class="submit">
                                  <asp:LinkButton ID="lnbUpdate" runat="server" CommandName="Update" CssClass="btn btn-success" Width="80px" OnClientClick="editor.sync()">保存</asp:LinkButton> 
                                  <asp:LinkButton ID="lbnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-danger" Width="80px">取消</asp:LinkButton>
                                  </div></p>
        </EditItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource runat="server" ID="sdsComment" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' SelectCommand="SELECT * FROM [comment] WHERE ([id] = @id)" DeleteCommand="DELETE FROM [comment] WHERE [id] = @id" InsertCommand="INSERT INTO [comment] ([contents], [time], [title]) VALUES (@contents, @time, @title)" UpdateCommand="UPDATE [comment] SET [contents] = @contents, [time] = @time, [title] = @title WHERE [id] = @id">
        <DeleteParameters>
             <asp:QueryStringParameter QueryStringField="cid" DefaultValue="1" Name="id" Type="Int32"></asp:QueryStringParameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="contents" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="time"></asp:Parameter>
            <asp:Parameter Name="title" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="cid" DefaultValue="1" Name="id" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="contents" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="time"></asp:Parameter>
            <asp:Parameter Name="title" Type="String"></asp:Parameter>
             <asp:QueryStringParameter QueryStringField="cid" DefaultValue="1" Name="id" Type="Int32"></asp:QueryStringParameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

