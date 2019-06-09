<#if posts.total &gt; 0>
    <#list (posts.records)?if_exists as post>
    <!-- 文章摘要 -->
    <article class="wow fadeInUp post type-post status-publish format-standard sticky hentry rwz"
             data-wow-delay="0.3s">
        <figure class="thumbnail">
            <span class="load">
                <a href="/article/${post.postId?if_exists}">
                    <img src="${post.postThumbnail?if_exists}" alt="${post.postTitle?if_exists}"/>
                </a>
            </span>
            <span class="cat">
                <#if (post.categories)?? && (post.categories)?size gt 0>
                    <a href="${(options.blog_url)!}/category/${(post.categories[0].cateUrl)}">${(post.categories[0].cateName)}</a>
                <#else>
                    <a href="${(options.blog_url)!}/category/default" target="_blank">未分类</a>
                </#if>
            </span>
        </figure>

        <header class="entry-header">
            <h2 class="entry-title">
                <a href="${(options.blog_url)!}/article/${post.postId?c}" rel="bookmark">
                ${post.postTitle}
                </a>
            </h2>
        </header><!-- .entry-header -->

        <div class="entry-content">
            <div class="archive-content">
            ${post.postSummary?if_exists}...
            </div>
            <span class="title-l"></span>
            <span class="new-icon"></span>
            <span class="entry-meta">
                <span class="date">${post.postDate?string("yyyy年MM月dd日")}&nbsp;&nbsp;</span>
                <span class="views"><i class="fa fa-eye"></i> ${post.postViews?c} views</span>
                <span class="comment">&nbsp;&nbsp;
                    <a href="/article/${post.postId?if_exists}#comments" rel="external nofollow">
                        <i class="fa fa-comment-o"></i> <#if post.commentSize  gt 0>${post.commentSize}<#else>
                        发表评论 </#if>
                    </a>
                </span>
            </span>
            <div class="clear"></div>
        </div><!-- .entry-content -->

        <span class="entry-more">
             <a href="/article/${post.postId?if_exists}" rel="bookmark">阅读全文</a>
        </span>
    </article><!-- #post -->
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

