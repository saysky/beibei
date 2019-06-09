<#compress >
    <#include "module/_macro.ftl">
    <@head>${options.blog_title} | 生词管理</@head>
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
                <h1 style="display: inline-block;">生词管理</h1>
                <ol class="breadcrumb">
                    <li>
                        <a data-pjax="true" href="/admin">
                            <i class="fa fa-dashboard"></i>首页</a>
                    </li>
                    <li><a data-pjax="true" href="#">生词管理</a></li>
                    <li class="active">所有生词</li>
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
                                        <th>词汇</th>
                                        <th>中文意思</th>
                                        <th><@spring.message code='common.th.control' /></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if words.records?size gt 0>
                                        <#list words.records as word>
                                            <tr id="word-${word.id}">
                                                <td class="col-md-2">
                                                    <a href="/detail?id=${word.id?if_exists}"> ${word.enName?if_exists}</a>
                                                </td>
                                                <td class="col-md-8">
                                                    ${word.cnName?if_exists}
                                                </td><td class="col-md-2">
                                                    <button class="btn btn-danger btn-xs "
                                                            onclick="removeIt(${word.id})">删除</button>
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
                                <#assign hasPrevious = (words.current > 1)>
                                <#assign hasNext = (words.current < words.pages)>
                                <div class="no-margin pull-left">
                                    <@spring.message code='admin.pageinfo.text.no' />${words.current}
                                    /${words.pages}<@spring.message code='admin.pageinfo.text.page' />
                                </div>
                                <ul class="pagination no-margin pull-right">
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                                           href="/admin/word"><@spring.message code='admin.pageinfo.btn.first' /></a>
                                    </li>
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                                           href="/admin/word?page=${words.current-1}"><@spring.message code='admin.pageinfo.btn.pre' /></a>
                                    </li>
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasNext>disabled</#if>"
                                           href="/admin/word?page=${words.current+1}"><@spring.message code='admin.pageinfo.btn.next' /></a>
                                    </li>
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasNext>disabled</#if>"
                                           href="/admin/word?page=${words.pages}"><@spring.message code='admin.pageinfo.btn.last' /></a>
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
                            url: '/admin/word/remove',
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


                function openAttach(id) {
                    layer.open({
                        type: 2,
                        title: '<@spring.message code="common.js.all-attachment" />',
                        shadeClose: true,
                        shade: 0.5,
                        maxmin: true,
                        area: ['90%', '90%'],
                        content: '/admin/attachment/select?id=' + id,
                        scrollbar: false
                    });
                }

            </script>
        </div>
        <#include "module/_footer.ftl">
    </div>
    <@footer></@footer>
</#compress>