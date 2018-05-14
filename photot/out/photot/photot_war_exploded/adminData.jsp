<%--
  Created by IntelliJ IDEA.
  User: pc26
  Date: 2018/3/15
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <title>最美巢湖-随手拍后台</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/media.css">
    <link rel="stylesheet" href="css/style.css"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->
    <script src="js/jquery-1.9.1.min.js"></script>

    <script type="text/javascript">
        function imagesSelectedForHead(myFiles) {
            for (var i = 0, f; f = myFiles[i]; i++) {
                var imageReader = new FileReader();
                imageReader.onload = (function(aFile) {
                    return function(e) {
                        $('#imgtext').html('<img  class="images" style="width: 100px;height: 100px" src="'+e.target.result+'" title="'+aFile.name
                            +'"/>');

                         // $('#imageUrl').val(e.target.result);
                    };
                })(f);
                imageReader.readAsDataURL(f);
            }
        }

    </script>
</head>
<body>
    <div class="header">
        <!--header-->
        <div class="top">
            <!--top-->
            <div class="fl title">
                最美巢湖-随手拍后台
            </div>
            <div class="fr user">
                <div class="fl userinfo">
                    <i class="fa fa-user fa-2x"></i><br>
                    <span class="name">
                    <s:if test="#session.admin==null">
                        <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
                    </s:if>
                        <s:else>
                            欢迎你:<s:property value="#session.admin.Admin_name"/> <br>
                            <a href="${pageContext.request.contextPath}/AdminAction_cancelLogin">注销</a>
                        </s:else>

                    </span>
                </div>
                <s:if test="#session.admin==null">
                    <div class="fl userlogo">
                        <img src="images/1.jpg" alt="user logo" width="60" height="60">
                    </div>
                </s:if>
                <s:else>
                    <div class="fl userlogo">
                        <img src="<s:property value="#session.admin.Admin_photo"/>" width="60" height="60">
                    </div>
                </s:else>
                <div class="fl menu">
                    <img src="images/menu.png" alt="user menu" height="30">
                </div>
            </div>
        </div>
        <div class="nav">
            <!--nav-->
            <ul class="list">
                <li class=" item">
                    <a href="index.jsp">
                        <i class="fa fa-television" aria-hidden="true"></i>
                        <span>工作台</span>
                    </a>
                </li>
                <li class=" item">
                    <a href="${pageContext.request.contextPath}/EventsAction_list">
                        <span>随手拍管理</span>
                    </a>
                <li class=" item">
                    <a href="reportForms.jsp">
                        <span>报表管理</span>
                    </a>
                </li>
                <li class=" item">
                    <a href="${pageContext.request.contextPath}/UserAction_list">
                        <span>管理员管理</span>
                    </a>
                </li>
                <li class=" item">
                    <a href="">
                        <span>提醒功能</span>
                    </a>
                </li>
                <li class=" item">
                    <a href="${pageContext.request.contextPath}/UserAction_lists">
                        <span>通讯录管理</span>
                    </a>
                </li>
                <li class=" item active">
                    <a href="${pageContext.request.contextPath}/AdminAction_getAdmin">
                        <span>个人中心</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="sider user">
        <div class="content">
            <!--sider-content-->
            <div class="infolist">
                <ul class="list">
                    <li class="list-on">
                        <a href="${pageContext.request.contextPath}/AdminAction_getAdmin">个人资料修改</a>
                    </li>
                    <li>
                        <a href="adminpassword.jsp">密码修改</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <%--文件上传页面3个要求
		1.表单必须post提交
		2.表单提交类型enctype 必须是多段式
		3.文件上传使用<<input type="file">

