<%--
  Created by IntelliJ IDEA.
  User: pc26
  Date: 2018/3/28
  Time: 20:40
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
    <link rel="stylesheet" href="http://cdn.bootcss.com/cropper/2.3.4/cropper.min.css"/>
    <style>
        /*.cropper-container{
            width: 100% !important;
        }*/
        /*cut*/
        .img-preview-sm {
            width: 100px;
            height: 102px;
        }

        /*.img-container, .img-preview {
            overflow: hidden;
            text-align: center;
        }*/
        /*.ibox-content {
            clear: both;
        }
        .ibox-content {
            padding: 15px 20px 20px 20px;
            border-color: #e7eace;
        }*/
    </style>
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
<body class="body-index">
<div id="index">
    <div class="container-fluid">
        <div class="row">
            <!-- 放大镜-->
            <div class="magnifier">
                <img class="border" src="img/magnifier.png" alt="">
                <img class="img" src="img/magnifier-img.png" alt="">
            </div>
        </div>
        <div class="row text-center footer">
            <div class="">
                <!-- 按钮 -->
                <div class="upload">
                    <!--<button type="button"  @click="uploadButton">上传不文明现象</button>-->
                    <button type="button" @click="toUpload">上传不安全行为</button>
                </div>
                <div class="instruction">
                    <div class="activity pull-left">
                        <a href="rule.jsp">活动说明</a>
                    </div>
                    <div class="question pull-left">
                        <a href="resolved.jsp">查看问题</a>
                    </div>
                </div>
            </div>
            <div class="">
                <!--访问量-->
                访问量：<span v-text="visit"></span>
            </div>
        </div>
        <!--<div class="cover-uploadImg cover">
            &lt;!&ndash; 问题弹出层&ndash;&gt;
            <div class="uploadImg cover-inner">
                <form>
                    <div class="form-title text-center">
                        <span>上传不文明现象</span>
                        <span class="close-cover" @click="closeCover">
                                <img src="img/close.png" alt="">
                            </span>
                    </div>
                    <div class="container-fluid">
                        <div class="form-group">
                            <label>标题：</label>
                            <input type="text" class="form-control" placeholder="请您用一句话概括（20字以内）" maxlength="20"
                                   v-model="problemTitle">
                        </div>
                        <div class="form-group">
                            <label>分类：</label>
                            <div class="selectCover" v-text="problemCategory.val" style="display: none;"></div>
                            <select class="form-control" v-model="problemCategory">
                                <option value="">&#45;&#45;请选择&#45;&#45;</option>
                                <option v-for="typelist in type" v-text="typelist.Name" :value="typelist"></option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>地址：</label>
                            <input type="text" class="form-control" v-model="address">
                        </div>
                        <div class="form-group">
                            <label>内容：</label>
                            <textarea class="form-control" rows="3" placeholder="请您用一句话描述不文明现象，谢谢您的反馈！（50字以内）" maxlength="50"
                                      v-model="content"></textarea>
                        </div>

                        <div class="form-group" style="position: relative;height: 130px;">
                            <label>上传照片：</label>
                            <p style="color: #b6b6b6;">图片大小 5M以内</p>
                            <div class="upload-click upload-click-first text-center">+</div>
                            <div class="upload-click upload-click-next text-center">+</div>
                            &lt;!&ndash;上传之后的图片预览&ndash;&gt;
                            &lt;!&ndash;<p class="showImgTitle"></p>&ndash;&gt;
                            <div class="uploadImgShow" style="position: absolute;top: 43px;left: 0;">

                            </div>
                        </div>

                        <div class="form-button upload">
                            <button type="button" class="btn btn-default" @click="submitProblem">提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>-->
        <!--

        &lt;!&ndash;截取图片弹窗&ndash;&gt;
        <div class="cover-cut cover">
            <div class="cover-inner">
                <div class="clearfix" style="margin-top: 50px;padding: 10px;">
                    <div class="form-group">
                        <div style="font-size: 15px;">上传照片：</div>
                        <p style="color: #b6b6b6;">图片大小 5M以内（最多上传两张照片）</p>
                        <p style="color: #b6b6b6;font-weight:bold;">建议横向拍摄</p>
                        <div class="image-crop" style="width:100%;height: 200px;">
                            <img src="img/default.jpg" alt="">
                        </div>
                        <p>裁剪效果</p>
                        <div class="clearfix" style="position: relative;">
                            <div class="pull-left img-preview img-preview-sm"></div>
                            <div class="btn-group" id="chooseImg" style="position: absolute;bottom: 0;left: 120px;">
                                <label title="Upload image file" for="inputImage" class="btn btn-primary fsz-12"
                                       style="padding: 4px 6px;font-size: 12px;">
                                    <input type="file" accept="image/*" name="file" class="hide">
                                    <input type="file" accept="image/*" name="file" id="inputImage" class="hide">
                                    选择图片
                                </label>
                                <label title="Donload image" id="download" class="btn btn-primary fsz-12"
                                       style="padding: 4px 6px;font-size: 12px;">确认上传</label>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        &lt;!&ndash;删除图片&ndash;&gt;
        <div class="cover-delete cover">
            <div class="cover-inner">
                <div class="cover-delete-text text-center">是否确认删除此图片？</div>
                <div class="cover-delete-button">
                    <button type="button" class="delete-button pull-left">确定</button>
                    <button type="button" class="cancel-button pull-right">取消</button>
                </div>
            </div>
        </div>


        <div class="submitSuccess cover">
            <div class="cover-inner">
                &lt;!&ndash; 信息弹出层&ndash;&gt;
                <form>
                    <div class="form-title text-center">
                        <span>提交成功！请填写联系方式</span>
                        <span class="close-cover" @click="closeCover">
                                <img src="img/close.png" alt="">
                            </span>
                    </div>
                    <div class="container-fluid">
                        <div class="form-group">
                            <label>姓名：</label>
                            <input type="text" class="form-control" v-model="userName">
                        </div>
                        <div class="form-group">
                            <label>手机号：</label>
                            <input type="text" class="form-control" v-model="phoneNumber">
                        </div>
                        <div class="form-button upload">
                            <button type="button" class="btn btn-default" @click="submitInformation">确定</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>-->
        <!--<div class="share">
            &lt;!&ndash;分享&ndash;&gt;
            <img src="img/share.png" alt="">
        </div>-->
    </div>
