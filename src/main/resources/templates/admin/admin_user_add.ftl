<#compress >
    <#include "module/_macro.ftl">
    <@head>${options.blog_title} | <@spring.message code='admin.users.add' /></@head>
<div class="wrapper">
    <!-- 顶部栏模块 -->
    <#include "module/_header.ftl">
    <!-- 菜单栏模块 -->
    <#include "module/_sidebar.ftl">
    <div class="content-wrapper">
        <style>
            .form-horizontal .control-label {
                text-align: left;
            }
        </style>
        <section class="content-header">
            <h1>
                <@spring.message code='admin.users.add' />
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li>
                    <a data-pjax="true" href="/admin">
                        <i class="fa fa-dashboard"></i> <@spring.message code='admin.index.bread.index' /></a>
                </li>
                <li><a data-pjax="true" href="#"><@spring.message code='admin.user.profile.bread.user' /></a></li>
                <li class="active"><@spring.message code='admin.user.profile.title' /></li>
            </ol>
        </section>
        <!-- tab选项卡 -->
        <section class="content container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#general"
                                   data-toggle="tab"><@spring.message code='admin.user.profile.tab.basic' /></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="general">
                                <form method="post" class="form-horizontal" id="profileForm">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="roleList" class="col-lg-2 col-sm-4 control-label">
                                                <@spring.message code='admin.users.role' />
                                            </label>
                                            <div class="col-lg-4 col-sm-8">
                                                <#list roles as role>
                                                    <div class="pretty p-default">
                                                        <input type="checkbox" name="roleList" value="${role.id}">
                                                        <div class="state p-primary">
                                                            <label>${role.description}</label>
                                                        </div>
                                                    </div>
                                                </#list>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userName"
                                                   class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.username' />
                                                <span data-toggle="tooltip" data-placement="top"
                                                      title="<@spring.message code='admin.user.profile.form.username.tips' />"
                                                      style="cursor: pointer">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i>
                                                </span>
                                            </label>
                                            <div class="col-lg-4 col-sm-8">
                                                <input type="text" class="form-control" id="userName" name="userName">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userDisplayName"
                                                   class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.display-name' />
                                                <span data-toggle="tooltip" data-placement="top"
                                                      title="<@spring.message code='admin.user.profile.form.display-name.tips' />"
                                                      style="cursor: pointer">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i>
                                                </span>
                                            </label>
                                            <div class="col-lg-4 col-sm-8">
                                                <input type="text" class="form-control" id="userDisplayName"
                                                       name="userDisplayName">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userPass" class="col-lg-2 col-sm-4 control-label">
                                                <@spring.message code='admin.users.password' />
                                            </label>
                                            <div class="col-lg-4 col-sm-8">
                                                <input type="text" class="form-control" id="userPass" name="userPass">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userEmail"
                                                   class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.email' /></label>
                                            <div class="col-lg-4 col-sm-8">
                                                <input type="email" class="form-control" id="userEmail"
                                                       name="userEmail">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userAvatar"
                                                   class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.avatar' /></label>
                                            <div class="col-lg-4 col-sm-8">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="userAvatar"
                                                           name="userAvatar">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default " type="button"
                                                                onclick="openAttach('userAvatar')">
                                                            <@spring.message code='common.btn.choose' />
                                                        </button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userDesc"
                                                   class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.desc' />
                                            </label>
                                            <div class="col-lg-4 col-sm-8">
                                                <textarea class="form-control" rows="3" id="userDesc" name="userDesc"
                                                          style="resize: none"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userEmail"
                                                   class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.site' /></label>
                                            <div class="col-lg-4 col-sm-8">
                                                <input type="url" class="form-control" id="userSite" name="userSite">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-4 control-label"><@spring.message code='admin.user.profile.form.status' /></label>
                                            <div class="col-lg-4 col-sm-8 control-radio">
                                                <div class="pretty p-default p-round">
                                                    <input type="radio" name="status" value="0" checked>
                                                    <div class="state p-primary">
                                                        <label><@spring.message code='common.radio.enable' /></label>
                                                    </div>
                                                </div>
                                                <div class="pretty p-default p-round">
                                                    <input type="radio" name="status" value="1">
                                                    <div class="state p-primary">
                                                        <label><@spring.message code='common.radio.disable' /></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="box-footer">
                                        <button type="button" class="btn btn-primary btn-sm"
                                                onclick="saveUser('profileForm')"><@spring.message code='common.btn.save' /></button>
                                        <a href="/admin/user"
                                           class="btn btn-info btn-sm"> <@spring.message code='common.btn.back' /></a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <@compress single_line=true>
            <script>
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip()
                });

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

                function saveUser(option) {
                    var userName = $('#userName').val();
                    var userDisplayName = $('#userDisplayName').val();
                    var userEmail = $('#userEmail').val();
                    var userPass = $('#userPass').val();
                    var role = $("input:checkbox[name='roleList']:checked").length;
                    if (userName == "" || userDisplayName == "" || userEmail == "" || userPass == "" || role == 0) {
                        showMsg('<@spring.message code="common.js.info-no-complete" />', "info", 2000);
                        return;
                    }
                    var param = $('#' + option).serialize();
                    $.ajax({
                        type: 'post',
                        url: '/admin/user/save',
                        data: param,
                        success: function (data) {
                            if (data.code == 1) {
                                $.toast({
                                    text: data.msg,
                                    heading: '<@spring.message code="common.text.tips" />',
                                    icon: 'success',
                                    showHideTransition: 'fade',
                                    allowToastClose: true,
                                    hideAfter: 1000,
                                    stack: 1,
                                    position: 'top-center',
                                    textAlign: 'left',
                                    loader: true,
                                    loaderBg: '#ffffff',
                                    afterHidden: function () {
                                        window.location.href = "/admin/user";
                                    }
                                });
                            } else {
                                showMsg(data.msg, "error", 2000);
                            }
                        }
                    });
                }

                function changPass() {
                    var newPass = $('#newPass').val();
                    var reNewPass = $('#reNewPass').val();
                    if (newPass == "" || reNewPass == "") {
                        showMsg("<@spring.message code='common.js.info-no-complete' />", "info", 2000);
                        return;
                    }
                    if (newPass != reNewPass) {
                        showMsg("<@spring.message code='admin.user.profile.form.password.no-same' />", "error", 2000);
                        return;
                    }
                    var param = $('#passForm').serialize();
                    $.ajax({
                        type: 'post',
                        url: '/admin/user/changePass/proxy',
                        data: param,
                        success: function (data) {
                            if (data.code == 1) {
                                $.toast({
                                    text: data.msg,
                                    heading: '<@spring.message code="common.text.tips" />',
                                    icon: 'success',
                                    showHideTransition: 'fade',
                                    allowToastClose: true,
                                    hideAfter: 1000,
                                    stack: 1,
                                    position: 'top-center',
                                    textAlign: 'left',
                                    loader: true,
                                    loaderBg: '#ffffff',
                                    afterHidden: function () {
                                        window.location.reload();
                                    }
                                });
                            } else {
                                showMsg(data.msg, "error", 2000);
                            }
                        }
                    });
                }
            </script>
        </@compress>
    </div>
    <#include "module/_footer.ftl">
</div>
    <@footer></@footer>
</#compress>
