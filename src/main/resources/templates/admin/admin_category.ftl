<#compress >
    <#include "module/_macro.ftl">
    <@head>${options.blog_title} | <@spring.message code='admin.categories.title' /></@head>
<div class="wrapper">
    <!-- 顶部栏模块 -->
    <#include "module/_header.ftl">
    <!-- 菜单栏模块 -->
    <#include "module/_sidebar.ftl">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <@spring.message code='admin.categories.title' />
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li>
                    <a data-pjax="true" href="/admin">
                        <i class="fa fa-dashboard"></i> <@spring.message code='admin.index.bread.index' /></a>
                </li>
                <li><a data-pjax="true" href="#"><@spring.message code='admin.categories.bread.posts' /></a></li>
                <li class="active"><@spring.message code='admin.categories.title' /></li>
            </ol>
        </section>
        <section class="content container-fluid">
            <div class="row">
                <div class="col-md-5">
                    <div class="box box-primary">
                        <#if updateCategory??>
                            <div class="box-header with-border">
                                <h3 class="box-title"><@spring.message code='admin.categories.text.edit-category' /> <#if updateCategory??>
                                    [${updateCategory.cateName}]</#if></h3>
                            </div>
                            <form action="/admin/category/save" method="post" role="form" id="cateForm">
                                <input type="hidden" name="cateId" value="${updateCategory.cateId?c}">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="cateName"><@spring.message code='admin.categories.form.cate-name' /></label>
                                        <input type="text" class="form-control" id="cateName" name="cateName"
                                               value="${updateCategory.cateName?if_exists}">
                                        <small><@spring.message code='admin.categories.form.cate-name-tips' /></small>
                                    </div>
                                    <div class="form-group">
                                        <label for="cateUrl"><@spring.message code='admin.categories.form.cate-url' /></label>
                                        <input type="text" class="form-control" id="cateUrl" name="cateUrl"
                                               value="${updateCategory.cateUrl?if_exists}">
                                        <small><@spring.message code='admin.categories.form.cate-url-tips' /></small>
                                    </div>
                                    <div class="form-group">
                                        <label for="catePid"><@spring.message code='admin.categories.form.cate-pid' /></label>
                                        <select class="form-control" id="catePid" name="catePid">
                                            <option value="0"><@spring.message code='common.none.parent.node'/></option>
                                            <#list categories as c>
                                                <option value="${c.cateId}"
                                                        <#if updateCategory.catePid?default(1) == c.cateId>selected</#if>>${c.cateName}</option>
                                            </#list>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="cateSort"><@spring.message code='admin.categories.form.cate-sort' /></label>
                                        <input type="text" class="form-control" id="cateSort" name="cateSort"
                                               value="${updateCategory.cateSort?if_exists}">
                                    </div>
                                    <div class="form-group">
                                        <label for="cateDesc"
                                               class="control-label"><@spring.message code='admin.categories.form.cate-desc' /></label>
                                        <textarea class="form-control" rows="3" id="cateDesc" name="cateDesc"
                                                  style="resize: none">${updateCategory.cateDesc?if_exists}</textarea>
                                        <small><@spring.message code='admin.categories.form.cate-desc-tips' /></small>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button type="button"
                                            class="btn btn-primary btn-sm "
                                            onclick="saveCategory()"><@spring.message code='common.btn.define-edit' /></button>
                                    <a data-pjax="true" href="/admin/category"
                                       class="btn btn-info btn-sm "><@spring.message code='common.btn.back-to-add' /></a>
                                </div>
                            </form>
                        <#else >
                            <div class="box-header with-border">
                                <h3 class="box-title"><@spring.message code='admin.categories.text.add-category' /></h3>
                            </div>
                            <form action="/admin/category/save" method="post" role="form" id="cateForm">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="cateName"><@spring.message code='admin.categories.form.cate-name' /></label>
                                        <input type="text" class="form-control" id="cateName" name="cateName"
                                               placeholder="">
                                        <small><@spring.message code='admin.categories.form.cate-name-tips' /></small>
                                    </div>
                                    <div class="form-group">
                                        <label for="cateUrl"><@spring.message code='admin.categories.form.cate-url' /></label>
                                        <input type="text" class="form-control" id="cateUrl" name="cateUrl"
                                               placeholder="">
                                        <small><@spring.message code='admin.categories.form.cate-url-tips' /></small>
                                    </div>
                                    <div class="form-group">
                                        <label for="catePid"><@spring.message code='admin.categories.form.cate-pid' /></label>
                                        <select class="form-control" id="catePid" name="catePid">
                                            <option value="0"><@spring.message code='common.none.parent.node'/></option>
                                            <#list categories as c>
                                                <option value="${c.cateId}">${c.cateName}</option>
                                            </#list>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="cateSort"><@spring.message code='admin.categories.form.cate-sort' /></label>
                                        <input type="text" class="form-control" id="cateSort" name="cateSort" value="1">
                                    </div>
                                    <div class="form-group">
                                        <label for="cateDesc"
                                               class="control-label"><@spring.message code='admin.categories.form.cate-desc' /></label>
                                        <textarea class="form-control" rows="3" id="cateDesc" name="cateDesc"
                                                  style="resize: none"></textarea>
                                        <small><@spring.message code='admin.categories.form.cate-desc-tips' /></small>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button type="button"
                                            class="btn btn-primary btn-sm "
                                            onclick="saveCategory()"><@spring.message code='common.btn.define-add' /></button>
                                </div>
                            </form>
                        </#if>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><@spring.message code='admin.categories.text.all-categories' /></h3>
                        </div>
                        <div class="box-body table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th><@spring.message code='common.th.name' /></th>
                                    <th><@spring.message code='common.th.url' /></th>
                                    <th><@spring.message code='common.th.posts-count' /></th>
                                    <th><@spring.message code='common.th.control' /></th>
                                </tr>
                                </thead>
                                <tbody>
                                    <#list categories as cate>
                                    <tr>
                                        <td>${cate.cateName}</td>
                                        <td><a href="/category/${cate.cateUrl?if_exists}"
                                               target="_blank">${cate.cateUrl?if_exists}</a></td>
                                        <td>
                                    <span class="label"
                                          style="background-color: #d6cdcd;">${cate.count?if_exists}</span>
                                        </td>
                                        <td>
                                            <#if cate.cateUrl?if_exists != 'default'>
                                                <#if updateCategory?? && updateCategory.cateId?c==cate.cateId?c>
                                                    <a href="#" class="btn btn-primary btn-xs "
                                                       disabled><@spring.message code='common.btn.editing' /></a>
                                                <#else >
                                                    <a data-pjax="true"
                                                       href="/admin/category/edit?cateId=${cate.cateId?c}"
                                                       class="btn btn-primary btn-xs "><@spring.message code='common.btn.modify' /></a>
                                                </#if>
                                                <button class="btn btn-danger btn-xs delete-category"
                                                        onclick="removeIt(${cate.cateId?c})"><@spring.message code='common.btn.delete' /></button>
                                            </#if>
                                        </td>
                                    </tr>
                                    </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>

            function saveCategory() {
                $.ajax({
                    type: 'POST',
                    url: '/admin/category/save',
                    async: false,
                    data: $("#cateForm").serialize(),
                    success: function (data) {
                        if (data.code == 0) {
                            showMsg(data.msg, "error", 2000);
                        } else {
                            showMsgAndRedirect(data.msg, "success", 2000, "/admin/category");
                        }
                    }
                });
            };

            function removeIt(cateId) {
                layer.confirm('<@spring.message code="common.text.define-delete" />', function (index) {
                    $.ajax({
                        type: 'GET',
                        url: '/admin/category/remove',
                        async: false,
                        data: {
                            'cateId': cateId
                        },
                        success: function (data) {
                            if (data.code == 0) {
                                showMsg(data.msg, "error", 2000);
                            } else {
                                showMsgAndRedirect(data.msg, "success", 2000, "/admin/category");
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
