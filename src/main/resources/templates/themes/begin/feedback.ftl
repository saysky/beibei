<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity4">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Cache-Control" content="max-age=72000"/>
        <title></title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <meta name="description" content="贝贝词汇,知道你正在改变"/>
        <meta name="keywords" content="贝贝,贝贝词汇,词汇背诵"/>
        <link rel="icon" href="${options.blog_static_url?if_exists}/static/images/favicon.ico" type="image/x-icon"/>
        <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${options.blog_static_url?if_exists}/begin/assets/css/review.css">

        <link rel="stylesheet"
              href="${options.blog_static_url?if_exists}/static/plugins/bootstrap/css/bootstrap.min.css">

        <!--<link rel="stylesheet" href="/components/font-awesome/css/font-awesome.min.css">-->
        <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/css/AdminLTE.min.css">
        <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/css/skins/_all-skins.min.css">


        <#--        <link rel="stylesheet" th:href="/css/style.css">-->
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>

        </style>
    </head>
    <body class="hold-transition skin-blue layout-top-nav">
        <div class="wrapper" style="background-color: #ecf0f5;margin-bottom: 20px;">
            <header class="main-header">
                <nav class="navbar navbar-static-top">
                    <div class="container">
                        <div class="navbar-header">
                            <a href="/" class="navbar-brand" style="color: #fff;font-weight: bold;">
                                贝贝词汇
                            </a>
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                    data-target="#navbar-collapse">
                                <i class="fa fa-bars"></i>
                            </button>
                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="/" class="active">首页</a></li>
                                <li><a href="/word" class="active">词汇表</a></li>
                                <li><a href="/bei">背诵</a></li>
                                <li><a href="/review">复习</a></li>
                                <li><a href="/feedback">反馈</a></li>
                            </ul>

                            <form class="navbar-form navbar-left" action="/word" role="search">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="keywords" name="keywords"
                                           value="${(RequestParameters.keywords)!}   ">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default " type="button">查询</button>
                                    </span>
                                </div>
                            </form>
                        </div>

                        <div class="navbar-custom-menu" id="user-nav-wrapper">
                            <@shiro.authenticated>
                                <ul class="nav navbar-nav">

                                    <li class="dropdown user user-menu">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                            <img src="<@shiro.principal  property="userAvatar"/>" class="user-image"
                                                 alt="User Image">
                                            <span class="hidden-xs"><@shiro.principal  property="userDisplayName"/></span>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li class="user-header">
                                                <img src="<@shiro.principal  property="userAvatar"/>" class="img-circle"
                                                     alt="User Image">
                                                <p><@shiro.principal  property="userDisplayName"/></p>
                                            </li>
                                            <li class="user-footer">
                                                <div class="pull-left"><a data-pjax="true" href="/admin/user/profile"
                                                                          class="btn btn-default "><i
                                                                class="fa fa-user"></i><@spring.message code='admin.module.header.btn.profile' />
                                                    </a></div>
                                                <div class="pull-right"><a href="/admin/logOut"
                                                                           class="btn btn-default "><i
                                                                class="fa fa-sign-out"></i><@spring.message code='admin.module.header.btn.loginout' />
                                                    </a></div>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </@shiro.authenticated>

                            <@shiro.guest>
                                <ul class="nav navbar-nav pull-right">
                                    <li><a href="/admin/login">登录 </a></li>
                                    <li><a href="/admin/register">注册</a></li>
                                </ul>
                            </@shiro.guest>
                        </div>
                    </div>
                </nav>
            </header>

            <div class="content-wrapper">
                <div class="container">
                    <section class="content">
                        <div class="row" style="margin: 0;">
                            <div class="col-md-12" style="background: #fff;">
                                <div class="box box-solid">
                                    <form action="">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">问题反馈</h3>
                                        </div>
                                        <div class="box-body">
                                            <div class="form-group">
                                                <textarea class="form-control" rows="6"
                                                          placeholder="请输入您的建议" id="feedback-content"></textarea>
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <button type="button" id="feedback-btn" class="btn btn-primary">提交</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div style="clear: both;"></div>
                        </div>
                    </section>
                </div>
                <!-- /.container -->
            </div>
        </div>


        <script type="text/javascript"
                src="${options.blog_static_url?if_exists}/static/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript"
                src="${options.blog_static_url?if_exists}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="${options.blog_static_url?if_exists}/static/plugins/layer/layer.js"></script>
        <script type="text/javascript" src="${options.blog_static_url?if_exists}/static/js/adminlte.min.js"></script>
        <script>
            $(document).on("click", "#feedback-btn", function () {
                var content = $("#feedback-content").val();
                $.ajax({
                    url: "/admin/feedback/save",
                    type: 'POST',
                    data: {'content': content},
                    success: function (data) {
                        if (data.code == 1) {
                            layer.msg(data.msg, {icon: 1});
                            $("#feedback-content").val('');
                        }
                    }
                });
                return false;
            });
        </script>
    </body>
</html>

