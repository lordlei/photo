<%--
  Created by IntelliJ IDEA.
  User: pc26
  Date: 2018/5/6
  Time: 19:03
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
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body class="body-upload">
<div id="upload">
    <div class="container-fluid">
        <div class="row header text-center">
            上传不安全行为
        </div>
        <div class="row">
            <form class="panel-body" method="post" action="EventsAction_delete">
                <div class="form-group">
                    <label>标题：</label>
                    <input name="event_detail" type="text" class="form-control" placeholder="请您用一句话概括（20字以内）" v-model="problemTitle">
                </div>
                <div class="form-group">
                    <label>分类：</label>
                    <div class="selectCover" v-text="problemCategory.val" style="display: none;"></div>
                    <select name="event_category.category_id" class="form-control" v-model="problemCategory">
                        <option value="">--请选择--</option>
                        <option value="1">--车辆违停--</option>
                        <option value="2">--环境卫生--</option>
                        <option value="3">--占道经营--</option>
                        <option value="6">--其他方面--</option>
                        <%--<option v-for="typelist in type" v-text="typelist.Name" :value="typelist"></option>--%>
                    </select>
                </div>
                <div class="form-group">
                    <label>地址：</label>
                    <input name="event_place" type="text" class="form-control" v-model="address">
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
                    <button type="submit" class="btn btn-warning col-xs-12" >提交</button>
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


</body>
</html>