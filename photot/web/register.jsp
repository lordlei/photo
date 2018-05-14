<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<%--//表单校验插件--%>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">

<script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>


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
<%--//表单校验--%>
<script type="text/javascript">
    <%--//表单校验
	//自定义校验规则
	$.validator.addMethod(
		//规则的名称
		"checkUsername",
		//校验的函数
		function (value,element,params) {
		    //定义一个标志
			var flag = false;
            //value:输入的内容
            //element:被校验的元素对象
            //params：规则对应的参数值
			//目的:对输入的username进行ajax校验
            $.ajax({
				//需要同步
                "async": false,
                "url": "${pageContext.request.contextPath}/checkUsername",
                "data": {"username": value},
                "type": "POST",
				"dataType":"json",
                "success": function (data) {
                    flag=data.isExist;
                }
			});
            return !flag;
        }
	);
	--%>

	$(function () {
		$("#myforms").validate({
			//下面获取的是表单的name
			rules:{
                "Admin_code": {
                    "required": true,
                },
				"Admin_password":{
                    "required":true,
					"rangelength":[6,12]
				},
				"Admin_repassword":{
			        "required":true,
					"rangelength":[6,12],
					"equalTo":"#Admin_password"
				},
				"Admin_email":{
			        "required":true,
					"email":true
				},
				"Admin_phone":{
			        "required":true
				},
				"Admin_mobile":{
			        "required":true
				},
                "Admin_weiXin":{
                    "required":true
                },
                "Admin_job":{
                    "required":true
                },
                "Admin_name":{
                    "required":true
                }
			},

			messages:{
                "Admin_code":{
                    "required":"用户名不能为空",
                },
                "Admin_password":{
                    "required":"密码不能为空",
                    "rangelength":"密码长度为6到12位"
                },
                "Admin_repassword":{
                    "required":"密码不能为空",
                    "rangelength":"密码长度为6到12位",
                    "equalTo":"两次输入的密码不相同"
                },
                "Admin_email":{
                    "required":"邮箱不能为空",
                    "email":"请输入正确的邮箱格式"
                },
                "Admin_name":{
                    "required":"真实姓名不能为空"
                },
                "Admin_phone":{
                    "required":"电话不能为空"
                },
                "Admin_mobile":{
                    "required":"座机不能为空"
                },
                "Admin_weiXin":{
                    "required":"微信不能为空"
                },
                "Admin_job":{
                    "required":"部门不能为空"
                }

			}

		});
    });

</script>



<%--<script type="text/javascript">

    $(function () {
        //光标移除事件
        $("#username").blur(function () {
            //获取内容
            var username=$("#username").val()
            //ajax 传递
            $.post(
                "${pageContext.request.contextPath}/checkUsername",
                {"username":username},
                function (data) {
                    if(data.isExit){
                        $("#usernameInfo").css("color","red");
                        $("#usernameInfo").html("用户名已经存在")
                    }else{
                        $("#usernameInfo").html("")

					}
                },
                "json"
            )

        })
    })
</script>--%>



<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}
	.error{
		color:red;
	}
</style>
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


	<div class="container"
		style="width: 100%; background: url('image/regist_bg.jpg');">
		<div class="row">
			<div class="col-md-2"></div>
                 <form id="myforms" class="form-horizontal" action="${pageContext.request.contextPath}/AdminAction_login" enctype="multipart/form-data" method="post" style="margin-top: 5px;">
			<div class="col-md-8"
				style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
				<font>管理员注册</font>USER REGISTER

				<%--头像--%>
				<div class="form-group">
					<label  class="col-sm-2 control-label">头像</label>
					<div class="col-sm-6">
						<div class="choose-img">
							<%--<span class="add-img">--%>
							<span id="imgtext">
                                <img src="images/add-img.png" alt=""/>
                               <%--<img src="" width="100" height="100"--%>
									<%--alt=""/>--%>
                            </span>
							<input id="fileupload" type="file" name="photo" onchange="imagesSelectedForHead(this.files)"
								   >
						</div>
					</div>
				</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="Admin_code" name="Admin_code" placeholder="请输入用户名"><span id="usernameInfo"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="Admin_password" name="Admin_password" placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="Admin_repassword" name="Admin_repassword"
								placeholder="请输入确认密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="inputEmail3" name="Admin_email"
								placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="Admin_name" name="Admin_name"
								placeholder="请输入姓名">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">手机</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="Admin_phone" name="Admin_phone"
								   placeholder="请输入手机">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label">座机</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="Admin_mobile" name="Admin_mobile"
								   placeholder="请输入座机">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label">微信号</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="Admin_weiXin" name="Admin_weiXin"
								   placeholder="请输入微信号">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">所属部门</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="Admin_job" name="Admin_job"
								   placeholder="请输入部门">
						</div>
					</div>



					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" width="100" value="注册"
								style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
						</div>
					</div>
			</div>

			<div class="col-md-2"></div>
</form>
		</div>
	</div>
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
	最美巢湖
</div>

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




