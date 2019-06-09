$(document).ready(function () {
    var loginName = localStorage.getItem("loginName");
    var loginPwd = localStorage.getItem("loginPwd");
    if (loginName != null && localStorage.getItem("loginName") != null) {
        $("#login-name").val(localStorage.getItem("loginName"));
    }
    if (loginPwd != null && localStorage.getItem("loginPwd") != null) {
        $("#login-pwd").val(localStorage.getItem("loginPwd"));
    }
});

var prevLink = document.referrer;

function btn_login() {
    $('#btn-login').button('loading');
    var name = $("#login-name").val();
    var pwd = $("#login-pwd").val();
    var rememberMe = $("#rememberMe").prop("checked");
    if (name == "" || pwd == "") {
        showMsg("请输入完整信息！", "info", 2000);
        $('#btn-login').button('reset');
    } else {
        $.ajax({
            type: 'POST',
            url: '/admin/getLogin',
            async: false,
            data: {
                'loginName': name,
                'loginPwd': pwd
            },
            success: function (data) {
                if (rememberMe) {
                    localStorage.setItem('loginName', $("#login-name").val());
                    localStorage.setItem('loginPwd', $("#login-pwd").val());
                } else {
                    localStorage.setItem('loginName','');
                    localStorage.setItem('loginPwd','');
                }
                if (data.code == 1) {
                    $.toast({
                        text: data.msg,
                        heading: heading,
                        icon: 'success',
                        showHideTransition: 'fade',
                        allowToastClose: true,
                        hideAfter: 1000,
                        stack: 1,
                        position: 'top-center',
                        textAlign: 'left',
                        loader: true,
                        loaderBg: '#ffffff',
                        afterHidden: function () {
                            if ($.trim(prevLink) == '') {
                                window.location.href = '/admin';
                            } else {
                                window.location.href = prevLink;
                            }
                        }
                    });
                } else {
                    $('.login-body').addClass('animate shake');
                    $.toast({
                        text: data.msg,
                        heading: heading,
                        icon: 'error',
                        showHideTransition: 'fade',
                        allowToastClose: true,
                        hideAfter: 2000,
                        stack: 1,
                        position: 'top-center',
                        textAlign: 'left',
                        loader: true,
                        loaderBg: '#ffffff',
                        afterHidden: function () {
                            $('.login-body').removeClass('animate shake');
                        }
                    });
                    $('#btn-login').button('reset');
                }
            }
        });
    }
}


function btn_register() {
    $('#btn-register').button('loading');
    var userName = $("#userName").val();
    var userPass = $("#userPass").val();
    var userEmail = $("#userEmail").val();
    if (userName == "" || userPass == "" || userEmail == "") {
        showMsg("请输入完整信息！", "info", 2000);
        $('#btn-register').button('reset');
    } else {
        $.ajax({
            type: 'POST',
            url: '/admin/getRegister',
            async: false,
            data: {
                'userName': userName,
                'userPass': userPass,
                'userEmail': userEmail
            },
            success: function (data) {
                if (data.code == 1) {
                    showMsgAndRedirect(data.msg, "success", 2000, "/admin/login");
                } else {
                    showMsg(data.msg, "error", 2000);
                    $('#btn-register').button('reset');
                    localStorage.setItem('loginName', userName);
                }
            }
        });
    }
}


function btn_forget() {
    $('#btn-forget').button('loading');
    var userName = $("#userName").val();
    var userEmail = $("#userEmail").val();
    if (userName == "" || userEmail == "") {
        showMsg("请输入完整信息！", "info", 2000);
        $('#btn-forget').button('reset');
    } else {
        $.ajax({
            type: 'POST',
            url: '/admin/getForget',
            async: false,
            data: {
                'userName': userName,
                'userEmail': userEmail
            },
            success: function (data) {
                if (data.code == 1) {
                    showMsgAndRedirect(data.msg, "success", 2000, "/admin/login");
                } else {
                    showMsg(data.msg, "error", 2000);
                    $('#btn-forget').button('reset');
                }
            }
        });
    }
}

$(document).keydown(function (event) {
    if (event.keyCode == 13) {
        btn_login();
    }
});
