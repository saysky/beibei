<div class="page-top animated fadeInDown">
    <div class="nav">
        <@commonTag method="menus">
            <#list frontMainMenus?sort_by('menuSort') as menu>
                <li>
                    <a href="${menu.menuUrl}" target="${menu.menuTarget?if_exists}">${menu.menuName} </a>
                </li>
            </#list>
        </@commonTag>
    </div>
    <div class="information">
        <div class="back_btn">
            <li>
                <a onclick="window.history.go(-1)" style="display: none" class="fa fa-chevron-left"></a>
            </li>
        </div>
        <div class="avatar">
            <img src="${options.begin_style_right_icon?default("${options.blog_static_url?if_exists}/begin/assets/img/logo.png")}" />
        </div>
    </div>
</div>