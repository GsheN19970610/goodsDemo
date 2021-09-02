<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <title>登录界面</title>
    <link href="jqlogin/css/default.css" rel="stylesheet" type="text/css"/>
    <!--必要样式-->
    <link href="jqlogin/css/styles.css" rel="stylesheet" type="text/css"/>
    <link href="jqlogin/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="jqlogin/css/loaders.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class='login'>
    <div class='login_title'>
        <span>仓储管理登录</span>
    </div>
    <div class='login_fields'>
        <div class='login_fields__user'>
            <div class='icon'>
                <img alt="" src='jqlogin/img/user_icon_copy.png'>
            </div>
            <input class="username" name="login" placeholder='用户名' maxlength="16" type='text' autocomplete="off"
                   value="admin"/>
            <div class='validation'>
                <img alt="" src='jqlogin/img/tick.png'>
            </div>
        </div>
        <div class='login_fields__password'>
            <div class='icon'>
                <img alt="" src='jqlogin/img/lock_icon_copy.png'>
            </div>
            <input class="password" name="pwd" placeholder='密码' maxlength="16" type='text' autocomplete="off">
            <input type="hidden" id="md5_password" name="password"/>
            <div class='validation'>
                <img alt="" src='jqlogin/img/tick.png'>
            </div>
        </div>
        <div class='login_fields__password'>
            <div class='icon'>
                <img alt="" src='jqlogin/img/key.png'>
            </div>
            <input name="code" placeholder='验证码' maxlength="4" type='text' name="ValidateNum" autocomplete="off">
            <div class='validation' style="opacity: 1; right: -5px;top: -3px;">
                <canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
            </div>
        </div>
        <div class='login_fields__submit'>
            <input type='button' value='登录'>
        </div>
        <div style="margin-left: 225px;margin-top: 40px"><a href="reg/index.jsp"
                                                            style="color: #299aea;text-decoration:underline"><h4>
            <b>用户注册</b></h4></a></div>

    </div>
    <div class='success'>
    </div>
    <div class='disclaimer'>
        <p>欢迎登陆后台管理系统</p>
    </div>
</div>
<div class='authent'>
    <div class="loader" style="height: 44px;width: 44px;margin-left: 28px;">
        <div class="loader-inner ball-clip-rotate-multiple">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <p>认证中...</p>
