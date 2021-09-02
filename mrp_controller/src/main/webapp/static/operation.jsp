<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>出入库页面</title>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css"/>
    <!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
    <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <style>
        .lauiuserinput {
            width: 100px;
            height: 28px;
            margin-left: 800px;
        }
    </style>
    <script>
        $(function () {
            $.ajax({
                url: "http://localhost:8080/layuiDemo_war_exploded/static/goodType/sessionList",
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

</head>

<body style="padding: 20px;">
<!-- 页面结构 -->
<div class="layui-main">
    <!-- 表格上方标题 -->
    <blockquote class="layui-elem-quote">操作日志</blockquote>
    <!-- 添加按钮 -->
    <%--    <a class="layui-btn layui-btn-sm" id="add-user-btn">入库</a>--%>
    <input class="layui-input-inline lauiuserinput " placeholder="查找日志" id="add-user-input" autocomplete="off"/>
    <a class="layui-btn layui-btn-sm" id="add-user-btn1">点击查询日志</a>
    <!-- 用户表 -->
    <table id="user-tbl" lay-filter="user-tbl"></table>
    <script type="text/html" id="user-tbl-toolbar">
        <%--        <a class="layui-btn layui-btn-xs" lay-event="updateUser">出库</a>--%>
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="deleteUser">删除</a>
    </script>
</div>

<!-- 添加用户弹出层 -->
<div id="add-user-layer" style="display: none; padding: 20px">
    <form id="add-user-form" class="layui-form layui-form-pane">
        <%--        <div class="layui-form-item">--%>
        <%--            <label class="layui-form-label">商品ID</label>--%>
        <%--            <div class="layui-input-block">--%>
        <%--                <input type="text" name="typeId" class="layui-input" lay-verify="required" autocomplete="off">--%>
        <%--            </div>--%>
        <%--        </div>--%>

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

<!-- 更新用户弹出层 -->
<div id="update-user-layer" style="display: none; padding: 20px">
    <form id="update-user-form" class="layui-form layui-form-pane" lay-filter="update-user-form">
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">id</label>
            <div class="layui-input-block">
                <input type="text" name="goodId" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-block">
                <input type="text" name="goodName" class="layui-input" lay-verify="required"
                       style="cursor:not-allowed;color: gray" disabled autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品信息</label>
            <div class="layui-input-block">
                <input type="text" name="goodInfo" class="layui-input" lay-verify="required"
                       style="cursor:not-allowed;color: gray" disabled autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品价格</label>
            <div class="layui-input-block">
                <input type="text" name="goodPrice" class="layui-input" lay-verify="required"
                       style="cursor:not-allowed;color: gray" disabled autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出库数量</label>
            <div class="layui-input-block">
                <input onchange="validate()" type="text" name="goodNum" class="layui-input nums1" lay-verify="required"
                       autocomplete="off">
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
                <button class="layui-btn" lay-submit lay-filter="update-user-form-submit">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    function dateToStr(date) {
        var time = new Date(date);
        var y = time.getFullYear();
        var M = time.getMonth() + 1;
        M = M < 10 ? ("0" + M) : M;
        var d = time.getDate();
        d = d < 10 ? ("0" + d) : d;
        var h = time.getHours();
        h = h < 10 ? ("0" + h) : h;
        var m = time.getMinutes();
        m = m < 10 ? ("0" + m) : m;
        var s = time.getSeconds();
        s = s < 10 ? ("0" + s) : s;
        var str = y + "-" + M + "-" + d + " " + h + ":" + m + ":" + s;
        // var str = y + "年" + M + "月" + d + "日  " + h + "时" + m + "分" + s+"秒";
        console.log(str);
        return str;
    }
</script>
<!-- 页面JS -->
<script>
    layui.use(['jquery', 'table', 'layer', 'form'], function () {
        // 加载layui模块，使用其推荐的【预先加载】方式，详见官网【模块规范】一节
        var $ = layui.$;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        table.render({
            elem: '#user-tbl',
            url: 'operation/all',
            method: 'get',
            cols: [[
                {field: 'id', title: 'ID'},
                {
                    field: 'user.name', title: '操作者'
                    , templet(d) {
                        return d.user.name
                    }
                },
                {field: 'goodName', title: '商品名称'},
                {
                    field: 'operationType', title: '操作类型'
                    , templet: function (d) {
                        if (d.operationType == 2) {
                            return '入库'
                        } else if (d.operationType == -1) {
                            return '出库'
                        } else if (d.operationType == 1) {
                            return '添加商品'
                        } else if (d.operationType == 3) {
                            return '更新商品'
                        } else if (d.operationType == 4) {
                            return '删除商品'
                        }
                    }
                },
                {field: 'operationNum', title: '操作数量'},
                {
                    field: 'operationTime', title: '操作时间'
                    , templet: function (d) {
                        return dateToStr(d.operationTime);
                    }
                },
                {toolbar: '#user-tbl-toolbar', title: '操作'}
            ]],
            // 表格容器id，用于表格重载
            id: 'user-tbl',
            even: true,
            page: true,
            limits: [3, 5, 10],
            limit: 5, //每页默认显示的数量

        });


        // 通过用户姓名查找日志
        $(document).on('click', '#add-user-btn1', function (data) {
            var sreachTxt = $("#add-user-input");
            layer.msg(sreachTxt.val())
            console.log(data)
            console.log("sssss" + sreachTxt.val())
            var index = layer.msg('查询中，请稍候...', {icon: 16, time: false, shade: 0});
            table.reload('user-tbl', {
                //where 可以用 访问同一个controller 的时候可以用动态sql生成 暂时这样获取参数
                url: 'operation/' + sreachTxt.val(),
                // where:{
                //    name:sreachTxt.val()
                // },
                page: {
                    curr: 1
                }

            })
            layer.close(index);
        })

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

        form.on('submit(add-user-form-submit)', function (data) {
            $.ajax({
                url: "http://localhost:8080/layuiDemo_war_exploded/static/operation",
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

        // 监听行工具栏事件：删除用户与更新用户
        table.on('tool(user-tbl)', function (obj) {
            // 获取当前行数据和lay-event的值
            var data = obj.data;
            var event = obj.event;

            if (event === 'deleteUser') {
                layer.confirm('确定删除该用户吗？', function (index) {
                    $.ajax({
                        url: 'operation/' + data.id,
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
            }

            if (event === 'updateUser') {
                form.val('update-user-form', {
                    "goodId": data.goodId,
                    "goodName": data.goodName,
                    "goodPrice": data.goodPrice,
                    "goodInfo": data.goodInfo,
                    "goodNums": data.goodNum,
                    "goodNum": "",
                });
                layer.open({
                    type: 1,
                    title: '更新用户',
                    skin: 'layui-layer-molv',
                    area: ['500px'],
                    content: $('#update-user-layer')
                });
                form.on('submit(update-user-form-submit)', function (data) {
                    $.ajax({
                        url: "operation",
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
                                    url: 'operation/all',
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
            }
        });
    });

</script>
</body>

</html>