<%@ Page Title="" Language="C#" MasterPageFile="~/header.master" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="javascript/dropdown.js"></script>
    <link rel="stylesheet" type="text/css" href="font/exo-demibold/stylesheet.css" />
    <link href="style/list.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/animation.css">
    <link rel="stylesheet" type="text/css" href="css/orchid/style.css">
    <link rel="stylesheet" type="text/css" href="css/orchid/color.css">
    <link href="style/hover.css" rel="stylesheet" />
    <title>图书列表</title>
    <style>
        .empty {
            margin-top: 80px;
            margin-left: 40px;
            font-weight: bold;
            float: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHMain" runat="Server">
    <div class="aside">
        <asp:ListView ID="lvType" runat="server" ItemPlaceholderID="phItem" DataSourceID="sdsType">
            <LayoutTemplate>
                <div class="aside-main">
                    <ul class="nav">
                        <li>
                            <asp:LinkButton ID="lbAll" runat="server" OnClick="lbAll_Click"><i class="icon-desktop"></i>全部</asp:LinkButton></li>
                        <asp:PlaceHolder ID="phItem" runat="server"></asp:PlaceHolder>
                    </ul>
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <li>
                    <asp:LinkButton ID="lbLeft" runat="server" CommandName='<%#Eval("id")%>' OnClick="lbLeft_Click"><i class="icon-<%#Eval("icon") %>"></i><%#Eval("name") %></asp:LinkButton></li>
            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource runat="server" ID="sdsType" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' SelectCommand="SELECT * FROM [type]"></asp:SqlDataSource>
    </div>
    <div class="section">
        <div class="tittle">
        </div>
        <asp:ListView ID="lvBooks" runat="server" DataSourceID="sdsBooks" ItemPlaceholderID="phItem">
            <LayoutTemplate>
                <div class="content">
                    <ul class="list-col list-col5 list-express slide-item">
                        <asp:PlaceHolder ID="phItem" runat="server"></asp:PlaceHolder>
                        <div class="page-footer">
                            <asp:DataPager ID="dpPages" runat="server" PageSize="8">



                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ShowNextPageButton="false" ShowPreviousPageButton="true" FirstPageText="首页" LastPageText="尾页" NextPageText=">" PreviousPageText="<"></asp:NextPreviousPagerField>
                                    <asp:NumericPagerField></asp:NumericPagerField>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ShowNextPageButton="true" ShowPreviousPageButton="False" FirstPageText="首页" LastPageText="尾页" NextPageText=">" PreviousPageText="<"></asp:NextPreviousPagerField>
                                </Fields>
                            </asp:DataPager>
                    </ul>

                </div>
                </div>
                
            </LayoutTemplate>
            <EmptyDataTemplate>
                <div class="content"><span class="empty"><img src="images/001C45AB.png" />该类别下无图书！</span></div>
            </EmptyDataTemplate>
            <ItemTemplate>
                <li class="bookli">
                    <div class="book">
                        <div class="img-hover">
                            <a href="bookdetail.aspx?bid=<%#Eval("id") %>" target="_blank">
                                <img id="img1" width="106" height="158" src="<%#Eval("photo") %>">
                            </a>
                            &nbsp;&nbsp;<div class="book-info">
                                <div class="bname">
                                    <a class="blink" href="bookdetail.aspx?bid=<%#Eval("id") %>"><%#Common.indexSpilt(Eval("name").ToString())%></a>
                                </div>
                                <div class="author">
                                    <%#Common.indexSpilt(Eval("author").ToString()) %>
                                </div>
                            </div>

                            <div class="hidden">
                                <p>
                                    <h6 class="mbname">
                                        <%#Eval("press") %>
                                    </h6>
                                    <span class="author">价格：￥<%#Eval("price") %></span><br />
                            <span class="year">
                                <%# ((DateTime)Eval("uploadtime")).ToString("yyyy年MM月dd日") %>
                            </span>
                                   <br />
                            <span class="publisher">
                                豆瓣评分：<%#Eval("score") %>
                            </span>
                                </p>
                                <p class="abstract"></p>
                            </div>

                        </div>
                    </div>
                </li>
            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource runat="server" ID="sdsBooks" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' SelectCommand="SELECT * FROM [book] WHERE ([typeID] = @typeID)">
            <SelectParameters>
                <asp:SessionParameter SessionField="TypeName" DefaultValue="1" Name="typeID" Type="Int32"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
    <asp:SqlDataSource ID="sdsBooks2" runat="server" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' SelectCommand="SELECT * FROM [book]"></asp:SqlDataSource>
</asp:Content>

