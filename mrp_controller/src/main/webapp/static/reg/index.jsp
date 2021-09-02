<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户注册</title>

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background: url("../jqlogin/img/bg06.jpg") no-repeat;
            background-size: 100% 100%;
            color: #333333;
            font: 12px/18px "tahoma", "Microsoft YaHei", "arial", "SimHei", "SimSun";
        }

        html, body, ul, li, div, a {
            margin: 0;
            padding: 0;
        }

        a.menu:hover {
            color: #ffff00;
            text-decoration: none;
        }

        a.menu:active {
            color: #ffffff;
            text-decoration: none
        }

        a.menu:link {
            color: #ffffff;
            text-decoration: none
        }

        a.menu:visited {
            color: #ffffff;
            text-decoration: none
        }

        img {
            border: 0;
        }

        label {
            margin: 0 5px 0 0
        }

        a {
            color: #1F376D;
            text-decoration: none
        }

        a:hover {
            color: #01B2FF;
        }

        a.blue {
            color: #26A3CF;
            text-decoration: none
        }

        a.more {
            color: #FFFFFF;
            text-decoration: none
        }

        .footer * {
            color: #9B9B9B;
            text-shadow: 0 1px 0 #fff;
        }

        .footer a:hover {
            color: #555;
        }

        input[type="submit"] {
            background: url('images/buttom.png') no-repeat;
            font-size: 15px;
            font-weight: 600;
            color: #FFFFFF;
            border: 0;
            font-family: "Microsoft YaHei", "SimHei", "SimSun";
            text-shadow: 0 -1px 0 #535353;
            margin: 5px 5px 0 0;
            padding: 0 0 3px 0;
            display: block;
            width: 106px;
            height: 35px;
            text-align: center;
            font-weight: bold;
            line-height: 33px;
            text-indent: 20px;
        }

        input[type="button"] {
            background: url('images/buttom.png') no-repeat;
            font-size: 15px;
            font-weight: 600;
            color: #FFFFFF;
            border: 0;
            text-shadow: 0 -1px 0 #535353;
            margin: 5px 5px 0 0;
            padding: 0 0 3px 0;
            display: block;
            width: 106px;
            height: 35px;
            text-align: center;
            font-weight: bold;
            line-height: 33px;
            text-indent: 20px;
        }

        input.button_button {
            background: url('images/buttom.png') no-repeat;
            margin: 0;
            width: 106px;
            height: 35px;
            border: 0;
            font-size: 15px;
            font-weight: 600;
            color: #FFFFFF;
            text-shadow: 0 -1px 0 #535353;
            padding: 0 0 3px 0;
            text-align: center;
            font-weight: bold;
            line-height: 33px;
            text-indent: 20px;
        }

        ol, ul {
            list-style: none outside none;
            margin: 0px;
            padding: 0;
        }

        hr {
            color: #FF7700;
            width: 200px;
            height: 2px;
            float: left;
        }

        textarea {
            font-size: 12px;
            background-color: #ffffff;
            border: solid 1px #888888;
        }

        fieldset {
            clear: both;
            padding: 0 0 1em 1em;
            margin: 0 0 30px .3em;
            border: 1px solid #888888;
        }

        legend {
            margin: 0 0;
            padding: 2px;
            font-size: 10px;
            border: 0px;
            text-transform: capitalize;
            color: #000000;
        }

        .clear {
            clear: both !important
        }

        .bold {
            font-weight: bold !important
        }

        .block {
            display: block !important
        }

        /*index start*/
        .body_main {
            margin: 0 auto;
            width: 992px;
        }

        .index_box .box_title {
            background: url('images/box_top.png') no-repeat scroll center top transparent;
            width: 991px;
            height: 80px;
            padding: 0;
        }

        .index_box .box_title .text_content {
            text-align: center;
            padding: 20px 0 10px 0;
        }

        .index_box .box_title .text_content h1 {
            font-weight: normal;
        }

        .index_box .box_main {
            border: solid #D0D0D0;
            background: #ffffff;
            border-width: 0 1px 0 1px;
            width: 988px;;
            min-height: 50px;
            overflow: hidden !important;
        }

        .index_box .box_bottom {
            background: url('images/box_bottom.png') no-repeat scroll center top transparent;
            width: 991px;
            height: 7px;
            padding: 0;
        }

        /*Tooltips*/
        .tooltips_main {
            position: absolute;
            left: 0;
            margin: -5px 0 0 2px;
            z-index: 999;
        }

        .tooltips_box, .tooltips, .msg {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            position: relative;
            border-style: solid;
            border-color: #FF1F1F;
        }

        .tooltips, .msg {
            border-width: 0 1px;
            *left: -2px;
            background-color: #FFCFCF;
        }

        .tooltips_box {
            border-width: 1px;
            line-height: 1.5;
        }

        .tooltips {
            margin: 0 -2px;
        }

        .msg {
            margin: 1px -2px;
            padding: 0 6px;
            color: #2F2C2C;
            text-shadow: 0 1px 0 #FFFFFF;
            font-size: 12px;
        }

        .ov {
            background: url('images/tri.gif') no-repeat scroll 0 0 transparent;
            position: absolute;
            left: 30%;
            overflow: hidden;
            width: 15px;
            height: 15px;
            margin: 16px 0 0 0;
            display: inline;
        }

        /*regist*/
        .register {
            float: left;
            padding: 25px 50px;
        }

        .register .form_submit {
            float: left;
            border-bottom: 1px solid #bfbfbf;
            width: 888px;
        }

        .register .form_submit .fieldset {
            float: left;
        }

        .register .form_submit .fieldset .field-group {
            float: left;
            height: 55px;
        }

        .register .form_submit .fieldset .field-group .title {
            float: left;
            width: 120px;
            text-align: right;
            margin: 4px 0 0 0;
            font-size: 14px;
        }

        .register .form_submit .fieldset .field-group .control-group {
            float: left;
            width: 350px;
            margin: 0 10px;
        }

        .register .form_submit .fieldset .field-group .tips {
            float: left;
            width: 250px;
            color: #bfbfbf;
        }

        .register .div_submit {
            float: left;
            width: 875px;
            margin: 10px 5px;
        }

        .register .div_submit .div_submit_button {
            float: right;
        }

        /*end regist*/
        .fieldset .input_add_background {
            background: url("images/input.jpg") no-repeat scroll 100% 100% transparent;
            background-position: center;
            height: 30px;
            width: 157px;
            float: left;
            margin: 0 2px 0 0;
        }

        .fieldset .input_add_background input.register_input_ot {
            background-color: #f9f9f9;
            border: 0 none;
            color: #4F4F4F;
            font-size: 12px;
            height: 18px;
            outline: medium none;
            width: 145px;
            padding: 1px;
            margin: 5px;
        }

        .fieldset .input_add_long_background {
            background: url("images/input_long.jpg") no-repeat scroll 100% 100% transparent;
            background-position: center;
            height: 30px;
            width: 286px;
            float: left;
            margin: 0 0 15px 0;
            display: inline;
        }

        .fieldset .input_add_long_light_background {
            background: url("images/input_long_light.jpg") no-repeat scroll 100% 100% transparent;
            background-position: center;
            height: 30px;
            width: 286px;
            float: left;
        }

        .fieldset .input_add_long_background input.register_input {
            background-color: #f9f9f9;
            border: 0 none;
            color: #4F4F4F;
            font-size: 12px;
            height: 18px;
            outline: medium none;
            width: 270px;
            padding: 1px;
            margin: 5px;
        }

        .fieldset .input_text {
            display: inline-block;
            position: absolute;
            vertical-align: top;
            margin: 6px 0 0 10px;
            z-index: 2;
            font-style: italic;
            color: #BFBFBF;
        }

    </style>
    <%--<link href="${pageContext.request.contextPath}/page/reg/css/jq22.css" rel="stylesheet" type="text/css" />--%>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <%--<script TYPE="text/javascript" src="${pageContext.request.contextPath}/page/reg/js/jq22.js"></script>--%>