</div>
<div class="OverWindows"></div>
<link href="jqlogin/layui/css/layui.css" rel="stylesheet" type="text/css"/>
<script src="jqlogin/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="jqlogin/js/jquery-ui.min.js"></script>
<script type="text/javascript" src='jqlogin/js/stopExecutionOnTimeout.js?t=1'></script>
<script src="jqlogin/layui/layui.js" type="text/javascript"></script>
<script src="jqlogin/js/Particleground.js" type="text/javascript"></script>
<script src="jqlogin/js/Treatment.js" type="text/javascript"></script>
<script src="jqlogin/js/jquery.mockjax.js" type="text/javascript"></script>
<script src="https://cdn.bootcss.com/blueimp-md5/2.10.0/js/md5.min.js"></script>
<script type="text/javascript">
    var canGetCookie = 0;//是否支持存储Cookie 0 不支持 1 支持
    var ajaxmockjax = 1;//是否启用虚拟Ajax的请求响 0 不启用  1 启用
    //默认账号密码

    var truelogin = "admin";
    var truepwd = "admin";

    var CodeVal = 0;
    Code();

    function Code() {
        if (canGetCookie == 1) {
            createCode("AdminCode");
            var AdminCode = getCookieValue("AdminCode");
            showCheck(AdminCode);
        } else {
            showCheck(createCode(""));
        }
    }

    function showCheck(a) {
        CodeVal = a;
        var c = document.getElementById("myCanvas");
        var ctx = c.getContext("2d");
        ctx.clearRect(0, 0, 1000, 1000);
        ctx.font = "80px 'Hiragino Sans GB'";
        ctx.fillStyle = "#E8DFE8";
        ctx.fillText(a, 0, 100);
    }

    $(document).keypress(function (e) {
        // 回车键事件
        if (e.which == 13) {
            $('input[type="button"]').click();
            e = 0;
            return false;
        }

    });
    //粒子背景特效
    $('body').particleground({
        dotColor: '#E8DFE8',
        lineColor: '#133b88'
    });
    $('input[name="pwd"]').focus(function () {
        $(this).attr('type', 'password');
    });
    $('input[type="text"]').focus(function () {
        $(this).prev().animate({'opacity': '1'}, 200);
    });
    $('input[type="text"],input[type="password"]').blur(function () {
        $(this).prev().animate({'opacity': '.5'}, 200);
    });
    $('input[name="login"],input[name="pwd"]').keyup(function () {
        var Len = $(this).val().length;
        if (!$(this).val() == '' && Len >= 5) {
            $(this).next().animate({
                'opacity': '1',
                'right': '30'
            }, 200);
        } else {
            $(this).next().animate({
                'opacity': '0',
                'right': '20'
            }, 200);
        }
    });
    var open = 0;
    layui.use('layer', function () {
        var msgalert = '默认账号:' + truelogin + '<br/> 默认密码:' + truepwd;
        var index = layer.alert(msgalert, {
            icon: 6,
            time: 4000,
            offset: 't',
            closeBtn: 0,
            title: '友情提示',
            btn: [],
            anim: 2,
            shade: 0
        });
        layer.style(index, {
            color: '#777'
        });
        //非空验证
        $('input[type="button"]').click(function () {
            var login = $('input[name="login"]').val();
            var pwd = $('input[name="pwd"]').val();
            var code = $('input[name="code"]').val();
            var md5pwd = $('input[name="password"]').val();
            md5pwd = md5(pwd);
            // alert(md5pwd)
            if (login == '') {
                ErroAlert('请输入您的账号');
                Code();
            } else if (pwd == '') {
                ErroAlert('请输入密码');
                Code();
            } else if (code == '' || code.length != 4) {
                ErroAlert('输入验证码');
                Code();
            } else {
                //认证中..
                fullscreen();
                $('.login').addClass('test'); //倾斜特效
                setTimeout(function () {
                    $('.login').addClass('testtwo'); //平移特效
                }, 300);
                setTimeout(function () {
                    $('.authent').show().animate({right: -320}, {
                        easing: 'easeOutQuint',
                        duration: 600,
                        queue: false
                    });
                    $('.authent').animate({opacity: 1}, {
                        duration: 200,
                        queue: false
                    }).addClass('visible');
                }, 500);

                //登陆
                var JsonData = {name: login, pwd: pwd, code: code};
                //此处做为ajax内部判断
                // var url = "login";
                $.ajax({
                    url: "${pageContext.request.contextPath}/login/loginUser",
                    type: "get",
                    contentType: "application/json;charset=utf-8",
                    data: {name: login, password: pwd, code: code},
                    // JSON.stringify({'name':name,'passwd':passwd})
                    dataType: "json",
                    success: function (data) {
                        // alert(data)
                        //ajax返回
                        //认证完成
                        setTimeout(function () {
                            $('.authent').show().animate({right: 90}, {
                                easing: 'easeOutQuint',
                                duration: 600,
                                queue: false
                            });
                            $('.authent').animate({opacity: 0}, {
                                duration: 200,
                                queue: false
                            }).addClass('visible');
                            $('.login').removeClass('testtwo'); //平移特效
                        }, 2000);
                        setTimeout(function () {
                            // alert(data == null)
                            if (data == null) {
                                ErroAlert('账号或密码错误');
                                Code();
                            }
                            // alert(data.name)
                            $('.authent').hide();
                            $('.login').removeClass('test');
                            // alert('用户名1'+(JsonData.login == data.name))
                            // alert('密码：'+(JsonData.pwd == data.password))
                            // alert('验证码1'+(JsonData.code.toUpperCase() == CodeVal.toUpperCase()))
                            if (JsonData.login == data.username && JsonData.pwd == data.password && JsonData.code.toUpperCase() == CodeVal.toUpperCase()) {
                                // alert(8888);
                                alert("登陆成功")
                                //登录成功
                                $('.login div').fadeOut(100);
                                $('.success').fadeIn(1000);

                                // $('.success').html(data.Text);
                                location.href = "main.jsp";

                            } else {
                                // alert(111)
                                ErroAlert('账号或密码错误');
                                Code();
                            }
                        }, 2400);
                    },
                    error: function (msg) {
                        // $(".notice").html('Error:'+msg);
                        alert("账号或密码错误,请重新登录！")
                        ErroAlert('账号或密码错误');
                        location.href = "${pageContext.request.contextPath}/static/index.jsp";
                    }
                })


            }
        })
    })
    var fullscreen = function () {
        elem = document.body;
        if (elem.webkitRequestFullScreen) {
            elem.webkitRequestFullScreen();
        } else if (elem.mozRequestFullScreen) {
            elem.mozRequestFullScreen();
        } else if (elem.requestFullScreen) {
            elem.requestFullscreen();
        } else {
            //浏览器不支持全屏API或已被禁用
        }
    }

</script>
</body>
</html>
