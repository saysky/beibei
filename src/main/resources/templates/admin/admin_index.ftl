<#compress >
    <#include "module/_macro.ftl">
    <@head>${options.blog_title} | <@spring.message code='admin.index.title' /></@head>
    <div class="wrapper">
        <!-- 顶部栏模块 -->
        <#include "module/_header.ftl">
        <!-- 菜单栏模块 -->
        <#include "module/_sidebar.ftl">
        <div class="content-wrapper">
            <style type="text/css" rel="stylesheet">
                #btnWidgetsOption {
                    margin-left: 4px;
                    padding: 3px 6px;
                    position: relative;
                    top: -4px;
                    border: 1px solid #ccc;
                    border-radius: 2px;
                    background: #fff;
                    text-shadow: none;
                    font-weight: 600;
                    font-size: 12px;
                    line-height: normal;
                    color: #3c8dbc;
                    cursor: pointer;
                    transition: all .2s ease-in-out
                }

                #btnWidgetsOption:hover {
                    background: #3c8dbc;
                    color: #fff
                }

                .form-horizontal .control-label {
                    text-align: left;
                }

                .control-radio {
                    padding-top: 7px;
                }
            </style>
            <section class="content-header">
                <h1 style="display: inline-block;"><@spring.message code='admin.index.title' /></h1>
                <ol class="breadcrumb">
                    <li>
                        <a href="/admin"><i
                                    class="fa fa-dashboard"></i> <@spring.message code='admin.index.bread.index' /></a>
                    </li>
                    <li class="active"><@spring.message code='admin.index.bread.active' /></li>
                </ol>
            </section>
            <section class="content container-fluid">

                <@shiro.hasRole name="admin">
                    <div class="row">

                        <div class="col-lg-3 col-xs-6" id="widgetPostCountBody">
                            <div class="small-box bg-aqua">
                                <div class="inner"><h3>${wordCount?default(0)}</h3>
                                    <p>词汇数</p></div>
                                <div class="icon"><i class="ion ion-bag"></i></div>
                                <a data-pjax="true" href="/admin/word"
                                   class="small-box-footer"><@spring.message code='common.btn.view-all' /> <i
                                            class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6" id="widgetCommentCountBody">
                            <div class="small-box bg-green">
                                <div class="inner"><h3>${userCount?default(0)}</h3>
                                    <p>用户数</p></div>
                                <div class="icon"><i class="ion ion-stats-bars"></i></div>
                                <a data-pjax="true" href="/admin/user"
                                   class="small-box-footer"><@spring.message code='common.btn.view-all' /> <i
                                            class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6" id="widgetAttachmentCountBody">
                            <div class="small-box bg-yellow">
                                <div class="inner"><h3>${attachmentCount?default(0)}</h3>
                                    <p>附件数</p></div>
                                <div class="icon"><i class="ion ion-person-add"></i></div>
                                <a data-pjax="true" href="/admin/attachment"
                                   class="small-box-footer"><@spring.message code='common.btn.upload-image' /> <i
                                            class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6" id="widgetAttachmentCountBody">
                            <div class="small-box bg-red">
                                <div class="inner"><h3>${feedbackCount?default(0)}</h3>
                                    <p>反馈数</p></div>
                                <div class="icon"><i class="ion ion-person-add"></i></div>
                                <a data-pjax="true" href="/admin/feedback"
                                   class="small-box-footer"><@spring.message code='common.btn.view-all' /> <i
                                            class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </@shiro.hasRole>

                <@shiro.lacksRole name="admin">
                    <div class="row">

                        <div class="col-lg-3 col-xs-6" id="widgetPostCountBody">
                            <div class="small-box bg-aqua">
                                <div class="inner"><h3>${planToday?default(0)}</h3>
                                    <p>今日目标</p></div>
                                <div class="icon"><i class="ion ion-bag"></i></div>
                                <a  href="/bei"
                                   class="small-box-footer"><@spring.message code='common.btn.view-all' /> <i
                                            class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6" id="widgetCommentCountBody">
                            <div class="small-box bg-green">
                                <div class="inner"><h3>${finishToday?default(0)}</h3>
                                    <p>今日完成</p></div>
                                <div class="icon"><i class="ion ion-stats-bars"></i></div>
                                <a href="/review"
                                   class="small-box-footer"><@spring.message code='common.btn.view-all' /> <i
                                            class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6" id="widgetAttachmentCountBody">
                            <div class="small-box bg-yellow">
                                <div class="inner"><h3>${wordAll?default(0)}</h3>
                                    <p>词汇总数</p></div>
                                <div class="icon"><i class="ion ion-person-add"></i></div>
                                <a  href="/word"
                                   class="small-box-footer"><@spring.message code='common.btn.view-all' /> <i
                                            class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6" id="widgetAttachmentCountBody">
                            <div class="small-box bg-red">
                                <div class="inner"><h3>${finishAll?default(0)}</h3>
                                    <p>已完成</p></div>
                                <div class="icon"><i class="ion ion-person-add"></i></div>
                                <a href="javascript:void(0)"
                                   class="small-box-footer"><@spring.message code='common.btn.view-all' /> <i
                                            class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </@shiro.lacksRole>

            </section>
        </div>
        <#include "module/_footer.ftl">
    </div>
    <@footer></@footer>
</#compress>
