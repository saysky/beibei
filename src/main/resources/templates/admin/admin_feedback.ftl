<#compress >
    <#include "module/_macro.ftl">
    <@head>${options.blog_title} | 反馈管理</@head>
    <div class="wrapper">
        <!-- 顶部栏模块 -->
        <#include "module/_header.ftl">
        <!-- 菜单栏模块 -->
        <#include "module/_sidebar.ftl">
        <div class="content-wrapper">
            <style type="text/css" rel="stylesheet">

                #btnNewPost {
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

                #btnNewPost:hover {
                    background: #3c8dbc;
                    color: #fff
                }
            </style>
            <section class="content-header">
                <h1 style="display: inline-block;">反馈管理</h1>
                <ol class="breadcrumb">
                    <li>
                        <a data-pjax="true" href="/admin">
                            <i class="fa fa-dashboard"></i>首页</a>
                    </li>
                    <li><a data-pjax="true" href="#">反馈管理</a></li>
                    <li class="active">所有反馈</li>
                </ol>
            </section>
            <section class="content container-fluid">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-primary">
                            <div class="box-body table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>用户</th>
                                        <th>内容</th>
                                        <th>提交时间</th>
                                        <th><@spring.message code='common.th.control' /></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if feedbacks.records?size gt 0>
                                        <#list feedbacks.records as feedback>
                                            <tr id="feedback-${feedback.id}">
                                                <td class="col-md-2">
                                                    ${(feedback.user.userDisplayName)!}
                                                </td>
                                                <td class="col-md-7">
                                                    ${feedback.content?if_exists}
                                                </td>
                                                <td  class="col-md-2">
                                                    ${(feedback.createTime?string("yyyy-MM-dd HH:mm:ss"))!}
                                                </td>
                                                <td class="col-md-1">
                                                    <button class="btn btn-danger btn-xs "
                                                            onclick="removeIt(${feedback.id})">删除</button>
                                                </td>
                                            </tr>
                                        </#list>
                                    <#else>
                                        <tr>
                                            <th colspan="4"
                                                style="text-align: center"><@spring.message code='common.text.no-data' /></th>
                                        </tr>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box-footer clearfix">
                                <#assign hasPrevious = (feedbacks.current > 1)>
                                <#assign hasNext = (feedbacks.current < feedbacks.pages)>
                                <div class="no-margin pull-left">
                                    <@spring.message code='admin.pageinfo.text.no' />${feedbacks.current}
                                    /${feedbacks.pages}<@spring.message code='admin.pageinfo.text.page' />
                                </div>
                                <ul class="pagination no-margin pull-right">
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                                           href="/admin/feedback"><@spring.message code='admin.pageinfo.btn.first' /></a>
                                    </li>
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                                           href="/admin/feedback?page=${feedbacks.current-1}"><@spring.message code='admin.pageinfo.btn.pre' /></a>
                                    </li>
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasNext>disabled</#if>"
                                           href="/admin/feedback?page=${feedbacks.current+1}"><@spring.message code='admin.pageinfo.btn.next' /></a>
                                    </li>
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasNext>disabled</#if>"
                                           href="/admin/feedback?page=${feedbacks.pages}"><@spring.message code='admin.pageinfo.btn.last' /></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <script>


                function removeIt(id) {
                    layer.confirm('<@spring.message code="common.text.define-delete" />', function (index) {
                        $.ajax({
                            type: 'POST',
                            url: '/admin/feedback/remove',
                            async: false,
                            data: {
                                'id': id
                            },
                            success: function (data) {
                                if (data.code == 0) {
                                    showMsg(data.msg, "error", 2000);
                                } else {
                                    showMsgAndReload(data.msg, "success", 2000);
                                }
                            }
                        });
                        layer.close(index);
                    });
                }



            </script>
        </div>
        <#include "module/_footer.ftl">
    </div>
    <@footer></@footer>
</#compress>