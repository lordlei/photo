<%--
  Created by IntelliJ IDEA.
  User: pc26
  Date: 2018/3/17
  Time: 19:33
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
    <link rel="stylesheet" href="css/style.css">

    <style>
        .table > thead > tr > th{
            border-bottom: 1px solid #ddd;
        }
    </style>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function dianji() {
            var flag = document.getElementById("inlineCheckbox").checked;
            var cks = document.getElementsByName("check_id");
            if (flag) {
                for ( var i = 0; i < cks.length; i++) {
                    cks[i].checked = true;
                }
            } else {
                for ( var i = 0; i < cks.length; i++) {
                    cks[i].checked = false;
                }
            }
        }

        function submitTable(){
            $("#submitTable").submit();
        }

        function changPage(currentPage) {
            $("#currentPageInput").val(currentPage);

            $("#submitTable").submit();
        }

        function deleteEvent() {
            document.forms['submitDelete'].action = "${pageContext.request.contextPath }/EventsAction_delete";
            document.forms['submitDelete'].submit();
        }

        function check() {
            document.forms['submitDelete'].action = "${pageContext.request.contextPath }/EventsAction_checks";
            document.forms['submitDelete'].submit();
        }
        function seeDetails() {
            document.forms['submitDelete'].action = "${pageContext.request.contextPath }/EventsAction_replyButton";
            document.forms['submitDelete'].submit();
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
                            <%--<img src="http://localhost:9696/photo/images/<s:property value="#session.admin.Admin_photo"/>" width="60" height="60">--%>
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
                <li class=" item active">
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
                <li class=" item">
                    <a href="${pageContext.request.contextPath}/AdminAction_getAdmin">
                        <span>个人中心</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="sider">
        <div class="content">
            <!--sider-content-->
            <div class="user">
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

                <div class="fl userinfo">
                    <s:if test="#session.admin==null">
                        <div class="name">用户名</div>
                    </s:if>
                    <s:else>
                        <div class="name"><s:property value="#session.admin.Admin_name"/></div>
                    </s:else>
                    <div class="role">角色</div>
                </div>
            </div>
            <div class="infolist">
                <ul class="list">
                    <li>
                        <div class="box">
                            <div class="title">
                                <i class="fa fa-file-text-o"></i>
                                <span>待处理</span>
                            </div>
                            <ul class="sublist">
                                <li class="item">
                                    <a href="">超7日 未审核居民反馈问题 <span>1</span> 条</a>
                                </li>
                                <li class="item">
                                    <a href="">超7日 未审核居民反馈问题 <span>1</span> 条</a>
                                </li>
                                <li class="item">
                                    <a href="">超7日 未审核居民反馈问题 <span>1</span> 条</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="box">
                            <div class="title">
                                <i class="fa fa-bell-o"></i>
                                <span>预警台</span>
                            </div>
                            <ul class="sublist">
                                <li class="item">
                                    <a href="">超7日 未审核居民反馈问题 <span>1</span> 条</a>
                                </li>
                                <li class="item">
                                    <a href="">超7日 未审核居民反馈问题 <span>1</span> 条</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <form action="EventsAction_list" method="post" id="submitTable" name="submitDelete">
        <%--当前页数--%>
        <input type="hidden" name="currentPage" id="currentPageInput" value="<s:property value="#pageBean.currentPage"/>">
    <div class="main">
        <div class="content">
            <div class="module background question-list">
                <div class="title">
                    <div class="title-text pull-left">随手拍</div>
                    <div class="buttons pull-right">
                        <div class="button search pull-left input-prepend">
                            <div class="btn-group pull-left">
                                <button class="btn dropdown-toggle" data-toggle="dropdown">
                                    选择类型
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>已审核</li>
                                    <li>未审核</li>
                                    <li>已回复</li>
                                    <li>未回复</li>
                                </ul>
                            </div>
                            <input class="span2 pull-left" id="prependedDropdownButton" name="event_detail" type="text" placeholder="按问题描述搜索...">
                            <span class="pull-left search-btn">
                    <button class="pull-left">
                        <img class="pull-left" src="images/search.png" alt=""/>
                    </button>
                </span>
                        </div>
                        <div class="button delete pull-left">
                            <button type="button" onclick="deleteEvent()" class="btn">删除</button>
                        </div>
                        <div class="button check pull-left">
                            <button type="button" onclick="check()" class="btn">审核</button>
                        </div>
                        <div class="button reply pull-left">
                            <button type="button" onclick="seeDetails()" class="btn">回复</button>
                        </div>
                        <div class="button export pull-left">
                            <button type="button" onclick="seeDetails()" class="btn">查看具体</button>
                        </div>
                    </div>
                </div>
                <div class="table-list">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox" value="option" onchange="dianji()">
                                </label>
                                <span>全部</span>
                            </th>
                            <th>日期</th>
                            <th>问题描述</th>
                            <th>定位地点</th>
                            <th>状态</th>
                            <th>回复</th>
                            <th>姓名</th>
                            <th>电话</th>
                            <th>邮箱</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="#pageBean.list" var="list">
                            <tr>
                                <td>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox1" value="<s:property value="#list.event_id"/>" name="check_id">
                                    </label>
                                </td>
                                <td><s:property value="#list.event_time"/></td>
                                <td><s:property value="#list.event_detail"/></td>
                                <td><s:property value="#list.event_place"/></td>
                                <%--<a href="javascript:if(confirm('确实要删除该内容吗?'))location='http://www.google.com'">弹出窗口</a>--%>
                                <s:if test="#list.event_check==1">
                                    <td class="done-color">已审核</td>
                                </s:if>
                                <s:else>
                                   <td class="not-check"><a style="color: #FF0000" href="javascript:if(confirm('确认要通过审核'))
                                   location='${pageContext.request.contextPath}/EventsAction_check?event_id=<s:property value="#list.event_id"/>'">未审核</a></td>
                                </s:else>

                                <s:if test="#list.event_comment!=null">
                                    <td class="done-color"><a href="javascript:if(confirm('确认查看详情'))
                                    location='${pageContext.request.contextPath}/EventsAction_reply?event_id=<s:property value="#list.event_id"/>'">已回复</a></td>
                                </s:if>
                                <s:else>
                                    <td class="not-reply"><a style="color: green" href="javascript:if(confirm('确认进入回复页面'))
                                    location='${pageContext.request.contextPath}/EventsAction_reply?event_id=<s:property value="#list.event_id"/>'">未回复</a></td>
                                </s:else>

                                <td><s:property value="#list.event_user.user_name"/></td>
                                <td><s:property value="#list.event_user.user_phone"/></td>
                                <td><s:property value="#list.event_user.user_email"/></td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>
                </div>
                <div class="pages">
                    <span>共<s:property value="#pageBean.totalCount"/>记录</span>
                    <a href="javaScript:void(0)" onclick="changPage(<s:property value='#pageBean.currentPage-1'/>)">上一页»</a>
                    <s:iterator begin="1" end="#pageBean.totalPage" var="count" >
                        <a href="javaScript:void(0)" onclick="changPage(<s:property value="#count"/>)" id="joinPage"><s:property value="#count"/></a>
                    </s:iterator>
                    <a href="javaScript:void(0)" onclick="changPage(<s:property value='#pageBean.currentPage+1'/>)">下一页»</a>
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

<!--新增-->
<%--<div class="cover cover-same cover-add-choose">--%>
    <%--<div class="cover1">--%>
        <%--<div class="form-title">新增</div>--%>
        <%--<div class="selection-box">--%>
            <%--<div class="form-group">--%>
                <%--<span>局办选择：</span>--%>
                <%--<select class="form-control">--%>
                    <%--<option>1</option>--%>
                    <%--<option>2</option>--%>
                    <%--<option>3</option>--%>
                <%--</select>--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
                <%--<label for="name">姓名：</label>--%>
                <%--<input type="text" class="form-control" id="name">--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
                <%--<label for="phone">手机号：</label>--%>
                <%--<input type="text" class="form-control" id="phone">--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
                <%--<label for="landline">座机：</label>--%>
                <%--<input type="text" class="form-control" id="landline">--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
                <%--<label for="Email">邮箱：</label>--%>
                <%--<input type="email" class="form-control" id="Email">--%>
            <%--</div>--%>
            <%--<button type="button" class="btn cancel">取消</button>--%>
            <%--<button type="button" class="btn confirm">确定</button>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<script>
    $(".delete").click(function(){
        $(".cover-add-choose").css("display","block");
    });
    $(".cancel").click(function(){
        $(".cover-add-choose").css("display","none");
    });
</script>


<%--<!--重置密码-->--%>
<%--<div class="cover cover-same cover-reset">--%>
    <%--<div class="cover1">--%>
        <%--<div class="form-title">用户：<span>张三</span> 重置密码</div>--%>
        <%--<div class="selection-box">--%>
            <%--<div class="form-group">--%>
                <%--<label for="password">新密码：</label>--%>
                <%--<input type="password" class="form-control" id="password">--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
                <%--<label for="check-password">--%>
                    <%--<span>再次确认密码</span>--%>
                    <%--<span class="error"></span>--%>
                <%--</label>--%>
                <%--<input type="password" class="form-control" id="check-password">--%>
            <%--</div>--%>
            <%--<button type="button" class="btn cancel">取消</button>--%>
            <%--<button type="button" class="btn confirm">确定</button>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<script>
    $(".check").click(function(){
        $(".cover-reset").css("display","block");
    });
    $(".cancel").click(function(){
        $(".cover-reset").css("display","none");
    });

    $(".cover-reset .confirm").click(function () {
        var p = $("#password").val();
        var cp = $("#check-password").val();
        if(p != cp)
        {
            $(".error").html("（两次输入不一致，请重新输入）");
        }
    })

</script>
</body>
</html>