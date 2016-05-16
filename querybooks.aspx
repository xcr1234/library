<%@ Page Title="" Language="C#" MasterPageFile="~/header.master" AutoEventWireup="true" CodeFile="querybooks.aspx.cs" Inherits="querybooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>图书搜索</title>
   
    <link href="style/query.css" rel="stylesheet" />
    <link href="style/newsindexmain.css" rel="stylesheet" />

    <link href="style/imghover.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHMain" Runat="Server">
    <div class="container" style="width:1000px">
         
        <asp:ListView ID="lvQuery" runat="server" DataSourceID="sdsQuery" ItemPlaceholderID="phResult">
          <EmptyDataTemplate>
              <div class="empty">
                   <p><asp:Image ID="imgNone" runat="server" ImageUrl="~/images/none.jpg" height="300"/></p>
                   <p><asp:Image ID="imgWN" runat="server" imageurl="~/images/001C45AB.png"/>无搜索结果！</p>
               </div>
             
          </EmptyDataTemplate>
            <LayoutTemplate>
                 
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>书籍名称</th>
                            <th>作者</th>
                            <th>出版社</th>
                            <th>价格</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:PlaceHolder ID="phResult" runat="server"></asp:PlaceHolder>
                    </tbody>

                </table>
            </LayoutTemplate>
            
            <ItemTemplate>

                   <tr>
                        <td><%#Container.DataItemIndex+1 %></td>
                       <td><a href="bookdetail.aspx?bid=<%#Eval("id") %>" class="img-hover" target="_blank">.<%#Eval("name") %><img class="hidden" src="<%#Eval("photo") %>" width="150" height="150"></a></td>
                        <td><%#Eval("author") %></td>
                        <td><%#Eval("press") %></td>
                        <td><%#Eval("price") %></td>
                       <td><a href="bookdetail.aspx?bid=<%#Eval("id") %>" target="_blank">查看</a></td>
                   </tr>

            </ItemTemplate>
        </asp:ListView>
        
 
        <asp:SqlDataSource runat="server" ID="sdsQuery" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' 
            SelectCommand="SELECT id,name, author,photo, press, price FROM book WHERE (name LIKE '%' + @name + '%' or author LIKE '%' + @name + '%' or press LIKE '%' + @name + '%')">
            <SelectParameters>
                <asp:SessionParameter SessionField="SysQuery" Name="name"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
        </div>
</asp:Content>

