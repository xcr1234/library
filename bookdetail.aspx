<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/header.master" AutoEventWireup="true" CodeFile="bookdetail.aspx.cs" Inherits="book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>图书详情</title>
    <link href="style/bookdetail.css" rel="stylesheet" />
    <style type="text/css">
        a:link {
            color: #0C13E0;
        }
    
        .textbox{
            position:absolute;
            left:500px;
        width:200px;
        height:25px;
        border-radius:5px;
        outline:none;
        padding:2px 0 2px 8px;
        border:1px solid #f55e5e;
        }
        .dropdownlist1 {
         position:absolute;
        left:500px;
        width:210px;
        height:30px;
        border-radius:5px;
        outline:none;
        padding:2px 0 2px 8px;
        border:1px solid #f55e5e;
        }

       .detail-img-info .dimg p span{
           position:absolute;
           left:300px;
            display:block;
            width:80px!important;
            text-align:right;
            
        }

    </style>
    <script src="kindeditor/kindeditor.js"></script>
    <script src="kindeditor/lang/zh_CN.js"></script>
    <asp:Literal ID="ltrKindeditor" runat="server"></asp:Literal> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHMain" runat="Server">
    <%--图书详情--%>
    <div class="section">
        <%--返回--%>
        <div class="back">
            <a class="dback" href="#">&lt&lt 返回</a>
        </div>
        <%--图片上书名--%>

        <%--图片及信息--%>
        <div class="detail-img-info">

            <div class="dinfo" style="float: left; width: 60%; height: 125px; margin: 30px 0 0 0">
                <asp:ListView ID="lvNews" runat="server" DataSourceID="sdsBooks" ItemPlaceholderID="phBook" OnItemEditing="lvNews_ItemEditing" >
                    <LayoutTemplate>
                        <ul>
                            <asp:PlaceHolder ID="phBook" runat="server"></asp:PlaceHolder>
                        </ul>
                    </LayoutTemplate>
                    <EditItemTemplate>
                        
                                <div class="detail-img-info">
                                    <div class="dimg">
                                       
                                            <img src="<%#Eval("photo") %>" width="106" height="158" />
                                    </div>
                                    <li>
                                        <p>
                                           <span>　　书名：</span><asp:TextBox ID="txtName" runat="server" Text='<%#Bind("name") %>' Cssclass="textbox"></asp:TextBox>
                                            
                                        </p>
                                        <br />
                                    </li>
                                    <li>
                                        <p>
                                            <span>　　作者：</span><asp:TextBox ID="txtAuthor" runat="server" Text='<%#Bind("author") %>' Cssclass="textbox"></asp:TextBox></p>
                                        <br />
                                    </li>
                                    <li>
                                        <p>
                                            <span>　出版社：</span><asp:TextBox ID="txtPress" runat="server" Text='<%#Bind("press") %>' Cssclass="textbox"></asp:TextBox></p>
                                        <br />
                                    </li>
                                    <li>
                                        <p>
                                            <span>　　价格：</span><asp:TextBox ID="txtPrice" runat="server" Text='<%#Bind("price") %> ' Cssclass="textbox"></asp:TextBox></p>
                                        <br />
                                    </li>
                                    
                                    <li>
                                        <p>
                                            <span>豆瓣评分：</span><asp:TextBox ID="txtScore" runat="server" Text='<%#Bind("score") %>' Cssclass="textbox"></asp:TextBox></p>
                                        <br />
                                    </li>
                                    <li>
                                        <p>
                                            <span>上传时间：</span><asp:TextBox ID="txtUploadtime" runat="server" Text='<%#Bind("uploadtime", "{0:yyyy-MM-dd}") %>' TextMode="Date" Cssclass="textbox"></asp:TextBox></p>
                                        <br />
                                    </li>
                                    <li>
                                        <p>
                                            <span>　　类型：</span>
                                            <asp:DropDownList ID="ddlType"  runat="server" DataSourceID="sdsType"  Cssclass="dropdownlist1" DataTextField="name" DataValueField="id" SelectedValue='<%#Bind("typeID") %>'>
                                                
                                            </asp:DropDownList> <asp:SqlDataSource runat="server" ID="sdsType" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' SelectCommand="SELECT * FROM [type]"></asp:SqlDataSource>
                                        </p>
                                        <br />
                                    </li>
                                    <hr class="hrdetail" />
                                </div>
                                <%--内容介绍--%>
                                 <div class="detailsm">
                            <h3 style="margin: 20px 0 0 160px;color:#5f5a5a">内容介绍...</h3>
                            <br />
                            <p>
                                
                                <div style="width: 800px; margin: 0 auto">
                                    
                                    <asp:TextBox ID="txtDescription" runat="server" Text='<%#Bind("description") %>' TextMode="MultiLine" Height="400px" Width="700px"></asp:TextBox>
                                  
                                </div>
                            </p>

                                
                              <p> <div class="submit">
                                  <asp:LinkButton ID="lnbUpdate" runat="server" CommandName="Update" CssClass="btn btn-success" Width="80px" OnClientClick="editor.sync()">保存</asp:LinkButton> 
                                  <asp:LinkButton ID="lbnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-danger" Width="80px">取消</asp:LinkButton>
                                  </div></p></div>

                    </EditItemTemplate>
                    
                    <ItemTemplate>
                        <div class="detail-img-info">
                            <div class="dimg">
                                <a href="http://book.douban.com/subject/<%#Eval("no") %>" target="_blank" style="color: #0112FF;">
                                    <img src="<%#Eval("photo") %>" width="106" height="158" /></a>
                            </div>
                            <li>
                                <p>　　书名：<a href="http://book.douban.com/subject/<%#Eval("no") %>" target="_blank"><%#Eval("name") %></a>
                                    <asp:LoginView ID="lgvEditDel" runat="server">
                                        <LoggedInTemplate>
                                             <asp:LinkButton ID="lbEdit" runat="server" ForeColor="#F10909" CommandName="Edit">编辑</asp:LinkButton>
                                            <asp:LinkButton ID="lnbDel" runat="server" CommandName="Delete" OnClientClick="return confirm('是否确认删除？');">删除</asp:LinkButton>
                                        </LoggedInTemplate>
                                        <AnonymousTemplate>
                        <a href="javascript:;" onclick="alert('请先登录！');login()" style="color:#F10909">编辑</a> 
                        <a href="javascript:;" onclick="alert('请先登录！');login()" style="color:#0F33D6">删除</a>
                    </AnonymousTemplate>
                                    </asp:LoginView>
                                   
                                </p>
                                <br />
                            </li>
                            <li>
                                <p>　　作者：<%#Eval("author") %></p>
                                <br />
                            </li>
                            <li>
                                <p>　出版社：<%#Eval("press") %></p>
                                <br />
                            </li>
                            <li>
                                <p>　　价格：<%#Eval("price") %></p>
                                <br />
                            </li>
                            <li>
                                <p>　　类别：<%#Eval("typeName") %></p>
                                <br />
                            </li>
                            <li>
                                <p>豆瓣评分：<%#Eval("score") %></p>
                                <br />
                            </li>
                            <li>
                                <p>上传时间：<%#Eval("uploadtime", "{0:yyyy年MM月dd日}") %></p>
                                <br />
                            </li>

                            <hr class="hrdetail" />
                        </div>
                        <%--内容介绍--%>
                        <div class="detailsm">
                            <h3 style="margin: 20px 0 0 80px;">内容介绍...</h3>
                            <br />
                            <p>
                                <div style="width: 800px; margin: 0 auto;line-height:150%;overflow-y:auto;height:500px"><%#Eval("description") %></div>
                            </p>
                        </div>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                      删除成功！<br /><br />
                        <a href="Default.aspx" style="color:blue">返回首页</a>

                    </EmptyDataTemplate>
                </asp:ListView>
                <asp:SqlDataSource runat="server" ID="sdsBooks" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' SelectCommand="SELECT book.id, book.no, book.name, book.author, book.photo, book.press, book.price, book.description, book.uploadtime, book.typeID, book.score, type.name AS typeName FROM book INNER JOIN type ON book.typeID = type.id WHERE (book.id = @id)" UpdateCommand="UPDATE book SET name = @name, author = @author, press = @press, price = @price, description = @description, score = @score,typeID=@typeID,uploadtime=@uploadtime where id = @id" DeleteCommand="DELETE FROM book WHERE (id = @id)">
                    <DeleteParameters>
                        <asp:QueryStringParameter QueryStringField="bid" DefaultValue="3" Name="id"></asp:QueryStringParameter>
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="bid" DefaultValue="3" Name="id"></asp:QueryStringParameter>
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name"></asp:Parameter>
                        <asp:Parameter Name="author"></asp:Parameter>
                        <asp:Parameter Name="press"></asp:Parameter>
                        <asp:Parameter Name="price"></asp:Parameter>
                        <asp:Parameter Name="description"></asp:Parameter>
                        <asp:Parameter Name="score"></asp:Parameter>
                        <asp:Parameter Name="typeID"></asp:Parameter>
                        <asp:Parameter Name="uploadtime"></asp:Parameter>
                        <asp:QueryStringParameter QueryStringField="bid" DefaultValue="3" Name="id"></asp:QueryStringParameter>
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
        </div>


    </div>
</asp:Content>

