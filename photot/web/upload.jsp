<%--
  Created by IntelliJ IDEA.
  User: pc26
  Date: 2018/3/28
  Time: 20:03
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
    <link rel="stylesheet" href="css/waitMe.min.css">
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
<body class="body-upload">
<div id="upload">
    <div class="container-fluid">
        <div class="row header text-center">
            上传不安全行为
        </div>
        <div class="row">
            <form class="panel-body" action="resolved.jsp">
                <div class="form-group">
                    <label>标题：</label>
                    <input type="text" class="form-control" placeholder="请您用一句话概括（20字以内）" v-model="problemTitle">
                </div>
                <div class="form-group">
                    <label>分类：</label>
                    <div class="selectCover" v-text="problemCategory.val" style="display: none;"></div>
                    <select class="form-control" v-model="problemCategory">
                        <option value="">--请选择--</option>
                        <option v-for="typelist in type" v-text="typelist.Name" :value="typelist"></option>
                    </select>
                </div>
                <div class="form-group">
                    <label>地址：</label>
                    <input type="text" class="form-control" v-model="address">
                </div>
                <div class="form-group">
                    <label>内容：</label>
                    <textarea class="form-control" rows="3" placeholder="请您用一句话描述不安全行为，谢谢您的反馈！（50字以内）" v-model="content"></textarea>
                </div>

                <div class="form-group" style="position: relative;height: 130px;">
                    <label>上传照片：</label>
                    <p style="color: #b6b6b6;">图片大小 5M以内</p>
                    <!--<div class="upload-click upload-click-next text-center" @click="showUploadModal">+</div>-->
                    <!--上传之后的图片预览-->
                    <!--<p class="showImgTitle"></p>-->
                    <div class="pull-left uploadImgShow" v-for="(item, index) in cropperImgList" @click="showRemoveCropperImgModal(item, index)">
                        <img :src="'http://demo15.fyxmt.com/upload'+item" :data-id="item" alt="">
                        <!-- test -->
                        <!--<img :src="'http://pubop.sipac.gov.cn/prckerapi/upload'+item" :data-id="item" alt="">-->
                    </div>
                    <div class="upload-click upload-click-first text-center" v-if="cropperImgList.length<2" @click="showUploadModal">+</div>
                </div>

                <div class="form-button">
                    <button type="button" class="btn btn-warning col-xs-12" @click="submitProblem">提交</button>
                </div>
            </form>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="uploadModalLabel">上传照片</h4>
                    </div>
                    <div class="modal-body">
                        <div class="cover-cut ">
                            <div class="cover-inner">
                                <div class="clearfix">
                                    <div class="form-group">
                                        <div style="font-size: 15px;">上传照片：</div>
                                        <p style="color: #b6b6b6;">图片大小 5M以内（最多上传两张照片）</p>
                                        <p style="font-size: 15px;color: #b6b6b6;font-weight:bold;">建议横向拍摄，裁剪可自由缩放照片。</p>
                                        <div class="image-crop" style="width:100%;height: 200px;">
                                            <img src="img/default.jpg" alt="">
                                        </div>
                                        <p>裁剪效果</p>
                                        <div class="clearfix" style="position: relative;">
                                            <div class="pull-left img-preview img-preview-sm"></div>
                                            <div class="btn-group" id="chooseImg" style="position: absolute;bottom: 0;left: 120px;">
                                                <label title="Upload image file" for="inputImage" class="btn btn-warning fsz-12"
                                                       style="padding: 4px 6px;font-size: 12px;">
                                                    <input type="file" accept="image/*" name="file" class="hide">
                                                    <input type="file" accept="image/*" name="file" id="inputImage" class="hide">
                                                    选择图片
                                                </label>
                                                <label title="Donload image" id="download" class="btn btn-warning fsz-12"
                                                       @click="uploadCropper"
                                                       style="padding: 4px 6px;font-size: 12px;">确认上传</label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--<div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>-->
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="removeCropperImgModal" tabindex="-1" role="dialog" aria-labelledby="removeCropperImgModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="removeCropperImgModalLabel">提醒</h4>
                    </div>
                    <div class="modal-body">
                        是否确认删除此图片？
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-warning" @click="removeCropperImg">删除</button>
                    </div>
                </div>
            </div>
        </div>
        <!--删除图片-->
        <!--<div class="cover-delete cover">
            <div class="cover-inner">
                <div class="cover-delete-text text-center">是否确认删除此图片？</div>
                <div class="cover-delete-button">
                    <button type="button" class="delete-button pull-left">确定</button>
                    <button type="button" class="cancel-button pull-right">取消</button>
                </div>
            </div>
        </div>-->

        <!-- Modal -->
        <div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="infoModalLabel">提交成功！请填写联系方式</h4>
                    </div>
                    <div class="modal-body">
                        <div class="submitSuccess ">
                            <div class="cover-inner">
                                <!-- 信息弹出层-->
                                <form>
                                    <!--<div class="form-title text-center">
                                        <span>提交成功！请填写联系方式</span>
                                        <span class="close-cover" @click="closeCover">
                                <img src="img/close.png" alt="">
                            </span>
                                    </div>-->
                                    <div class="container-fluid">
                                        <div class="form-group">
                                            <label>姓名：</label>
                                            <input type="text" class="form-control" v-model="userName">
                                        </div>
                                        <div class="form-group">
                                            <label>手机号：</label>
                                            <input type="text" class="form-control" v-model="phoneNumber">
                                        </div>
                                        <div class="form-button ">
                                            <button type="button" class="btn btn-warning col-xs-12" @click="submitInformation">确定</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="share">
            <!--分享-->
            <img src="img/share.png" alt="">
        </div>
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
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/waitMe/waitMe.min.js"></script>
<script src="js/vue/vue.js"></script>
<script src="js/config.js"></script>
<script src="js/common.js"></script>

