<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <title>COIPFDI</title>
    <link rel="stylesheet" href="static/plug/layui/css/layui.css">
    <%--网页图标--%>
    <link rel="shortcut icon" href="static/images/COIPIB.png" type="image/x-icon">
    <!--font-awesome-->
    <link href="static/plug/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!--全局样式表-->
    <link href="static/css/global.css" rel="stylesheet"/>
    <%--分页样式表--%>
    <link href="static/css/pageInfo/page.css" rel="stylesheet">
    <%--index页样式--%>
    <link href="static/css/index.css" rel="stylesheet">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 引入顺序也要注意下,bootstrap.js 依赖于jQuery.js -->
    <script src='static/js/jquery/jquery.min.js'></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header position: absolute;">
        <a href="${ctx}/index.jsp">
            <div class="layui-logo doc-logo" style="font-weight: bold">COIPFDI</div>
        </a>
        <ul class="layui-nav layui-layout-left small-head-nav-left">
            <li class="layui-nav-item"><a href="javascript:;"></a></li>
        </ul>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left head-nav-left">
            <li class="dropdown pull-right layui-nav-item">
                <a href="#" data-toggle="dropdown" class="dropdown-toggle">帮助</a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#" style="color:black;">关于软件</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">使用说明</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown pull-right layui-nav-item">
                <a href="#" data-toggle="dropdown" class="dropdown-toggle">管理员
                    <!-- <strong class="caret"></strong> --></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#" style="color:black;">参数预设</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">上载申请处理</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">联系管理员</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown pull-right layui-nav-item">
                <a href="#" data-toggle="dropdown" class="dropdown-toggle">编辑</a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#" style="color:black;">撤销</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">清除</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;" data-toggle="dropdown" class="dropdown-toggle">结果显示方式</a>
                        <ul style="text-align: right;">
                            <li>
                                <%--									<a href="#" style="color:black;" onclick="javascript:zhuzhuangChart();return false;">柱状图</a>--%>
                                <a href="#" style="color:black;"
                                   onclick="javascript:showBarChart();return false;">柱状图</a>
                            </li>
                            <li>
                                <%--									<a href="#" style="color:black;" onclick="javascript:zhexianChart();return false;">折线图</a>--%>
                                <a href="#" style="color:black;"
                                   onclick="javascript:showLineChart();return false;">折线图</a>
                            </li>
                            <li>
                                <a href="#" style="color:black;" onclick="javascript:bingChart();return false;">饼图</a>
                                <%--									<a href="#" style="color:black;" onclick="javascript:showPieChart();return false;">饼图</a>--%>
                            </li>
                            <li>
                                <a href="#" style="color:black;" onclick="javascript:leidaChart();return false;">雷达图</a>
                                <%--									<a href="#" style="color:black;" onclick="javascript:showRadarChart();return false;">雷达图</a>--%>
                            </li>
                        </ul>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">字体</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">字号</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown pull-right layui-nav-item">
                <a href="#" data-toggle="dropdown" class="dropdown-toggle">文件</a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#" style="color:black;">打开</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">关闭</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">保存</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">另存为</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">导出</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">导入</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">打印</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">上载</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#" style="color:black;">退出</a>
                    </li>
                </ul>
            </li>
            <!--禁止删除-->
            <li class="layui-nav-item" id="adminMenu">

            </li>
        </ul>
        <ul class="layui-nav layui-layout-right head-nav-right">
            <div class="btn-group" style="margin-right:20px">
                <button type="button" class="btn btn-default" onclick="window.location.href='login.jsp'">登录</button>
                <button type="button" class="btn btn-default" onclick="window.location.href='register.jsp'">注册</button>
            </div>
            <button type="button" class="btn btn-primary btn-lg" style="font-size:12px;display:none;margin-right:20px">
                <span class="glyphicon glyphicon-user"></span> User
            </button>
            <li class="layui-nav-item">
                <button class="layui-btn" lay-submit="" lay-filter="formSearch" onclick="calculation();"
                        id="calculateBtn">运行计算
                </button>
            </li>
        </ul>

        <a class="small-doc-navicon" href="javascript:;" onclick="showLeftNav();">
            <i class="fa fa-navicon"></i>
        </a>
    </div>


    <div class="layui-side left-nav-index" style="width:20%">
        <div class="layui-side-scroll" style="width:100%">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） --><!-- 选择区部分 -->
            <table class="table table-hover table-bordered">
                <tr>
                    <td>
                        <ul class=" layui-nav-tree" lay-filter="test" id="verticalMenu">
                            <li class="layui-nav-item">园区个数
                                <DIV style="POSITION: relative">
                                    <SELECT name="districtSelect" class="form-control"
                                            style=" WIDTH: 120px; CLIP: rect(0px auto auto 80px); POSITION: relative" id="numCount"
                                            onchange="document.getElementById('districtNum').value=this.options[this.selectedIndex].value">
                                        <%
                                            for (int i = 1; i <= 1000; i++) {
                                                out.print("<OPTION value='" + i + "'>" + i + "</OPTION>");
                                            }
                                        %>
                                    </SELECT>
                                    <INPUT id="districtNum" name="districtNum" class="form-control"
                                           style="LEFT: 2px; TOP: 2px; WIDTH: 92px;height:28px; POSITION: absolute;border:0">
                                </DIV>
                            </li>
                            <li class="layui-nav-item">时间序列
                                <DIV style="POSITION: relative">
                                    <SELECT name="districtSelect" class="form-control"
                                            style=" WIDTH: 120px; CLIP: rect(0px auto auto 80px); POSITION: relative" id="timeSequence"
                                            onchange="document.getElementById('districtTime').value=this.options[this.selectedIndex].value">
                                        <%
                                            for (int i = 1; i <= 1000; i++) {
                                                out.print("<OPTION value='" + i + "'>" + i + "</OPTION>");
                                            }
                                        %>
                                    </SELECT>
                                    <INPUT id="districtTime" name="districtTime" class="form-control"
                                           style="LEFT: 2px; TOP: 2px; WIDTH: 92px;height:28px; POSITION: absolute;border:0">
                                </DIV>
                            </li>
                            <li class="layui-nav-item">园区类型数
                                <DIV style="POSITION: relative">
                                    <SELECT name="typeCount" class="form-control"
                                            style=" WIDTH: 120px; CLIP: rect(0px auto auto 80px); POSITION: relative" id="typeCountSel"
                                            onchange="document.getElementById('typeCount').value=this.options[this.selectedIndex].value">
                                        <%
                                            for (int i = 1; i <= 1000; i++) {
                                                out.print("<OPTION value='" + i + "'>" + i + "</OPTION>");
                                            }
                                        %>
                                    </SELECT>
                                    <INPUT id="typeCount" name="districtTime" class="form-control"
                                           style="LEFT: 2px; TOP: 2px; WIDTH: 92px;height:28px; POSITION: absolute;border:0">
                                </DIV>
                            </li>
                            <li class="layui-nav-item">园区类型
                                <select class="form-control" style="width:180px;" id="type">
                                    <option value="0" slected>经贸合作区</option>
                                    <option value="1">工业园</option>
                                    <option value="2">科技园</option>
                                    <option value="3">资源园</option>
                                    <option value="4">物流园/商贸园</option>
                                    <option value="5">农业园</option>
                                    <option value="6">其他园区</option>
                                </select>
                            </li>
                            <li class="layui-nav-item">自定义模式
                                <select class="form-control" style="width:180px;" id="customize">
                                    <option value="0" selected>否</option>
                                    <option value="1">是</option>
                                </select>
                            </li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>评价结果查询(篇名/关键词)
                        <input type="text" name="" class="layui-input doc-search" id="simSearchKey"
                               placeholder="请输入：关键字" style="width:180px;">
                        <button class="layui-btn layui-btn-normal layui-btn-sm" lay-submit="" lay-filter="formSearch" id="simpleSearch"
                                onclick="doClickSimplySearch();"  style="margin-top:5px;width: 180px">搜索
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="panel panel-default" style="width:240px;">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    查询结果列表
                                </h3>
                            </div>
                            <div id="table_div" align="left">
                                <table id="queryResultTable" width="98%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <th>&nbsp;<b>查询编号</b></th>
                                        <th>&nbsp;<b>用户名</b></th>
                                        <th>&nbsp;<b>园区类型</b></th>
                                        <th>&nbsp;<b>       </b></th>
                                    </tr>
                                </table>
                            </div>
                            <div class="panel-body">

                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="layui-body left-nav-body" style="left:20%">
        <!-- 内容主体区域 -->
        <div class="blog-main">
            <!--左边栏目--><!-- 数据输入部分 -->
            <div class="blog-main-left" id="blog-main-left">
                <div id="body-content-left" style="margin:0px;">
                    <table style="text-align:center;margin:0px;" class="table table-hover table-bordered">
                        <tr>
                            <td><b>数据输入</b></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    文件输入
                                    <button type="button" class="btn btn-default" style="margin-left: 0px" onclick="fileCalculate()">确定</button>
                                    <br><input type="file" id="inputFile" class="form-control">

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>数据输入</td>
                        </tr>
                    </table>
                </div>
                <div id="tablepage">
                    <table class="table table-hover table-bordered" style="text-align:center;margin:0px;">
                        <tr>
                            <td>指标</td>
                            <td>数值</td>
                            <td>权重</td>
                            <td>标准</td>
                        </tr>
                        <tr>
                            <td>产品融合度</td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="data0"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="weight0"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="standard0">
                            </td>
                        </tr>
                        <tr>
                            <td>市场融合度</td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="data1"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="weight1"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="standard1">
                            </td>
                        </tr>
                        <tr>
                            <td>技术融合度</td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="data2"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="weight2"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="standard2">
                            </td>
                        </tr>
                        <tr>
                            <td>人员融合度</td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="data3"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="weight3"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="standard3">
                            </td>
                        </tr>
                        <tr>
                            <td>政策依赖度</td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="data4"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="weight4"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="standard4">
                            </td>
                        </tr>
                        <tr>
                            <td>资本依赖度</td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="data5"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="weight5"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="standard5">
                            </td>
                        </tr>
                        <tr>
                            <td>社会文化影响度</td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="data6"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="weight6"></td>
                            <td><input type="text" style="border:0px" class="layui-input doc-search" id="standard6">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--右边栏目--><!-- 数据输出部分 -->
            <div class="blog-main-right" id="blog-main-right">
                <div id="body-content-right">
                    <table class="table table-hover table-bordered" style="text-align:center;margin:0px;">
                        <tr>
                            <td><b>结果输出</b></td>
                        </tr>
                        <tr>
                            <td>文件输出
                                <button type="button" class="btn btn-default" id="btnFileOutput" onclick="filePDFOutput();">浏览</button>
