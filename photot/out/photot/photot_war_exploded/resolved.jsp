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
    <link rel="stylesheet" href="css/swiper.css">
    <link rel="stylesheet" href="css/waitMe.min.css">
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
<body class="body-resolved">
<div class="container-fluid myContent">
    <div class="row">
        <!-- 分类-->
        <div class="category">
            <div class="container-fluid">
                <div class="swiper-container tabList">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide text-center" v-for="(item, index) in tabList"
                             @click="tabClick(index,item)"
                             v-bind="{id: item.Id, 'code': item.Code, 'class': tabIndex==index?'current':''}"
                             v-text="item.Name"></div>
                    </div>
                </div>
                <!--<span class="pullRight"> > </span>-->
            </div>
        </div>
    </div>
    <div class="row">
        <!-- 切换 -->
        <div class="tabs">
            <ul>
                <li class="text-center on">
                    <a>
                        已解决
                    </a>
                </li>
                <li class="text-center">
                    <a @click="toHanding()">
                        处理中
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row">
        <!--详情-->
        <div class="detail clearfix">
            <div class="col-xs-12">
                <div class="row panel-body detail-img-wrap">
                    <div class="detail-img">
                        <div class="img-compare">
                            <ul class="list-unstyled">
                                <li class="clearfix" v-for="item in detailImgList">
                                    <div class="compareImg compareImg-before pull-left">
                                        <img v-if="/[a-zA-z]+:\/\/[^\s]+/.test(item._before.PicUrl)" :src="item._before.PicUrl" style="height: 98px;" alt=""
                                             @load="completeLoad">
                                        <img v-else :src="rootUrl+'/thumbupload'+ item._before.PicUrl" alt=""
                                             @load="completeLoad">
                                    </div>
                                    <div class="vs pull-left text-center">
                                        <!--<img src="img/vs.png" alt="" width="100%">-->
                                    </div>
                                    <div class="compareImg compareImg-after pull-left">
                                        <img v-if="item._after" :class="{ fixedHeight: /[a-zA-z]+:\/\/[^\s]+/.test(item._after.PicUrl)}" :src="/[a-zA-z]+:\/\/[^\s]+/.test(item._after.PicUrl)?(item._after.PicUrl):(rootUrl + item._after.PicUrl)" alt="">
                                        <img v-else src="img/default-resolved.jpg" alt="">
                                    </div>
                                    <!--<span class="compareImg pull-left" v-else>
                                        <img src="img/test/1.jpg" alt="">
                                    </span>-->
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="detail-content">
                    <div class="detail-title" v-text="detail.ProblemName"></div>
                    <div class="release-information">
                        <span v-text="'发布时间：'+(detail.AddTime?detail.AddTime.substr(0,10):'')"></span>
                        <!--<span v-text="'发布人：'+detail.Name"></span>-->
                    </div>
                    <div class="detail-description" v-text="detail.ProblemDescribr"></div>
                </div>
                <div class="reply">
                    <div class="reply-title">回复</div>
                    <div class="reply-content" v-text="detail.ReplyContent"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <!-- 列表 -->
        <div class="list">
            <div class="swiper-container gallery-thumbs">
                <div class="swiper-wrapper">
                    <!--<div class="swiper-slide" v-for="item in problemList" :style="{ backgroundImage:'url(/upload'+ item.PicUrl +')' }"></div>-->
                    <div class="swiper-slide" v-for="item in problemList">
                        <div class="swiper-slider-img">
                            <img v-if="/[a-zA-z]+:\/\/[^\s]+/.test(item.PicUrl)" :src="item.PicUrl" alt="">
                            <img v-else :src="rootUrl+'/thumbupload'+ item.PicUrl" alt="">
                        </div>
                        <div class="swiper-slider-content text-center" v-text="item.ProblemName">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="fixed">
            <a href="upload.html">
				<span class="pull-left upload-img">
					<img class="pull-left" src="img/uoload.png" alt="">
				</span>
                <span class="pull-left text-center">点我上传</span>
                <span class="pull-left text-center">不安全行为</span>
            </a>
        </div>
    </div>
