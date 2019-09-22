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

    <style type="text/css">
        .table0 {
            font-family: "宋体";
            font-size: 14px;
            width: 400px;
            border-top-width: 1px;
            border-top-style: solid;
            border-top-color: #c4cdd4;
            border-bottom-width: 1px;
            border-bottom-style: solid;
            border-bottom-color: #c4cdd4;
            border-right-width: 1px;
            border-right-style: solid;
            border-right-color: #c4cdd4;
            border-left-width: 1px;
            border-left-style: solid;
            border-left-color: #c4cdd4;
        }
        .table0  tr {
            height : 25px;
            padding-left:5px;
            text-align: left;
        }
        .table0 th {
            color: #4c7c9b;
            font-weight: normal;
            background-color: #f1f1f1;
            height: 25px;
            border-right-width: 1px;
            border-right-style: solid;
            border-right-color: #c4cdd4;
        }
        .table0 td {
            border-right-width: 1px;
            border-right-style: solid;
            border-right-color: #c4cdd4;
            border-bottom-width: 1px;
            border-bottom-style: solid;
            border-bottom-color: #c4cdd4;
        }
    </style>

</head>
<body>
<div class="layui-side left-nav-index">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） --><!-- 选择区部分 -->
        <table class="table table-hover table-bordered">
            <tr>
                <td>评价结果查询<br>篇名/关键词
                    <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="formSearch"
                            onclick="doClickSimplySearch();" id="simpleSearch" style="margin-left:40px;">搜索
                    </button>
                    <input type="text" name="" class="layui-input doc-search" id="simSearchKey"
                           placeholder="请输入：关键字" style="width:180px;">
                </td>
            </tr>
        </table>
    </div>
</div>
<br><br><br><br><br><br><br><br><br>
<div id="table_div" align="left">
    <table id="queryResultTable" width="98%" border="0" cellspacing="0" cellpadding="0" class="table0">
        <tr>
            <th>&nbsp;<b>查询编号</b></th>
            <th>&nbsp;<b>用户名</b></th>
            <th>&nbsp;<b>园区类型</b></th>
        </tr>
    </table>
</div>
</body>

<script src="static/plug/layui/layui.js"></script>
<script src='static/js/jquery/jquery.min.js'></script>
<script src='static/js/pdfobject.js'></script>
<script src="static/plug/qrcodejs/qrcode.js"></script>
<script src="static/js/canvasjs.min.js"></script>
<!-- ECharts单文件引入 -->
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
<script language="javascript" type="text/javascript">
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
                    for(var i=0;i<objs.length;i++) { // 循环对象
                        var count=1;
                        var queryObj = objs[i];
                        var row = resultTable.insertRow(count); // 插入一行rows是一个数组，索引从0开始
                        count++;
                        row.insertCell(0).innerHTML = "&nbsp;" + queryObj.id; // insertCell插入列，从0开始
                        row.insertCell(1).innerHTML = "&nbsp;" + queryObj.userName;
                        row.insertCell(2).innerHTML = "&nbsp;" + queryObj.type;
                    }
                }else{
                    alert("未查询到结果！");
                }
            }
        });
    }

</script>
</html>