<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<@shiro.principal  property="userAvatar"/>" class="img-circle"
                     style="width: 45px;height: 45px;" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><@shiro.principal  property="userDisplayName"/></p>
                <a href="/admin/user/profile"><i
                        class="fa fa-circle text-success"></i><@spring.message code='admin.menu.profile' /></a>
            </div>
        </div>
        <form action="/word" method="get" target="_blank" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="keywords" class="form-control" placeholder="查单词...">
                <span class="input-group-btn">
                  <button type="submit" name="keyword" id="search-btn" target="_blank"  class="btn btn-flat">
                    <i class="fa fa-search"></i>
                  </button>
                </span>
            </div>
        </form>

        <@shiro.hasRole name="admin">
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">HEADER</li>
                <li>
                    <a data-pjax="true" href="/admin">
                        <i class="fa fa-dashboard"></i>
                        <span><@spring.message code='admin.menu.dashboard' /></span>
                    </a>
                </li>
                <li>
                    <a data-pjax="true" href="/admin/word">
                        <i class="fa  fa-book"></i>
                        <span>词汇</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                </li>
                <li>
                    <a data-pjax="true" href="/admin/strange">
                        <i class="fa fa-book"></i>
                        <span>生词本</span>
                    </a>
                </li>
                <li>
                    <a data-pjax="true" href="/admin/attachment">
                        <i class="fa fa-picture-o"></i>
                        <span><@spring.message code='admin.menu.attachments' /></span>
                    </a>
                </li>
                <li>
                    <a data-pjax="true" href="/admin/feedback">
                        <i class="fa fa-comment"></i>
                        <span>用户反馈</span>
                    </a>
                </li>
                <li class="treeview">
                    <a data-pjax="true" href="#">
                        <i class="fa fa-user-o"></i>
                        <span><@spring.message code='admin.menu.user' /></span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a data-pjax="true" href="/admin/user"><i
                                        class="fa fa-circle-o"></i><@spring.message code='admin.menu.user.list' /></a></li>
                        <li><a data-pjax="true" href="/admin/user/profile"><i
                                        class="fa fa-circle-o"></i><@spring.message code='admin.menu.profile' /></a></li>
                    </ul>
                </li>
                <li>
                    <a data-pjax="true" href="/admin/option">
                        <i class="fa fa-cog"></i>
                        <span><@spring.message code='admin.menu.settings' /></span>
                    </a>
                </li>
            </ul>
        </@shiro.hasRole>

        <@shiro.lacksRole name="admin">
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">HEADER</li>
            <li>
                <a data-pjax="true" href="/admin">
                    <i class="fa fa-dashboard"></i>
                    <span><@spring.message code='admin.menu.dashboard' /></span>
                </a>
            </li>
            <li>
                <a data-pjax="true" href="/admin/strange">
                    <i class="fa fa-book"></i>
                    <span>生词本</span>
                </a>
            </li>
            <li>
                <a data-pjax="true" href="/admin/user/profile">
                    <i class="fa fa-user-o"></i>
                    <span>个人资料</span>
                </a>
            </li>
        </ul>
        </@shiro.lacksRole>


    </section>
</aside>
