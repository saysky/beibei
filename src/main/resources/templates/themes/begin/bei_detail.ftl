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
            #review .test-answers a {
                display: block;
                padding: 10px;
                width: 200px;
            }

            .row {
                margin: 0;
            }

            .content {
                min-height: 100px;
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
                                        <h3 class="box-title">词汇学习</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="row divide-against-progress">
                                            <div id="review">
                                                <div id="learning-box" class="review-id row">
                                                    <div class="test-box span12 learning-hint-container hide">
                                                        <div id="word-hint" class="row new-word-row">
                                                            <div class="span10 offset1"><h1 class="">nine</h1>
                                                                <div class="learning-speaker">
                                                                    <h1>
                                                                        <small> /naɪn/</small>
                                                                    </h1>
                                                                    <span class="audio uk">UK<span
                                                                                class="speaker-icon"></span></span>
                                                                    <span
                                                                            class="audio us active">US<span
                                                                                class="speaker-icon"></span></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="example-hint"
                                                             class="row learning-hint learning-hint-hidden">
                                                            <div class="span10 offset1">
                                                                <div class="hint-content sentence annotation"> Are you
                                                                    sure
                                                                    you can come by at <span class="vocab">nine</span>?
                                                                    <span class="review-speaker speaker">&nbsp;</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="definition-cn-hint"
                                                             class="row learning-hint learning-hint-hidden">
                                                            <div class="span10 offset1">
                                                                <div class="hint-content"> num./n. 九
                                                                    pron./adv. 九(个,只...)
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row hint-test-row">
                                                            <div id="answer" class="span10 offset1 operation">
                                                                <div class="row test-answers  first"><a
                                                                            class="known span10"
                                                                            href="javascript:void(0)"><span>1. </span>想起来了</a>
                                                                </div>
                                                                <div class="row test-answers"><a class="unknown span10"
                                                                                                 href="javascript:void(0)"><span>2. </span>没想起来</a>
                                                                </div>
                                                                <div class="detail-button-container hide"><a
                                                                            class="known span10"
                                                                            href="javascript:void(0)"><span>1. </span>查看详细</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="test-box span12 learning-detail-container">
                                                        <div id="learning_word" class="row">
                                                            <div class="word span10">
                                                                <div class="row">
                                                                    <div class="span1">
                                                                        <h6 class="pull-right">&nbsp;</h6>
                                                                    </div>
                                                                    <div class="span9">
                                                                        <h1 class="content pull-left"
                                                                            style="">${word.enName?if_exists}
                                                                        </h1>
                                                                        <span class="hide"
                                                                              id="current-learning-word">${word.enName?if_exists}</span>
                                                                        <div class="pull-left learning-speaker">
                                                                            <a class="btn btn-default mark-btn"
                                                                               data-id="${word.id?if_exists}">收藏</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="span1"><h6 class="pull-right">单词解释</h6>
                                                                    </div>
                                                                    <div id="review-definitions" class="span9" style="">
                                                                        <div class="well">
                                                                            <div class="row">
                                                                                <div class="cndf span7">
                                                                                    <span class="text">${word.cnName?if_exists}</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div id="cliparts" class="span2"></div>
                                                        </div>
                                                        <div id="learning-examples-box" class="row">
                                                            <div class="span9">
                                                                <ul id="example-tab" class="nav nav-tabs">
                                                                    <li class="active"><a href="#ex-defaults-box"
                                                                                          class="">例句</a>
                                                                    </li>
                                                                </ul>
                                                                <div class="tab-content">
                                                                    <div class="tab-pane row active"
                                                                         id="ex-defaults-box">
                                                                        <ol class="span9">
                                                                            <li class="row">
                                                                                <div class="span9">
                                                                                    <div class="pull-left body">
                                                                                        <div class="annotation enex">
                                                                                            ${word.enSentence?if_exists}
                                                                                        </div>
                                                                                        <div class="cnex">
                                                                                            ${word.cnSentence?if_exists}
                                                                                        </div>
                                                                                        <div style="margin-top: 10px;">
                                                                                            <#if word.img??>
                                                                                                <img src="${word.img?if_exists}"
                                                                                                     alt=""
                                                                                                     width="400px"
                                                                                                     height="auto">
                                                                                            </#if>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </li>
                                                                        </ol>
                                                                        <div class="holder hide">
                                                                            <ul class="ex-sys-box-pagination"></ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="">
                                                            <div class="span10">
                                                                <a href="/bei/read" class="continue continue-button"
                                                                   style="left: 985.5px; top: 320px;">
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
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
        <script src="${options.blog_static_url?if_exists}/static/plugins/layer/layer.js"></script>
        <script type="text/javascript" src="${options.blog_static_url?if_exists}/static/js/adminlte.min.js"></script>
        <script>
            $(document).on("click", ".mark-btn", function () {
                var wordId = $(this).attr('data-id');
                $.ajax({
                    url: "/admin/strange/save",
                    type: 'POST',
                    data: {'wordId': wordId},
                    success: function (data) {
                        if (data.code == 1) {
                            layer.msg(data.msg, {icon: 1});
                        } else {
                            layer.msg(data.msg, {icon: 2});
                        }
                    }
                });
                return false;
            });
        </script>
    </body>
</html>

