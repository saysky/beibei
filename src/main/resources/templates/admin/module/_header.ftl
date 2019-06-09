<header class="main-header">
    <a href="/admin" class="logo">
        <span class="logo-mini"><b>贝</bB</span>
        <span class="logo-lg"><b>贝贝</b>词汇</span>
    </a>
    <nav class="navbar navbar-static-top" role="navigation">
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li><a href="/" title="<@spring.message code='admin.module.header.a.title.turn-to-front' />" target="_blank"><i class="fa fa-location-arrow"></i></a></li>
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="<@shiro.principal  property="userAvatar"/>" class="user-image" alt="User Image">
                        <span class="hidden-xs"><@shiro.principal  property="userDisplayName"/></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="user-header">
                            <img src="<@shiro.principal  property="userAvatar"/>" class="img-circle" alt="User Image">
                            <p><@shiro.principal  property="userDisplayName"/></p>
                        </li>
                        <li class="user-footer">
                            <div class="pull-left"><a data-pjax="true" href="/admin/user/profile" class="btn btn-default "><i class="fa fa-user"></i><@spring.message code='admin.module.header.btn.profile' /></a></div>
                            <div class="pull-right"><a href="/admin/logOut" class="btn btn-default "><i class="fa fa-sign-out"></i><@spring.message code='admin.module.header.btn.loginout' /></a></div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
