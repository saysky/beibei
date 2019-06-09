<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/toast/css/jquery.toast.min.css">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/css/AdminLTE.min.css">
    <style>
        .themeSetting,.themeImg{
            padding-top: 15px;
            padding-bottom: 15px;
        }
        .form-horizontal .control-label{
            text-align: left;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6 themeImg">
            <img src="/${themeDir}/screenshot.png" style="width: 100%;">
        </div>
        <div class="col-md-6 themeSetting">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#sns" data-toggle="tab">社交资料</a>
                    </li>
                    <li>
                        <a href="#style" data-toggle="tab">正文底部二维码</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <!-- 社交资料 -->
                    <div class="tab-pane active" id="sns">
                        <form method="post" class="form-horizontal" id="beginSnsOptions">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="beginSnsRss" class="col-sm-4 control-label">RSS：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_begin_sns_rss" id="beginSnsRss" value="true" ${((options.theme_begin_sns_rss?default('true'))=='true')?string('checked','')}> 显示
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_begin_sns_rss" id="beginSnsRss" value="false" ${((options.theme_begin_sns_rss?if_exists)=='false')?string('checked','')}> 隐藏
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="beginSnsWeixin" class="col-sm-4 control-label">微信二维码：</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="beginSnsWeixin" name="theme_begin_sns_weixin" value="${options.theme_begin_sns_weixin?if_exists}" >
                                            <span class="input-group-btn">
                                                <button class="btn btn-default btn-flat" type="button" onclick="openAttach('beginSnsWeixin')">选择</button>
                                            </span>
                                        </div>
                                    </div>
                                    <script type='text/javascript' src='${options.blog_static_url?if_exists}/begin/assets/js/tipso.js'></script>
                                </div>
                                <div class="form-group">
                                    <label for="beginSnsWeibo" class="col-sm-4 control-label">Weibo：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="beginSnsWeibo" name="theme_begin_sns_weibo" value="${options.theme_begin_sns_weibo?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="beginSnsEmail" class="col-sm-4 control-label">Email：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="beginSnsEmail" name="theme_begin_sns_email" value="${options.theme_begin_sns_email?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="beginSnsGithub" class="col-sm-4 control-label">Github：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="beginSnsGithub" name="theme_begin_sns_github" value="${options.theme_begin_sns_github?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="beginSnsQQ" class="col-sm-4 control-label">QQ：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="beginSnsQQ" name="theme_begin_sns_qq" value="${options.theme_begin_sns_qq?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="beginSnsAboutPicture" class="col-sm-4 control-label">关于本站头像：</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="beginSnsAboutPicture" name="theme_begin_sns_about_picture" value="${options.theme_begin_sns_about_picture?default("${options.blog_static_url?if_exists}/begin/source/images/logo.png")}" >
                                            <span class="input-group-btn">
                                                <button class="btn btn-default btn-flat" type="button" onclick="openAttach('beginSnsAboutPicture')">选择</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="beginSnsAboutNickname" class="col-sm-4 control-label">关于本站昵称：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="beginSnsAboutNickname" name="theme_begin_sns_about_nickname" value="${options.theme_begin_sns_about_nickname?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                <label for="beginSnsAboutDesc" class="col-sm-4 control-label">关于本站说明：</label>
                                <div class="col-sm-8">
                                    <textarea type="text" class="form-control" id="beginSnsAboutDesc" name="theme_begin_sns_about_desc" >${options.theme_begin_sns_about_desc?if_exists}</textarea>
                                </div>
                            </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary btn-sm pull-right" onclick="saveThemeOptions('beginSnsOptions')">保存设置</button>
                            </div>
                        </form>
                    </div>
                    <!--正文底部二维码-->
                    <div class="tab-pane" id="style">
                        <form method="post" class="form-horizontal" id="beginStyleOptions">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="beginPostFooterIsDisplay" class="col-sm-4 control-label">是否显示：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_begin_post_footer_is_display" id="beginPostFooterIsDisplay" value="true" ${((options.theme_begin_post_footer_is_display?default('true'))=='true')?string('checked','')}> 显示
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_begin_post_footer_is_display" id="beginPostFooterIsDisplay" value="false" ${((options.theme_begin_post_footer_is_display?if_exists)=='false')?string('checked','')}> 隐藏
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="beginPostFooterLeftTitle" class="col-sm-4 control-label">左侧标题：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="beginPostFooterLeftTitle" name="theme_begin_post_footer_left_title" value="${options.theme_begin_post_footer_left_title?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="beginPostFooterLeftDesc" class="col-sm-4 control-label">左侧说明：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="beginPostFooterLeftDesc" name="theme_begin_post_footer_left_desc" value="${options.theme_begin_post_footer_left_desc?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="beginPostFooterLeftPic" class="col-sm-4 control-label">左侧图片：</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="beginPostFooterLeftPic" name="theme_begin_post_footer_left_pic" value="${options.theme_begin_post_footer_left_pic?default("${options.blog_static_url?if_exists}/begin/assets/img/logo.png")}" >
                                            <span class="input-group-btn">
                                                <button class="btn btn-default btn-flat" type="button" onclick="openAttach('beginPostFooterLeftPic')">选择</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="beginPostFooterRightTitle" class="col-sm-4 control-label">右侧标题：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="beginPostFooterRightTitle" name="theme_begin_post_footer_right_title" value="${options.theme_begin_post_footer_left_title?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="beginPostFooterRightDesc" class="col-sm-4 control-label">右侧说明：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="beginPostFooterRightDesc" name="theme_begin_post_footer_right_desc" value="${options.theme_begin_post_footer_left_desc?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="beginPostFooterRightPic" class="col-sm-4 control-label">右侧图片：</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="beginPostFooterRightPic" name="theme_begin_post_footer_right_pic" value="${options.theme_begin_post_footer_left_pic?default("${options.blog_static_url?if_exists}/begin/assets/img/logo.png")}" >
                                            <span class="input-group-btn">
                                                <button class="btn btn-default btn-flat" type="button" onclick="openAttach('beginPostFooterRightPic')">选择</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary btn-sm pull-right" onclick="saveThemeOptions('beginStyleOptions')">保存设置</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${options.blog_static_url?if_exists}/static/plugins/jquery/jquery.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/toast/js/jquery.toast.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/layer/layer.js"></script>
<script src="${options.blog_static_url?if_exists}/static/js/app.js"></script>
<script>
    function saveThemeOptions(option) {
        var param = $('#'+option).serialize();
        $.ajax({
            type: 'post',
            url: '/admin/option/save',
            data: param,
            success: function (data) {
                if(data.code==1){
                    showMsg(data.msg,"success",1000);
                }else{
                    showMsg(data.msg,"error",1000);
                }
            }
        });
    }
    function openAttach(id) {
        layer.open({
            type: 2,
            title: '所有附件',
            shadeClose: true,
            shade: 0.5,
            area: ['90%', '90%'],
            content: '/admin/attachment/select?id='+id,
            scrollbar: false
        });
    }
</script>
</html>