</head>
<body>
<div class='body_main'>
    <!-- start main content -->
    <div class='index_box' style='margin-top:20px;'>
        <div style="position:fixed;color:red;margin:70px 0 0 450px;font-size:16px;Z-index:100;display:block;"
             id="hint"></div>
        <div class='box_title'>
            <div class='text_content'>
                <h1>欢迎注册用户</h1>
            </div>
        </div>
        <div class='box_main'>
            <div id="register" class="register">
                <form id="form" action="${pageContext.request.contextPath}/user/register" method="post"
                      onSubmit="return check();">
                    <div id="form_submit" class="form_submit">
                        <div class="fieldset">
                            <div class="field-group">
                                <label class="required title">手机号码</label>
                                <span class="control-group" id="mobile_input">
                <div class="input_add_long_background">
                  <input class="register_input" type="text" id="phone" name="phone" maxLength="11" value=""
                         onblur="__changeUserName('phone');">
                </div>
                </span>
                                <label class="tips">仅用于发送服务开通与到期提醒以及紧急故障方便联系到您，绝对保密</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">用户名</label>
                                <span class="control-group" id="email_input">
                <div class="input_add_long_background">
                  <input class="register_input" type="text" id="username" name="name" maxLength="50" value=""
                         onblur="__changeUserName('username');">
                </div>
                </span>
                                <label class="tips">请输入您的用户名</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">性别</label>
                                <span class="control-group" style="line-height:28px;">
                <input type="radio" value="1" name="gender" checked>
                男
                <input type="radio" value="0" name="gender">
                女 </span>
                                <label class="tips" style="margin-bottom:5px;" id="tooltext1">请选择您的性别</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">设置密码</label>
                                <span class="control-group" id="password1_input">
                <div class="input_add_long_background">
                  <input class="register_input pwds1" type="password" id="password1" name="password" maxLength="20"
                         value="" onblur="checkPwd1(this.value);"/>
                </div>
                </span>
                                <label class="tips">请使用6~20个英文字母（区分大小写）、符号或数字</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">确认密码</label>
                                <span class="control-group">
                <div class="input_add_long_background">
                  <input class="register_input pwds2" onchange="validate()" type="password" name="password1"
                         maxLength="20" value="" onblur="checkPwd1(this.value);"/>
                </div>
                </span>
                                <label class="tips1"></label>
                            </div>
                            <div class="field-group">
                                <label class="required title">用户昵称</label>
                                <span class="control-group" id="code_input">
                <div class="input_add_background" style="margin-right:15px;">
                  <input class="register_input_ot" type="text" id="code" name="nickname" max_length="6" value=""/>
                </div>
                </span>
                                <label class="tips">此项为您的昵称,请按喜好填写</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">用户地址</label>
                                <span class="control-group" id="code_input1">
                <div class="input_add_background" style="margin-right:15px;">
                  <input class="register_input_ot" type="text" id="code1" name="address" max_length="20" value=""/>
                </div>
                </span>
                                <label class="tips">此项为您的常驻地址</label>
                            </div>
                        </div>
                    </div>
                    <div id="div_submit" class="div_submit">
                        <div class='div_submit_button'>
                            <input id="submit" type="submit" value="注册" class='button_button disabled'>
                        </div>
                    </div>
                </form>
            </div>

        </div>
        <div class='box_bottom'></div>
    </div>
