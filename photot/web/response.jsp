<%--
  Created by IntelliJ IDEA.
  User: pc26
  Date: 2018/3/17
  Time: 21:08
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
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/media.css">
    <link rel="stylesheet" href="css/style.css">

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
<form action="${pageContext.request.contextPath}/EventsAction_setComment" method="post">
    <input type="hidden" name="event_id" value="<s:property value="#events.event_id"/>">
    <div class="main">
        <div class="content">
            <div class="module reply">
                <div class="reply-title">
                    <div class="top-title pull-left">
                        <span class="pull-left"><s:property value="#events.event_detail"/></span>
                        <span class="pull-right time"><s:property value="#events.event_time"/></span>
                    </div>
                    <div class="state pull-left">
                        <span class="pull-left address-img"><img src="images/address.png" alt=""/></span>
                        <span class="pull-left"><s:property value="#events.event_place"/></span>
                        <s:if test="#events.event_comment!=null">
                             <span class="done-reply pull-left">已回复</span>
                        </s:if>
                        <s:else>
                             <span class="not-reply pull-left">未回复</span>
                        </s:else>
                        <%--<span class="pull-right transmit">--%>
            <%--</span>--%>
                    </div>
                </div>
                <div class="images">
                    <div class="information">
                        <span>提供者：<s:property value="#events.event_user.user_name"/></span>
                        <span><s:property value="#events.event_user.user_phone"/></span>
                        <span><s:property value="#events.event_user.user_email"/></span>
                    </div>
                    <div class="images-show">
                        <ul>
                            <li>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox1" value="option1" name="choose">
                                </label>
                                <img src="images/picture1.jpg" alt=""/>
                            </li>
                            <li>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox2" value="option1" name="choose">
                                </label>
                                <img src="images/timg1.jpg" alt=""/>
                            </li>
                            <li>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox3" value="option1" name="choose">
                                </label>
                                <img src="images/timg2.jpg" alt=""/>
                            </li>
                            <li>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox4" value="option1" name="choose">
                                </label>
                                <img src="images/timg3.jpg" alt=""/>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content-text">
                    <div class="choose-button">
                        <div class="radio pull-left">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                                开通
                            </label>
                        </div>
                        <div class="radio pull-left">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                关闭
                            </label>
                        </div>
                    </div>
                    <div class="edit-box">
                        <div class="tab">
                            <ul id="tabs">
                                <li class="list">
                                    <div class="text"><span onclick="defaultComment()">模板消息</span></div>
                                </li>
                                <li class="list on">
                                    <div class="text">自定义</div>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <span class="done-color ">请在下面文本框中进行评论</span>
                        </div>
                        <div id="panels">
                            <%--<div class="box hide">--%>
                                <%--<textarea name="event_comment" style="width:1121px;height: 220px" >您所发现的不文明事件我们已经收到，感谢你对社会文明的关心和支持。您所举报的内容，我们已经安排专人进行核实，请您等待处理结果。我们会给您一个满意答复。再次感谢你的建议。</textarea>--%>
                            <%--</div>--%>
                            <div class="box">
                                <textarea name="event_comment" id="default_comment" style="width:1121px;height: 220px" ></textarea>
                            </div>
                        </div>
                        <div class="button-reply">
                            <button type="submit" class="btn btn-default">确定</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
    <script type="text/javascript">
        function defaultComment(){
            $("#default_comment").val("您所发现的不文明事件我们已经收到，感谢你对社会文明的关心和支持。您所举报的内容，我们已经安排专人进行核实，请您等待处理结果。我们会给您一个满意答复。再次感谢你的建议。");
        }
    </script>
    <script>
        $('.header .top .menu').on('click', function () {
            $('.header .nav').slideToggle();
        });
        $('#tabs .list').on('click', function () {
            var index = $(this).index();
            $(this).addClass('on').siblings('.list').removeClass('on');
            $('#panels .box').eq(index).removeClass('hide');
            $('#panels .box').eq(index).siblings('.box').addClass('hide');
        });
    </script>


<div class="cover cover-forward">
    <div class="cover1">

        <div class="form-title">转发：小区门口随意乱停车</div>
        <div class="selection-box">
            <span>请选择局办</span>
            <select class="form-control">
                <option>1</option>
                <option>2</option>
                <option>3</option>
            </select>
            <span>请选择人员</span>
            <select class="form-control">
                <option>1</option>
                <option>2</option>
                <option>3</option>
            </select>
            <button type="button" class="btn cancel">取消</button>
            <button type="button" class="btn confirm">确定</button>
        </div>

    </div>
</div>

<script>
    $(".transmit").click(function(){
        $(".cover-forward").css("display","block");
    });
    $(".cancel").click(function(){
        $(".cover-forward").css("display","none");
    });
</script>

<div class="cover cover-img">
    <div class="cover1">
        <img src="images/picture1.jpg" alt=""/>
    </div>
</div>
<script>
    $(".images-show li").on('click','img',function(){
        $(".cover-img").css("display","block");
    })
    $(".cover-img").bind("click",function(e){
        var target  = $(e.target);
        if(target.closest(".cover-img .cover1").length == 0){
            $(".cover-img").css("display","none");
        }
    })
</script>
</body>
</html>