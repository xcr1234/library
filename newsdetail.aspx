<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/header.master" AutoEventWireup="true" CodeFile="newsdetail.aspx.cs" Inherits="newsdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>新闻详情</title>
    <link href="style/newsdetail.css" rel="stylesheet" />
    <script src="kindeditor/kindeditor.js"></script>
    <script src="kindeditor/lang/zh_CN.js"></script>
    <asp:Literal ID="ltlKindeditor" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHMain" runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="sdsNews" ItemPlaceholderID="newsdetail" OnItemEditing="ListView1_ItemEditing">
        <LayoutTemplate>
            <div id="newsdetail" runat="server"></div>

        </LayoutTemplate>
        <ItemTemplate>
            <h2><%#Eval("title") %></h2>
            <div class="sp">
                &nbsp;&nbsp;<%# ((DateTime)Eval("time")).ToString("yyyy年MM月dd日") %>来自:<%#Eval("from") %>
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

            </div>
            <p><%#Eval("contents") %></p>
        </ItemTemplate>
        <EditItemTemplate>

           
            <div class="sp" style="text-align: center">
                标题:<asp:TextBox ID="txtTitle" runat="server" Text='<%#Bind("title") %>' CssClass="editinput" style="text-align:left;"></asp:TextBox>
                </br>
                日期:<asp:TextBox ID="txtDate" runat="server" Font-Overline="False" TextMode="Date" Text='<%# Bind("time", "{0:yyyy-MM-dd}") %>' CssClass="date"></asp:TextBox>
                来自:
                <asp:TextBox ID="txtFrom" runat="server" Text='<%#Bind("from") %>' CssClass="from"></asp:TextBox>
               
            </div>

            <p></p>
            <asp:TextBox ID="txtContents" runat="server" TextMode="MultiLine" Text='<%#Bind("contents") %>' Style="width: 700px; height: 400px; visibility: hidden;"></asp:TextBox>
         <p> <div class="submit">
                                  <asp:LinkButton ID="lnbUpdate" runat="server" CommandName="Update" CssClass="btn btn-success" Width="80px" OnClientClick="editor.sync()">保存</asp:LinkButton> 
                                  <asp:LinkButton ID="lbnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-danger" Width="80px">取消</asp:LinkButton>
                                  </div></p>
        </EditItemTemplate>

        <EmptyDataTemplate>
            <center><span style="font-size:30px;">删除成功！</span><br /><br />
                        <a href="Default.aspx" style="color:blue">返回首页</a></center>
        </EmptyDataTemplate>
    </asp:ListView>

    <asp:SqlDataSource runat="server" ID="sdsNews" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' SelectCommand="SELECT * FROM [news] WHERE ([id] = @id)" DeleteCommand="DELETE FROM [news] WHERE [id] = @id" InsertCommand="INSERT INTO [news] ([title],  [contents], [time], [from]) VALUES (@title,  @contents, @time, @from)" UpdateCommand="UPDATE [news] SET [title] = @title,  [contents] = @contents, [time] = @time, [from] = @from WHERE [id] = @id">
        <DeleteParameters>
             <asp:QueryStringParameter QueryStringField="nid" DefaultValue="9" Name="id" Type="Decimal"></asp:QueryStringParameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="title" Type="String"></asp:Parameter>
            
            <asp:Parameter Name="contents" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="time"></asp:Parameter>
            <asp:Parameter Name="from" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="nid" DefaultValue="9" Name="id" Type="Decimal"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" Type="String"></asp:Parameter>
          
            <asp:Parameter Name="contents" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="time"></asp:Parameter>
            <asp:Parameter Name="from" Type="String"></asp:Parameter>
              <asp:QueryStringParameter QueryStringField="nid" DefaultValue="9" Name="id" Type="Decimal"></asp:QueryStringParameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

