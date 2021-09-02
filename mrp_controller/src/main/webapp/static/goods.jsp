<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>商品页面</title>
    <%--    <link rel="stylesheet" href="http://localhost:8080/layuiDemo_war_exploded/static/js/layui-2.5.4/css/layui.css">--%>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css"/>
    <!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
    <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <%--    <script src="js/layui-2.5.4/layui.js"></script>--%>
    <style>
        .lauiuserinput {
            width: 100px;
            height: 28px;
            margin-left: 915px;
        }

    </style>
    <script>
        $(function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/static/goodType/sessionList",
                dataType: "json",
                success: function (data) {
                }
            })

            if (location.href.indexOf("#reloaded") == -1) {
                location.href = location.href + "#reloaded";
                location.reload();
                location.reload();
            }

        })

    </script>
    <style type="text/css">
        .lauiuserinput1 {
            width: 100px;
            height: 28px;
            margin-left: 0px;
        }
    </style>
</head>

<body style="padding: 20px;">
<!-- 页面结构 -->
<div class="layui-main">
    <!-- 表格上方标题 -->
    <blockquote class="layui-elem-quote">商品列表</blockquote>
    <!-- 添加按钮 -->
    <a class="layui-btn layui-btn-sm" id="add-user-btn">添加商品</a>


    <input class="layui-input-inline lauiuserinput1 " placeholder="￥" id="add-user-input2" autocomplete="off"/>—
    <input class="layui-input-inline lauiuserinput1 " placeholder="￥" id="add-user-input3" autocomplete="off"/>
    <a class="layui-btn layui-btn-sm" id="add-user-btn2">价格查询商品</a>
    <div class="layui-input-inline layui-form layui-form-pane">
        <select id="add-user-btn6">
            <option>请选择商品类型</option>
            <c:forEach items="${sessionScope.goodtypes}" var="goodTypes">
                <option value="${goodTypes.typeId}">${goodTypes.typeName}</option>
            </c:forEach>
        </select>

    </div>
    <a class="layui-btn layui-btn-sm" id="add-user-btn4">点击查询商品类型</a>
    <input class="layui-input-block lauiuserinput " placeholder="查找商品" id="add-user-input" autocomplete="off"/>
    <a class="layui-btn layui-btn-sm" id="add-user-btn1">点击查询商品</a>

</div>
<!-- 商品表 -->
<table id="user-tbl" lay-filter="user-tbl"></table>
<script type="text/html" id="user-tbl-toolbar">
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="updateUser9">更新</a>
    <a class="layui-btn layui-btn-xs" lay-event="updateUser1">入库</a>
    <a class="layui-btn layui-btn-xs" lay-event="updateUser">出库</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="deleteUser">删除</a>
</script>
</div>

