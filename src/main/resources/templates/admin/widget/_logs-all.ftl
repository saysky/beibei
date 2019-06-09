<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 attachDesc" style="padding-top: 15px;">
            <div class="box box-solid">
                <div class="box-body table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th><@spring.message code='admin.logs.th.log-id' /></th>
                                <th><@spring.message code='admin.logs.th.log-action' /></th>
                                <th><@spring.message code='admin.logs.th.log-result' /></th>
                                <th>IP</th>
                                <th><@spring.message code='admin.logs.th.log-datetime' /></th>
                            </tr>
                        </thead>
                        <tbody>
                            <#list logs.records as log>
                                <tr>
                                    <td>${log.logId}</td>
                                    <td>${log.logTitle}</td>
                                    <td>${log.logContent}</td>
                                    <td>${log.logIp}</td>
                                    <td>${log.logCreated?if_exists?string("yyyy-MM-dd HH:mm")}</td>
                                </tr>
                            </#list>
                        </tbody>
                    </table>
                </div>
                <div class="box-footer clearfix">
                    <div class="no-margin pull-left">
                        <@spring.message code='admin.pageinfo.text.no' />${logs.current}/${logs.pages}<@spring.message code='admin.pageinfo.text.page' />
                    </div>
                    <div class="no-margin pull-right">
                    <#assign hasPrevious = (logs.current > 1)>
                    <#assign hasNext = (logs.current < logs.pages)>
                        <ul class="pagination" style="margin: 0;">
                            <li><a class="btn btn-sm <#if !hasPrevious>disabled</#if>" href="/admin/logs"><@spring.message code='admin.pageinfo.btn.first' /></a> </li>
                            <li><a class="btn btn-sm <#if !hasPrevious>disabled</#if>" href="/admin/logs?page=${logs.current-1}"><@spring.message code='admin.pageinfo.btn.pre' /></a></li>
                            <li><a class="btn btn-sm <#if !hasNext>disabled</#if>" href="/admin/logs?page=${logs.current+1}"><@spring.message code='admin.pageinfo.btn.next' /></a></li>
                            <li><a class="btn btn-sm <#if !hasNext>disabled</#if>" href="/admin/logs?page=${logs.pages}"><@spring.message code='admin.pageinfo.btn.last' /></a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${options.blog_static_url?if_exists}/static/plugins/jquery/jquery.min.js"></script>
<script src="${options.blog_static_url?if_exists}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
</html>