<%--                                <h2 class="layui-colla-title layui-btn-sm" style="background-color: #009688">浏览</h2>--%>
<%--                                <div class="layui-colla-content">--%>
<%--                                    <span class="layui-btn" data-status='1' onclick="filePDFOutput();">导出PDF</span>--%>
<%--                                    <span class="layui-btn" data-status='0' onclick="fileExcelOutput();">导出Excel</span>--%>
<%--                                </div>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>结果预览</td>
                        </tr>
                    </table>
                </div>
                <div id="page">
                    <div class="panel panel-default" style="height:450px;">
                        <div id="chartContainer" style="height:400px;width:500px;"></div>
                    </div>
                </div>
            </div>
            <div id="showPdf" style="width: 100%;"></div>

            <div><span class="share">立即分享</span></div>
        </div>
        <div class="clear"></div>
    </div>

    <div class="layui-footer" style="left:20%">
        <!-- 底部固定区域 -->
        <button class="layui-btn layui-btn-primary layui-btn-sm" id="back" style="display: none;">
            <i class="fa fa-chevron-left" aria-hidden="true"></i>
        </button>
    </div>
</div>
<input type="hidden" id="isEdit" value="false">
<input type="hidden" id="isActive" value="false">
<!--二维码弹层-->
<div id="popQRCode">
    <div id="qrcode" style="margin-left: 30px; margin-top: 8px;"></div>
