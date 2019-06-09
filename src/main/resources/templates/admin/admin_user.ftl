<#compress >
    <#include "module/_macro.ftl">
    <@head>${options.blog_title} | <@spring.message code='admin.users.title' /></@head>
<div class="wrapper">
    <!-- 顶部栏模块 -->
    <#include "module/_header.ftl">
    <!-- 菜单栏模块 -->
    <#include "module/_sidebar.ftl">
    <div class="content-wrapper">
        <style type="text/css" rel="stylesheet">
            .role-ul {
                list-style: none;
                padding-left: 0
            }

            .role-ul > li {
                list-style: none;
                float: left;
                margin: 0;
                padding-bottom: 10px
            }

            #btnNewUser {
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

            #btnNewUser:hover {
                background: #3c8dbc;
                color: #fff
            }
        </style>
        <section class="content-header">
            <h1 style="display: inline-block;"><@spring.message code='admin.users.title' /></h1>
            <a data-pjax="false" id="btnNewUser" href="/admin/user/new">
                <@spring.message code='admin.users.btn.new-user' />
            </a>
            <ol class="breadcrumb">
                <li>
                    <a data-pjax="true" href="/admin">
                        <i class="fa fa-dashboard"></i> <@spring.message code='admin.index.bread.index' /></a>
                </li>
                <li><a data-pjax="true" href="#"><@spring.message code='admin.users.title' /></a></li>
                <li class="active"><@spring.message code='admin.users.bread.all-users' /></li>
            </ol>
        </section>
        <section class="content container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <ul class="role-ul">
                        <#list roles as role>
                            <li class="${role.role!}">
                                <a data-pjax="true" href="/admin/user?role=${role.role!}"
                                   <#if role.role == currentRole>style="color: #000"</#if>>
                                ${role.description!} <span class="count">(${role.count?default(0)})</span>
                                </a>
                                <#if role_has_next>
                                    &nbsp;|&nbsp;
                                </#if>
                            </li>
                        </#list>
                    </ul>
                </div>
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th><@spring.message code='admin.users.user-name' /></th>
                                    <th><@spring.message code='admin.users.display-name' /></th>
                                    <th><@spring.message code='admin.user.profile.form.email' /></th>
                                    <th><@spring.message code='common.th.posts-count' /></th>
                                    <th><@spring.message code='common.th.comments-count' /></th>
                                    <th><@spring.message code='common.th.status' /></th>
                                    <th><@spring.message code='admin.users.create-time' /></th>
                                    <th><@spring.message code='common.th.control' /></th>
                                    <th><@spring.message code='common.th.id' /></th>
                                </tr>
                                </thead>
                                <tbody>
                                    <#if users.records?size gt 0>
                                        <#list users.records as user>
                                        <tr id="user-${user.userId}">
                                            <td>
                                                <a href="/author/${user.userName!}">${user.userName!}</a>
                                            </td>
                                            <td>${user.userDisplayName!}</td>
                                            <td>${user.userEmail!}</td>
                                            <td>
                                                <span class="label"
                                                      style="background-color: #d6cdcd;">${user.postCount?default(0)}</span>
                                            </td>
                                            <td>
                                                <span class="label"
                                                      style="background-color: #d6cdcd;">${user.commentCount?default(0)}</span>
                                            </td>
                                            <td>
                                                <#switch user.status>
                                                    <#case 0>
                                                        <span class="text-success"><@spring.message code='admin.users.normal' /></span>
                                                        <#break >
                                                    <#case 1>
                                                        已禁用
                                                        <span class="text-danger"><@spring.message code='admin.users.normal' /></span>
                                                        <#break >
                                                    <#case 2>
                                                        已删除
                                                        <span class="text-danger"><strong><@spring.message code='admin.users.normal' /></strong></span>
                                                        <#break >
                                                </#switch>
                                            </td>
                                            <td>${(user.createTime?string("yyyy-MM-dd HH:mm"))!}</td>
                                            <td>
                                                <a href="/admin/user/edit?userId=${user.userId?c}"
                                                   class="btn btn-info btn-xs "><@spring.message code='common.btn.edit' /></a>
                                                <a href="/admin/user/login/proxy?userId=${user.userId?c}"
                                                   class="btn btn-success btn-xs "><@spring.message code='admin.users.login-it' /></a>
                                                <a href="javascript:void(0)" onclick="removeIt(${user.userId})"
                                                   class="btn btn-danger btn-xs "><@spring.message code='common.btn.delete' /></a>
                                            </td>
                                            <td>${user.userId?c}</td>
                                        </tr>
                                        </#list>
                                    <#else>
                                    <tr>
                                        <th colspan="7"
                                            style="text-align: center"><@spring.message code='common.text.no-data' /></th>
                                    </tr>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <#assign hasPrevious = (users.current > 1)>
                            <#assign hasNext = (users.current < users.pages)>
                            <div class="no-margin pull-left">
                                <@spring.message code='admin.pageinfo.text.no' />${users.current}
                                /${users.pages}<@spring.message code='admin.pageinfo.text.page' />
                            </div>
                            <ul class="pagination no-margin pull-right">
                                <li><a data-pjax="true" class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                                       href="/admin/user?role=${currentRole}"><@spring.message code='admin.pageinfo.btn.first' /></a>
                                </li>
                                <li><a data-pjax="true" class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                                       href="/admin/user?role=${currentRole}&page=${users.current-1}"><@spring.message code='admin.pageinfo.btn.pre' /></a>
                                </li>
                                <li><a data-pjax="true" class="btn btn-sm <#if !hasNext>disabled</#if>"
                                       href="/admin/user?role=${currentRole}&page=${users.current+1}"><@spring.message code='admin.pageinfo.btn.next' /></a>
                                </li>
                                <li><a data-pjax="true" class="btn btn-sm <#if !hasNext>disabled</#if>"
                                       href="/admin/user?page=${users.pages}&role=${currentRole}"><@spring.message code='admin.pageinfo.btn.last' /></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>

            function removeIt(userId) {
                layer.confirm('<@spring.message code="common.text.define-delete" />', function (index) {
                    $.ajax({
                        type: 'POST',
                        url: '/admin/user/remove',
                        async: false,
                        data: {
                            'userId': userId
                        },
                        success: function (data) {
                            if (data.code == 0) {
                                showMsg(data.msg, "error", 2000);
                            } else {
                                showMsg(data.msg, "success", 2000);
                                $('#user-'+userId).remove();
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
