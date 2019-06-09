<div id="footer-widget-box" class="site-footer wow fadeInUp" data-wow-delay="0.3s">
    <div class="footer-widget">

    <@widgetTag method="footerWidgets">
        <#list footerWidgets as widget>
            <aside id="text-${widget.widgetId}" class="widget widget_text wow fadeInUp" data-wow-delay="0.3s">
                <h3 class="widget-title">
                    <span class="s-icon"></span>${widget.widgetTitle}
                </h3>
                <div class="textwidget">
                    ${widget.widgetContent}
                </div>
                <div class="clear"></div>
            </aside>
        </#list>
    </@widgetTag>
        <div class="clear"></div>
    </div>
</div>
<footer id="colophon" class="site-footer wow fadeInUp" data-wow-delay="0.3s" role="contentinfo">
    <div class="site-info">
    ${options.blog_footer_info?if_exists}
    </div><!-- .site-info -->
</footer><!-- .site-footer -->

<ul id="scroll">
    <li class="log log-no">
        <a class="log-button" title="文章目录">
            <i class="fa fa-bars"></i>
        </a>
        <div class="log-prompt">
            <div class="log-arrow">文章目录</div>
        </div>
    </li>
    <li>
        <a class="scroll-h" title="返回顶部"><i class="fa fa-angle-up"></i></a>
    </li>
    <li><a class="scroll-b" title="转到底部"><i class="fa fa-angle-down"></i></a></li>
    <li class="gb2-site"><a id="gb2big5"><span>繁</span></a></li>
    <li class="qqonline">
        <div class="online">
            <a href="javascript:void(0)"><i class="fa fa-qq"></i></a>
        </div>
        <div class="qqonline-box">
            <div class="qqonline-main">
                <div class="nline-wiexin">
                    <h4>微信</h4>
                    <img title="微信" alt="微信" src="${(options.theme_begin_sns_weixin)!}"/>
                </div>
                <div class="nline-qq">
                    <a target="_blank" rel="external nofollow"
                       href="http://wpa.qq.com/msgrd?v=3&uin=${(options.theme_begin_sns_qq)!}&site=qq&menu=yes"><i class="fa fa-qq"></i>在线咨询
                    </a>
                </div>
            </div>
            <span class="qq-arrow"></span>
        </div>
    </li>
</ul>
