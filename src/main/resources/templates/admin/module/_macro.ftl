<#macro head>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta property="lang" content="${(options.blog_locale)?if_exists}">
    <title><#nested ></title>
    <#if options.blog_favicon??>
        <link rel="shortcut icon" type="images/x-icon" href="${options.blog_favicon}">
    </#if>
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/pace/pace.min.css">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/css/style.css">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/css/loader.css">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/toast/css/jquery.toast.min.css">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/fileinput/fileinput.min.css">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/OwO/OwO.min.css">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/pretty-checkbox/pretty-checkbox.min.css">
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="${options.blog_static_url?if_exists}/static/plugins/jquery/jquery.min.js"></script>
    <script src="${options.blog_static_url?if_exists}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${options.blog_static_url?if_exists}/static/plugins/OwO/OwO.min.js"></script>
</head>
<body class="hold-transition sidebar-mini fixed ${options.admin_theme?default('skin-blue')} ${options.admin_layout?default('')} ${options.sidebar_style?default('')}">
<#if options.admin_loading?default("false") == "true">
<!-- 页面加载动画 -->
<div id="loading">
    <div id="loading-center">
        <div id="loading-center-absolute">
            <div class="object" id="object_one"></div>
            <div class="object" id="object_two"></div>
            <div class="object" id="object_three"></div>
            <div class="object" id="object_four"></div>
        </div>
    </div>
</div>
</#if>
</#macro>

<#macro footer>
<#if options.admin_pjax?default("true") == "true">
    <script src="${options.blog_static_url?if_exists}/static/plugins/pjax/jquery.pjax.js"></script>
</#if>
<script src="${options.blog_static_url?if_exists}/static/plugins/pace/pace.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/js/adminlte.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/toast/js/jquery.toast.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/layer/layer.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/fileinput/fileinput.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/froala-editor/js/froala_editor.pkgd.min.js"></script>
    <#if options.blog_locale?default('zh_CN')=='zh_CN'>
    <script src="${options.blog_static_url?if_exists}/static/plugins/froala-editor/js/languages/zh_cn.js"></script>
    </#if>
<script src="${options.blog_static_url?if_exists}/static/plugins/froala-editor/js/plugins/image_manager.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/inline-attachment/codemirror-4.inline-attachment.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/jquery-tageditor/jquery.tag-editor.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/jquery-tageditor/jquery.caret.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/hz2py/jQuery.Hz2Py-min.js"></script>
<#if options.blog_locale?default('zh_CN')=='zh_CN'>
    <script src="${options.blog_static_url?if_exists}/static/plugins/fileinput/zh.min.js"></script>
</#if>
<script src="${options.blog_static_url?if_exists}/static/js/app.js"></script>
<@compress single_line=true>
<script>
    Pace.options = {
        restartOnRequestAfter: false
    };
    $(document).ajaxStart(function() {Pace.restart();});
    <#if options.admin_pjax?default("true") == "true">
        $(document).pjax('a[data-pjax=true]', '.content-wrapper', {fragment: '.content-wrapper',timeout: 8000});
    </#if>
    <#if options.admin_loading?default("false") == "true">
        $(window).on('load', function(){
            $('body').addClass('loaded');
            setTimeout(function () {
                $('#loading').remove();
            },500);
        });
    </#if>
    var heading = "<@spring.message code='common.text.tips' />";
</script>
</@compress>
</body>
</html>
</#macro>
