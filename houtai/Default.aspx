<%@ Page Language="C#" ValidateRequest="false" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="houtai_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>布客后台管理系统</title>
    <link rel="stylesheet" href="css/main.css" media="all" />
    <link rel="stylesheet" href="css/popLayer.css" media="all" />
    <script src="js/script.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <script charset="utf-8" src="../kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
    <link href="css/btn.css" rel="stylesheet" />
    <style type="text/css">
        @font-face {
            font-family: 'icomoon';
            src: url('fonts/icomoon.eot');
            src: url('fonts/icomoon.eot?#iefix') format('embedded-opentype'), url('fonts/icomoon.woff') format('woff'), url('fonts/icomoon.ttf') format('truetype'), url('fonts/icomoon.svg#icomoon') format('svg');
            font-weight: normal;
            font-style: normal;
        }

        .hidden {
            display: none !important;
        }
         .textbox {
        width: 200px;
        height: 25px!important;
        border-radius: 5px;
        outline: none;
        padding: 2px 0 2px 8px;
        border: 1px solid #5F9EA0;
    }
    </style>
    
    <script>
        function edit() {
            alert('请进入图书详情页编辑、删除图书！');
        }
        function checkall() {
            $("input[type='checkbox']").attr("checked", "true");
        }
        function checkdes() {
            $("input[type='checkbox']").each(function () {
                if ($(this).attr("checked")) {
                    $(this).removeAttr("checked");

                }
                else {
                    $(this).attr("checked", 'true');

                }
            });

        }
    </script>
    <script>
        KindEditor.ready(function (K) {
            window.editor = K.create('#txtEdit', {
                uploadJson: '../fileupload/upload_json.ashx',
                fileManagerJson: '../fileupload/file_manager_json.ashx',
                allowFileManager: true,
                width: "700px",
                height: "300px"

            });
        });
       
    </script>
    <asp:Literal ID="litEdit" runat="server"></asp:Literal>
