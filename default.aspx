<%@ Page Title="" Language="C#" MasterPageFile="~/header.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
       .loginbtn{
    color: White;
    background: #F3A331;
    text-decoration: none;
    padding: 5px 35px;
    text-align: center;
    margin-left: 125px;
    border-radius: 5px;
        border: 0;
        }
    </style>
    <title>首页</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    

	
	<!-- 弹出层结束 -->
	
</div><!-- wrap结束 为了把轮播放大 只好把wrap提前结束了-->
	<div id="LoopDiv">
		<input id="S_Num" type="hidden" value="4" />
		<div id="starsIF" class="imageflow">
            <asp:ListView ID="ListView1" runat="server" DataSourceID="sdsImgWrap" ItemPlaceholderID="starsIF">
                <LayoutTemplate>
                    <div id="starsIF" class="imageflow" runat="server"></div>
                </LayoutTemplate>
                <ItemTemplate>
                 <img src="<%#Eval("photo") %>" alt="" width="280" height="250"  longdesc="bookdetail.aspx?bid=<%#Eval("id") %>"/>
                </ItemTemplate>

            </asp:ListView>

		</div>
       
        
        <asp:SqlDataSource runat="server" ID="sdsImgWrap" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' 
            SelectCommand="SELECT top 15 [photo], [id] FROM [book] "></asp:SqlDataSource>
    </div><!-- 图片轮播结束 -->
<!-- 续接上wrap -->
<div class="wrap2">
	<div class="head-book head"><i></i><a href="list.aspx">图书展示</a><a href="list.aspx" class="more">更多 >></a></div>
	<div class="book-display">
		
		
        <asp:ListView ID="lvBookDisplay" runat="server" DataSourceID="sdsBookShow1"  GroupItemCount="2">
            
            <GroupTemplate>
             <li>
                 <ul class="book-row1">
				 <li><asp:PlaceHolder runat="server" ID="itemPlaceholder" /></li>
				 </ul>
			 </li>

                
            </GroupTemplate>
            <LayoutTemplate>
                <ul><asp:PlaceHolder ID="groupPlaceholder" runat="server" /></ul>
            </LayoutTemplate>
            <ItemTemplate>
               <a href="bookdetail.aspx?bid=<%#Eval("id") %>" title="<%#Eval("name") %>" target="_blank"><img src="<%#Eval("photo") %>" alt="<%#Eval("name") %>"><%#Common.indexSpilt(Eval("name").ToString()) %></a>
            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource runat="server" ID="sdsBookShow1" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' SelectCommand="select top 10 * from book order by newid()"></asp:SqlDataSource>
        
      
    </div><!-- 图书展示结束 -->
	<div class="head-news head"><i></i><a href="newsindex.aspx">新闻中心</a><a href="newsindex.aspx" class="more">更多 >></a></div>
	<div class="news-list">
		<div id="content">
			  <div id="feature_list">
			    <ul id="tabs">
			      <li><a href='newsdetail.aspx'><img src="images/12.png" />
			        <h3>新书签售</h3>
			        <span>给你最想要的和文艺男神零距离接触的机会</span> </a> </li>
			      <li><a href="comment.aspx"><img src="images/4.png" />
			        <h3>犀利书评</h3>
			        <span>帮你屏蔽无用之书</span> </a> </li>
			      <li> <a href="newsdetail.aspx"> <img src="images/14.png" />
			        <h3>豆瓣评分</h3>
			        <span>给你最客观的评价</span> </a> </li>
			    </ul>
			    <ul id="output">
			      <li> <img src="images/sample1.jpg" /><a href="newsindex.aspx">详 情</a> </li>
			      <li> <img src="images/sample2.jpg" /><a href="newsindex.aspx">详 情</a> </li>
			      <li> <img src="images/sample3.jpg" /><a href="newsindex.aspx">详 情</a> </li>
			    </ul>
			  </div>
		</div>
	</div><!--新闻列表结束  -->	
   
    <asp:SqlDataSource runat="server" ID="sdsDisplayNew" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' SelectCommand="select top 10 * from book order BY uploadtime desc"></asp:SqlDataSource>
    <div class="head-new head"><i></i><a href="list.aspx">新书速递</a><a href="list.aspx" class="more">更多 >></a></div>
	<div class="book-reconmmend">
		 <asp:ListView ID="lvDisplayNew" runat="server" DataSourceID="sdsDisplayNew" GroupItemCount="2">
        <GroupTemplate>
             <li>
                 <ul class="book-row1">
				 <li><asp:PlaceHolder runat="server" ID="itemPlaceholder" /></li>
				 </ul>
			 </li>

                
            </GroupTemplate>
            <LayoutTemplate>
                <ul><asp:PlaceHolder ID="groupPlaceholder" runat="server" /></ul>
            </LayoutTemplate>
            <ItemTemplate>
               <a href="bookdetail.aspx?bid=<%#Eval("id") %>" title="<%#Eval("name") %>"><img src="<%#Eval("photo") %>" alt="<%#Eval("name") %>"><%#Common.indexSpilt(Eval("name").ToString()) %></a>
            </ItemTemplate>

    </asp:ListView>
	</div><!-- 新书推荐结束 -->
</div><!-- 真的wrap结束了 -->
</asp:Content>

