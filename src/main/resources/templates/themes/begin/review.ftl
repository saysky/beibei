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
            #review .hero-unit.start-review.new-start-review, #review .hero-unit.checkin.new-start-review {
                padding: 40px 60px;
                margin-top: 20px;
            }

            .hero-unit {
                padding: 60px;
                margin-bottom: 30px;
                font-size: 18px;
                font-weight: 200;
                line-height: 30px;
                color: inherit;
                background-color: #eee;
                -webkit-border-radius: 6px;
                -moz-border-radius: 6px;
                border-radius: 6px;
            }

            @media (min-width: 1200px) {
                .span7 {
                    width: 481px;
                }
            }

            #review .hero-unit.start-review.new-start-review .new-review-summary .span2, #review .hero-unit.checkin.new-start-review .new-review-summary .span2 {
                text-align: center;
            }

            #review .hero-unit.start-review.new-start-review h1, #review .hero-unit.checkin.new-start-review h1 {
                color: #3c8dbc;
            }

            #review .hero-unit.start-review h1, #review .hero-unit.checkin h1 {
                font-size: 64px;
                float: left;
            }

            .hero-unit h1 {
                margin-bottom: 0;
                font-size: 60px;
                line-height: 1;
                color: inherit;
                letter-spacing: -1px;
            }

            @media (min-width: 1200px) {
                .span2 {
                    width: 126px;
                }
            }

            @media (min-width: 1200px) {
                [class*="span"] {
                    float: left;
                    min-height: 1px;
                    margin-left: 16px;
                }
            }

            #review .hero-unit.start-review small, #review .hero-unit.checkin small {
                display: block;
                line-height: 22px;
                color: #222;
                font-size: 20px;
                margin-top: 5px;
            }

            #review .hero-unit.start-review.new-start-review .new-review-summary .span2, #review .hero-unit.checkin.new-start-review .new-review-summary .span2 {
                text-align: center;
            }

            @media (min-width: 1200px) {
                .span3 {
                    width: 197px;
                }
            }

            @media (min-width: 1200px) {
                .row-fluid {
                    width: 100%;
                    *zoom: 1;
                }
            }

            #review .hero-unit.start-review.new-start-review .new-review-summary .start-review-button, #review .hero-unit.checkin.new-start-review .new-review-summary .start-review-button {
                margin-top: 20px;
            }

            #review .hero-unit.start-review.new-start-review .start-review-button, #review .hero-unit.checkin.new-start-review .start-review-button {
                font-size: 25px;
            }

            #review .hero-unit.start-review .start-review-button, #review .hero-unit.checkin .start-review-button, #review .hero-unit.start-review .btn-large, #review .hero-unit.checkin .btn-large {
                border: none;
                padding: 15px;
            }

            #review .hero-unit.start-review small, #review .hero-unit.checkin small {
                display: block;
                line-height: 22px;
                color: #222;
                font-size: 20px;
                margin-top: 5px;
            }
            #review .test-answers a {
                display: block;
                padding: 10px;
                width: 200px;
            }

            .row {
                margin: 0;
            }

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
                                    <div class="box-header with-border">
                                        <h3 class="box-title">词汇复习</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="row divide-against-progress">
                                            <div id="review">
                                                <#if finishCount < readCount>
                                                    <div class="row">
                                                        <div class="test-box review-id" data-id="1481099043512645">
                                                            <div id="preview" class="row">
                                                                <div style="width: 100%">
                                                                    <div class="row word-row new-word-row">
                                                                        <div class="">
                                                                            <h1>${word.enName?if_exists}</h1>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div id="answer" class="">
                                                                            <table style="margin:80px auto">
                                                                                <#list words as w>
                                                                                <tr>
                                                                                    <td>
                                                                                        <div class="row test-answers">
                                                                                            <a class="record-btn"
                                                                                               data-id="${word.id?if_exists}"
                                                                                               data-status="<#if w.id == word.id>1<#else>0</#if>"
                                                                                               href="javascript:void(0)">
                                                                                                ${w_index+1}. ${w.cnName}
                                                                                            </a>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                                </#list>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="progress">
                                                                            <div class="progress-bar progress-bar-primary progress-bar-striped"
                                                                                 role="progressbar" aria-valuenow="40"
                                                                                 aria-valuemin="0" aria-valuemax="100"
                                                                                 style="width: ${(finishCount/readCount*100)?default(100)}%">
                                                                                <span class="sr-only">${finishCount?if_exists}/${readCount?if_exists}</span>
                                                                            </div>
                                                                            <p style="text-align: center;">${finishCount?if_exists}
                                                                                /${readCount?if_exists}</p>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <#else>
                                                    <div class="hero-unit start-review new-start-review">
                                                        <div class="row new-review-summary">
                                                            <div class="pull-left span7">
                                                                <h1 class="span2 today">${readCount?if_exists}
                                                                    <small>已学习</small>
                                                                </h1>
                                                                <h1 class="span2">${(finishCount)!}
                                                                    <small>已复习</small>
                                                                </h1>
                                                            </div>
                                                            <div class="span3">
                                                                <div class="row-fluid">
                                                                    <a href="javascript:void(0)">
                                                                        <button class="span12 btn-large btn-success start-review-button">
                                                                            赞，复习完毕
                                                                        </button>
                                                                    </a>
                                                                </div>
                                                                <div class="row-fluid">
                                                                    <div id="start-review-button-loading" class="hide"
                                                                         style="text-align: center; padding-top: 30px;">
                                                                        <img src="https://static.baydn.com/static/img/loading.gif"
                                                                                width="20"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </#if>

                                            </div>
                                        </div>
                                    </div>
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
        <script type="text/javascript" src="${options.blog_static_url?if_exists}/static/js/adminlte.min.js"></script>
        <script>
            $(document).on("click", ".record-btn", function () {
                var wordId = $(this).attr('data-id');
                var status = $(this).attr('data-status');
                if(status == 0) {
                    $(this).attr("style","background:#F4434B");
                } else if(status == 1) {
                    $(this).attr("style","background:#209e85");
                }
                $.ajax({
                    url: "/bei/record",
                    type: 'POST',
                    data: {'status': status, 'wordId': wordId},
                    success: function (data) {
                        if (data.code == 1) {
                            if(status == 1) {
                                window.location.reload();
                            }

                        }
                    }
                });
                return false;
            });
        </script>
    </body>
</html>

