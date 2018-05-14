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

    <title>巢州-随手拍后台</title>
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
                <li class=" item ">
                    <a href="index.jsp">
                        <i class="fa fa-television" aria-hidden="true"></i>
                        <span>工作台</span>
                    </a>
                </li>
                <li class=" item">
                    <a href="${pageContext.request.contextPath}/EventsAction_list">
                        <span>随手拍管理</span>
                    </a>
                </li>
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
                    <li>
                        <a href="${pageContext.request.contextPath}/AdminAction_getAdmin">个人资料修改</a>
                    </li>
                    <li class="list-on">
                        <a href="adminpassword.jsp">密码修改</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <form action="AdminAction_updateCode" method="post">
    <div class="main">
        <div class="content">
            <div class="module background question-list change-password">
                <div class="title">
                    <div class="title-text pull-left">密码修改</div>
                </div>
                <div class="table-list">
                    <div class="middle">
                        <div class="form-group">
                            <label for="old-password">旧密码：</label>
                            <input type="password" class="form-control" id="old-password" name="Admin_password">
                        </div>
                        <div class="form-group check-code">
                            <label for="check-c">请输入验证码：</label>
                            <input type="text" name="checkCode" class="form-control" id="check-c">
                            <span>
                                <img src="${pageContext.request.contextPath}/checkImg_verify" id="checkImage" onclick="changeImg()" alt=""/>
                            </span>
                        </div>
                        <div class="form-group">
                            <label for="new-password">新密码：</label>
                            <input type="password" class="form-control" name="new_Admin_password" id="new-password">
                        </div>
                        <div class="form-group">
                            <font color="red" ><s:property value="exception.message" /> </font>
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
    </script>
    <%--
    <script type="text/javascript">
        function changeImg() {
            var image = document.getElementById("checkImage");
            image.src="${pageContext.request.contextPath}/checkImg?"+new Date().getTime();
        }
    </script>
    --%>

</body>
</html>