</div>

</body>
</html>
<script type="text/javascript">
    function __changeUserName(of) {
        var username = $('#' + of).val();
        if (of == 'username') {
            if (username.search(/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/) == -1) {
                showTooltips('email_input', '请输入正确的用户名');
                return;
            }
        } else {
            if (username == '' || !isMobilePhone(username)) {
                showTooltips('mobile_input', '请输入正确的手机号码');
                return;
            }
        }
    }

    function checkPwd1(pwd1) {
        if (pwd1.search(/^.{6,20}$/) == -1) {
            showTooltips('password1_input', '密码为空或位数太少');
        } else {
            hideTooltips('password1_input');
        }
    }

    // function checkEmail(email) {
    // 	if (email.search(/^.+@.+$/) == -1) {
    // 		showTooltips('email_input','邮箱格式不正确');
    // 	}else {
    // 		hideTooltips('email_input');
    // 	}
    // }

    // function checkAuthCode(authcode) {
    // 	if (authcode == '' || authcode.length != 6) {
    // 		showTooltips('code_input','验证码不正确');
    // 	}else {
    // 		hideTooltips('code_input');
    //  }
    // }

    function check() {
        hideAllTooltips();
        var ckh_result = true;
        if ($('#username').val() == '') {
            showTooltips('email_input', '用户名不能为空');
            ckh_result = false;
        }
        if ($('#password1').val() == '') {
            showTooltips('password1_input', '密码不能为空');
            ckh_result = false;
        }
        if ($('#phone').val() == '' || !isMobilePhone($('#phone').val())) {
            showTooltips('mobile_input', '手机号不正确');
            ckh_result = false;
        }
        // if ($('#code').val() == '' || $('#code').val().length !=6) {
        // showTooltips('code_input','昵称不正确');
        // ckh_result = false;
        // }
        if ($('#verify').attr('checked') == false) {
            showTooltips('checkbox_input', '对不起，您不同意Webluker的《使用协议》无法注册');
            ckh_result = false;
        }
        alert("注册成功即将跳转登录页进行登录...")
        return ckh_result;
    }

    function checkMobilePhone(telphone) {
        if (telphone == '' || !isMobilePhone(telphone)) {
            showTooltips('mobile_input', '请输入正确的手机号码');
        } else {
            hideTooltips('mobile_input');
        }
    }

    function isMobilePhone(value) {
        if (value.search(/^(\+\d{2,3})?\d{11}$/) == -1)
            return false;
        else
            return true;
    }

    function trim(str) {
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }

    /**** 是否为合法外网IP地址 ****/
    function isIP(value) {
        var reg_ip = new RegExp('^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$');
        if (!reg_ip.exec(value)) {
            return false;
        }

        var strs = value.split(".");
        if (strs.length != 4) {
            return false;
        }
        for (var i = 0; i < strs.length; i++) {
            if (strs[i].indexOf("0") == 0 && strs[i].length > 1) {
                return false;
            } else if (parseInt(strs[i]) > 255 || parseInt(strs[i]) < 0) {
                return false;
            }
        }
        if (value.search(/^192\.168\./) != -1 || value.search(/^172/) != -1 || value.search(/^127\.0/) != -1) {
            return false;
        }
        return true;
    }

    /**** 是否为合法IP地址 ****/
    function isAllIP(value, innerIP) {
        var reg_ip = new RegExp('^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$');
        if (!reg_ip.exec(value)) {
            return false;
        }

        var strs = value.split(".");
        if (strs.length != 4) {
            return false;
        }
        for (var i = 0; i < strs.length; i++) {
            if (strs[i].indexOf("0") == 0 && strs[i].length > 1) {
                return false;
            } else if (parseInt(strs[i]) > 255 || parseInt(strs[i]) < 0) {
                return false;
            }
        }
        if (innerIP == false) {
            if (value.search(/^192\.168\./) != -1 || value.search(/^172/) != -1 || value.search(/^127\.0/) != -1) {
                return false;
            }
        }
        return true;
    }

    /**** 是否为合法Email地址 ****/
    function isEmail(value) {
        if (value.search(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/) == -1)
            return false;
        else
            return true;
    }

    /**** 是否为合法的国内电话号码 ****/
    function isTelphone(value) {
        if (value.search(/^(\d{3}-\d{8}|\d{4}-\d{7}|\d{4}-\d{8})$/) == -1)
            return false;
        else
            return true;
    }

    /**** 是否为合法的手机号码，为了兼容国际写法，目前只判断了是否是+数字 ****/
    function isMobilePhone(value) {
        if (value.search(/^(\+\d{2,3})?\d{11}$/) == -1)
            return false;
        else
            return true;
    }

    /**** 是否为合法的国内邮政编码 ****/
    function isZipcode(value) {
        if (value.search(/^[1-9]\d{5}$/) == -1)
            return false;
        else
            return true;
    }

    /**** 是否为合法的QQ号 ****/
    function isQQ(value) {
        if (value.search(/^[1-9][0-9]{4,}$/) == -1)
            return false;
        else
            return true;
    }

    /**** 是否为数字串，length等于0不限制长度 ****/
    function isNumber(value, length) {
        var regx;
        if (length == 0)
            regx = new RegExp("^\\d*$");
        else
            regx = new RegExp("^\\d{" + length + "}$");
        if (value.search(regx) == -1)
            return false;
        else
            return true;
    }

    /*Error message Tooltips*/
    $(document).ready(function () {
        /*点击隐藏错误提示,如果不想让提示点击消失,需要加上class='not_click_hide'*/
        $('.control-group input').not('.not_click_hide').focus(function () {
            hideTooltips($(this).parent().parent().attr('id'));
        });
    });

    /*
     *msgid:想让tooltips出现的地方的id
     *msg:提示的内容
     *time:自动消失的时间，如果不想让提示自动消失，则此参数不写
     */
    function showTooltips(msgid, msg, time) {
        if (msgid == '') {
            return;
        }
        if (msg == '') {
            msg = 'Error!';
        }
        $('#' + msgid).prepend("<div class='for_fix_ie6_bug' style='position:relative;'><div class='tooltips_main'><div class='tooltips_box'><div class='tooltips'><div class='msg'>" + msg + "</div></div><div class='ov'></div></div></div></div>");
        $('#' + msgid + ' .tooltips_main').fadeIn("slow").animate({marginTop: "-23px"}, {queue: true, duration: 400});
        try {
            if (typeof time != "undefined") {
                setTimeout('hideTooltips("' + msgid + '")', time);
            }
        } catch (err) {
        }

    }

    function hideTooltips(msgid) {
        try {
            $('#' + msgid).find('.tooltips_main').fadeOut("slow");
            $('#' + msgid).find('.tooltips_main').remove();
        } catch (e) {
        }
    }

    function hideAllTooltips() {
        $('.tooltips_main').fadeOut("slow");
        $('.tooltips_main').remove();
    }

    /*End error message tooltips*/
    function validate() {

        var input1_val = $('.pwds1').val();
        var input2_val = $('.pwds2').val();
        if (input2_val == input1_val) {
            alert("密码一致");
        } else {
            alert("两次密码应一致哦")
        }
        // var pwd = $(".pwds1").val();
        // var pwd1 = $(".pwds2").val();
        // <!-- 对比两次输入的密码 -->
        // if(pwd == pwd1)
        // {
        //   $(".tips1").html("两次密码相同");
        //   $(".tips1").css("color","green");
        //   // $("#xiugai").removeAttr("disabled");
        // }
        // else {
        //   $("tips1").html("两次密码不相同");
        //   $("tips1").css("color","red")
        //   // $("button").attr("disabled","disabled");
        // }
    }
</script>