</div>
</body>

<script src="static/plug/layui/layui.js"></script>
<script src='static/js/jquery/jquery.min.js'></script>
<script src='static/js/pdfobject.js'></script>
<script src="static/plug/qrcodejs/qrcode.js"></script>
<script src="static/js/canvasjs.min.js"></script>
<script src="https://cdn.bootcss.com/html2canvas/0.5.0-beta4/html2canvas.js"></script>
<script src="https://cdn.bootcss.com/jspdf/1.3.4/jspdf.debug.js"></script>
<!-- ECharts单文件引入 -->
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
<script>

    // js全局变量
    var userInfo = {};
    userInfo.id = "${user.id}";
    userInfo.name = "${user.name}";
    userInfo.email = "${user.email}";
    userInfo.level = "${user.level}";
    userInfo.active = "${user.active}";
    var authEnum = ["游客可见", "注册用户可见", "VIP用户可见", "管理员可见"];
    var activeEnum = ["通过", "待审核", "未通过"];

    // layui框架导航模块初始化，禁止删除
    var layer, element;
    layui.use(['element', 'layer'], function () {
        element = layui.element;
        layer = layui.layer;
    });

    $(function () {
        getFirstLayer();
        checkUserLogin();
    });

    $('#simSearchKey').on('keypress', function (event) {
        if (event.keyCode == 13) {
            $('#simpleSearch').trigger('click');
        }

    })

    // 点击水平导航栏“编辑”、“文件”、“文件审核”显示文件
    function doClickHorizontalMenu(isActive, isEdit) {
        if (isActive == "false" && isEdit == "true" && userInfo.level == 0) {
            location = '${ctx}/login.jsp';
        }
        clearVerticalMenuCSS();
        $("#isActive").val(isActive);
        $("#isEdit").val(isEdit);
        var affiliationId = String($("#verticalMenu > li:nth-child(1) > a").attr("id"));
        affiliationId = affiliationId.substr(15);
        doClickShowDoc(affiliationId, 1);
        $("#body-content-right").html("");
        if (isActive == "true" && isEdit == "false") {
            $("#adminMenu > dl").unbind("click").bind("click", function () {
                $("#adminMenu").addClass("layui-this");
            });
        }
    }

    // 切换水平导航栏时恢复垂直导航栏状态
    function clearVerticalMenuCSS() {
        var ele = $("#verticalMenu");
        ele.children("li").each(function (i, childEle) {
            $(childEle).removeClass("layui-nav-itemed");
            $(childEle).removeClass("layui-this");
        });
        ele.children("dd").each(function (i, childEle) {
            $(childEle).removeClass("layui-this");
        });
    }

    // 显示用户信息
    function checkUserLogin() {
        if (userInfo != null && userInfo.id != null && userInfo.id != -1) {
            $("#loginButton").hide();
            var html = "";
            html = html + '<a href="javascript:;">' + userInfo.name + '</a>'
                + '<dl class="layui-nav-child">'
                + '<dd><a href="${ctx}/updatePassword">修改密码</a></dd>'
                + '<dd style="text-align: center;"><a href="javascript:;" onclick="logout();">退出</a></dd>'
                + '</dl>';
            $("#userInfoButton").html(html);
            $("#userInfoButton").show();
        } else {
            $("#loginButton").show();
            $("#userInfoButton").hide();
        }

        if (userInfo != null && userInfo.level != null && userInfo.level == 3) {
            var html = "";
            html = html + '<a href="javascript:;">管理员</a>\n' +
                '                <dl class="layui-nav-child">\n' +
                '                    <dd><a href="javascript:;" onclick="doClickHorizontalMenu(\'true\', \'false\');">文献审核</a></dd>\n' +
                '                    <dd><a href="javascript:;" onclick="doClickShowUserManagement(1);">用户管理</a></dd>\n' +
                '                </dl>'
            $("#adminMenu").html(html);
        }
    }

    // 用户退出
    function logout() {
        $.ajax({
            type: "get",
            url: "${ctx}/reglogin/logout",
            success: function (data) {
                if (data.code != 200) {
                    layer.msg(data.msg, {icon: 2});
                    return false;
                } else {
                    layer.msg(data.msg, {icon: 1});
                    location = "${ctx}/";
                }
            }
        });
    }

    // 获取一级菜单并显示
    function getFirstLayer() {
        $.ajax({
            async: false,
            type: "get",
            url: "${ctx}/affiliation/showFirstLayer",
            dataType: "json",
            success: function (data) {
                if (data.code != 200) {
                    layer.msg(data.msg, {icon: 2});
                    return false;
                } else {
                    var affiliationList = data.data.affiliationList;
                    var html = "";
                    var affiliationId = affiliationList[0].id;
                    doClickShowDoc(affiliationId, 1);
                    affiliationList.forEach(function (element) {
                        if (element.deleted == 1) {
                            var id = element.id;
                            var name = element.name;
                            var allChildren = getAllChildren(id);
                            html = html
                                + '<li class="layui-nav-item">\n'
                                + '<a class="" href="javascript:;" id="affiliationList' + id
                                + '" onclick="doClickShowDoc(' + id + ',' + 1 + ')">'
                                + name + '</a>\n'
                                + allChildren
                                + '</li>\n';
                        }
                    });
                    $("#verticalMenu").html(html);
                }
            }
        });
    };

    // 根据parentId获取二级菜单并返回html
    function getAllChildren(parentId) {
        var html = '';
        $.ajax({
            async: false,
            type: "post",
            url: "${ctx}/affiliation/showNextLayer",
            data: {parentId: parentId},
            dataType: "json",
            success: function (data) {
                if (data.code != 200) {
                    layer.msg(data.msg, {icon: 2});
                    return '';
                } else {
                    var affiliationList = data.data.childrenList;
                    if (affiliationList.length > 0) html = '<dl class="layui-nav-child">';
                    affiliationList.forEach(function (element) {
                        var id = element.id;
                        if (element.deleted == 1) {
                            var name = element.name;
                            html = html + '<dd><a href="javascript:;" onclick="doClickShowDoc(' + id + ',' + 1 + ')">'
                                + name
                                + '</a></dd>\n';
                        }
                    });
                    if (affiliationList.length > 0) html = html + '</dl>';
                }
            }
        });
        return html;
    }

    function doClickShowDoc(id, curPage) {
        var isEdit = $("#isEdit").val();
        var isActive = $("#isActive").val();
        $.ajax({
            type: 'get',
            url: "${ctx}/document/showAllDocument",
            data: {"affiliationId": id, "page": curPage, "isEdit": isEdit, "isActive": isActive},
            dataType: "json",
            success: function (data) {
                if (data.code != 200) {
                    layer.msg(data.msg, {icon: 2});
                    console.log(data.msg);
                    return '';
                } else {
                    fillDocsTable(data, id, curPage, isEdit, isActive);
                    return '';
                }
            }
        });
    }

    // doClickShowDoc子函数，填充不同情况下的表格
    function fillDocsTable(data, id, curPage, isEdit, isActive) {
        var htmlName = '<div class="layui-form"><table class="layui-table"><thead><tr>' +
            '<th style="width: 5%;text-align: center">序号</th>' +
            '<th style="width: 30%;text-align: center"">标题</th>' +
            '<th class="doc-preview" style="width: 6%;text-align: center"">预览</th>' +
            '<th style="width: 11%;text-align: center"">密级</th>' +
            '<th style="width: 10%;text-align: center"">作者</th>' +
            '<th class="doc-editor" style="width: 10%;text-align: center"">编辑人</th>' +
            '<th class="doc-updateTime" style="width: 10%;text-align: center"">更新日期</th>';
        if ((isEdit == "true" && isActive == "false") || (isEdit == "false" && isActive == "true")) {
            htmlName = htmlName + '<th style="width: 8%;text-align: center"">审核状态</th>';
            htmlName = htmlName + '<th style="width: 14%;text-align: center"">操作</th>';
        }
        htmlName = htmlName + '</tr></thead>';

        var pagination = data.data.pagination;
        var documentList = pagination.data;
        var pageInfo = pagination.pageInfo;
        var totalPage = pageInfo.totalPage;

        if (documentList.length > 0) htmlName = htmlName + '<tbody>';
        var sequence = 1;
        documentList.forEach(function (element) {
            var name = element.name;
            var editor = element.editor;
            var author = element.author;
            var attachment = element.attachment;
            var auth = element.auth;
            var active = element.active;
            var updateTime = timestampToTime(element.updateTime);
            htmlName = htmlName + '<tr>' +
                '<td style="text-align: center;">' + sequence + '</td>' +
                '<td><a style="cursor:pointer" onclick="doClickShowInfo(' + JSON.stringify(element).replace(/\"/g, "'") + ')">' + name + '</a></td>';
            if (attachment != null) {
                htmlName = htmlName + '<td class="doc-preview" style="text-align: center;"><a class="clickAction" onclick="doclickShowPdf(\'' + attachment + '\')">预览</a></td>';
            } else {
                htmlName = htmlName + '<td class="doc-preview" style="text-align: center;">预览</td>';
            }
            htmlName = htmlName +
                '<td style="text-align: center;">' + authEnum[auth] + '</td>' +
                '<td style="text-align: center;">' + author + '</td>' +
                '<td class="doc-editor" style="text-align: center;">' + editor + '</td>' +
                '<td class="doc-updateTime" style="text-align: center;">' + updateTime + '</td>';
            if (isEdit == "true" && isActive == "false") {
                htmlName = htmlName + '<td style="text-align: center;">' + activeEnum[active] + '</td>';
                if (id != 200) {
                    htmlName = htmlName + '<td style="text-align: center;"><a onclick="editeDoc(\'' + element.id + '\');" class="clickAction">编辑</a>'

                        + '<a class="clickAction" href="javascript:;" onclick="doClickPerformDocActions(' + element.id + ',' + id + ',' + curPage + ', \'remove\'' + ')">放入回收站</a>'
                        + '</td>';
                } else {
                    htmlName = htmlName + '<td style="text-align: center;"><a class="clickAction" onclick="doClickPerformDocActions(' + element.id + ',' + id + ',' + curPage + ', \'recover\'' + ')">还原</a>'
                        + '<a class="clickAction" href="javascript:;" onclick="doClickPerformDocActions(' + element.id + ',' + id + ',' + curPage + ', \'delete\'' + ')">永久删除</a>'
                        + '</td>';
                }
            }
            if (isEdit == "false" && isActive == "true") {
                htmlName = htmlName + '<td style="text-align: center;">' + activeEnum[active] + '</td>';
                if (id != 200) {
                    htmlName = htmlName + '<td style="text-align: center;"><a class="clickAction" onclick="doClickPerformDocActions(' + element.id + ',' + id + ',' + curPage + ', \'active\'' + ')">通过</a>'
                        + '<a class="clickAction" onclick="doClickPerformDocActions(' + element.id + ',' + id + ',' + curPage + ', \'reject\'' + ')">不通过</a>'
                        + '</td>';
                }
            }
            htmlName = htmlName + '</tr>';
            sequence++;
        });
        if (documentList.length > 0) htmlName = htmlName + '</tbody></table></div>';
        $("#body-content-left").html(htmlName);

        var htmlPage = '<li class="total-page"><a href="javascript:void(0);">共&nbsp;' + totalPage + '&nbsp;页</a></li>';
        if (curPage <= 1) {
            htmlPage = htmlPage + '<li><a href="javascript:void(0);">上一页</a></li>';
        } else {
            curPage = curPage - 1;
            htmlPage = htmlPage + '<li><a href="javascript:void(0);" onclick="doClickShowDoc('
                + id + ','
                + curPage
                + ')">上一页</a></li>';
        }
        htmlPage = htmlPage + '<li><a href="javascript:void(0);" id="curPageIndex" data-curpage=' + pageInfo.page + ' data-affid=' + id + '>当前页&nbsp;' + pageInfo.page + '</a></li>';
        if (curPage >= pageInfo.totalPage) {
            htmlPage = htmlPage + '<li><a href="javascript:void(0);">下一页</a></li>';
        } else {
            curPage = curPage + 1;
            htmlPage = htmlPage + '<li><a href="javascript:void(0);" onclick="doClickShowDoc('
                + id + ','
                + curPage
                + ')">下一页</a></li>';
        }
        $("#page").html(htmlPage);
    }

    // 显示所有用户
    function doClickShowUserManagement(curPage) {
        var levelEnum = ["普通用户", "VIP用户", "管理员"];
        $.ajax({
            type: 'get',
            url: "${ctx}/reglogin/showAllUser",
            data: {"page": curPage},
            dataType: "json",
            success: function (data) {
                if (data.code != 200) {
                    layer.msg(data.msg, {icon: 2});
                    console.log(data.msg);
                    return false;
                } else {
                    var htmlName = '<div class="layui-form"><table class="layui-table"><thead><tr>' +
                        '<th style="width: 6%;text-align: center">序号</th>' +
                        '<th style="width: 6%;text-align: center">用户名</th>' +
                        '<th style="width: 42%;text-align: center"">邮箱</th>' +
                        '<th style="width: 8%;text-align: center"">级别</th>' +
                        '<th style="width: 10%;text-align: center"">操作</th>';
                    htmlName = htmlName + '</tr></thead>';
                    var pagination = data.data.pagination;
                    var userList = pagination.data;
                    var pageInfo = pagination.pageInfo;
                    var totalPage = pageInfo.totalPage;

                    if (userList.length > 0) htmlName = htmlName + '<tbody>';
                    var sequence = 1;
                    userList.forEach(function (element) {
                        var name = element.name;
                        var email = element.email;
                        var level = element.level;
                        htmlName = htmlName + '<tr>' +
                            '<td style="text-align: center;">' + sequence + '</td>' +
                            '<td style="text-align: center;">' + name + '</td>' +
                            '<td style="text-align: center;">' + email + '</td>' +
                            '<td style="text-align: center;">' + levelEnum[level - 1] + '</td>' +
                            '<td style="text-align: center;">';
                        if (level <= 1) {
                            htmlName = htmlName + '<a class="clickAction" href="javascript:;" onclick="doClickGrantVIP(' + element.id + ',' + curPage + ');">升级用户</a>';
                        } else {
                            htmlName = htmlName + '升级用户';
                        }
                        htmlName = htmlName + '</td></tr>';
                        sequence++;
                    });
                    if (userList.length > 0) htmlName = htmlName + '</tbody></table></div>';
                    $("#body-content-left").html(htmlName);

                    var htmlPage = '<li class="total-page"><a href="javascript:void(0);">共&nbsp;' + totalPage + '&nbsp;页</a></li>';
                    if (curPage <= 1) {
                        htmlPage = htmlPage + '<li><a href="javascript:void(0);">上一页</a></li>';
                    } else {
                        curPage = curPage - 1;
                        htmlPage = htmlPage + '<li><a href="javascript:void(0);" onclick="doClickShowUserManagement('
                            + curPage
                            + ')">上一页</a></li>';
                    }
                    htmlPage = htmlPage + '<li><a href="javascript:void(0);">当前页&nbsp;' + pageInfo.page + '</a></li>';
                    if (curPage >= pageInfo.totalPage) {
                        htmlPage = htmlPage + '<li><a href="javascript:void(0);">下一页</a></li>';
                    } else {
                        curPage = curPage + 1;
                        htmlPage = htmlPage + '<li><a href="javascript:void(0);" onclick="doClickShowUserManagement('
                            + curPage
                            + ')">下一页</a></li>';
                    }
                    $("#page").html(htmlPage);
                }
            }
        });
    }

    function doclickShowPdf(attachment) {
        document.getElementById("blog-main-left").style.display = "none";
        document.getElementById("blog-main-right").style.display = "none";
        var height = window.innerHeight - 67;
        document.getElementById("showPdf").style.height = height + "px";
        PDFObject.embed(attachment, "#showPdf");
        $("#showPdf").show();
        $("#back").show();
    }

    function clickBackBtn() {
        $("#blog-main-left").show();
        $("#blog-main-right").show();
        $("#showPdf").hide();
        $("#back").hide();
    }

    function doClickShowInfo(obj) {
        var name = obj.name;
        var topic = obj.topic;
        var year = obj.year;
        var editor = obj.editor;
        var digest = obj.digest;
        var author = obj.author;
        var authorIntro = obj.authorIntro == null ? "" : obj.authorIntro;
        var note = obj.note == null ? "" : obj.note;
        var auth = obj.auth;
        var affiliation = obj.affiliationList[0].name;
        if (obj.affiliationList[1] != null) {
            affiliation += "->" + obj.affiliationList[1].name;
        }
        var keywords = obj.keywords;
        var createTime = timestampToDate(obj.createTime);
        var updateTime = timestampToDate(obj.updateTime);
        var html = '标题：' + name +
            '<br><br>作者：' + author +
            '<br><br>作者简介：' + authorIntro +
            '<br><br>摘要：' + digest +
            '<br><br>关键字：' + keywords +
            '<br><br>主题：' + topic +
            '<br><br>归属：' + affiliation +
            '<br><br>备注：' + note +
            '<br><br>密级：' + authEnum[auth] +
            '<br><br>年份：' + year +
            '<br><br>编辑人：' + editor +
            '<br><br>创建时间：' + createTime +
            '<br><br>修改时间：' + updateTime;
        $("#body-content-right").html(html);
    }

    function timestampToTime(timestamp) {
        var date = new Date(timestamp);
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var D = date.getDate() + ' ';
        return Y + M + D;
    }

    function timestampToDate(timestamp) {
        var date = new Date(timestamp);
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var D = date.getDate() + ' ';
        var h = date.getHours() < 10 ? '0' + date.getHours() : date.getHours();
        var m = date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes();
        var s = date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds();
        return Y + M + D + h + ':' + m + ":" + s;
    }

    // 实现文件操作：放入回收站、回收站文件永久删除、回收站文件还原、文件审核
    function doClickPerformDocActions(docId, affiliationId, curPage, action) {
        var interface = "${ctx}/document/" + action;
        $.ajax({
            type: 'get',
            url: interface,
            data: {"id": docId},
            dataType: "json",
            success: function (data) {
                if (data.code != 200) {
                    layer.msg(data.msg, {icon: 2});
                    return '';
                } else {
                    layer.msg(data.msg, {icon: 1});
                    doClickShowDoc(affiliationId, curPage);
                    return;
                }
            }
        });
    }

    // 升级VIP用户操作
    function doClickGrantVIP(userId, curPage) {
        var e = e || window.event;
        var obj = e.target || e.srcElement;
        $.ajax({
            type: 'get',
            url: '${ctx}/reglogin/grantVIP',
            data: {"id": userId},
            dataType: "json",
            success: function (data) {
                if (data.code != 200) {
                    layer.msg(data.msg, {icon: 2});
                    return false;
                } else {
                    layer.msg(data.msg, {icon: 1});
                    doClickShowUserManagement(curPage);
                    return;
                }
            }
        });
    }

    // 搜索文件
    function doClickSimplySearch() {
        var resultTable = document.getElementById('queryResultTable');
        // 删除所有行，不删除标题行
        var rowCount = resultTable.rows.length; // 获得一共多少行，因为不删除标题，所以索引从 1 开始
        for (var i = 1; i < rowCount; i++) {
            resultTable.deleteRow(1); // 因为删除一行以后下面的行会顶上来，所以一直删除第一行即可
        }
        var key = $("#simSearchKey").val();
        $.ajax({
            type: 'get',
            url: '${ctx}/query',
            data: {"id_name_type": key},
            dataType: "json",
            success: function (data) {
                if(data != '[]'){
                    var objs=eval(data); // 解析JSON
                    var count=1;
                    for(var i=0;i<objs.length;i++) { // 循环对象
                        var queryObj = objs[i];
                        var row = resultTable.insertRow(count++); // 插入一行rows是一个数组，索引从0开始
                        row.insertCell(0).innerHTML = "&nbsp;" + queryObj.id; // insertCell插入列，从0开始
                        row.insertCell(1).innerHTML = "&nbsp;" + queryObj.userName;
                        row.insertCell(2).innerHTML = "&nbsp;" + queryObj.type;
                        var buttonHTML="<button class=\"layui-btn layui-btn-normal layui-btn-xs\" onclick=\"showResultInChartContainer("+queryObj.goal+");\" style=\"margin-top: 3px\">结果预览 </button>";
                        row.insertCell(3).innerHTML = "&nbsp;" + buttonHTML;
                    }
                }else{
                    alert("未查询到结果！");
                }
            }
        });
    }

    // 导出PDF文件
    function filePDFOutput(){
        var target = document.getElementsByClassName("blog-main");
        html2canvas(target).then(function (canvas)
            {
                var contentWidth = canvas.width;
                var contentHeight = canvas.height;

                //一页pdf显示html页面生成的canvas高度;
                var pageHeight = contentWidth / 592.28 * 841.89;
                //未生成pdf的html页面高度
                var leftHeight = contentHeight;
                //pdf页面偏移
                var position = 0;
                //html页面生成的canvas在pdf中图片的宽高（a4纸的尺寸[595.28,841.89]）
                var imgWidth = 595.28;
                var imgHeight = 592.28 / contentWidth * contentHeight;

                var pageData = canvas.toDataURL('image/jpeg', 1.0);
                var pdf = new jsPDF('', 'pt', 'a4');

                //有两个高度需要区分，一个是html页面的实际高度，和生成pdf的页面高度(841.89)
                //当内容未超过pdf一页显示的范围，无需分页
                if (leftHeight < pageHeight) {
                    pdf.addImage(pageData, 'JPEG', 0, 0, imgWidth, imgHeight);
                } else {
                    while (leftHeight > 0) {
                        pdf.addImage(pageData, 'JPEG', 0, position, imgWidth, imgHeight)
                        leftHeight -= pageHeight;
                        position -= 841.89;
                        //避免添加空白页
                        if (leftHeight > 0) {
                            pdf.addPage();
                        }
                    }
                }
                pdf.save('中国境外产业园区融合发展指数测度.pdf');
            }
        );
    }

    // 导出Excel文件
    function fileExcelOutput(){

    }

    function editeDoc(docId) {
        location.href = '${ctx}/docOperation';
        window.localStorage.setItem('docId', docId);
    }

    var leftNavFlag = false;

    function showLeftNav() {
        if (leftNavFlag == false) {
            $(".left-nav-index").show();
            leftNavFlag = true;
        } else {
            $(".left-nav-index").hide();
            leftNavFlag = false;
        }

    }

    // 二维码分享
    $(".share").unbind("click").bind('click', function () {
        var url = document.location;
        var qrcode = new QRCode('qrcode', {
            text: String(url),
            width: 220,
            height: 220,
            colorDark: '#000000',
            colorLight: '#ffffff',
            correctLevel: QRCode.CorrectLevel.H
        });
        layer.open({
            title: '分享此网页',
            type: 1,
            resize: false,
            area: ['280px', '280px'],
            content: $('#popQRCode'),
            cancel: function (index, layer0) {
                qrcode.clear();
                $('#qrcode').html('');
            }
        });
    });

    function zhuzhuangChart() {
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });

        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('chartContainer'));

                option = {
                    calculable: true,
                    xAxis: [
                        {
                            type: 'category',
                            data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: '蒸发量',
                            type: 'bar',
                            data: [2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
                            markPoint: {
                                data: [
                                    {type: 'max', name: '最大值'},
                                    {type: 'min', name: '最小值'}
                                ]
                            },
                            markLine: {
                                data: [
                                    {type: 'average', name: '平均值'}
                                ]
                            }
                        },
                        {
                            name: '降水量',
                            type: 'bar',
                            data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
                            markPoint: {
                                data: [
                                    {name: '年最高', value: 182.2, xAxis: 7, yAxis: 183, symbolSize: 18},
                                    {name: '年最低', value: 2.3, xAxis: 11, yAxis: 3}
                                ]
                            },
                            markLine: {
                                data: [
                                    {type: 'average', name: '平均值'}
                                ]
                            }
                        }
                    ]
                };

                // 为echarts对象加载数据
                myChart.setOption(option);
            }
        );
    }

    function bingChart() {

        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });

        var data = {
            'count': 4,
            'name': ['园区一', '园区二', '园区三', '园区四'],
            'num': [200, 300, 400, 500]
        };

        // 使用
        require(
            [
                'echarts',
                'echarts/chart/pie' // 使用饼图就加载pie模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('chartContainer'));

                var str = "[";
                for (var i = 0; i < data['count']; i++) {
                    var temp = "{value: " + data['num'][i] + ", name: '" + data['name'][i] + "'},";
                    str += temp;
                }
                str += "]";

                option = {
                    calculable: true,
                    series: [
                        {
                            name: '访问来源',
                            type: 'pie',
                            radius: '55%',
                            center: ['50%', '60%'],
                            data: eval(str),//序列，字典，列表
                            // [
                            // 	{value:data['num'][0], name:data['name'][0]},
                            // 	{value:data['num'][1], name:data['name'][1]},
                            // 	{value:data['num'][2], name:data['name'][2]},
                            // 	{value:data['num'][3], name:data['name'][3]},
                            // ]
                        }
                    ]
                };

                // 为echarts对象加载数据
                myChart.setOption(option);


            }
        );
    }

    function zhexianChart() {
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });

        // 使用
        require(
            [
                'echarts',
                'echarts/chart/line' // 使用折线图就加载line模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('chartContainer'));

                option = {
                    calculable: true,
                    xAxis: [
                        {
                            type: 'category',
                            boundaryGap: false,
                            data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            axisLabel: {
                                formatter: '{value} °C'
                            }
                        }
                    ],
                    series: [
                        {
                            name: '最高气温',
                            type: 'line',
                            data: [11, 11, 15, 13, 12, 13, 10],
                            markPoint: {
                                data: [
                                    {type: 'max', name: '最大值'},
                                    {type: 'min', name: '最小值'}
                                ]
                            },
                            markLine: {
                                data: [
                                    {type: 'average', name: '平均值'}
                                ]
                            }
                        },
                        {
                            name: '最低气温',
                            type: 'line',
                            data: [1, -2, 2, 5, 3, 2, 0],
                            markPoint: {
                                data: [
                                    {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
                                ]
                            },
                            markLine: {
                                data: [
                                    {type: 'average', name: '平均值'}
                                ]
                            }
                        }
                    ]
                };

                // 为echarts对象加载数据
                myChart.setOption(option);
            }
        );
    }

    function leidaChart() {
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });

        var data = {
            'count': 4,
            'name': ['园区一', '园区二', '园区三', '园区四'],
            'num': [20000, 30000, 40000, 50000]
        };

        // 使用
        require(
            [
                'echarts',
                'echarts/chart/radar' // 使用雷达图就加载radar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('chartContainer'));

                var str = "[";
                for (var i = 0; i < data['count']; i++) {
                    var temp = "{text: '" + data['name'][i] + "', max: " + data['num'][i] + "},";
                    str += temp;
                }
                str += "]";

                option = {
                    polar: [
                        {
                            indicator: eval(str)
                            // 		[
                            // 	{ text:data['name'][0], max: data['num'][0]},
                            // 	{ text:data['name'][1], max: data['num'][1]},
                            // 	{ text:data['name'][2], max: data['num'][2]},
                            // 	{ text:data['name'][3], max: data['num'][3]},
                            // ]
                        }
                    ],
                    calculable: true,
                    series: [
                        {
                            name: '预算 vs 开销（Budget vs spending）',
                            type: 'radar',
                            data: [
                                {
                                    value: [4300, 10000, 28000, 35000, 50000, 19000],
                                    name: '预算分配（Allocated Budget）'
                                },
                                {
                                    value: [5000, 14000, 28000, 31000, 42000, 21000],
                                    name: '实际开销（Actual Spending）'
                                }
                            ]
                        }
                    ]
                };
                // 为echarts对象加载数据
                myChart.setOption(option);
            }
        );
    }

    var data0 = {
        'type': 0,
        'time': [2017, 2018, 2019],
        'country': "阿富汗",
        'data': [[1.1, 1.3, 1.5, 1.2], [1.7, 2.3, 1.1, 2.3], [1.2, 1.0, 1.8, 1.7]]
    };
    var data1 = {
        'type': 1,
        'time': 2019,
        'country': ['USA', 'UK', 'China'],
        'data': [[2.1, 2.3, 2.1, 2.6], [2.1, 2.3, 2.1, 2.6], [2.1, 2.3, 2.1, 2.6]]
    };

    function showBarChart() {//柱状图
        var data = {
            'type': 0,
            'time': [2017, 2018, 2019],
            'country': "园区融合发展指数",
            'data': [[1.1, 1.3, 1.5, 1.2], [1.7, 2.3, 1.1, 2.3], [1.2, 1.0, 1.8, 1.7]]
        };
        var type = data['type'];
        charData = [];
        var title_text;
        if (type == 0) {
            title_text = data['country'];
            for (var i = 0; i < data['data'].length; i++) {
                var column = {
                    type: "column",
                    name: data['country'] + data['time'][i] + '年的数据',
                    legendText: "" + data['time'][i],
                    showInLegend: true,
                    dataPoints: [
                        {label: "园区一", y: data['data'][i][0]},
                        {label: "园区二", y: data['data'][i][1]},
                        {label: "园区三", y: data['data'][i][2]},
                        {label: "园区四", y: data['data'][i][3]},
                    ]
                };
                charData.push(column);
            }
        } else if (type == 1) {
            title_text = "各园区" + data['time'] + "年指数对比";
            for (var i = 0; i < data['data'].length; i++) {
                var column = {
                    type: "column",
                    name: data['country'][i] + data['time'] + '年的数据',
                    legendText: "" + data['country'][i],
                    showInLegend: true,
                    dataPoints: [
                        {label: "政治风险", y: data['data'][i][0]},
                        {label: "经济风险", y: data['data'][i][1]},
                        {label: "社会风险", y: data['data'][i][2]},
                        {label: "综合风险", y: data['data'][i][3]},
                    ]
                };
                charData.push(column);
            }

        }

        var chart = new CanvasJS.Chart("chartContainer", {
            animationEnabled: true,
            title: {
                text: title_text
            },
            toolTip: {
                shared: true
            },
            legend: {
                cursor: "pointer",
                itemclick: toggleDataSeries
            },
            data: charData,
        });
        chart.render();

        function toggleDataSeries(e) {
            if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                e.dataSeries.visible = false;
            } else {
                e.dataSeries.visible = true;
            }
            chart.render();
        }
    }

    function showLineChart() {
        var data = {
            'type': 0,
            'time': [2017, 2018, 2019],
            'country': "园区融合发展指数",
            'data': [[1.1, 1.3, 1.5, 1.2], [1.7, 2.3, 1.1, 2.3], [1.2, 1.0, 1.8, 1.7]]
        };
        var type = data['type'];
        charData = [];
        risk = ["园区一", "园区二", "园区三", "园区四"];
        var title_text;
        if (type == 0) {
            title_text = data['country'];
            for (var i = 0; i < 4; i++) {
                dataPts = [];
                for (var j = 0; j < data['time'].length; j++) {
                    var pts = {x: new Date(data['time'][j], 0, 0), y: data['data'][j][i]};
                    dataPts.push(pts);
                }
                var line = {
                    type: "line",
                    name: risk[i],
                    showInLegend: true,
                    dataPoints: dataPts
                };
                charData.push(line);
            }
        } else if (type == 1) {
            for (var i = 0; i < 4; i++) {
                dataPts = [];
                for (var j = 0; j < data['country'].length; j++) {
                    // var pts = {x:new ()}
                }
                var column = {
                    type: "column",
                    name: data['country'][i] + data['time'] + '年的数据',
                    legendText: "" + data['country'][i],
                    showInLegend: true,
                    dataPoints: [
                        {label: "政治风险", y: data['data'][i][0]},
                        {label: "经济风险", y: data['data'][i][1]},
                        {label: "社会风险", y: data['data'][i][2]},
                        {label: "综合风险", y: data['data'][i][3]},
                    ]
                };
                charData.push(column);
            }

        }

        var chart = new CanvasJS.Chart("chartContainer", {
            title: {
                text: data['country']
            },
            axisX: {
                valueFormatString: "YYYY"
            },
            toolTip: {
                shared: true
            },
            legend: {
                cursor: "pointer",
                itemclick: toggleDataSeries
            },
            data: charData
        });
        chart.render();

        function toggleDataSeries(e) {
            if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                e.dataSeries.visible = false;
            } else {
                e.dataSeries.visible = true;
            }
            e.chart.render();
        }
    }

    <%--function createNode(txt) {--%>
    <%--    const template = `<div class='child'>${txt}</div>`;--%>
    <%--    let tempNode = document.createElement('div');--%>
    <%--    tempNode.innerHTML = template;--%>
    <%--    return tempNode.firstChild;--%>
    <%--}--%>

    function calculation() {
        debugger;
        var array = new Array(15);
        for (var i = 0; i < 7; i++) {
            array[i] = document.getElementById(("data" + i).toString()).value;
        }
        for (var i = 0; i < 7; i++) {
            array[7 + i] = document.getElementById(("weight" + i).toString()).value;
        }
        var typeObj = document.getElementById("type");
        var typeindex = typeObj.selectedIndex;
        var type = typeObj.options[typeindex].text;

        var customizeObj = document.getElementById("customize");
        var customizeindex = customizeObj.selectedIndex;
        var customize = customizeObj.options[customizeindex].text;
        $.ajax({
            type: 'post',
            url: '${ctx}/calculate/table',
            data:{"array": JSON.stringify(array), "type": type, "customize": customize},
            dataType: 'json',
            success: function (result) {
                var data = eval('('+result+')')['goal'];
                showResultInChartContainer(data);
            }
        });
    }

    function fileCalculate() {
        //园区个数
        var Obj1 = document.getElementById("numCount");
        var index1 = Obj1.selectedIndex;
        var text1 = Obj1.options[index1].text;
        //时间序列
        var Obj2 = document.getElementById("timeSequence");
        var index2 = Obj2.selectedIndex;
        var text2 = Obj2.options[index2].text;
        //园区类型数
        var Obj3 = document.getElementById("typeCountSel");
        var index3 = Obj3.selectedIndex;
        var text3 = Obj3.options[index3].text;
        //园区类型
        var Obj4 = document.getElementById("type");
        var index4 = Obj4.selectedIndex;
        var text4 = Obj4.options[index4].text;

        var formData = new FormData();
        formData.append('file', $('#inputFile')[0].files[0]); // 固定格式
        formData.append('numCount', text1);
        formData.append('timeCount', text2);
        formData.append('typeCount', text3);
        formData.append('type', text4);

        $.ajax({
            url:'${ctx}/calculate/file',	//后台接收数据地址
            data:formData,
            type: "POST",
            dataType: "json",
            cache: false,			//上传文件无需缓存
            processData: false,		//用于对data参数进行序列化处理 这里必须false
            contentType: false,
            success:function(data){
                alert("文件上传成功！");
                alert(data);
            },
            failure: function () {
                alert("文件上传失败！");
            }
        })
    }

    function showResultInChartContainer(data) {
        let str;
        if(data<20){
            str="很低";
        }
        else if(data>=20&&data<40){
            str="较低";
        }
        else if(data>=40&&data<60){
            str="一般";
        }
        else if(data>=60&&data<80){
            str="较高";
        }
        else if(data>=80){
            str="很高";
        }
        const container = document.getElementById("chartContainer");
        container.innerText = "融合化发展指数\n"+data+"\n融合化发展水平"+str;
        container.style.fontSize = '30px';
        container.style.textAlign = 'center';
        container.style.verticalAlign = "middle";

    }

</script>
</html>