</head>
<body >
    <form id="form1" runat="server">
        <div>

            <div class="slidebar">
                <div class="logo">
                    <asp:Image ID="imgLogo" runat="server" Width="122" Height="122" />
                    <h4>管理员:<asp:LoginName ID="LoginName1" runat="server" />
                    </h4>
                </div>
                <ul id="links">
                    <li><a href="#book">图书管理</a></li>
                    <li><a href="#news">新闻管理</a></li>
                    <li><a href="#infor" id="infor">个人信息</a></li>
                </ul>
            </div>
            <div class="main">
                <div class="mainContent clearfix">
                    <section id="book">
                        <h2 class="header">图书管理</h2>
                        <ul class="topbar clearfix">
                            <li><a href="../addbook.aspx" target="_blank">q&nbsp;&nbsp;添加图书</a></li>
                            <li><a href="#" onclick="cancel()" class="hidden">m&nbsp;&nbsp;删除图书</a></li>
                            <li><a href="javascript:edit();" class="hidden">l&nbsp;&nbsp;编辑删除</a></li>

                        </ul>
                        <asp:ListView OnItemUpdated="lvBooks_ItemUpdated" ID="lvBooks" runat="server" DataSourceID="sdsBooks" DataKeyNames="id" ItemPlaceholderID="phItem">
                            <LayoutTemplate>
                                <div class="book-list">
                                    <ul>
                                        <asp:PlaceHolder ID="phItem" runat="server"></asp:PlaceHolder>
                                    </ul>
                                </div>
                                <div class="page-footer" runat="server">

                                    <asp:DataPager ID="dpPages" runat="server">



                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ShowNextPageButton="false" ShowPreviousPageButton="true" FirstPageText="首页" LastPageText="尾页" NextPageText=">" PreviousPageText="<"></asp:NextPreviousPagerField>
                                            <asp:NumericPagerField></asp:NumericPagerField>
                                            <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ShowNextPageButton="true" ShowPreviousPageButton="False" FirstPageText="首页" LastPageText="尾页" NextPageText=">" PreviousPageText="<"></asp:NextPreviousPagerField>
                                        </Fields>
                                    </asp:DataPager>

                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>

                                <li><a href="../bookdetail.aspx?bid=<%#Eval("id") %>" target="_blank" title="<%#Eval("name") %>">
                                    <img src="../<%#Eval("photo") %>" alt=""></a>
                                    <label for="<%#Eval("id") %>"><a href="../bookdetail.aspx?bid=<%#Eval("id") %>" target="_blank" title="<%#Eval("name") %>"><%# Common.houtaiSplit(Eval("name").ToString()) %></a></label></li>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="sdsBooks" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' SelectCommand="SELECT * FROM [book]" EnableCaching="False"></asp:SqlDataSource>
                    </section>
                    <section id="news" style="display: none">
                        <h2 class="header">新闻管理</h2>
                        <ul class="topbar clearfix">
                            <li><a href="#" id="hand-in">d&nbsp;&nbsp;上传新闻</a></li>
                            <li>
                                <asp:LinkButton ID="lnbDel" runat="server" OnClick="lnbDel_Click" OnClientClick="return confirm('是否确认删除选择的新闻？');">m&nbsp;&nbsp;删除新闻</asp:LinkButton></li>
                            <li><a href="#" class="hidden">l&nbsp;&nbsp;保存</a></li>
                        </ul>

                        <asp:ListView ID="lvNews" runat="server" DataSourceID="sdsNews" ItemPlaceholderID="phNews">
                            <LayoutTemplate>
                                <ul class="news-list">
                                    <a href="javascript:;" style="text-decoration: underline;" onclick="checkall()">全选</a>
                                    <a href="javascript:;" style="text-decoration: underline;" onclick="checkdes()">反选</a>
                                    <asp:PlaceHolder ID="phNews" runat="server"></asp:PlaceHolder>
                                </ul>

                            </LayoutTemplate>
                            <ItemTemplate>
                                <li>
                                    <asp:CheckBox ID="ckbNews" runat="server" ToolTip='<%#Eval("id") %>' /><a href="../newsdetail.aspx?nid=<%#Eval("id") %>" target="_blank"><%#Eval("title") %></a></li>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="sdsNews" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' SelectCommand="SELECT * FROM [news]" DeleteCommand="DELETE FROM [news] WHERE [id] = @id" InsertCommand="INSERT INTO [news] ([title], [photo], [contents], [time], [from]) VALUES (@title, @photo, @contents, @time, @from)" UpdateCommand="UPDATE [news] SET [title] = @title, [photo] = @photo, [contents] = @contents, [time] = @time, [from] = @from WHERE [id] = @id">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Decimal"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="title" Type="String"></asp:Parameter>
                                <asp:Parameter Name="photo" Type="String"></asp:Parameter>
                                <asp:Parameter Name="contents" Type="String"></asp:Parameter>
                                <asp:Parameter DbType="Date" Name="time"></asp:Parameter>
                                <asp:Parameter Name="from" Type="String"></asp:Parameter>
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="title" Type="String"></asp:Parameter>
                                <asp:Parameter Name="photo" Type="String"></asp:Parameter>
                                <asp:Parameter Name="contents" Type="String"></asp:Parameter>
                                <asp:Parameter DbType="Date" Name="time"></asp:Parameter>
                                <asp:Parameter Name="from" Type="String"></asp:Parameter>
                                <asp:Parameter Name="id" Type="Decimal"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>

                        <!-- 文本编辑器弹出层 -->
                        <div id="editor">
                            <a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn">×</a>


                            <!--编辑器editor 这个id="editor_id"是上面KindEditor.ready(function(K));函数创建一个
					    文本编辑框来替换textarea需要用到的id-->
                            <style type="text/css">
                                .textbox1 {
                                border-radius:5px;                     
                                 border: 1px solid #5F9EA0;
                                }
                                .description{
                                    margin-top:30px;
                                }
                            </style>
                            <div class="contents">
                                <div class="item">
                                    <label for="txtTitle">标题：</label><asp:TextBox ID="txtTitle" runat="server"
                                        height='28px' Cssclass="textbox1"></asp:TextBox>
                                </div>
                                <div class="item">
                                    <label for="txtFrom">来自：</label><asp:TextBox Cssclass="textbox1" ID="txtFrom" runat="server" height='28px'></asp:TextBox>
                                </div>
                                <div class="item">
                                    <label for="txtTime">发表时间：</label><asp:TextBox Cssclass="textbox1" ID="txtTime" runat="server" Font-Underline="False" TextMode="Date" height='28px' ></asp:TextBox>
                                </div>
                                <div class="description">
                                    <asp:TextBox ID="txtEdit" runat="server" TextMode="MultiLine" ></asp:TextBox>
                                </div>
                            </div>

                            <div class="buttons">
                                <asp:Button ID="btnSubmit" runat="server" Text="发表" OnClientClick="editor.sync();" OnClick="btnSubmit_Click" />
                                <button onclick="close();">取消</button>
                            </div>

                        </div>
                        <script type="text/javascript">
                            $(function ($) {
                                //弹出登录
                                $("#hand-in").hover(function () {
                                    $(this).stop().animate({
                                        opacity: '1'
                                    }, 600);
                                }, function () {
                                    $(this).stop().animate({
                                        opacity: '0.6'
                                    }, 1000);
                                }).on('click', function () {
                                    $("body").append("<div id='mask'></div>");
                                    $("#mask").addClass("mask").fadeIn("slow");
                                    $("#editor").fadeIn("slow");
                                });

                                $(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
                                    $("#editor").fadeOut("fast");
                                    $("#mask").css({ display: 'none' });
                                });
                            });
                        </script>
                    </section>
                    <section id="infor" style="display: none">
                        <h2 class="header" id="personal">个人信息</h2>
                        <ul class="topbar clearfix">
                            <li><a href="#">i&nbsp;&nbsp;基本信息</a></li>
                            <li><a href="#" id="change">k&nbsp;&nbsp;修改密码</a></li>
                            <li><a href="#" class="hidden">l&nbsp;&nbsp;保存</a></li>
                        </ul>

                        <!-- 修改密码的弹出层 html和js混在一起的 -->
                        <div id="popBox">
                            <input type="hidden" value="<%= HttpContext.Current.User.Identity.Name%>" id="username" />
                            <div class="row1">
                                修改密码<a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn">×</a>
                            </div>
                            <div class="row">
                                原始密码:
					            <input type="password" id="oldPsw" placeholder="原始密码" />
                                <a href="javascript:void(0)" title="提示" class="warning" id="warn">*</a>
                            </div>
                            <div class="row">
                                 &nbsp;&nbsp;&nbsp;新密码: 
					            <input type="password" id="newPsw" placeholder="密码" />
                                <a href="javascript:void(0)" title="提示" class="warning" id="warn2">*</a>
                            </div>
                            <div class="row">
                                确认密码:
                                <input type="password" id="rePsw" placeholder="确认密码" />
                            </div>
                            <div class="row">
                                <a href="#" id="submit">提交</a>
                            </div>
                        </div>

                        <script type="text/javascript">
                            $(function ($) {
                                //弹出登录
                                $("#change").hover(function () {
                                    $(this).stop().animate({
                                        opacity: '1'
                                    }, 600);
                                }, function () {
                                    $(this).stop().animate({
                                        opacity: '0.6'
                                    }, 1000);
                                }).on('click', function () {
                                    $("body").append("<div id='mask'></div>");
                                    $("#mask").addClass("mask").fadeIn("slow");
                                    $("#popBox").fadeIn("slow");
                                });
                                //
                                //按钮的透明度
                                $("#submit").hover(function () {
                                    $(this).stop().animate({
                                        opacity: '1'
                                    }, 600);
                                }, function () {
                                    $(this).stop().animate({
                                        opacity: '0.8'
                                    }, 1000);
                                });
                                //文本框不允许为空---按钮触发
                                $("#submit").on('click', function () {
                                    var oldPsw = $("#oldPsw").val();
                                    var newPwd = $("#newPsw").val();
                                    var rePwd = $("#rePsw").val();
                                    if (oldPsw == "" || oldPsw == undefined || oldPsw == null) {
                                        if (newPwd == "" || newPwd == undefined || newPwd == null) {
                                            $(".warning").css({ display: 'block' });
                                        }
                                        else {
                                            $("#warn").css({ display: 'block' });
                                            $("#warn2").css({ display: 'none' });
                                        }
                                    }
                                    else {
                                        if (newPwd == "" || newPwd == undefined || newPwd == null) {
                                            $("#warn").css({ display: 'none' });
                                            $(".warn2").css({ display: 'block' });
                                        }
                                        else {
                                            $(".warning").css({ display: 'none' });
                                        }
                                    }

                                    if (oldPsw != "" && newPwd != "" && rePwd != "") {
                                        if (newPwd != rePwd) {
                                            alert("两次密码输入不相同！");
                                        }
                                        else {
                                            $.post("changePassword.ashx", {
                                                username: $("#username").val(),
                                                old: oldPsw,
                                                newpass: newPwd
                                            }, function (data, status) {

                                                st = JSON.parse(data);
                                                if (st.status) {
                                                    alert("修改成功，请重新登录！");
                                                    history.go(0);

                                                }
                                                else {
                                                    alert(st.msg);
                                                }
                                            });
                                        }
                                    }


                                });
                                //文本框不允许为空---单个文本触发
                                $("#oldPsw").on('blur', function () {
                                    var oldPsw = $("#oldPsw").val();
                                    if (oldPsw == "" || oldPsw == undefined || oldPsw == null) {
                                        $("#warn").css({ display: 'block' });
                                    }
                                    else {
                                        $("#warn").css({ display: 'none' });
                                    }
                                });
                                $("#oldPsw").on('focus', function () {
                                    $("#warn").css({ display: 'none' });
                                });
                                //
                                $("#newPwd").on('blur', function () {
                                    var oldPsw = $("#newPwd").val();
                                    if (oldPsw == "" || oldPsw == undefined || oldPsw == null) {
                                        $("#warn2").css({ display: 'block' });
                                    }
                                    else {
                                        $("#warn2").css({ display: 'none' });
                                    }
                                });
                                $("#newPwd").on('focus', function () {
                                    $("#warn2").css({ display: 'none' });
                                });
                                //关闭
                                $(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
                                    $("#popBox").fadeOut("fast");
                                    $("#mask").css({ display: 'none' });
                                });
                            });
                            function close() {
                                $("#popBox").fadeOut("fast");
                                $("#mask").css({ display: 'none' });
                            }
                        </script>
                        <div class="person">
                            <div class="person-pic">
                                <asp:Image ID="imgDefault" runat="server" Width="210" Height="210" />
                            </div>
                            <h2>基本信息</h2>
                            <asp:ListView OnItemCanceling="lvPersonal_ItemCanceling" OnItemEditing="lvPersonal_ItemEditing" ID="lvPersonal" runat="server" DataSourceID="sdsPersonal" ItemPlaceholderID="phPersonal">
                                <LayoutTemplate>
                                    <ul class="person-list">
                                        <asp:PlaceHolder ID="phPersonal" runat="server"></asp:PlaceHolder>
                                    </ul>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <li>
                                        <label for="user-name">用户名:</label><%#Eval("no") %><input type="hidden" id="user-name" value="<%#Eval("no") %>"></li>
                                    <li>
                                        <label>姓名：</label><%#Eval("name") %></li>
                                    <li>
                                        <label>性别：</label><%#Convert.ToInt32(Eval("sex"))==1?"男":"女" %></li>
                                    <li>
                                        <label>生日：</label><%# Eval("birth","{0:yyyy年MM月dd日}") %></li>
                                    <li>
                                        <label>地址：</label><%#Eval("address") %></li>
                                    <li>
                                        <label>个人说明：</label><%#Eval("description") %></li>
                                    <li>
                                        <asp:LinkButton ID="lnbEdit" runat="server" CommandName="Edit" CssClass="btn btn-warning" OnClientClick="showSection('infor')" >编辑</asp:LinkButton></li>
                                    <asp:FileUpload ID="fileImg" runat="server" Width="150px"/>
                                    <br /><asp:LinkButton ID="lnbImg" runat="server" CssClass="btn btn-danger" OnClick="lnbImg_Click">上传图片</asp:LinkButton>
                                </ItemTemplate>

                                <EditItemTemplate>
         
                                    <li>
                                        <label>用户名:</label><asp:TextBox ID="txtUsername" runat="server" Text='<%#Bind("name") %>' CssClass="textbox"></asp:TextBox></li>
                                    <li>
                                        <label>性别：</label>
                                        <asp:DropDownList ID="ddlSex" runat="server" SelectedValue='<%# Bind("sex") %>' Width="54px" CssClass="textbox">
                                            <asp:ListItem Value="True">男</asp:ListItem>
                                            <asp:ListItem Value="False">女</asp:ListItem>
                                        </asp:DropDownList>
                                    </li>
                                    <li>
                                        <label>生日：</label><asp:TextBox ID="txtBirth" runat="server" TextMode="Date" Text='<%#Bind("birth","{0:yyyy-MM-dd}") %>' CssClass="textbox"></asp:TextBox>

                                    </li>
                                    <li><label>地址：</label><asp:TextBox ID="txtAddress" runat="server" Text='<%#Bind("address") %>' CssClass="textbox"></asp:TextBox></li>
                                    <li><label>个人描述：</label><asp:TextBox ID="txtBind" runat="server" Text='<%#Bind("description") %>' CssClass="textbox"></asp:TextBox></li>
                                <li><label style="width:200px">
                                    <asp:LinkButton ID="lnbSave" runat="server" CommandName="Update" CssClass="btn btn-success">保存</asp:LinkButton> 
                                    <asp:LinkButton ID="lnbCancel" runat="server" CommandName="Cancel" CssClass="btn btn-danger">取消</asp:LinkButton></label></li>
                                     </EditItemTemplate>
                            </asp:ListView>

                            <asp:SqlDataSource runat="server" ID="sdsPersonal" ConnectionString='<%$ ConnectionStrings:localhost-sqlserver %>' SelectCommand="SELECT [id], [sex], [address], [birth], [description], [name], [no] FROM [manager] WHERE ([no] = @no)" DeleteCommand="DELETE FROM [manager] WHERE [id] = @id" InsertCommand="INSERT INTO [manager] ([sex], [address], [birth], [description], [name], [no]) VALUES (@sex, @address, @birth, @description, @name, @no)" UpdateCommand="UPDATE [manager] SET [sex] = @sex, [address] = @address, [birth] = @birth, [description] = @description, [name] = @name WHERE [no] = @no">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="sex" Type="Boolean"></asp:Parameter>
                                    <asp:Parameter Name="address" Type="String"></asp:Parameter>
                                    <asp:Parameter DbType="Date" Name="birth"></asp:Parameter>
                                    <asp:Parameter Name="description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="name" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="no" Type="String"></asp:Parameter>
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="username" Name="no" Type="String"></asp:SessionParameter>
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="sex" Type="Boolean"></asp:Parameter>
                                    <asp:Parameter Name="address" Type="String"></asp:Parameter>
                                    <asp:Parameter DbType="Date" Name="birth"></asp:Parameter>
                                    <asp:Parameter Name="description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="name" Type="String"></asp:Parameter>
                                    <asp:SessionParameter SessionField="username" Name="no" Type="String"></asp:SessionParameter>

                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </section>
                </div>
            </div>

            <script src="js/script.js" type="text/javascript"></script>
        </div>
    </form>
</body>
</html>
