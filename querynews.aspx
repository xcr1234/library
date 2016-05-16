<%@ Page Title="" Language="C#" MasterPageFile="~/header.master" AutoEventWireup="true" CodeFile="querynews.aspx.cs" Inherits="query" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>新闻搜索</title>
    <link href="style/query.css" rel="stylesheet" />
    <link href="style/newsindexmain.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHMain" Runat="Server">
    <div class="container">
   
        <asp:ListView ID="lvQuery" runat="server" DataSourceID="sdsQuery" ItemPlaceholderID="phResult">
            <LayoutTemplate>
                <div class="qianshou">
                    <span class='newshead' style="width:700px;">搜索结果<span style="float:right;"></span></span>
                   <ul class="liststyle"> <asp:PlaceHolder ID="phResult" runat="server"></asp:PlaceHolder></ul>
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                 <li><a href="newsdetail.aspx?nid=<%#Eval("id") %>" target="_blank"><%#Eval("title") %></a><span class="date"><%# ((DateTime)Eval("time")).ToString("yyyy年MM月dd日") %></span></li>
            </ItemTemplate>
              <EmptyDataTemplate>
               <div class="empty">
                   <p><asp:Image ID="imgNone" runat="server" ImageUrl="~/images/none.jpg" height="300"/></p>
                   <p>
                       <asp:Image ID="imgWN" runat="server" imageurl="~/images/001C45AB.png"/>无搜索结果！</p>
               </div>
            </EmptyDataTemplate>
        </asp:ListView>
        
 
    <asp:SqlDataSource runat="server" ID="sdsQuery" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' SelectCommand="SELECT id, title, time FROM news WHERE (title LIKE '%' + @title + '%')">
        <SelectParameters>
            <asp:SessionParameter SessionField="SysQuery" Name="title"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
        </div>
</asp:Content>

