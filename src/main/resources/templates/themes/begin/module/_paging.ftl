<#if posts.pages &gt; 0>
    <div style="text-align: center;margin-top: 20px;">
        <div class="clear"></div>
        <nav class="navigation pagination" role="navigation">
            <h2 class="screen-reader-text">文章导航</h2>
            <div class="nav-links">
                <br>
                <#assign totalPages = posts.pages>
                <#assign totalElements = posts.total>
                <#assign number = posts.current>
                <#assign first = (posts.current == 1)>
                <#assign last = (posts.current == posts.pages)>
                <#assign hasPrevious = (posts.current > 1)>
                <#assign hasNext = (posts.current < posts.pages)>

                <#--上一页-->
                <#if hasPrevious>
                    <a class="prev page-numbers" href="${prefix}/page/${number-1}${suffix?if_exists}">
                        <i class="fa fa-angle-left"></i>
                    </a>
                </#if>

                <#--总页数小于等于7全部显示-->
                <#if totalPages <= 7>
                    <#if totalPages gt 1>
                        <#list 1..totalPages-1 as pageIndex>
                            <a class="page-numbers <#if number == pageIndex>current</#if>"
                               href="${prefix}/page/${pageIndex}${suffix?if_exists}">
                                <span class="screen-reader-text">第 </span>${pageIndex}<span class="screen-reader-text"> 页</span>
                            </a>
                        </#list>
                    </#if>

                <#--总页数大于7，部分以...显示-->
                <#else>
                <#--首页-->
                    <#if first>
                        <span class="page-numbers current">
                <span class="screen-reader-text">第 </span>1<span class="screen-reader-text"> 页</span>
            </span>
                    <#else>
                        <a class="page-numbers" href="${prefix}/page/1${suffix?if_exists}">
                            <span class="screen-reader-text">第 </span>1<span class="screen-reader-text"> 页</span>
                        </a>
                    </#if>


                <#--当前页面小于等于4-->
                    <#if number  <= 3 >
                        <#list 2..5 as pageIndex>
                            <#if number == pageIndex>
                                <span class="page-numbers current">
                         <span class="screen-reader-text">第 </span>${pageIndex}<span
                                            class="screen-reader-text"> 页</span>
                     </span>
                            <#else>
                                <a class="page-numbers" href="${prefix}/page/${pageIndex}${suffix?if_exists}">
                                    <span class="screen-reader-text">第 </span>${pageIndex}<span
                                            class="screen-reader-text"> 页</span>
                                </a>
                            </#if>
                        </#list>
                        <span class="page-numbers dots">…</span>
                    </#if>

                <#--最后一页与当前页面之差，小于等于3-->
                    <#if (totalPages - number ) <= 4 >
                        <span class="page-numbers dots">…</span>
                        <#list (totalPages - 4)..(totalPages - 1) as pageIndex2>
                            <#if number == pageIndex2>
                                <span class="page-numbers current">
                         <span class="screen-reader-text">第 </span>${pageIndex2}<span
                                            class="screen-reader-text"> 页</span>
                     </span>
                            <#else>
                                <a class="page-numbers" href="${prefix}/page/${pageIndex2}${suffix?if_exists}">
                                    <span class="screen-reader-text">第 </span>${pageIndex2}<span
                                            class="screen-reader-text"> 页</span>
                                </a>
                            </#if>
                        </#list>
                    </#if>

                <#--最后一页与当前页面之差大于3，且当前页面大于4-->

                    <#if (number  > 3) && ((totalPages - number) > 4 )>
                        <span class="page-numbers dots">…</span>
                        <a class="page-numbers" href="${prefix}/page/${number-1}${suffix?if_exists}">
                            <span class="screen-reader-text">第 </span>${number-1}<span
                                    class="screen-reader-text"> 页</span>
                        </a>
                        <span class="page-numbers current">
                <span class="screen-reader-text">第 </span>${number}<span class="screen-reader-text"> 页</span>
            </span>
                        <a class="page-numbers" href="${prefix}/page/${number+1}${suffix?if_exists}">
                            <span class="screen-reader-text">第 </span>${number+1}<span
                                    class="screen-reader-text"> 页</span>
                        </a>
                        <span class="page-numbers dots">…</span>
                    </#if>

                </#if>

                <#--尾页-->
                <a class="page-numbers <#if number == totalPages>current</#if>"
                   href="${prefix}/page/${totalPages}${suffix?if_exists}">
                    <span class="screen-reader-text">第 </span>${totalPages}<span class="screen-reader-text"> 页</span>
                </a>

                <#--下一页-->
                <#if hasNext>
                    <a class="next page-numbers" href="${prefix}/page/${number+1}${suffix?if_exists}">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </#if>
            </div>
        </nav>
        <div class="clear"></div>
    </div>
</#if>