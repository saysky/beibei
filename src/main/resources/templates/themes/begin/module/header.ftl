<header id="masthead" class="site-header">
    <nav id="top-header">
        <div class="top-nav">
        <@shiro.authenticated>
            <div id="user-profile">
                <div class="user-box">
                    <div class="user-my">
                        <img alt="<@shiro.principal  property="userDisplayName"/>"
                             src="<@shiro.principal  property="userAvatar"/>"
                             class="avatar avatar-10 photo" style="width: 16px;height: 16px;">
                        <a href="javascript:void(0)"><@shiro.principal  property="userDisplayName"/>，您好！</a>
                    </div>
                    <div class="user-info" style="display: none;">
                        <div class="arrow-up"></div>
                        <div class="user-info-min">
                            <h3><@shiro.principal  property="userDisplayName"/></h3>
                            <div class="usericon">
                                <img alt="<@shiro.principal  property="userDisplayName"/>"
                                     src="<@shiro.principal  property="userAvatar"/>"
                                     class="avatar avatar-80 photo" style="width: 96px; height: 96px;"></div>
                            <div class="userinfo">
                                <p>
                                    <a href="/admin/user/profile" target="_blank">个人资料</a><a
                                        href="/admin" target="_blank">管理站点</a> <a
                                        href="/admin/logOut">登出</a>
                                </p>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </@shiro.authenticated>
        <@shiro.guest>
            <div id="user-profile">
                <div class="user-login">欢迎光临！</div>
                <div class="nav-set">
                    <div class="nav-login">
                        <a href="/admin/login"
                           title="Login"><i class="fa fa-user"></i>登录
                        </a>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </@shiro.guest>
            <div class="menu-topmenu-container">
                <ul id="menu-topmenu" class="top-menu">
                <@commonTag method="menus">
                    <#list frontTopMenus as menu>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page">
                            <a href="${menu.menuUrl?if_exists}">
                                <i class="${menu.menuIcon?if_exists}"></i>
                                <span class="font-text">${menu.menuName?if_exists}</span>
                            </a>
                        </li>
                    </#list>
                </@commonTag>
                </ul>
            </div>
        </div>
    </nav>
    <!--  #menu-box -->
    <div id="menu-box">
        <div id="top-menu">
			<span class="nav-search">
				<i class="fa fa-search"></i>
			</span>
            <span class="mobile-login"><a href="/admin/login" title="Login"><i class="fa fa-user"></i></a></span>
            <div class="logo-site">
                <h1 class="site-title">
                    <a href="${(options.blog_url)?if_exists}" title="" rel="home">${(options.blog_title)?if_exists}</a>
                </h1>
                <p class="site-description">${options.blog_sub_title?default('')}</p>
            </div><!-- .logo-site -->

            <div id="site-nav-wrap">
                <div id="sidr-close">
                    <a href="#sidr-close" class="toggle-sidr-close">×</a>
                </div>
                <nav id="site-nav" class="main-nav">
                    <a href="#sidr-main" id="navigation-toggle" class="bars">
                        <i class="fa fa-bars"></i>
                    </a>
                    <div class="menu-mainmenu-container">
                    <#macro childMenus menus>
                        <ul class="sub-menu">
                            <#list menus as menu>
                                <li id="menu-item-${menu.menuId}"
                                    class="menu-item menu-item-type-custom menu-item-object-custom">
                                    <a href="${menu.menuUrl?if_exists}">
                                        <span class="font-text">${(menu.menuName)!}</span>
                                    </a>
                                    <#if menu.childMenus?? && menu.childMenus?size gt 0>
                                        <@childMenus menu.childMenus></@childMenus>
                                    </#if>
                                </li>
                            </#list>
                        </ul>
                    </#macro>
                        <ul id="menu-mainmenu" class="down-menu nav-menu">
                        <@commonTag method="menus">
                            <#list frontMainMenus as menu>
                                <li id="menu-item-${menu.menuId}"
                                    class="menu-item menu-item-type-custom menu-item-object-custom">
                                    <a href="${menu.menuUrl?if_exists}">
                                        <i class="${(menu.menuIcon)!}"></i>
                                        <span class="font-text">${(menu.menuName)!}</span>
                                    </a>
                                    <#if menu.childMenus?? && menu.childMenus?size gt 0>
                                        <@childMenus menu.childMenus></@childMenus>
                                    </#if>
                                </li>
                            </#list>
                        </@commonTag>
                        </ul>
                    </div>
                </nav><!-- #site-nav -->
            </div><!-- #site-nav-wrap -->
            <div class="clear"></div>
        </div><!-- #top-menu -->
    </div>
    <!-- #menu-box -->

</header><!-- #masthead -->

<div id="search-main">
    <div class="searchbar">
        <form method="get" id="searchform" action="/search">
            <span>
                <input type="text" value="" name="keyword" id="keyword" placeholder="输入搜索内容" required/>
                <button type="submit" id="searchsubmit">搜索</button>
            </span>
        </form>
    </div>
    <div class="clear"></div>
</div>


