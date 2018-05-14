
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="S" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>巢州-随手拍后台</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
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
<div class="login-header pull-left">
    <div class="middle">
        <div class="logo pull-left">
            <img src="images/logo.png" alt=""/>
        </div>
        <div class="nav pull-left">
            <ul>
                <li>
                    <a href="#">
                        <span class="chinese">首页</span>
                        <span class="english">HOME</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="chinese">新闻中心</span>
                        <span class="english">NEWS</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="chinese">通知公告</span>
                        <span class="english">NOTICES</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="relative pull-right">
            <ul>
                <li>
                    <a href="#">
                        <span class="login-icon pull-left"></span>
                        <span class="pull-left">微信</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span  class="login-icon login-icon1 pull-left"></span>
                        <span class="pull-left">微博</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>

<form action="${pageContext.request.contextPath}/AdminAction_login" method="post">
<div class="login-main pull-left">
    <div class="middle">
        <div class="form pull-right">
            <div class="form-group">
                <label class="form-icon"></label>
                <input type="text" class="form-control" name="Admin_code" placeholder="登录账号">
            </div>
            <div class="form-group">
                <label class="form-icon form-icon2"></label>
                <input type="password" class="form-control" name="Admin_password" placeholder="密码（8-12位区分大小写）">
            </div>
            <%--<div class="form-group form-group-check">--%>
                <%--<span class="pull-left">--%>
                    <%--<label class="form-icon form-icon3"></label>--%>
                    <%--<input type="text" class="form-control" name="checkcode" placeholder="请输入验证码">--%>
                <%--</span>--%>
                <%--<span class="pull-left">--%>
                    <%--<img  id="checkImage" src="${pageContext.request.contextPath}/checkImg" onclick="changeImg(this)" />--%>
                <%--</span>--%>
            <%--</div>--%>
            <%--

            <div class="form-group checkbox">
                <label class="checkbox-inline pull-left">
                    <input type="checkbox" id="inlineCheckbox1" value="option1" name="autoLogin">
                </label>
                <span class="auto-login pull-left">自动登录</span>
                </div>
                --%>
            <font color="red" ><s:property value="exception.message" /> </font>
            <div class="form-group">
                <button type="submit" class="btn confirm">登录</button>
            </div>
            <div class="form-group" onclick="registerss()">
                <button class="btn confirm"><a href="register.jsp" style="color: white;height: 21px;width: 300px">注册</a></button>
            </div>
        </div>
    </div>
</div>
</form>
<div class="announcement pull-left">
    <div class="middle">
        <ul>
            <li>
                <span class="icon-img pull-left">
                    <img src="images/voice.png" alt=""/>
                </span>
                <span class="text pull-left">后台使用说明</span>
                <span class="pull-left">
                    <a href="#">
                        [查看详情]
                    </a>
                </span>
            </li>
        </ul>
    </div>
</div>
<div class="login-bottom">
    <div class="middle">
        <div class="news pull-left">
            <ul>
                <li><a href="#"><span class="pull-left">1.【名城新闻网】工业园区产业工程师（技师）协会今天成立</span><span class="pull-right">2016.08.28</span></a></li>
                <li><a href="#"><span class="pull-left">2.【名城新闻网】工业园区产业工程师（技师）协会今天成立</span><span class="pull-right">2016.08.28</span></a></li>
                <li><a href="#"><span class="pull-left">3.【名城新闻网】工业园区产业工程师（技师）协会今天成立</span><span class="pull-right">2016.08.28</span></a></li>
                <li><a href="#"><span class="pull-left">4.【名城新闻网】工业园区产业工程师（技师）协会今天成立</span><span class="pull-right">2016.08.28</span></a></li>
                <li><a href="#"><span class="pull-left">5.【名城新闻网】工业园区产业工程师（技师）协会今天成立</span><span class="pull-right">2016.08.28</span></a></li>
            </ul>
        </div>
        <div class="QR-code pull-right">
            <div class="left pull-left">
                <ul>
                    <li>
                        <span class="pull-left">微信：</span>
                        <span class="QR-code-icon pull-left"></span>
                    </li>
                    <li>
                        <span class="pull-left">微博：</span>
                        <span class="QR-code-icon weibo-icon pull-left"></span>
                    </li>
                </ul>
            </div>
            <div class="right pull-right">
                <ul>
                    <li>
                        <img src="images/code.jpg" alt=""/>
                    </li>
                    <li>
                        <img src="images/code.jpg" alt=""/>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    最美巢湖-巢湖学院移动创新中心
</div>
<script src="js/jquery-1.9.1.min.js"></script>
<script>
    window.onload = function(){
        var h = $(window).height();
        var he = $(".login-header").height();
        var hm = $(".login-main").height();
        var ha = $(".announcement").height();
        var hf = $(".footer").height();
        var hr = $(".login-bottom .QR-code .right").height();
        var hl = $(".login-bottom .QR-code .left").height();
        var  hb = h - he - hm - ha - hf;
        $(".login-bottom").css("height",hb);
        $(".login-bottom .QR-code .right").css("margin-top",(hb-hr)/2);
        $(".login-bottom .QR-code .left").css("margin-top",(hb-hl)/2);
    }
</script>

<script type="text/javascript">
    function changeImg(obj) {
        obj.src="checkImg?time="+new Date().getTime()
    }
    function registerss() {
        window.location.href = "register.jsp";
    }
</script>


</body>
</html>