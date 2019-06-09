$(document).ready(function () {
    if ($(window).width() < 1024) {
        if ($('body').hasClass('layout-boxed')) {
            $('body').removeClass('layout-boxed');
        }
        if ($('body').hasClass('sidebar-collapse')) {
            $('body').removeClass('sidebar-collapse');
        }
    }
    initMenu();
});

$(document).on('pjax:clicked', function () {
    $('.content-wrapper').html("");
});

$(document).on('pjax:complete', function () {
    initMenu();
});

/**
 * https://github.com/JpressProjects/jpress/blob/master/jpress-web/src/main/resources/static/admin/js/jpressadmin.js
 */
function initMenu() {
    var pathName = location.pathname;
    if (pathName == "/admin/post/edit") {
        pathName = "/admin/post/new";
    }
    if (pathName == "/admin/category/edit") {
        pathName = "/admin/category";
    }
    if (pathName == "/admin/tag/edit") {
        pathName = "/admin/tag";
    }
    if (pathName == "/admin/page/edit") {
        pathName = "/admin/page/new";
    }
    if (pathName == "/admin/page/links") {
        pathName = "/admin/page";
    }
    if (pathName == "/admin/page/galleries") {
        pathName = "/admin/page";
    }
    if (pathName == "/admin/menu/edit") {
        pathName = "/admin/menu";
    }
    $(".sidebar-menu").children().each(function () {
        var li = $(this);
        li.find('a').each(function () {
            var href = $(this).attr("href");
            if (pathName == href) {
                li.addClass("active");
                $(this).parent().addClass("active");
            } else {
                //li.removeClass("active");
                $(this).parent().removeClass("active");
            }
        });
    });
}

/**
 * 提示框
 * @param text
 * @param icon
 * @param hideAfter
 */
function showMsg(text, icon, hideAfter) {
    if (heading == undefined) {
        var heading = "提示";
    }
    $.toast({
        text: text,
        heading: heading,
        icon: icon,
        showHideTransition: 'fade',
        allowToastClose: true,
        hideAfter: hideAfter,
        stack: 1,
        position: 'top-center',
        textAlign: 'left',
        loader: true,
        loaderBg: '#ffffff'
    });
}

function showMsgAndReload(text, icon, hideAfter) {
    if (heading == undefined) {
        var heading = "提示";
    }
    $.toast({
        text: text,
        heading: heading,
        icon: icon,
        showHideTransition: 'fade',
        allowToastClose: true,
        hideAfter: hideAfter,
        stack: 1,
        position: 'top-center',
        textAlign: 'left',
        loader: true,
        loaderBg: '#ffffff',
        afterHidden: function () {
            window.location.reload();
        }
    });
}

function showMsgAndRedirect(text, icon, hideAfter, redirectUrl) {
    if (heading == undefined) {
        var heading = "提示";
    }
    $.toast({
        text: text,
        heading: heading,
        icon: icon,
        showHideTransition: 'fade',
        allowToastClose: true,
        hideAfter: hideAfter,
        stack: 1,
        position: 'top-center',
        textAlign: 'left',
        loader: true,
        loaderBg: '#ffffff',
        afterHidden: function () {
            window.location.href = redirectUrl;
        }
    });
}

/**
 * 转义
 * @param str str
 * @returns {string}
 */
function stringEncode(str) {
    var div = document.createElement('div');
    if (div.innerText) {
        div.innerText = str;
    } else {
        div.textContent = str;
    }
    return div.innerHTML;
}

/**
 * 保存设置选项
 */
function saveOptions(option) {
    var param = $('#' + option).serialize();
    $.ajax({
        type: 'post',
        url: '/admin/option/save',
        data: param,
        success: function (data) {
            if (data.code == 1) {
                showMsg(data.msg, "success", 1000);
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
}

//
// $(document).on('click', '#syncPostViews', function() {
//
// });

function syncPostViews() {
    $.ajax({
        type: 'post',
        url: '/admin/post/syncAllPostViews',
        success: function (data) {
            if (data.code == 1) {
                showMsg(data.msg, "success", 1000);
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
}

function DoCheck() {
    var ch = document.getElementsByName("ids");
    if (document.getElementById("allSelect").checked == true) {
        for (var i = 0; i < ch.length; i++) {
            ch[i].checked = true;
        }
    } else {
        for (var i = 0; i < ch.length; i++) {
            ch[i].checked = false;
        }
    }
}