--%>
    <form action="${pageContext.request.contextPath}/AdminAction_update" method="post" enctype="multipart/form-data" >
        <%--修改需要一个隐藏的id--%>
        <input type="hidden" value="<s:property value="#session.admin.Admin_id"/>" name="Admin_id" class="form-control">
    <div class="main">
        <div class="content">
            <div class="module background question-list change-password">
                <div class="title">
                    <div class="title-text pull-left">信息修改</div>
                </div>
                <div class="table-list">
                    <div class="middle">
                            <div class="choose-img">
                            <%--<span class="add-img">--%>
                                <span id="imgtext">
                                <%--<img src="images/add-img.png" alt=""/>--%>
                               <img src="<s:property value="#session.admin.Admin_photo"/>"  width="100" height="100" alt=""/>
                            </span>
                                <input id="fileupload" type="file" name="photo" onchange="imagesSelectedForHead(this.files)" class="btn">
                            </div>
                            <div class="form-group">
                                <label for="name">姓名：</label>
                                <input type="text" value="<s:property value="#session.admin.Admin_name"/>" name="Admin_name" class="form-control" id="name">
                                <span class="name-error" style="font-size: 12px;color: #d00000;"></span>
                            </div>
                            <div class="form-group">
                                <label for="phone">电话：</label>
                                <input type="text" value="<s:property value="#session.admin.Admin_mobile"/>" name="Admin_mobile" class="form-control" id="phone">
                                <span class="phone-error" style="font-size: 12px;color: #d00000;"></span>
                            </div>
                            <div class="form-group">
                                <label for="mobile">手机：</label>
                                <input type="text" value="<s:property value="#session.admin.Admin_phone"/>" name="Admin_phone" class="form-control" id="mobile">
                                <span class="mobile-error" style="font-size: 12px;color: #d00000;"></span>
                            </div>
                            <div class="form-group">
                                <label for="department">部门：</label>
                                <input type="text" value="<s:property value="#session.admin.Admin_section"/>" name="Admin_section" class="form-control" id="department">
                            </div>
                            <div class="form-group">
                                <label for="job">职务：</label>
                                <input type="text" value="<s:property value="#session.admin.Admin_job"/>" name="Admin_job" class="form-control" id="job">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-default">确定</button>
                            </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>

    <script>
        $('.header .top .menu').on('click', function () {
            $('.header .nav').slideToggle();
        })



        $("#name").blur(function(){
            var name = $("#name").val();
            var cname = /^[\u4e00-\u9fa5]+$/;
            if(!cname.test(name))
            {
                $(".name-error").html('中文名为2~4个中文字符！');
            }
            else
            {
                $(".name-error").html('');
            }
        });

        $("#phone").blur(function(){
            var phone = $("#phone").val();
            var cphone = /[0-9-()（）]{7,18}/;
            if(!cphone.test(phone))
            {
                $(".phone-error").html('请填写正确的电话！');
            }
            else
            {
                $(".phone-error").html('');
            }
        });

        $("#mobile").blur(function(){
            var mobile = $("#mobile").val();
            var cmobile = /0?(13|14|15|18)[0-9]{9}/;
            if(!cmobile.test(mobile))
            {
                $(".mobile-error").html('请填写正确的手机号！');
            }
            else
            {
                $(".mobile-error").html('');
            }
        });

        $("button").click(function(){
            var name = $("#name").val();
            var phone = $("#phone").val();
            var mobile = $("#mobile").val();
            var department = $("#department").val();
            var position = $("#job").val();
            if(name=="" || phone=="" || mobile=="" || department=="" || position=="")
            {
                alert("请将信息填写完整！");
            }
        });

        /*$("#phone").click(function(){
            var name = $("#name").val();
            var cname = /^[\u4e00-\u9fa5]+$/;
            if(!cname.test(name))
            {
                $(".name-error").html('请填写正确的姓名格式！');
            }
            else
            {
                $(".name-error").html('');
            }
        });

        $("#mobile").click(function(){
            var phone = $("#phone").val();
            var cphone = /[0-9-()（）]{7,18}/;
            if(!cphone.test(phone))
            {
                $(".phone-error").html('请填写正确的电话！');
            }
            else
            {
                $(".phone-error").html('');
            }
        });

        $("#department").click(function(){
            var mobile = $("#mobile").val();
            var cmobile = /0?(13|14|15|18)[0-9]{9}/;
            if(!cmobile.test(mobile))
            {
                $(".mobile-error").html('请填写正确的手机号！');
            }
            else
            {
                $(".mobile-error").html('');
            }
        });*/

    </script>
</body>
</html>