</div>

<script src="js/jquery/jquery.js"></script>
<script src="js/jquery/jquery.ui.widget.js"></script>
<script src="js/jquery/jquery.iframe-transport.js"></script>
<script src="js/jquery/jquery.fileupload.js"></script>
<script src="http://cdn.bootcss.com/cropper/2.3.4/cropper.min.js"></script>
<script src="js/uploadImg/Blob.js"></script>
<script src="js/uploadImg/canvas-toBlob.js"></script>
<script src="js/uploadImg/webuploader.min.js"></script>
<script src="js/vue/vue.js"></script>
<script src="js/config.js"></script>
<script src="js/common.js"></script>

<script>
    /*function reload() {
        window.location.href = window.location.href;
    }*/

    var user = JSON.parse(localStorage.getItem("user"));
    var phone = JSON.parse(localStorage.getItem("phone"));
    var imgUrl = [];
    new Vue({
        el: '#index',
        data: {
            visit: '',
            type: [],
            problemCategory: '',
            problemTitle: '',
            address: '',
            content: '',
            userName: '',
            phoneNumber: '',
            imagesUrl: ''
        },
        created: function () {
            this.getVisit();
            /*this.getCategory();*/
            /*setTimeout(function () {

                $(".upload-click").click(function () {
                    $(".cover-cut").css("display", "block");
                });

                //裁剪图片
                var $image = $(".image-crop > img");
                $image.cropper({
                    viewMode: 1,
                    preview: '.img-preview', //不同尺寸预览区
                    aspectRatio: 1.3333, //裁剪比例，NaN-自由选择区域
                    autoCropArea: 0.7, //初始裁剪区域占图片比例
                    crop: function (data) { //裁剪操作回调
                    }
                });

                var $inputImage = $("#inputImage");
                if (window.FileReader) {
                    $inputImage.change(function () {
                        var file = this.files[0];
                        fileName = file.name;
                        var reader = new FileReader();
                        //reader回调，重新初始裁剪区
                        reader.onload = function () {
                            // 通过 reader.result 来访问生成的 DataURL
                            var url = reader.result;
                            //选择图片后重新初始裁剪区
                            $image.cropper('reset', true).cropper('replace', url);
                        };
                        reader.readAsDataURL(file);
                    });
                } else {
                    $inputImage.addClass("hide");
                }

                $('#download').click(function (e) {
                    $(this).attr("disabled", "disabled");
                    if ($(".image-crop img").attr("src") == "") {
                        alert("请选择要上传图片！");
                        $(this).attr("disabled", "true");
                        return;
                    }

                    var canVas = $image.cropper("getCroppedCanvas", {});

                    var type = $image.attr('src').split(';')[0].split(':')[1];
                    canVas.toBlob(function (blob) {
                        var formData = new FormData();
                        formData.append("file", blob, fileName);

                        $.ajax({
                            type: "POST",
                            url: config.root_url + '/api/problem/upload/all',
                            data: formData,
                            contentType: false, //必须
                            processData: false, //必须
                            dataType: "json",
                            success: function (retJson) {
                                //上传成功
                                if (retJson.Success) {
                                    $(this).attr("disabled", "true");
                                    alert("图片上传成功！");

                                    $(".cover-cut").css("display", "none");

                                    imgUrl.push(retJson.Data);
                                    /!*$(".showImgTitle").html("预览图");*!/


                                    if (imgUrl.length == 1) {
                                        $(".upload-click-next").css("display", "block");
                                    }


                                    $(".uploadImgShow").append('<img src="'+ config.root_url +'/upload'+ retJson.Data +'" data-id="'+retJson.Data+'">');

                                    if(imgUrl.length >= 2)
                                    {
                                        alert("友情提示：您已上传两张照片！");
                                        /!*$("#chooseImg").css("display","none");*!/
                                        $(".upload-click").css("display","none");
                                    }
                                }else {
                                    alert("图片过大，请重新选择图片上传！");
                                    $(this).attr("disabled","true");
                                }
                            },
                            error : function() {

                            }
                        });
                    }, type);

                });



                var currentImg = '';
                $(".uploadImgShow").on('click','img',function () {
                    currentImg = $(this).attr("data-id");
                    $(".cover-delete").css("display","block");
                });

                $(".delete-button").click(function () {
                    $(".cover-delete").css("display","none");
                    var currentIndex =0;
                    $.each(imgUrl,function (index, item) {
                        if(item == currentImg)
                        {
                            currentIndex = index;
                        }
                    });
                    imgUrl.splice(currentIndex,1);
                    $(".uploadImgShow img").eq(currentIndex).remove();
                    if(imgUrl.length == 0)
                    {
                        $(".upload-click-first").css("display","block");
                        $(".upload-click-next").css("display","none");
                    }
                    if(imgUrl.length == 1)
                    {
                        $(".upload-click-next").css("display","block");
                        $(".upload-click-first").css("display","block");
                    }
                });

                $(".cancel-button").click(function () {
                    $(".cover-delete").css("display","none");
                });
            },1000);*/
        },
        methods: {
            toUpload: function () {
                window.location.assign('upload.jsp');
            },
            //获取访问量
            getVisit: function () {
                var that = this;
                $.ajax({
                    type: 'post',
                    data: JSON.stringify({
                        id: "E1235CA4-B0CC-4B99-B301-813002A3B0F9"
                    }),
                    contentType: "application/json",
                    url: config.root_url + "/api/com/ps/add",
                    dataType: 'json',
                    success: function (data) {
                        if (data.Success) {
                            that.visit = data.Data;
                        }
                    }
                });
            },
            /*//上传不文明现象分类
            getCategory: function () {
                var that = this;
                $.ajax({
                    type: 'get',
                    data: {},
                    contentType: "application/json",
                    url: config.root_url + "/api/problem/type/list",
                    dataType: 'json',
                    success: function (data) {
                        if (data.Success) {
                            that.type = data.Data;
                        }
                    }
                })
            },
            //上传不文明现象
            uploadButton: function () {
                $(".cover-uploadImg").css("display", "block");
            },
            //关闭弹窗
            closeCover: function () {
                $(".cover").css("display", "none");
                reload();
            },
            //提交
            submitProblem: function () {
                var that = this;
                if (!that.problemTitle || !that.problemCategory || !that.address || !that.content || !imgUrl) {
                    alert("请将内容填写完整！");
                }
                else {
                    if (!user || !phone) {
                        $(".cover-uploadImg").css("display", "none");
                        $(".submitSuccess").css("display", "block");
                    }
                    else {
                        that.submitAll();
                    }
                }
            },
            //确认提交全部信息
            submitInformation: function () {
                var that = this;
                if (!that.userName || !that.phoneNumber) {
                    alert("请将用户信息填写完整！");
                }
                else {
                    var testPhone = /0?(13|14|15|18)[0-9]{9}/;
                    if (testPhone.test(that.phoneNumber)) {
                        window.localStorage.setItem('user', JSON.stringify(that.userName));
                        window.localStorage.setItem('phone', JSON.stringify(that.phoneNumber));
                        that.submitAll();
                    }
                    else {
                        alert("请上传正确的手机号！");
                    }
                }
            },
            //提交接口
            submitAll: function () {
                var that = this;
                if (imgUrl.length == 1) {
                    that.imagesUrl = imgUrl[0];
                }
                if (imgUrl.length == 2) {
                    that.imagesUrl = imgUrl[0] + "," + imgUrl[1];
                }
                $.ajax({
                    type: 'post',
                    data: JSON.stringify({
                        Id: "string",
                        ProblemName: that.problemTitle,
                        ProblemDescribr: that.content,
                        AddTime: "2017-05-04T00:56:54.597Z",
                        UpdateTime: "2017-05-04T00:56:54.597Z",
                        Location: that.address,
                        Status: 0,
                        Dealed: true,
                        Name: user || that.userName,
                        Mobile: phone || that.phoneNumber,
                        Email: "string",
                        RoleID: "string",
                        ReplyContent: "string",
                        Visible: true,
                        PicUrls: that.imagesUrl,
                        Type: that.problemCategory.Code,
                        Urgent: true,
                        CIID: "string",
                        MCStatus: 0,
                        IsPrize: true,
                        Week: 0,
                        PrizeID: "string",
                        Source: "string"
                    }),
                    contentType: "application/json",
                    url: config.root_url + "/api/problem/add",
                    dataType: 'json',
                    success: function (data) {
                        if (data.Success) {
                            alert("提交成功！");
                            $(".share").css("display", "block");
                            $(".share").click(function () {
                                $(".share").css("display", "none");
                                reload();
                            });
                        }
                    }
                });
            }*/
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