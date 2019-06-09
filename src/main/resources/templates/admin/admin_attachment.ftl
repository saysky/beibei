<#compress >
    <#include "module/_macro.ftl">
    <@head>${options.blog_title} | <@spring.message code='admin.attachments.title' /></@head>
<div class="wrapper">
    <!-- 顶部栏模块 -->
    <#include "module/_header.ftl">
    <!-- 菜单栏模块 -->
    <#include "module/_sidebar.ftl">
    <div class="content-wrapper">
        <style type="text/css" rel="stylesheet">
            #showForm {
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

            #showForm:hover {
                background: #3c8dbc;
                color: #fff
            }

            .div-thumbnail {
                transition: all .5s ease-in-out;
                padding: 10px
            }

            .thumbnail {
                margin-bottom: 0
            }
        </style>
        <section class="content-header">
            <h1 style="display: inline-block;"><@spring.message code='admin.attachments.title' /></h1>
            <a id="showForm" href="#">
                <i class="fa fa-cloud-upload"
                   aria-hidden="true"></i><@spring.message code='admin.attachments.btn.upload' />
            </a>
            <ol class="breadcrumb">
                <li><a data-pjax="true" href="/admin"><i
                        class="fa fa-dashboard"></i> <@spring.message code='admin.index.bread.index' /></a></li>
                <li class="active"><@spring.message code='admin.attachments.title' /></li>
            </ol>
        </section>
        <section class="content container-fluid">
            <div class="row" id="uploadForm" style="display: none;">
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="file-loading">
                            <input id="uploadImg" class="file-loading" type="file" multiple name="file">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-6 pull-right">
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control input-group-lg" id="keywords" name="keywords"
                                   value="${(RequestParameters.keywords)!}" placeholder="搜索附件文件">
                        </div>
                    </form>
                </div>
                <div class="clear"></div>
                <div id="attachment-box">
                    <#list attachments.records as attachment>
                        <div class="col-lg-2 col-md-3 col-sm-6 col-xs-6 div-thumbnail"
                             onclick="openDetail(${attachment.attachId?c})">
                            <a href="#" class="thumbnail">
                                <img src="${attachment.attachSmallPath?if_exists}" class="img-responsive"
                                     title="${(attachment.attachName)!}">
                            </a>
                        </div>
                    </#list>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <#assign hasPrevious = (attachments.current > 1)>
                    <#assign hasNext = (attachments.current < attachments.pages)>
                    <div class="no-margin pull-left">
                        <@spring.message code='admin.pageinfo.text.no' />
                        <span id="pageNum">${attachments.current}</span>
                        /${attachments.pages}<@spring.message code='admin.pageinfo.text.page' />
                    </div>
                    <ul class="pagination no-margin pull-right">
                        <li><a data-pjax="true" class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                               href="/admin/attachment"><@spring.message code='admin.pageinfo.btn.first' /></a></li>
                        <li><a data-pjax="true" class="btn btn-sm <#if !hasPrevious>disabled</#if>"
                               href="/admin/attachment?page=${attachments.current-1}"><@spring.message code='admin.pageinfo.btn.pre' /></a>
                        </li>
                        <li><a data-pjax="true" class="btn btn-sm <#if !hasNext>disabled</#if>"
                               href="/admin/attachment?page=${attachments.current+1}"><@spring.message code='admin.pageinfo.btn.next' /></a>
                        </li>
                        <li><a data-pjax="true" class="btn btn-sm <#if !hasNext>disabled</#if>"
                               href="/admin/attachment?page=${attachments.pages}"><@spring.message code='admin.pageinfo.btn.last' /></a>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <script type="application/javascript">
            function openDetail(id) {
                layer.open({
                    type: 2,
                    title: '<@spring.message code="admin.attachments.js.modal.detail-title" />',
                    shadeClose: true,
                    shade: 0.5,
                    maxmin: true,
                    area: ['90%', '90%'],
                    content: '/admin/attachment/detail?attachId=' + id,
                    scrollbar: false
                });
            }

            function loadFileInput() {
                $('#uploadImg').fileinput({
                    language: 'zh',
                    uploadUrl: '/admin/attachment/upload',
                    uploadAsync: true,
//                    allowedFileExtensions: ['jpg','gif','png','jpeg','svg','psd'],
                    maxFileCount: 100,
                    enctype: 'multipart/form-data',
                    showClose: false
                }).on("fileuploaded", function (event, data, previewId, index) {
                    var data = data.jqXHR.responseJSON;
                    if (data.success == "1") {
                        $("#uploadForm").hide(400);
                        $.toast({
                            text: data.message,
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
                    }
                });
            }

            $(document).ready(function () {
                loadFileInput();
            });
                <#if options.admin_pjax?default("true") == "true">
                $(document).on('pjax:complete', function () {
                    loadFileInput();
                });
                </#if>
            $("#showForm").click(function () {
                $("#uploadForm").slideToggle(400);
            });

            <#--var winH = $(window).height(); //页面可视区域高度-->
            <#--var i = 1;-->
            <#--var max = ${attachments.pages};-->
            <#--$(window).scroll(function () {-->
            <#--    var pageH = $(document.body).height();-->
            <#--    var scrollT = $(window).scrollTop(); //滚动条top-->
            <#--    var aa = (pageH - winH - scrollT) / winH;-->
            <#--    if (aa < 0.02 && i < max) {-->
            <#--        i++;-->
            <#--        $("#pageNum").html(i);-->
            <#--        var keywords = $('#keywords').val();-->
            <#--        $.ajax({-->
            <#--            type: 'GET',-->
            <#--            url: '/admin/attachment/page?page=' + i + '&keywords=' + keywords,-->
            <#--            success: function (data) {-->
            <#--                if (data.code == 1) {-->
            <#--                    console.log(data);-->
            <#--                    var str = '';-->
            <#--                    $.each(data.result, function (index, value) {-->
            <#--                        str += '<div class="col-lg-2 col-md-3 col-sm-6 col-xs-6 div-thumbnail"\n' +-->
            <#--                                '     onclick="openDetail(' + value.attachId + ')">\n' +-->
            <#--                                '     <a href="#" class="thumbnail">\n' +-->
            <#--                                '         <img src="' + value.attachSmallPath + '" class="img-responsive"\n' +-->
            <#--                                '          title="' + value.attachName + '">\n' +-->
            <#--                                '     </a>\n' +-->
            <#--                                '</div>';-->
            <#--                    });-->
            <#--                    console.log(str);-->
            <#--                    $("#attachment-box").append(str);-->
            <#--                } else {-->
            <#--                    showMsg(data.msg, "error", 1000);-->
            <#--                }-->
            <#--            }-->
            <#--        })-->
            <#--    }-->
            <#--});-->
        </script>
    </div>
    <#include "module/_footer.ftl">
</div>
    <@footer></@footer>
</#compress>
