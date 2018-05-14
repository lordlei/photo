<%--
  Created by IntelliJ IDEA.
  User: pc26
  Date: 2018/3/18
  Time: 17:30
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
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/media.css">
    <link rel="stylesheet" href="css/style.css">

    <style>
        .table > thead > tr > th{
            border-bottom: 1px solid #ddd;
        }
        .wrap-filter {
            border-bottom: 1px solid #e4e4e4;
        }
        .wrap-time {
            padding: 0 12px;
        }
        .input-time {
            margin-left: 12px;
            border: 1px solid #2299ee;
        }
        .wrap-btns {
            padding: 10px 12px;
        }
        .wrap-btns .btn-group {
            padding: 0 12px;
        }
        .wrap-btns .btn-info {
            background-color: #2299ee;
        }
        .echart-pie {
            width: 300px;
            height: 300px;
        }
        .table-list {
            padding-left: 320px;
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
    <script src="js/echarts.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript">
        function dianji() {
            var flag = document.getElementById("inlineCheckbox").checked;
            var cks = document.getElementsByName("choose");
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
    </script>
</head>
<body>
<form id="form1" runat="server">
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
                <li class=" item ">
                    <a href="${pageContext.request.contextPath}/EventsAction_list">
                        <span>随手拍管理</span>
                    </a>
                </li>
                <li class=" item active">
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
    <div class="main">
        <div class="content">
            <div class="module background question-list">
                <div class="title">
                    <div class="title-text">报表管理</div>
                </div>
                <div class="panel-body wrap-filter">
                    <div class="clearfix">
                        <div class="pull-left wrap-time">
                            <div class="pull-left">开始时间</div>
                            <div class="pull-left">
                                <input class="input-time" type="text" value="2012-05-15 21:05" id="starttime" data-date-format="yyyy-mm-dd hh:ii">
                            </div>
                        </div>
                        <div class="pull-left wrap-time">
                            <div class="pull-left">结束时间</div>
                            <div class="pull-left">
                                <input class="input-time" type="text" value="2012-05-15 21:05" id="endtime" data-date-format="yyyy-mm-dd hh:ii">
                            </div>
                        </div>
                    </div>
                    <div class="clearfix wrap-btns">
                        <div class="button export pull-left">
                            <button type="button" class="btn btn-info">全部</button>
                        </div>
                        <div class="btn-group pull-left">
                            <button class="btn dropdown-toggle" data-toggle="dropdown">
                                责任局办
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">责任局办1</a></li>
                                <li><a href="#">责任局办2</a></li>
                                <li><a href="#">责任局办3</a></li>
                                <li><a href="#">责任局办4</a></li>
                            </ul>
                        </div>
                        <div class="button reply pull-right">
                            <input  class="btn btn-success" type="submit" value="搜索">
                        </div>
                    </div>
                </div>
                <div class="pull-left wrap-pie">
                    <!--统计图-->
                    <div class="echart-pie" id="echart"></div>
                </div>
                <div class="table-list">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>问题分类</th>
                            <th>收到问题</th>
                            <th>已解决</th>
                            <th>未逾期</th>
                            <th>逾期超10天</th>
                            <th>逾期超15天</th>
                            <th>逾期超30天</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>车辆违停</td>
                            <td>10</td>
                            <td>4</td>
                            <td>3</td>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>环境卫生</td>
                            <td>3</td>
                            <td>1</td>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>占道经营</td>
                            <td>6</td>
                            <td>2</td>
                            <td>2</td>
                            <td>6</td>
                            <td>1</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>设施毁坏</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                            <td>4</td>
                            <td>2</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>城市牛皮癣</td>
                            <td>11</td>
                            <td>7</td>
                            <td>7</td>
                            <td>2</td>
                            <td>1</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>大声喧哗</td>
                            <td>6</td>
                            <td>3</td>
                            <td>3</td>
                            <td>7</td>
                            <td>1</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>其他方面</td>
                            <td>14</td>
                            <td>6</td>
                            <td>4</td>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- <div class="pages">
                     <span>共14记录</span>
                     <span class="disabled">«上一页</span>
                     <span class="current">1</span>
                     <a href="ProblemList.aspx?page=2&tip=ProblemList">2</a>
                     <a href="ProblemList.aspx?page=2&tip=ProblemList">下一页»</a>
                 </div>-->
            </div>
        </div>
    </div>
    <script>
        $('.header .top .menu').on('click', function () {
            $('.header .nav').slideToggle();
        })
    </script>
</form>

<script>

    $('#starttime,#endtime').datetimepicker({
        language: 'zh-CN'
    });

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('echart'));

    // 指定图表的配置项和数据
    var option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data:['车辆违停','环境卫生','占道经营','设施损坏','城市牛皮癣','其他方面','总计']
        },
        series: [
            {
                name:'访问来源',
                type:'pie',
                radius: ['50%', '70%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data:[
                    {value:335, name:'车辆违停'},
                    {value:310, name:'环境卫生'},
                    {value:234, name:'占道经营'},
                    {value:135, name:'设施损坏'},
                    {value:135, name:'城市牛皮癣'},
                    {value:135, name:'其他方面'},
                    {value:1548, name:'总计'}
                ]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

</script>
</body>
</html>