<#compress >
    <#include "module/_macro.ftl">
    <@head>${options.blog_title} | <@spring.message code='admin.comments.title' /></@head>
    <div class="wrapper">
        <!-- 顶部栏模块 -->
        <#include "module/_header.ftl">
        <!-- 菜单栏模块 -->
        <#include "module/_sidebar.ftl">
        <div class="content-wrapper">
            <style type="text/css" rel="stylesheet">
                .draft, .publish, .trash {
                    list-style: none;
                    float: left;
                    margin: 0;
                    padding-bottom: 10px
                }
            </style>
            <section class="content-header">
                <h1><@spring.message code='admin.comments.title' />
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <a data-pjax="true" href="/admin"><i
                                    class="fa fa-dashboard"></i> <@spring.message code='admin.index.bread.index' /></a>
                    </li>
                    <li class="active"><@spring.message code='admin.comments.title' /></li>
                </ol>
            </section>
            <section class="content container-fluid">
                <ul style="list-style: none;padding-left: 0">
                    <li class="publish">
                        <a data-pjax="true" href="/admin/comment"
                           <#if status==0>style="color: #000" </#if>><@spring.message code='common.status.published' />
                            <span
                                    class="count">(${publicCount})</span></a>&nbsp;|&nbsp;
                    </li>
                    <li class="draft">
                        <a data-pjax="true" href="/admin/comment?status=1"
                           <#if status==1>style="color: #000" </#if>><@spring.message code='common.status.checking' />
                            <span
                                    class="count">(${checkCount})</span></a>&nbsp;|&nbsp;
                    </li>
                    <li class="trash">
                        <a data-pjax="true" href="/admin/comment?status=2"
                           <#if status==2>style="color: #000" </#if>><@spring.message code='common.status.recycle-bin' />
                            <span class="count">(${trashCount})</span></a>
                    </li>
                </ul>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-primary">
                            <div class="box-body table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th class="col-md-1"><@spring.message code='common.th.comment-author' /></th>
                                        <th class="col-md-4"><@spring.message code='common.th.content' /></th>
                                        <th class="col-md-4"><@spring.message code='common.th.comment-page' /></th>
                                        <th class="col-md-2"><@spring.message code='common.th.date' /></th>
                                        <th class="col-md-1"><@spring.message code='common.th.control' /></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if comments.records?size gt 0>
                                        <#list comments.records as comment>
                                            <tr id="comment-${comment.commentId}">
                                                <td>
                                                    <a href="${(comment.commentAuthorUrl)!'javascript:void(0)'}" target="_blank">
                                                        ${comment.commentAuthor}
                                                    </a>
                                                </td>
                                                <td>${comment.commentContent}</td>
                                                <td>
                                                    <#if (comment.post)??>
                                                        <#if comment.post.postType == "post">
                                                            <a target="_blank" href="/article/${comment.post.postId}#comment-id-${comment.commentId?c}">${comment.post.postTitle}</a>
                                                        <#elseif comment.post.postType == "notice">
                                                            <a target="_blank" href="/notice/${comment.post.postId}#comment-id-${comment.commentId?c}">${comment.post.postTitle}</a>
                                                        <#else >
                                                            <a target="_blank"
                                                               href="/p/${(comment.post.postUrl)!}#comment-id-${comment.commentId?c}">${comment.post.postTitle}</a>
                                                        </#if>
                                                    </#if>
                                                </td>
                                                <td>${comment.commentDate?string('yyyy-MM-dd HH:mm')}</td>
                                                <td>
                                                    <#if (comment.post)??>
                                                        <#switch comment.commentStatus>
                                                            <#case 0>
                                                                <button class="btn btn-primary btn-xs "
                                                                        onclick="replyShow(${comment.commentId})"><@spring.message code="common.btn.reply" /></button>
                                                                <button class="btn btn-danger btn-xs "
                                                                        onclick="removeIt(${comment.commentId})"><@spring.message code="common.btn.recycling" /></button>
                                                                <#break >
                                                            <#case 1>
                                                                <button onclick="revertIt(${comment.commentId})"
                                                                        class="btn btn-primary btn-xs ">
                                                                    <@spring.message code="common.btn.pass" /></button>
                                                                <button class="btn btn-info btn-xs "
                                                                        onclick="replyShow(${comment.commentId})"><@spring.message code="common.btn.pass-reply" /></button>
                                                                <button class="btn btn-danger btn-xs "
                                                                        onclick="removeIt(${comment.commentId})"><@spring.message code="common.btn.recycling" /></button>
                                                                <#break >
                                                            <#case 2>
                                                                <button class="btn btn-primary btn-xs "
                                                                        onclick="revertIt(${comment.commentId})"><@spring.message code="common.btn.reduction" /></button>
                                                                <button class="btn btn-danger btn-xs "
                                                                        onclick="removeIt(${comment.commentId})"><@spring.message code="common.btn.delete" /></button>
                                                                <#break >
                                                        </#switch>
                                                    </#if>
                                                </td>
                                            </tr>
                                        </#list>
                                    <#else >
                                        <tr>
                                            <td colspan="5"
                                                style="text-align: center"><@spring.message code="common.text.no-data" /></td>
                                        </tr>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box-footer clearfix">
                                <div class="no-margin pull-left">
                                    <@spring.message code='admin.pageinfo.text.no' />${comments.current}
                                    /${comments.pages}<@spring.message code='admin.pageinfo.text.page' />
                                </div>
                                <#assign hasPrevious = (comments.current > 1)>
                                <#assign hasNext = (comments.current < comments.pages)>
                                <ul class="pagination no-margin pull-right">
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                                           href="/admin/comment?status=${status}"><@spring.message code='admin.pageinfo.btn.first' /></a>
                                    </li>
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                                           href="/admin/comment?status=${status}&page=${comments.current-1}"><@spring.message code='admin.pageinfo.btn.pre' /></a>
                                    </li>
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasNext>disabled</#if>"
                                           href="/admin/comment?status=${status}&page=${comments.current+1}"><@spring.message code='admin.pageinfo.btn.next' /></a>
                                    </li>
                                    <li><a data-pjax="true" class="btn btn-sm <#if !hasNext>disabled</#if>"
                                           href="/admin/comment?status=${status}&page=${comments.pages}"><@spring.message code='admin.pageinfo.btn.last' /></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- 回复弹出层 -->
            <div class="modal fade" id="commentReplyModal">
                <div class="modal-dialog">
                    <div class="modal-content message_align">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">×</span></button>
                            <h4 class="modal-title"><@spring.message code="common.btn.reply" /></h4>
                        </div>
                        <form method="post" action="/admin/comment/reply" id="commentReplyForm">
                            <div class="modal-body">
                            <textarea class="form-control comment-input-content" rows="5" id="commentContent"
                                      name="commentContent" style="resize: none"></textarea>
                                <div class="OwO"></div>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" id="commentId" name="commentId" value=""/>
                                <input type="hidden" id="userAgent" name="userAgent" value=""/>
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal"><@spring.message code="common.btn.cancel" /></button>
                                <button type="button"
                                        class="btn btn-primary"
                                        onclick="replyIt()"><@spring.message code="common.btn.define" /></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <script>
                var s = new OwO({
                    container: document.getElementsByClassName('OwO')[0],
                    target: document.getElementsByClassName('comment-input-content')[0],
                    position: 'down',
                    width: '100%',
                    maxHeight: '210px',
                    api: "/static/plugins/OwO/OwO.min.json"
                });

                function removeIt(commentId) {
                    layer.confirm('<@spring.message code="common.text.define-delete" />', function (index) {
                        $.ajax({
                            type: 'POST',
                            url: '/admin/comment/remove',
                            async: false,
                            data: {
                                'commentId': commentId
                            },
                            success: function (data) {
                                if (data.code == 0) {
                                    showMsg(data.msg, "error", 2000);
                                } else {
                                    showMsg(data.msg, "success", 2000);
                                    $('#comment-' + commentId).remove();
                                }
                            }
                        });
                        layer.close(index);
                    });
                };

                function revertIt(commentId) {
                    $.ajax({
                        type: 'POST',
                        url: '/admin/comment/revert',
                        async: false,
                        data: {
                            'commentId': commentId
                        },
                        success: function (data) {
                            if (data.code == 0) {
                                showMsg(data.msg, "error", 2000);
                            } else {
                                showMsg(data.msg, "success", 2000);
                                window.location.reload();
                            }
                        }
                    });
                };

                function replyIt() {
                    $.ajax({
                        type: 'POST',
                        url: '/admin/comment/reply',
                        async: false,
                        data: $('#commentReplyForm').serialize(),
                        success: function (data) {
                            if (data.code == 0) {
                                showMsg(data.msg, "error", 2000);
                            } else {
                                showMsgAndRedirect(data.msg, "success", 2000, "/admin/comment");
                                $('#commentReplyModal').modal('hide')
                            }
                        }
                    });
                };

                function replyShow(commentId) {
                    $('#userAgent').val(navigator.userAgent);
                    $('#commentId').val(commentId);
                    $('#commentReplyModal').modal();
                }
            </script>
        </div>
        <#include "module/_footer.ftl">
    </div>
    <@footer></@footer>
</#compress>
