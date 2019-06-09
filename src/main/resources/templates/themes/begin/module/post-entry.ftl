<#if posts.total &gt; 0>
    <#list (posts.records)?if_exists as post>
        <!-- 文章摘要 -->
        <#if post.jumpUrl == "" ||  post.jumpUrl == " ">
            <article class="tao type-tao status-publish has-post-thumbnail hentry taobao-free taotag-docker rwz">
                <div class="tao-box wow fadeInUp" data-wow-delay="0.3s" style="border-radius: 25px 25px 25px 25px;height: 210px;">
                    <figure class="tao-img" style="margin-top: 15px;">
                        <a href="/article/${post.postId?if_exists}"><img
                                    width="100%" height="120"
                                    src="${post.postThumbnail?if_exists}"
                                    class="attachment-tao size-tao wp-post-image" alt="${post.postTitle?if_exists}">
                        </a>
                        <span class="cat" style="position: absolute;right: 79px;top: 125px;">
                         <a href="/article/${post.postId}">文</a>
                     </span>
                        <span class="cat" style="position: absolute;right: 47px;top: 125px;">
                         <a href="${post.videoUrl?if_exists}" target="_blank">视</a>
                     </span>
                        <span class="cat" style="position: absolute;right: 15px;top: 125px;">
                         <a href="${post.dataUrl?if_exists}" target="_blank">素</a>
                    </figure>

                    <div class="product-box">
                        <h2>
                            <a href="/article/${post.postId?if_exists}"
                               rel="bookmark">${post.postTitle?if_exists}</a>
                        </h2>
                        <div class="ded">
                       <span class="entry-meta" style="font-size: 0.5em;">
                            <span class="date">${post.postDate?string("yyyy年MM月dd日")}</span>
                            <span class="views"><i class="fa fa-eye"></i>
                                <#if post.postViews gt 999>
                                    ${post.postViews/1000}k
                                <#else>
                                    ${post.postViews?c}
                                </#if>
                            </span>
                            <span class="comment">
                                <a href="/article/${post.postId?if_exists}#comments" rel="external nofollow">
                                    <i class="fa fa-comment-o"></i>
                                    <#if (post.commentSize)?default(0) gt 99>
                                        99+
                                    <#else>
                                        ${post.commentSize?c}
                                    </#if>
                                </a>
                            </span>

                        </span>

                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </article>
        <#else>
            <article class="tao type-tao status-publish has-post-thumbnail hentry taobao-free taotag-docker rwz">
                <div class="tao-box wow fadeInUp" data-wow-delay="0.3s" style="border-radius: 25px 25px 25px 25px;height: 210px;">
                    <figure class="tao-img" style="margin-top: 15px;">
                        <a href="${post.jumpUrl?if_exists}" target="_blank"><img
                                    width="100%" height="80"
                                    src="${post.postThumbnail?if_exists}"
                                    class="attachment-tao size-tao wp-post-image" alt="${post.postTitle?if_exists}">
                        </a>
                        <span class="cat" style="position: absolute;right: 15px;top: 85px;">
                         <a href="${post.jumpUrl?if_exists}" target="_blank">往</a>
                     </span>
                    </figure>

                    <div class="product-box">
                        <h2 style="text-align: center;">
                            <a href="${post.jumpUrl?if_exists}" target="_blank"
                               rel="bookmark">${post.postTitle?if_exists}</a>
                        </h2>
                        <div class="ded" style="font-size: 0.5em;max-height:66px;overflow:hidden;line-height: 22px;">
                            ${post.postSummary?if_exists}
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </article>

        </#if>
        <!-- 文章摘要 -->
    </#list>

<#else>
    <section class="no-results not-found">
        <div class="post">
            <p>目前还没有文章！可以尝试使用下面的搜索功能，查找您喜欢的文章！</p>
            <div class="searchbar">
                <form method="get" id="searchform" action="/search">
                    <span>
                        <input type="text" value="" name="keyword" id="keyword" placeholder="输入搜索内容" required="">
                        <button type="submit" id="searchsubmit">搜索</button>
                    </span>
                </form>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div><!-- .page-content -->
    </section>
</#if>

