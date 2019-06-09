<#include "../../../common/macro/common_macro.ftl">
<#macro head title,keywords,description>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <title>${title?default("SENS")}</title>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="renderer" content="webkit">
    <meta name="theme-color" content="${options.begin_style_google_color?default('#fff')}">
    <meta name="keywords" content="${keywords?default("SENS")}"/>
    <meta name="description" content="${description?default("SENS")}"/>
    <@verification></@verification>
    <@favicon></@favicon>
    <!--[if lt IE 9]>
    <script src="${options.blog_static_url?if_exists}/begin/assets/js/html5.js"></script>
    <script src="${options.blog_static_url?if_exists}/begin/assets/js/css3-mediaqueries.js"></script>
    <![endif]-->
    <meta name='robots' content='noindex,follow'/>
    <link rel='stylesheet' id='begin-style-css' href='${options.blog_static_url?if_exists}/begin/assets/css/style.css'
          type='text/css' media='all'/>
    <link rel='stylesheet' id='fonts-css' href='${options.blog_static_url?if_exists}/begin/assets/css/fonts.css'
          type='text/css' media='all'/>
    <link rel="alternate" type="application/rss+xml" title="atom 1.0" href="/feed.xml">
    <style>
            <#if options.begin_style_post_title_lower?default("true") == "false">
            .post .post-title h3 {
                text-transform: none;
            }
            </#if>
            <#if options.begin_style_blog_title_lower?default("true") == "false">
            .sidebar .logo-title .title h3 {
                text-transform: none;
            }
            </#if>
        ::-webkit-scrollbar {
            width: 6px;
            height: 6px;
            background-color: #eee;
        }

        ::-webkit-scrollbar-thumb {
            background-color: ${options.begin_style_scrollbar?default("#3798e8")};
        }

        ::-webkit-scrollbar-track {
            background-color: #eee;
        }
        ${options.begin_style_self?if_exists}
    </style>
</head>
<body class="archive tax-taobao term-free term-266 logged-in custom-background">
</#macro>
<#macro footer>
<script type='text/javascript' src='${options.blog_static_url?if_exists}/begin/assets/js/jquery.min.js'></script>
<script type='text/javascript' src='${options.blog_static_url?if_exists}/begin/assets/js/jquery.cookie.js'></script>
<script type='text/javascript' src='${options.blog_static_url?if_exists}/begin/assets/js/slides.js'></script>
<script type='text/javascript' src='${options.blog_static_url?if_exists}/begin/assets/js/sticky.js'></script>
<script type='text/javascript' src='${options.blog_static_url?if_exists}/begin/assets/js/superfish.js'></script>
<script type='text/javascript' src='${options.blog_static_url?if_exists}/begin/assets/js/jquery.lazyload.js'></script>
<script type='text/javascript' src='${options.blog_static_url?if_exists}/begin/assets/js/tipso.js?ver=1.0.1'></script>
<script type='text/javascript' src='${options.blog_static_url?if_exists}/begin/assets/js/script.js'></script>
<script type='text/javascript' src='${options.blog_static_url?if_exists}/begin/assets/js/gb2big5.js'></script>
<script type='text/javascript' src='${options.blog_static_url?if_exists}/begin/assets/js/toastr.min.js'></script>
    <@statistics></@statistics>

<script>
    (function () {
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>
</body>
</html>
</#macro>
