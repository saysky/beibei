<div id="sidebar" class="widget-area all-sidebar">
    <#if is_category?if_exists>
        <style type="text/css">
            * {
                margin: 0;
                padding: 0;
                list-style-type: none;
            }

            a, img {
                border: 0;
                text-decoration: none;
            }

            body {
                font: 12px/180% Arial, Helvetica, sans-serif, "新宋体";
            }


            .subNav {
                border-top: solid 1px #e5e3da;
                cursor: pointer;
                font-weight: bold;
                font-size: 14px;
                color: #999;
                line-height: 28px;
                padding-left: 10px;
                background: url(/begin/assets/img/jiantou1.jpg) no-repeat;
                background-position: 95% 50%
            }

            .currentDt {
                background-image: url(/begin/assets/img/jiantou.jpg);
            }

            .navContent {
                display: none;
                padding: 0 !important;
            }

            .navContent li {
                border-top: solid 1px #e5e3da;
                width: 100% !important;
            }

            .navContent li a {
                display: block;
                heighr: 28px;
                font-size: 14px;
                line-height: 28px;
                padding-left: 10px;
            }
        </style>
        <script type="text/javascript">
            $(function () {
                $(".subNav").click(function () {
                    $(this).toggleClass("currentDd").siblings(".subNav").removeClass("currentDd");
                    $(this).toggleClass("currentDt").siblings(".subNav").removeClass("currentDt");
                    $(this).next(".navContent").slideToggle(300).siblings(".navContent").slideUp(500);
                })
            })
        </script>
        <aside class="widget widget_text wow fadeInUp" data-wow-delay="0.3s"><h3
                    class="widget-title"><i class="fa fa-bars"></i>当前分类</h3>
            <div class="subNavBox">
                <ul class="navContent" style="display:block">
                    <#list  categories as cate>
                        <li><a href="/category/${cate.cateUrl}">${cate.cateName}</a></li>
                    </#list>
                </ul>
            </div>
            <div class="clear"></div>
        </aside>


    <#elseif is_post?if_exists>
        <aside class="widget hot_comment wow fadeInUp" data-wow-delay="0.3s">
            <h3 class="widget-title"><i class="fa fa-bars"></i>相关文章</h3>
            <div id="hot_comment_widget">
                <ul>
                    <#list relatedPosts?if_exists as hot>
                        <li>
                            <span class='li-icon li-icon-${hot_index+1}'>${hot_index+1}</span>
                            <a href="${(options.blog_url)!}/article/${hot.postId}" rel="bookmark"
                               title=" ${hot.postViews} views">
                                ${hot.postTitle}</a>
                        </li>
                    </#list>
                </ul>
            </div>
            <div class="clear"></div>
        </aside>

    <@widgetTag method="sidebarWidgets">
    <#list sidebarWidgets as widget>
    <#if widget.isDisplay == 1>
        <aside id="text-${widget.widgetId}" class="widget widget_text wow fadeInUp" data-wow-delay="0.3s"><h3
                    class="widget-title"><i class="fa fa-bars"></i>支持本站</h3>
            <div class="textwidget">
                ${(widget.widgetContent)!}
            </div>
            <div class="clear"></div>
        </aside>
    </#if>
    </#list>
    </@widgetTag>
    <#else>
    <#--首页文章列表-->
        <aside class="widget about wow fadeInUp" data-wow-delay="0.3s">
            <h3 class="widget-title">
                <i class="fa fa-bars"></i>关于本站
            </h3>
            <div id="feed_widget">
                <div class="feed-about">
                    <div class="about-main">
                        <div class="about-img">
                            <img src="${(options.theme_begin_sns_about_picture)!}" alt="QR Code"/>
                        </div>
                        <div class="about-name">${(options.theme_begin_sns_about_title)!}</div>
                        <div class="about-the">${(options.theme_begin_sns_about_desc)!}</div>
                    </div>
                    <div class="clear"></div>
                    <ul>
                        <li class="weixin">
                        <span>
                            <a title="微信" target="_blank" href="${(options.theme_begin_sns_weixin)!}"><i
                                        class="fa fa-weixin"></i>
                            </a>
                        </span>
                        </li>
                        <li class="tqq">
                            <a target=blank rel="external nofollow"
                               href=http://wpa.qq.com/msgrd?V=3&uin=${(options.theme_begin_sns_qq)!}&Site=QQ&Menu=yes
                               title="QQ在线">
                                <i class="fa fa-qq"></i>
                            </a>
                        </li>
                        <li class="tsina">
                            <a title=""
                               href="http://weibo.com/${(options.theme_begin_sns_weibo)!}/profile?rightmod=1&wvr=6&mod=personinfo&is_all=1"
                               target="_blank" rel="external nofollow"><i class="fa fa-weibo"></i></a>
                        </li>
                        <li class="feed">
                            <a title="" href="https://github.com/${(options.theme_begin_sns_github)!}"
                               target="_blank"
                               rel="external nofollow"><i class="fa fa-github"></i></a></li>
                    </ul>
                    <div class="about-inf">
                        <span class="about-pn">文章 <@countTag method="postsCount">${postsCount?default(0)}</@countTag></span>
                        <span class="about-cn">留言 <@countTag method="commentsCount">${commentsCount?default(0)}</@countTag></span>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </aside>

        <aside class="widget wow fadeInUp" data-wow-delay="0.3s">
            <h3 class="widget-title">
                <i class="fa fa-bars"></i>网站概况
            </h3>
            <div class="widget-text">
                <ul class="site-profile">
                    <li><i class="fa fa-file-o"></i>
                        文章总数：<@countTag method="postsCount">${postsCount?default(0)}</@countTag> 篇
                    </li>
                    <li><i class="fa fa-commenting-o"></i>
                        留言数量：<@countTag method="commentsCount">${commentsCount?default(0)}</@countTag> 条
                    </li>
                    <li><i class="fa fa-folder-o"></i>
                        分类数量：<@countTag method="categoriesCount">${categoriesCount?default(0)}</@countTag> 个
                    </li>
                    <li><i class="fa fa-tags"></i>
                        标签总数：<@countTag method="tagsCount">${tagsCount?default(0)}</@countTag> 个
                    </li>
                    <li><i class="fa fa-link"></i>
                        链接数量：<@countTag method="linksCount">${linksCount?default(0)}</@countTag>
                        个
                    </li>
                    <li><i class="fa fa-clock-o"></i> 运行时间：<span id="blogStart"></span> 天</li>
                    <li><i class="fa fa-eye"></i>
                        浏览总量：<@countTag method="viewsCount">${viewsCount?default(0)}</@countTag> 次
                    </li>
                    <li><i class="fa fa-pencil-square-o"></i> 最后更新：
                        <span style="color:#2F889A"><@countTag method="lastUpdateTime">${lastUpdateTime?if_exists?string("yyyy年MM月dd日")}</@countTag></span>
                    </li>
                </ul>
                <script>
                    var dateBegin = new Date("${options.blog_start?default('0000-00-00')}");
                    var dateEnd = new Date();
                    var parseDate = dateEnd.getTime() - dateBegin.getTime();
                    var days = Math.floor(parseDate / (24 * 3600 * 1000));
                    document.getElementById('blogStart').innerHTML = days + 1;
                </script>
            </div>
            <div class="clear"></div>
        </aside>

        <aside class="widget hot_comment wow fadeInUp" data-wow-delay="0.3s">
            <h3 class="widget-title"><i class="fa fa-bars"></i>阅读榜</h3>
            <div id="hot_comment_widget">
                <ul>
                    <@articleTag method="hotPosts">
                        <#list hotPosts?if_exists as hot>
                            <li>
                                <span class='li-icon li-icon-${hot_index+1}'>${hot_index+1}</span>
                                <a href="${(options.blog_url)!}/article/${hot.postId}" rel="bookmark"
                                   title=" ${hot.postViews} views">
                                    ${hot.postTitle}</a>
                            </li>
                        </#list>
                    </@articleTag>
                </ul>
            </div>
            <div class="clear"></div>
        </aside>

        <aside class="widget recent_comments wow fadeInUp" data-wow-delay="0.3s">
            <h3 class="widget-title"><i class="fa fa-bars"></i>近期评论</h3>
            <div id="message" class="message-widget">
                <ul>
                    <@commonTag method="topTenComments">
                        <#list topTenComments as c>
                            <li>
                                <a href="/post/${c.postId?c}#comment-id-${c.commentId?c}" title=""
                                   rel="external nofollow">
                                    <#if (comment.commentAuthorAvatar)??>
                                        <img src="${comment.commentAuthorAvatar}" alt="avatar" class="avatar avatar-128"
                                             height="128" width="128">
                                    <#else>
                                        <img src="//gravatar.loli.net/avatar/${c.commentAuthorEmailMd5?if_exists}?s=256&d=${options.native_comment_avatar?default('mm')}"
                                             alt="avatar" class="avatar avatar-128" height="128" width="128">
                                    </#if>

                                    <span class="comment_author"><strong>${c.commentAuthor}</strong></span>
                                    <#if c.commentContent?length gt 50>
                                        ${c.commentContent?substring(0,50)}...
                                    <#else>
                                        ${c.commentContent!}
                                    </#if>
                                </a>
                            </li>
                        </#list>
                    </@commonTag>
                </ul>
            </div>
            <div class="clear"></div>
        </aside>

    </#if>
</div>