<script>
    function reload() {
//		window.location.href = window.location.href + "?id=" + 10000 * Math.random();
        window.location.href = "index.html?id=" + 10000 * Math.random();
    }

    var user = JSON.parse(localStorage.getItem("user"));
    var phone = JSON.parse(localStorage.getItem("phone"));
    var imgUrl = [];
    new Vue({
        el: '#upload',
        data: {
            visit: '',
            type: [],
            problemCategory: '',
            problemTitle: '',
            address: '',
            content: '',
            userName: '',
            phoneNumber: '',
            imagesUrl: '',
            cropperImgList: [],
            cropperImage: null,
            currentCropper: {
                item: {},
                index: 0
            }
        },
        created: function () {
            var that = this;
            this.getVisit();
            this.getCategory();
            this.$nextTick(function () {
                that.initCropper();
            });
        },
        methods: {
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
            //上传不文明现象分类
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
            //显示图片上传
            showUploadModal: function () {
                $('#uploadModal').modal('show');
            },
            initCropper: function () {
                var that = this;
                this.cropperImage = $(".image-crop > img");
                this.cropperImage.cropper({
                    viewMode: 1,
                    preview: '.img-preview', //不同尺寸预览区
                    aspectRatio: 1.3333, //裁剪比例，NaN-自由选择区域
                    autoCropArea: 1, //初始裁剪区域占图片比例
                    crop: function (data) { //裁剪操作回调
                    }
                });

//				var $inputImage = $("#inputImage");
                if (window.FileReader) {
                    $("#inputImage").change(function () {
                        var file = this.files[0];
                        fileName = file.name;
                        var reader = new FileReader();
                        //reader回调，重新初始裁剪区
                        reader.onload = function () {
                            // 通过 reader.result 来访问生成的 DataURL
                            var url = reader.result;
                            //选择图片后重新初始裁剪区
                            that.cropperImage.cropper('reset', true).cropper('replace', url);
                        };
                        reader.readAsDataURL(file);
                    });
                } else {
                    $("#inputImage").addClass("hide");
                }
            },
            uploadCropper: function () {
                var that = this;
                if ($(".image-crop img").attr("src") == "") {
                    alert("请选择要上传图片！");
                    return;
                }

                $('#uploadModal .modal-body').waitMe();
                var canVas = that.cropperImage.cropper("getCroppedCanvas", {});

                var type = that.cropperImage.attr('src').split(';')[0].split(':')[1];
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
                            $('#uploadModal .modal-body').waitMe('hide');
                            //上传成功
                            if (retJson.Success) {
                                alert("图片上传成功！");

                                $('#uploadModal').modal('hide');
                                that.resetCropper();

                                //imgUrl.push(retJson.Data);
                                that.cropperImgList.push(retJson.Data);
                                /*$(".showImgTitle").html("预览图");*/


                                /*if (that.cropperImgList.length == 1) {
                                    $(".upload-click-next").css("display", "block");
                                }*/


//								$(".uploadImgShow").append('<img src="' + config.root_url + '/upload' + retJson.Data + '" data-id="' + retJson.Data + '">');

                                /*$(".uploadImgShow").on('click', 'img', function () {
                                    var currentImg = $(this).attr("data-id");
                                    $(".cover-delete").css("display", "block");
                                    $(".delete-button").click(function () {
                                        $(".cover-delete").css("display", "none");
                                        $.each(that.cropperImgList, function (index, item) {
                                            if (item == currentImg) {
                                                that.cropperImgList.splice(index, 1);
                                                $(".uploadImgShow img").eq(index).remove();
                                            }
                                            if (that.cropperImgList.length == 0) {
                                                $(".upload-click-first").css("display", "block");
                                                $(".upload-click-next").css("display", "none");
                                            }
                                            if (that.cropperImgList.length == 1) {
                                                $(".upload-click-next").css("display", "block");
                                                $(".upload-click-first").css("display", "block");
                                            }
                                        });
                                    });

                                    $(".cancel-button").click(function () {
                                        $(".cover-delete").css("display", "none");
                                    });

                                });*/

                                if (that.cropperImgList.length >= 2) {
                                    alert("友情提示：您已上传两张照片！");
                                    /*$("#chooseImg").css("display","none");*/
                                    $(".upload-click").css("display", "none");
                                }
                            } else {
                                alert("图片过大，请重新选择图片上传！");
                            }
                        },
                        error: function () {

                        }
                    });
                }, type);
            },
            resetCropper: function () {
                this.cropperImage.cropper('reset', true).cropper('replace', 'http://pub.sipac.gov.cn/handpicker/img/default.jpg');
            },
            showRemoveCropperImgModal: function (item, index) {
                this.currentCropper = {
                    item: item,
                    index: index
                };
                $('#removeCropperImgModal').modal('show');
            },
            removeCropperImg: function () {
                this.cropperImgList.splice(this.currentCropper.index, 1);
                $('#removeCropperImgModal').modal('hide');
            },
            /*//关闭弹窗
            closeCover: function () {
                $(".cover").css("display", "none");
                reload();
            },*/
            //提交
            submitProblem: function () {
                var that = this;
                if (!that.problemTitle || !that.problemCategory || !that.address || !that.content || that.cropperImgList.length==0) {
                    alert("请将内容填写完整！");
                }
                else {
//					$('#infoModal').modal('show');
                    if(that.problemTitle.length>20)
                    {
                        alert("标题不得超过20字！");
                    }
                    else
                    {
                        if(that.content.length>50)
                        {
                            alert("内容不得超过50字！");
                        }
                        else
                        {
                            if (!user || !phone) {
//						$(".cover-uploadImg").css("display", "none");
                                $('#infoModal').modal('show');
//						$(".submitSuccess").css("display", "block");
                            }
                            else {
                                that.submitAll();
                            }
                        }
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
                if (that.cropperImgList.length == 1) {
                    that.imagesUrl = that.cropperImgList[0];
                }
                if (that.cropperImgList.length == 2) {
                    that.imagesUrl = that.cropperImgList[0] + "," + that.cropperImgList[1];
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
                            $('#infoModal').modal('hide');
                            $(".share").css("display", "block");
                            $(".share").off('click').click(function () {
                                $(".share").css("display", "none");
                                window.location.assign('index.html');
                                //reload();
                            });
                        }
                    }
                });
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