</div>
<script src="js/jquery/jquery.min.js"></script>
<script src="js/jquery/readmore.js"></script>
<script src="js/vue/vue.js"></script>
<script src="js/swiper/swiper.js"></script>
<script src="js/waitMe/waitMe.min.js"></script>
<script src="js/config.js"></script>
<script src="js/common.js"></script>
<script>
    $(function () {

        $('body').waitMe();
        var length = 0;
//		var galleryThumbs;
        //加载下一页
        function loadMore(data) {
            var _tempStr = "";
            var imgList = data;
            for (var i = 0; i < imgList.length; i++) {
                var urlTest = /[a-zA-z]+:\/\/[^\s]+/;
                if(urlTest.test(imgList[i].PicUrl))
                {
                    _tempStr += '<div class="swiper-slide">'
                        + '<div class="swiper-slider-img">'
                        + '<img src="' + imgList[i].PicUrl + '" alt="">'
                        + '</div>'
                        + '<div class="swiper-slider-content text-center">'
                        + imgList[i].ProblemName + '</div>'
                        + '</div>';
                }
                else
                {
                    _tempStr += '<div class="swiper-slide">'
                        + '<div class="swiper-slider-img">'
                        + '<img src="' + config.root_url + '/thumbupload' + imgList[i].PicUrl + '" alt="">'
                        + '</div>'
                        + '<div class="swiper-slider-content text-center">'
                        + imgList[i].ProblemName + '</div>'
                        + '</div>';
                }
            }
            return _tempStr;
        }

        new Vue({
            el: '.myContent',
            data: {
                tabList: [],
                tabIndex: getQueryString("tabIndex") ? getQueryString("tabIndex") : 0,
                status: '4', //状态： 4-已解决
                problemList: [], //问题列表
                pageSize: 4,
                pageIndex: 1, //当前页
                totalCount: 10000,
                rootUrl: config.root_url,
                flag: false,
                allList: [],
                detail: {},
                detailImgList: [],
                galleryThumbs: {},
                imgUrl:''
            },
            methods: {
                //获取啄木鸟随手拍问题类别列表
                getTypeList: function (callback) {
                    var self = this;
                    $.ajax({
                        type: 'get',
                        data: {},
                        contentType: "application/json",
                        url: config.root_url + "/api/problem/type/list",
                        dataType: 'json',
                        success: function (data) {
                            if (data.Success) {
                                self.tabList = data.Data;
                                self.tabList.unshift({Name: '全部', Code: '-1'});
                                if (callback) {
                                    callback();
                                }
                            } else {
                                console.info("获取类别列表失败");
                            }
                        }
                    })
                },
                //列表切换事件
                tabClick: function (index, item) {
                    window.location.href = "resolved.html?tabIndex=" + index;
                },
                //获取问题列表
                getProblemList: function (type, callback) {
                    var self = this;
                    if (length < self.totalCount) {
                        $.ajax({
                            type: 'get',
                            data: {},
                            contentType: "application/json",
                            url: config.root_url + "/api/problem/list/pic/" + self.status + "/" + self.pageSize + "/" + self.pageIndex + "/" + type,
                            dataType: 'json',
                            success: function (data) {
                                if (data.Success) {
                                    self.flag = true;
                                    self.pageIndex++;
                                    if (self.problemList.length == 0) {
                                        self.problemList = self.problemList.concat(data.Data.list);
                                    }
                                    self.allList = self.allList.concat(data.Data.list);
                                    self.totalCount = data.Data.totalCount;
                                    length = length + data.Data.list.length;
                                    if (callback) {
                                        callback(data.Data.list);
                                    }
                                } else {
                                    console.info("获取问题列表失败");
                                }
                            }
                        })
                    }
                },
                //获取问题详情
                getDetail: function (swiper) {
                    var self = this;
                    $('.detail').waitMe();
                    var id = self.allList[swiper.activeIndex].ID;
                    /*if (swiper) {
                        id = self.allList[swiper.activeIndex].ID;
                    } else {
                        id = self.problemList[0].ID
                    }*/
                    $.ajax({
                        type: 'get',
                        data: {},
                        contentType: "application/json",
                        url: config.root_url + "/api/problem/details/" + id,
                        dataType: 'json',
                        success: function (data) {
                            if (data.Success) {
                                //self.detail = data;
                                console.info(data.Data.txt[0])
                                self.detail = data.Data.txt[0];
                                var _beforeImgList = [];
                                var _afterImgList = [];
                                self.detailImgList = [];
                                for (var i = 0; i < data.Data.pic.ds.length; i++) {
                                    var temp = data.Data.pic.ds[i];
                                    //未解决
                                    if (temp.Type == 0) {
                                        _beforeImgList.push(temp)
                                    } else if (temp.Type == 1) {
                                        //已解决
                                        _afterImgList.push(temp)
                                    }
                                }
                                for (var i = 0; i < _beforeImgList.length; i++) {
                                    var _obj = {
                                        _before: _beforeImgList[i],
                                        _after: _afterImgList[i]
                                    };
                                    self.detailImgList.push(_obj);
                                }
                                //self.detailImgList = data.Data.pic.ds;
                                if (swiper) {
                                    //解锁 swiper
                                    swiper.unlockSwipes();
                                }
                                self.completeLoad();
                                $('.detail').off('click').on('click', 'img', function(){
                                    var urlsArr = [];
                                    $('.detail .compareImg img').each(function (i, e) {
                                        var src = $(this).attr('src');
                                        urlsArr.push($(this).attr('src'));
                                    });
                                    wx.previewImage({
                                        current: $(this).attr('src'), // 当前显示图片的http链接
                                        urls: urlsArr // 需要预览的图片http链接列表
                                    });
                                })
                            } else {
                                console.info("获取问题详情失败");
                            }
                            setTimeout(function () {
                                $('.detail').waitMe('hide');
                            }, 500)
                        }
                    })
                },
                //跳转到处理中页面
                toHanding: function () {
                    var self = this;
                    window.location.href = "handing.html?tabIndex=" + self.tabIndex;
                },
                //图片加载完成
                completeLoad: function () {
                    var h = $(".compareImg-before").height();
                    $(".compareImg-after").css("height", h);
                    $(".compareImg-after img").css("height", "100%");
                    $('.body-resolved .detail-img').readmore({
                        speed: 75,
                        maxHeight: h
                    });
                }
            },
            //初始化
            created: function () {
                var self = this;
                self.getTypeList(function () {
                    self.$nextTick(function () {
                        //tab初始化
                        new Swiper('.tabList', {
                            pagination: '.swiper-pagination',
                            slidesPerView: 'auto',
                            paginationClickable: true,
                            spaceBetween: 20
                        });
                    });
                    self.getProblemList(self.tabList[self.tabIndex].Code, function () {
                        self.$nextTick(function () {
                            self.galleryThumbs = new Swiper('.gallery-thumbs', {
                                pagination: '.swiper-pagination',
                                slidesPerView: 'auto',
                                centeredSlides: true,
                                slideToClickedSlide:true,
                                paginationClickable: true,
                                spaceBetween: 10,
                                onTransitionEnd: function (swiper, event) {
                                    //锁住swiper
                                    swiper.lockSwipes();
                                    if (swiper.activeIndex + self.pageSize > length) {
                                        //console.info(swiper.activeIndex);
                                        console.info("updated");
                                        self.getProblemList(self.tabList[self.tabIndex].Code, function (data) {
                                            swiper.appendSlide(loadMore(data));
                                        });
                                    }
                                    console.info("lock");
                                    self.getDetail(swiper);
                                }
                            });
                            $('body').waitMe('hide');
                        })
                    });
                });
            }
        })

    });

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