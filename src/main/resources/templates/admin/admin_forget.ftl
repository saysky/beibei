<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>言曌博客 &lsaquo; 找回密码</title>
    <link rel='stylesheet' id='dashicons-css' href='/static/css/dashicons.min.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='buttons-css' href='/static/css/buttons.min.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='login-css' href='/static/css/login.min.css' type='text/css' media='all'/>
    <meta name='robots' content='noindex,follow'/>
    <meta name="viewport" content="width=device-width"/>
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/animate/animate.min.css">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/toast/css/jquery.toast.min.css">

</head>
<body class="login login-action-login wp-core-ui  locale-zh-cn">
<div id="login" class="login-body animated">
    <h1><a href="${options.blog_url!}" title="欢迎您光临本站！" tabindex="-1">${options.blog_title!}</a></h1>
    <p class="message register">找回密码！</p>

    <form name="registerform" id="registerform" action="/admin/register"
          method="post" novalidate="novalidate">
        <p>
            <label for="userName"><@spring.message code='register.form.userName' /><br>
                <input type="text" name="userName" id="userName" class="input" value="" size="20">
            </label>
        </p>
        <p>
            <label for="userEmail"><@spring.message code='register.form.email' /><br>
                <input type="email" name="userEmail" id="userEmail" class="input" value="" size="25">
            </label>
        </p>
        <p id="forget_mail">新密码将会通过邮件发送给您。</p>

        <br class="clear">
        <input type="hidden" name="redirect_to" value="">
        <p class="submit">
            <button type="button" id="btn-forget"
                    data-loading-text="<@spring.message code='forget.btn.forgeting' />"
                    class="btn button button-primary button-large btn-block login-button fadeInUp"
                    onclick="btn_forget()"
                    style="animation-delay: 0.4s;outline: none;">
            <@spring.message code='forget.btn.forget' />
            </button>
        </p>
    </form>
    <p id="nav">
        <a href="/admin/login">登录</a> | <a href="/admin/register">注册</a>
    </p>

    <p id="backtoblog"><a href="/">&larr; 返回到${options.blog_title!}</a></p>

</div>

<script>
    var heading = "<@spring.message code='common.text.tips' />";
</script>
<script src="${options.blog_static_url?if_exists}/static/plugins/jquery/jquery.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/toast/js/jquery.toast.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/js/app.js"></script>
<script src="${options.blog_static_url?if_exists}/static/js/login.js"></script>
</body>
</html>
