<%--
  Created by IntelliJ IDEA.
  User: pc26
  Date: 2018/3/28
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>安全随手拍</title>
    <link rel="stylesheet" href="css/main.css">
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?3a0ddd1aa0693ccd7daa46f8d6940610";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
</head>
<body class="body-rule">
<div id="rule">
    <div class="container-fluid">
        <div class="row">
            <div class="header">
                <img src="img/rule-header.jpg" alt="">
            </div>
        </div>
        <div class="upload">
            <button class="pull-left" type="button" @click="Link">上传不安全行为</button>
            <button class="pull-right" type="button">活动说明</button>
        </div>

        <div class="description">
            <div class="description-title">活动说明</div>
            <div class="description-content">
                <p>参与方式：</p>
                <p>1、微信参与：在“邳州安监”微信公众平台中点击自定义菜单参与</p>
                <!--<p>2、微博参与：发微博同时关注并@文明阵地和@苏州工业园区发布参与（以上方式二选一）</p>-->
                <p>信息要求：</p>
                <p>在邳州市范围内发现的不安全行为。要求：</p>
                <p>1、清晰客观反映问题的照片（最多两张）</p>
                <p>2、拍摄时间、地点</p>
                <p>3、反映人的有效联系方式</p>
                <!--<p>活动奖励：</p>-->
                <!--<p>随机抽取2名，次日在管委会网站及政务微博、微信中公布名单。奖品：纪念品1份。领奖地址：苏州文化艺术中心（地址：园区观枫街1号）。</p>-->
            </div>
        </div>

    </div>
</div>

<script src="js/jquery/jquery.js"></script>
<script src="js/vue/vue.js"></script>
<script src="js/config.js"></script>
<script src="js/common.js"></script>
<script>
    var vm = new Vue({
        el: '#rule',
        data: {},
        created: function(){},
        methods: {
            Link: function () {
                window.location.href = 'index.html';
            }
        }
    })
</script>
<script>
    //设置微信转发参数
    window.shareData={
        imgUrl:'http://demo22.fyxmt.com/handpicker/img/share.jpg?t='+new Date().getTime(),
        tLink: 'http://demo22.fyxmt.com/handpicker/index.html',
        tTitle:'安监随手拍 ',
        tContent:'邳州安监'
    };
</script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script src="js/weixin.config.js"></script>
</body>
</html>