<!-- 添加商品弹出层 -->
<div id="add-user-layer" style="display: none; padding: 20px">
    <form id="add-user-form" class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">商品ID</label>
            <div class="layui-input-block">
                <input type="text" name="goodId" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">拥有者ID</label>
            <div class="layui-input-block">
                <input type="text" name="userId" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-block">
                <input type="text" name="goodName" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品类型</label>
            <div class="layui-input-block">
                <select name="goodType">
                    <option>请选择商品类型</option>
                    <c:forEach items="${sessionScope.goodtypes}" var="goodTypes">
                        <option value="${goodTypes.typeId}">${goodTypes.typeName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品信息</label>
            <div class="layui-input-block">
                <input type="text" name="goodInfo" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品价格</label>
            <div class="layui-input-block">
                <input type="text" name="goodPrice" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品库存</label>
            <div class="layui-input-block">
                <input type="text" name="goodNum" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>

        <input type="hidden" name="userId" value="${sessionScope.user.id}" class="layui-input" lay-verify="required"
               autocomplete="off">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="add-user-form-submit">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<!-- 更新弹出层 -->
<div id="update-user-layer" style="display: none; padding: 20px">
    <form id="update-user-form" class="layui-form layui-form-pane" lay-filter="update-user-form">
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">id</label>
            <div class="layui-input-block">
                <input type="text" name="goodId" class="layui-input m1" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">拥有者ID</label>
            <div class="layui-input-block">
                <input type="text" name="userId" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-block">
                <input type="text" name="goodName" class="layui-input m2" lay-verify="required"
                       style="cursor:not-allowed;color: gray" disabled autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品信息</label>
            <div class="layui-input-block">
                <input type="text" name="goodInfo" class="layui-input m3" lay-verify="required"
                       style="cursor:not-allowed;color: gray" disabled autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品价格</label>
            <div class="layui-input-block">
                <input type="text" name="goodPrice" class="layui-input m4" lay-verify="required"
                       style="cursor:not-allowed;color: gray" disabled autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出库数量</label>
            <div class="layui-input-block">
                <input type="text" name="goodNum" class="layui-input nums1" lay-verify="required" autocomplete="off">
                <%--                onblur="validate()"--%>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">库存数量</label>
            <div class="layui-input-block">
                <input type="text" name="goodNums" class="layui-input nums2" lay-verify="required"
                       style="cursor:not-allowed;color: gray" disabled autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button id="dusi" class="layui-btn" lay-submit lay-filter="update-user-form-submit">提交</button>
                <%--                <button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
            </div>
        </div>
    </form>
</div>
<%--入库--%>
<div id="update-user-layer0" style="display: none; padding: 20px">
    <form id="update-user-form1" class="layui-form layui-form-pane" lay-filter="update-user-form1">
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">id</label>
            <div class="layui-input-block">
                <input type="text" name="goodId" class="layui-input m1" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">拥有者ID</label>
            <div class="layui-input-block">
                <input type="text" name="userId" class="layui-input m2" lay-verify="required"
                       style="cursor:not-allowed;color: gray" disabled autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-block">
                <input type="text" name="goodName" class="layui-input m2" lay-verify="required"
                       style="cursor:not-allowed;color: gray" disabled autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品信息</label>
            <div class="layui-input-block">
                <input type="text" name="goodInfo" class="layui-input m3" lay-verify="required"
                       style="cursor:not-allowed;color: gray" disabled autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品价格</label>
            <div class="layui-input-block">
                <input type="text" name="goodPrice" class="layui-input m4" lay-verify="required"
                       style="cursor:not-allowed;color: gray" disabled autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">入库数量</label>
            <div class="layui-input-block">
                <input type="text" name="goodNum" class="layui-input nums3" lay-verify="required" autocomplete="off">
                <%--                onblur="validate()"--%>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">库存数量</label>
            <div class="layui-input-block">
                <input type="text" name="goodNums" class="layui-input nums4" lay-verify="required"
                       style="cursor:not-allowed;color: gray" disabled autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button id="dusi" class="layui-btn" lay-submit lay-filter="update-user-form-submit">提交</button>
                <%--                <button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
            </div>
        </div>
    </form>
</div>
<%--更新商品详细信息--%>
<div id="update-user-layer9" style="display: none; padding: 20px">
    <form id="update-user-form9" class="layui-form layui-form-pane" lay-filter="update-user-form9">
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">id</label>
            <div class="layui-input-block">
                <input type="text" name="goodId" class="layui-input m1" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">拥有者ID</label>
            <div class="layui-input-block">
                <input type="text" name="userId" class="layui-input m2" lay-verify="required"
                       style="cursor:not-allowed;color: gray" disabled autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-block">
                <input type="text" name="goodName" class="layui-input m2" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品信息</label>
            <div class="layui-input-block">
                <input type="text" name="goodInfo" class="layui-input m3" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品价格</label>
            <div class="layui-input-block">
                <input type="text" name="goodPrice" class="layui-input m4" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button id="dusi" class="layui-btn" lay-submit lay-filter="update-user-form-submit">提交</button>
                <%--                <button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
            </div>
        </div>
    </form>
</div>


<!-- 页面JS -->
<script>
    layui.use(['jquery', 'table', 'layer', 'form'], function () {
        // 加载layui模块，使用其推荐的【预先加载】方式，详见官网【模块规范】一节
        var $ = layui.$;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        // 显示所有商品
        table.render({
            elem: '#user-tbl',
            url: 'goods/all',
            method: 'get',
            cols: [[
                {field: 'goodId', title: 'ID'},
                {field: 'goodName', title: '商品名称'},
                {field: 'goodPrice', title: '商品价格'},
                {field: 'goodNum', title: '商品库存量'},
                {
                    field: 'goodTypes.typeName', title: '商品类别',
                    templet: function (d) {
                        return d.goodTypes.typeName;
                    }
                },
                {
                    field: 'user.name', title: '所有者姓名',
                    templet: function (d) {
                        return d.user.name;
                    }
                },
                {field: 'goodInfo', title: '商品信息'},
                {toolbar: '#user-tbl-toolbar', title: '操作', width: 250}
            ]],
            // 表格容器id，用于表格重载
            id: 'user-tbl',
            even: true,
            page: true,
            limits: [3, 5, 10],
            limit: 5, //每页默认显示的数量

        });


        // 通过商品姓名查找商品
        $(document).on('click', '#add-user-btn3', function (data) {
            var sreachTxt = $("#add-user-input");
            layer.msg(sreachTxt.val("#add-user-input"))
            console.log(data)
            console.log("sssss" + sreachTxt.val())
            var index = layer.msg('查询中，请稍候...', {icon: 16, time: false, shade: 0});
            table.reload('user-tbl', {
                //where 可以用 访问同一个controller 的时候可以用动态sql生成 暂时这样获取参数
                url: 'goods/' + sreachTxt.val(),
                // where:{
                //    name:sreachTxt.val()
                // },
                page: {
                    curr: 1
                }

            })
            layer.close(index);
        })

        // 通过商品类型查找商品
        $(document).on('click', '#add-user-btn4', function (data) {
            var sreachTxt = $("#add-user-btn6");
            // layer.msg(sreachTxt.val("#add-user-btn3"))
            console.log(data)
            var b = $('#add-user-btn6 option:selected').val();
            console.log("sssss" + b)
            alert(b)
            var index = layer.msg('查询中，请稍候...', {icon: 16, time: false, shade: 0});
            table.reload('user-tbl', {
                //where 可以用 访问同一个controller 的时候可以用动态sql生成 暂时这样获取参数
                url: 'goods/queryTypeId/' + sreachTxt.val(),
                // where:{
                //    name:sreachTxt.val()
                // },
                page: {
                    curr: 1
                }

            })
            layer.close(index);
        })

        // 通过价格查找商品
        $(document).on('click', '#add-user-btn2', function (data) {
            var sreachTxt1 = $("#add-user-input2");
            var sreachTxt2 = $("#add-user-input3")
            layer.msg(sreachTxt1.val())
            console.log(data)
            console.log("sssss" + sreachTxt1.val())
            var index = layer.msg('查询中，请稍候...', {icon: 16, time: false, shade: 0});
            table.reload('user-tbl', {
                //where 可以用 访问同一个controller 的时候可以用动态sql生成 暂时这样获取参数
                url: 'goods/' + sreachTxt1.val() + '/' + sreachTxt2.val(),
                // where:{
                //    name:sreachTxt.val()
                // },
                page: {
                    curr: 1
                }

            })
            layer.close(index);
        })

        // 显示添加商品弹出层
        $('#add-user-btn').click(function () {
            // 每次显示前重置表单
            $('#add-user-form')[0].reset();
            layer.open({
                type: 1,
                title: '入库',
                skin: 'layui-layer-molv ',
                area: ['500px'],
                content: $('#add-user-layer')
            });
        });

        // 添加商品表单提交
        form.on('submit(add-user-form-submit)', function (data) {
            // ajax方式添加商品
            $.ajax({
                url: "${pageContext.request.contextPath}/static/goods",
                type: "POST",
                data: JSON.stringify(data.field),
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {
                    if (data.status == 1) {
                        layer.close(layer.index);
                        layer.msg('添加成功');
                        table.reload('user-tbl');
                    } else {
                        layer.msg('添加失败');
                    }
                },
                error: function () {
                    console.log("ajax error");
                }
            });
            // 阻止表单跳转
            return false;
        });

        // 监听行工具栏事件：删除商品与更新商品
        table.on('tool(user-tbl)', function (obj) {
            // 获取当前行数据和lay-event的值
            var data = obj.data;
            var event = obj.event;

            // 删除用户事件
            if (event === 'deleteUser') {
                var isUserId =
                ${sessionScope.user.id}
                var isAdminId = ${sessionScope.user.isAdmin}
                    alert("权限ID为：" + isAdminId)
                if (isUserId == data.userId || isAdminId == 0) {
                    layer.confirm('确定删除该商品吗？', function (index) {
                        // ajax方式删除用户
                        $.ajax({
                            url: 'goods/' + data.goodId,
                            type: "DELETE",
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == 1) {
                                    layer.msg('删除成功');
                                    table.reload('user-tbl');
                                } else {
                                    layer.msg('删除失败');
                                }
                            },
                            error: function () {
                                console.log("ajax error");
                            }
                        });
                        layer.close(index);
                    });
                } else {
                    alert("您没有权限操作该选项")
                }
            }

            // 更新商品事件
            if (event === 'updateUser') {
                // 每次显示更新商品的表单前自动为表单填写该行的数据
                var isUserId =
                ${sessionScope.user.id}
                var isAdminId = ${sessionScope.user.isAdmin}
                    alert("权限ID为：" + isAdminId)
                if (isUserId == data.userId || isAdminId == 0) {

                    form.val('update-user-form', {
                        "userId": data.userId,
                        "goodId": data.goodId,
                        "goodName": data.goodName,
                        "goodPrice": data.goodPrice,
                        "goodInfo": data.goodInfo,
                        "goodNums": data.goodNum,
                        "goodNum": "",
                    });
                    // 显示更新商品表单的弹出层
                    layer.open({
                        type: 1,
                        title: '出库',
                        skin: 'layui-layer-molv',
                        area: ['500px'],
                        content: $('#update-user-layer')
                    });
                    // 更新商品表单提交
                    form.on('submit(update-user-form-submit)', function (data) {
                        // ajax方式更新商品

                        var input1_val = $('.nums1').val();
                        var input2_val = $('.nums2').val();
                        alert("出库数量==" + input1_val)
                        alert("库存数量==" + input2_val)
                        alert(eval(input2_val) > eval(input1_val))
                        if ((eval(input2_val) >= eval(input1_val)) && !isNaN(input1_val)) {
                            alert("可以出库")
                            $.ajax({
                                url: "goods",
                                type: "PUT",
                                data: JSON.stringify(data.field),
                                contentType: 'application/json',
                                dataType: 'json',
                                success: function (data) {
                                    if (data.status == 1) {
                                        layer.close(layer.index);
                                        layer.msg('更新成功');
                                        // table.reload('user-tbl');
                                        table.reload('user-tbl', {
                                            url: 'goods/all',
                                        })
                                        $("#add-user-input").val("");
                                    } else {
                                        layer.msg('更新失败');
                                    }
                                },
                                error: function () {
                                    console.log("ajax error");
                                }
                            });
                        } else {
                            alert("库存不足")
                            layer.close(layer.index);
                        }

                        // 阻止表单跳转
                        return false;
                    });
                } else {
                    alert("您没有权限操作该选项")
                }
            }

            // 更新商品事件更新信息
            if (event === 'updateUser9') {
                // 每次显示更新商品的表单前自动为表单填写该行的数据
                var isUserId =
                ${sessionScope.user.id}
                var isAdminId = ${sessionScope.user.isAdmin}
                    alert("权限ID为：" + isAdminId)
                if (isUserId == data.userId || isAdminId == 0) {

                    form.val('update-user-form9', {
                        "userId": data.userId,
                        "goodId": data.goodId,
                        "goodName": data.goodName,
                        "goodPrice": data.goodPrice,
                        "goodInfo": data.goodInfo,
                    });
                    // 显示更新商品表单的弹出层
                    layer.open({
                        type: 1,
                        title: '更新商品',
                        skin: 'layui-layer-molv',
                        area: ['500px'],
                        content: $('#update-user-layer9')
                    });
                    // 更新商品表单提交
                    form.on('submit(update-user-form-submit)', function (data) {
                        // ajax方式更新商品
                        $.ajax({
                            url: "${pageContext.request.contextPath}/static/goods/updateGoods",
                            type: "PUT",
                            data: JSON.stringify(data.field),
                            contentType: 'application/json',
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == 1) {
                                    layer.close(layer.index);
                                    layer.msg('更新成功');
                                    // table.reload('user-tbl');
                                    table.reload('user-tbl', {
                                        url: 'goods/all',
                                    })
                                    $("#add-user-input").val("");
                                } else {
                                    layer.msg('更新失败');
                                }
                            },
                            error: function () {
                                console.log("ajax error");
                            }
                        });


                        // 阻止表单跳转
                        return false;
                    });
                } else {
                    alert("您没有权限操作该选项")
                }
            }


            // 入库商品事件
            if (event === 'updateUser1') {
                // 每次显示更新商品的表单前自动为表单填写该行的数据
                var isUserId =
                ${sessionScope.user.id}
                var isAdminId = ${sessionScope.user.isAdmin}
                    alert("权限ID为：" + isAdminId)
                if (isUserId == data.userId || isAdminId == 0) {

                    form.val('update-user-form1', {
                        "userId": data.userId,
                        "goodId": data.goodId,
                        "goodName": data.goodName,
                        "goodPrice": data.goodPrice,
                        "goodInfo": data.goodInfo,
                        "goodNums": data.goodNum,
                        "goodNum": "",
                    });
                    // 显示更新商品表单的弹出层
                    layer.open({
                        type: 1,
                        title: '入库',
                        skin: 'layui-layer-molv',
                        area: ['500px'],
                        content: $('#update-user-layer0')
                    });
                    // 更新商品表单提交
                    form.on('submit(update-user-form-submit)', function (data) {
                        // ajax方式更新商品

                        var input1_val = $('.nums3').val();
                        var input2_val = $('.nums4').val();
                        alert("入库数量==" + input1_val)
                        alert("库存数量==" + input2_val)
                        alert((eval(input2_val) > 0) && !isNaN(input1_val))
                        if ((eval(input2_val) > 0) && !isNaN(input1_val)) {
                            alert("可以入库")
                            $.ajax({
                                url: "goods/addGoodsNum",
                                type: "PUT",
                                data: JSON.stringify(data.field),
                                contentType: 'application/json',
                                dataType: 'json',
                                success: function (data) {
                                    if (data.status == 1) {
                                        layer.close(layer.index);
                                        layer.msg('更新成功');
                                        // table.reload('user-tbl');
                                        table.reload('user-tbl', {
                                            url: 'goods/all',
                                        })
                                        $("#add-user-input").val("");
                                    } else {
                                        layer.msg('更新失败');
                                    }
                                },
                                error: function () {
                                    console.log("ajax error");
                                }
                            });
                        } else {
                            alert("库存不足")
                            layer.close(layer.index);
                        }

                        // 阻止表单跳转
                        return false;
                    });
                } else {
                    alert("您没有权限操作该选项")
                }
            }
        });
    });
    // function validate() {
    //
    //     var input1_val = $('.nums1').val();
    //     var input2_val = $('.nums2').val();
    //     if(input2_val > input1_val){
    //         $("#dusi").removeAttrs("style","cursor:not-allowed");
    //         alert("可以出库")
    //     }else{
    //         $("#dusi").attr("style","cursor:not-allowed");
    //         $("#dusi").attr("disabled");
    //         alert("库存不足")
    //         document.querySelector('#update-user-form').reset()
    //         layer.close(layer.index);
    //     }
    //
    //     $("#dusi").removeAttrs("style","cursor:not-allowed");
    // }

</script>
</body>

</html>