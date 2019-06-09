<@compress single_line=true>
    <link type="text/css" rel="stylesheet" href="${options.blog_static_url?if_exists}/static/plugins/OwO/OwO.min.css">
    <style>
        ${options.native_css?if_exists}
    </style>

    <div id="comments" class="comments-area">
        <div id="respond" class="comment-respond wow fadeInUp" data-wow-delay="0.3s">
            <h3 id="reply-title" class="comment-reply-title">发表评论
                <small>
                    <a rel="nofollow" id="cancel-comment-reply-link" href="javascript:void(0)"
                       style="display: none;">取消回复</a>
                </small>
            </h3>

            <form action="" method="post">
                <@shiro.authenticated>
                    <div class="user_avatar">
                        <img alt="<@shiro.principal  property="userDisplayName"/>"
                             src="<@shiro.principal  property="userAvatar"/>"
                             class="avatar avatar-64 photo" style="width:48px;height:48px;"> 登录者：<a
                                href="/admin/user/profile"><@shiro.principal  property="userDisplayName"/></a><br>
                        <a href="/admin/logOut">登出</a>
                    </div>
                </@shiro.authenticated>

                <p class="comment-form-comment">
                <div class="OwO"></div>
                <textarea id="commentContent" class="comment-input-content" name="commentContent" rows="4"
                          tabindex="1" placeholder="${(options.native_comment_placeholder)!}"></textarea>
                <div class="native-message" style="display: none"></div>
                </p>
                <@shiro.authenticated>
                    <div id="comment-author-info" style="display: none;">
                        <p class="comment-form-author">
                            <label for="author">昵称<span class="required">*</span></label>
                            <input type="text" class="comment-input comment-input-who" name="commentAuthor"
                                   id="commentAuthor" value="<@shiro.principal property="userDisplayName"/>">

                        </p>
                        <p class="comment-form-email">
                            <label for="email">邮箱<span class="required">*</span></label>
                            <input type="text" class="comment-input comment-input-email" name="commentAuthorEmail"
                                   id="commentAuthorEmail" value="<@shiro.principal property="userEmail"/>">
                        </p>
                        <p class="comment-form-url">
                            <label for="url">网址</label>
                            <input type="text" class="comment-input comment-input-website" name="commentAuthorUrl"
                                   id="commentAuthorUrl">
                        </p>
                    </div>
                </@shiro.authenticated>
                <@shiro.guest>
                    <div id="comment-author-info">
                        <p class="comment-form-author">
                            <label for="author">昵称<span class="required">*</span></label>
                            <input type="text" class="comment-input comment-input-who" name="commentAuthor"
                                   id="commentAuthor">

                        </p>
                        <p class="comment-form-email">
                            <label for="email">邮箱<span class="required">*</span></label>
                            <input type="text" class="comment-input comment-input-email" name="commentAuthorEmail"
                                   id="commentAuthorEmail">
                        </p>
                        <p class="comment-form-url">
                            <label for="url">网址</label>
                            <input type="text" class="comment-input comment-input-website" name="commentAuthorUrl"
                                   id="commentAuthorUrl">
                        </p>
                    </div>
                </@shiro.guest>
                <div class="clear"></div>
                <p class="form-submit">

                    <input id="submit" name="submit" type="button" tabindex="5" value="提交评论">
                    <input type="hidden" name="postId" value="${post.postId?c}">
                    <input type="hidden" name="commentParent" id="commentParent" value="0">
                </p>

            </form>

        </div>

        <#if comments?size gt 0>

            <#if post.commentSize gt 0>
                <h2 class="comments-title wow fadeInUp" data-wow-delay="0.3s">
                    目前评论：${post.commentSize}</h2>
            </#if>
            <#macro childComments comments>
                <ul class="comment-list children">
                    <#if comments?? && comments?size gt 0>
                        <#list comments?sort_by("commentDate") as comment>
                            <li class="comment even thread-even parent" id="comment-id-${comment.commentId?c}">
                                <div class="comment-body">
                                    <div class="comment-author vcard">
                                        <#if (comment.commentAuthorAvatar)??>
                                            <img class="avatar" src="${comment.commentAuthorAvatar}" alt="avatar">
                                        <#else>
                                            <img class="avatar"
                                                 src="//gravatar.loli.net/avatar/${comment.commentAuthorEmailMd5?if_exists}?s=256&d=${options.native_comment_avatar?default('mm')}"
                                                 alt="avatar">
                                        </#if>
                                        <strong>
                                            <a href="${(comment.commentAuthorUrl)!'javascript:void(0)'}"
                                               rel="external nofollow"
                                               class="native-list-one-head-name"
                                               target="_blank">${comment.commentAuthor}</a>
                                        </strong>

                                        <#if comment.isAdmin?default(0) == 1>
                                            <i class="fa fa-black-tie" style="color: #c40000;"></i>
                                            <span class=""
                                                  style="margin-top: 2px!important;color: #c40000;font-size: 13px;;"><b>作者</b></span>
                                        </#if>
                                        <span class="comment-meta commentmetadata native-comment-ua ">
                                        <span class="ua-info" style="display: none;">
                                            <span class="WB-OS  native-comment-ua-info" style="display: none;">
                                            ${comment.commentAgent?if_exists}
                                            </span> 江苏省 移动
                                        </span>
                                        <br>
                                        <span class="comment-aux">
                                            <span class="reply">
                                                <a rel="nofollow" at="${comment.commentId?c}"
                                                   class="native-list-one-footer-reback"
                                                   href="javascript:void(0)">回复</a>
                                            </span>
                                        ${comment.commentDate?string("yyyy-MM-dd HH:mm")}
                                            <#if isAuthor?if_exists>
                                                <a class="comment-delete-link" data-id="${comment.commentId}"
                                                   href="javascript:void(0)">&nbsp;删除</a>                &nbsp;
                                            </#if>
                                        </span>
		                            </span>
                                    </div>
                                    <p>${comment.commentContent?if_exists}</p>
                                </div>
                                <#if comment.childComments?? && comment.childComments?size gt 0>
                                    <@childComments comment.childComments></@childComments>
                                </#if>
                            </li>
                        </#list>
                    </#if>
                </ul><!-- .comment-list -->
            </#macro>
            <ul class="comment-list" id="comments-list">
                <#if comments?? && comments.getPageList()?size gt 0>
                    <#list comments.getPageList()?sort_by("commentDate")?reverse as comment>
                        <li class="comment even thread-even parent" id="comment-id-${comment.commentId?c}">
                            <div class="comment-body">
                                <div class="comment-author vcard">
                                    <#if (comment.commentAuthorAvatar)??>
                                        <img class="avatar" src="${comment.commentAuthorAvatar}" alt="avatar">
                                    <#else>
                                        <img class="avatar"
                                             src="//gravatar.loli.net/avatar/${comment.commentAuthorEmailMd5?if_exists}?s=256&d=${options.native_comment_avatar?default('mm')}"
                                             alt="avatar">
                                    </#if>
                                    <strong>
                                        <a href="${(comment.commentAuthorUrl)!'javascript:void(0)'}"
                                           rel="external nofollow"
                                           class="native-list-one-head-name"
                                           target="_blank">${comment.commentAuthor}</a>
                                    </strong>
                                    <#if comment.isAdmin?default(0) == 1>
                                        <i class="fa fa-black-tie" style="color: #c40000;"></i>
                                        <span class=""
                                              style="margin-top: 2px!important;color: #c40000;font-size: 13px;;"><b>作者</b></span>
                                    </#if>
                                    <span class="comment-meta commentmetadata native-comment-ua">
                                    <span class="ua-info" style="display: none;">
                                        <span class="WB-OS  native-comment-ua-info" style="display: none;">
                                        ${comment.commentAgent?if_exists}
                                        </span> 江苏省 移动
                                    </span>
                                    <br>
                                    <span class="comment-aux">
                                        <span class="reply">
                                               <a rel="nofollow" at="${comment.commentId?c}"
                                                  class="native-list-one-footer-reback"
                                                  href="javascript:void(0)">回复</a>
                                        </span>
                                    ${comment.commentDate?string("yyyy-MM-dd HH:mm")}
                                        <#if isAuthor?if_exists>
                                            <a class="comment-delete-link" data-id="${comment.commentId}"
                                               href="javascript:void(0)">&nbsp;删除</a>                &nbsp;
                                        </#if>
                                    </span>
                                </span>
                                </div>
                                <p>${comment.commentContent?if_exists}</p>
                            </div>
                            <#if comment.childComments?? && comment.childComments?size gt 0>
                                <@childComments comment.childComments></@childComments>
                            </#if>
                        </li>
                    </#list>
                </#if>
            </ul><!-- .comment-list -->

            <div class="scroll-links">
                <nav class="navigation comment-navigation" role="navigation">
                    <h2 class="screen-reader-text">评论导航</h2>
                    <div class="nav-links">
                        <div class="nav-previous"><a
                                    href="https://liuyanzhao.com/message.html/comment-page-3/#comments">较早评论</a></div>
                    </div>
                </nav>
            </div>

            <#if rainbow?size gt 1>
                <nav class="comment-navigation">
                    <div class="pagination">
                        <#if comments.hasPrevious>
                            <a class="prev page-numbers" href="?page=${comments.nowPage-1}#comments-list">
                                <i class="fa fa-angle-left"></i>
                            </a>
                        </#if>
                        <#list rainbow as r>
                            <#if r == comments.nowPage>
                                <span class="page-numbers current">${r}</span>
                            <#else>
                                <a class="page-numbers" href="?page=${r}#comments-list">${r}</a>
                            </#if>
                        </#list>
                        <#if comments.hasNext>
                            <a class="next page-numbers" href="?page=${comments.nowPage+1}#comments-list">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </#if>
                    </div>
                </nav>
            </#if>
            <div class="clear"></div>
        </#if>
    </div>


    <script src="${options.blog_static_url?if_exists}/static/plugins/jquery/jquery.min.js"></script>
    <script src="${options.blog_static_url?if_exists}/static/plugins/md5/md5.min.js"></script>
    <script src="${options.blog_static_url?if_exists}/static/plugins/ua-parser/ua-parser.min.js"></script>
    <script src="${options.blog_static_url?if_exists}/static/plugins/OwO/OwO.min.js"></script>
    <script>
        var defaultPlaceholder = $('#commentContent').attr("placeholder");
        var s = new OwO({
            logo: 'OωO表情',
            container: document.getElementsByClassName('OwO')[0],
            target: document.getElementsByClassName('comment-input-content')[0],
            position: 'down',
            width: '100%',
            maxHeight: '210px',
            api: "/static/plugins/OwO/OwO.min.json"
        });
        $(document).ready(function () {
            $(".native-comment-ua").each(function (i) {
                var uaInfo = $(this).find(".native-comment-ua-info").html();
                $(this).find('.ua-info').show().html(show_ua(uaInfo));
            });
            if ($('#commentAuthor').val() == '') {
                var author = localStorage.getItem("author");
                $("#commentAuthor").val(author == 'undefined' ? '' : author);
            }
            if ($('#commentAuthorEmail').val() == '') {
                var email = localStorage.getItem("email");
                $("#commentAuthorEmail").val(email == 'undefined' ? '' : email);
            }
            if ($('#commentAuthorUrl').val() == '') {
                var url = localStorage.getItem("url");
                $("#commentAuthorUrl").val(url == 'undefined' ? '' : url);
            }
        });
        $('#submit').click(function () {
            var author = $("#commentAuthor");
            var content = $("#commentContent");
            var email = $("#commentAuthorEmail");
            var url = $("#commentAuthorUrl");
            if (author.val() == '' || content.val() == '') {
                $(".native-message").html("<span style='color:red'>请输入必填项！</span>");
                $(".native-message").fadeIn(1000);
                setTimeout(function () {
                    $(".native-message").fadeOut(1000);
                }, 1500);
                return;
            }
            $(this).attr("disabled", "disabled");
            $(this).html("提交中...");
            $.ajax({
                type: 'POST',
                url: '/newComment',
                async: false,
                data: {
                    'postId': $('input[name=postId]').val(),
                    'commentContent': $('textarea[name=commentContent]').val(),
                    'commentAuthor': $('input[name=commentAuthor]').val(),
                    'commentAuthorEmail': $('input[name=commentAuthorEmail]').val(),
                    'commentAuthorUrl': $('input[name=commentAuthorUrl]').val(),
                    'commentAgent': navigator.userAgent,
                    'commentParent': $('input[name=commentParent]').val()
                },
                success: function (data) {
                    localStorage.setItem('author', author.val());
                    localStorage.setItem('email', email.val());
                    localStorage.setItem('url', url.val());
                    if (data.code == 1) {
                        $('.comment-input-content').val("");
                        $(".native-message").html("<span>" + data.msg + "</span>");
                        window
                    } else {
                        $(".native-message").html("<span style='color:red'>" + data.msg + "</span>");
                    }
                    $(".native-message").fadeIn(1000);
                    setTimeout(function () {
                        $(".native-message").fadeOut(1000);
                        $("#submit").removeAttr("disabled");
                        $("#submit").html("提交评论");
                        window.location.reload();
                    }, 1500);
                }
            });
        });
        $('.native-list-one-footer-reback').click(function () {
            var at = $(this).attr("at");
            var commentParentAuthor = $('#comment-id-' + at).find(".native-list-one-head-name").html();
            $('#commentParent').val(at);
            $('#commentContent').attr("placeholder", "@" + commentParentAuthor + ": ");
            $('#commentContent').focus();
            $('#cancel-comment-reply-link').show();
        });

        $('#cancel-comment-reply-link').click(function () {
            $('#commentContent').focus();
            $('#commentContent').attr("placeholder", defaultPlaceholder);
            $('#commentParent').val(0);
            $('#cancel-comment-reply-link').hide();
        });

        $('.comment-delete-link').click(function () {
            var id = $(this).attr('data-id');
            $.ajax({
                type: 'POST',
                url: '/admin/comment/remove',
                async: false,
                data: {
                    'commentId': id,
                },
                success: function (data) {
                    setTimeout(function () {
                        window.location.reload();
                    }, 1500);
                }
            });
        });

        var parser = new UAParser();

        function show_ua(string) {
            parser.setUA(string);
            var uua = parser.getResult();
            if (uua.os.version == 'x86_64') {
                uua.os.version = 'x64';
            }
            var browser = uua.browser.name + ' ' + uua.browser.version;
            var os = uua.os.name + ' ' + uua.os.version;
            return '<span class="ua visible-md-block">' + browser + '</span> <span class="ua visible-md-block">' + os + '</span>';
        }
    </script>
</@compress>
