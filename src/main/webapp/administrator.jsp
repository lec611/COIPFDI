<%--
  Created by IntelliJ IDEA.
  User: wuchangjiao
  Date: 2019/9/14
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 引入顺序也要注意下,bootstrap.js 依赖于jQuery.js -->
    <script src='static/js/jquery/jquery.min.js'></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <style>
        .bias1{
            border:1px solid;
            margin-top: 23px;
            -webkit-transform: rotate(15deg);/*Safari 4+,Google Chrome 1+  */
            -moz-transform: rotate(15deg);/*Firefox 3.5+*/
            filter: progid:DXImageTransform.Microsoft.BasicImage(Rotation=0.15);
        }
        .bias2{
            border:1px solid;
            margin-top: 23px;
            -webkit-transform: rotate(20deg);/*Safari 4+,Google Chrome 1+  */
            -moz-transform: rotate(20deg);/*Firefox 3.5+*/
            filter: progid:DXImageTransform.Microsoft.BasicImage(Rotation=0.2);
        }
    </style>
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
                <a href="#" onClick="javascript:parameter();return false;">参数预设</a>
            </li>
            <li class="dropdown pull-right layui-nav-item">
                <a href="#" onClick="javascript:application();return false;">上载申请处理</a>
            </li>
            <li class="dropdown pull-right layui-nav-item">
                <a href="#" onClick="javascript:contactAdmin();return false;">联系管理员</a>
            </li>
            <li class="dropdown pull-right layui-nav-item">
                <a href="#">审批管理员</a>
            </li>
            <!--禁止删除-->
            <li class="layui-nav-item" id="adminMenu">

            </li>
        </ul>
        <ul class="layui-nav layui-layout-right head-nav-right">
            <button type="button" class="btn btn-primary btn-lg" style="font-size:12px;margin-right:20px">
                <span class="glyphicon glyphicon-user"></span> User
            </button>
        </ul>

        <a class="small-doc-navicon" href="javascript:;" onclick="showLeftNav();">
            <i class="fa fa-navicon"></i>
        </a>
    </div>

    <div class="blog-main">
        <div style="margin-left: 20px;margin-right: 20px;display: none;" id="contactAdminDiv">
            <table class="table table-hover table-bordered" style="text-align:center;margin:0px;">
                <tr><td>序号</td><td>姓名</td><td>邮箱</td><td>备注</td></tr>
                <tr><td>1</td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td></tr>
                <tr><td>2</td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td></tr>
                <tr><td>3</td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td></tr>
                <tr><td>4</td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td></tr>
                <tr><td>5</td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td><td><input type="text" style="border:0px" class="layui-input doc-search" id=""></td></tr>
            </table>
            <div style="text-align: center;margin: 20px;">
                <button class="layui-btn" lay-submit="" lay-filter="formSearch" onclick="" id="">修改 </button>
                <button class="layui-btn" lay-submit="" lay-filter="formSearch" onclick="" id="">保存 </button>
                <button class="layui-btn" lay-submit="" lay-filter="formSearch" onclick="" id="">取消 </button>
            </div>
        </div>
        <div style="margin-left: 20px;margin-right: 50px;display: none;" id="applicationDiv">
            <table class="table table-hover table-bordered" style="text-align:center;margin:20px;">
<%--                <tr><td rowspan="2"><table><tr><td width="70%"></td><td>园区类型</td></tr><div class="bias1"></div><tr><td>指标</td><td></td></tr></table></td><td colspan="6">园区类型</td></tr>--%>
                <tr><td rowspan="2" style="padding: 0px" width="180px;"><img src="static/images/table2.png"></td><td colspan="6">园区类型</td></tr>
                <tr><td>指标层得分</td><td>标准</td><td>准则层得分</td><td>权重</td><td>目标层得分:融合化发展指数</td></tr>
                <tr><td>产业融合度</td><td></td><td></td><td></td><td></td><td rowspan="7"></td></tr>
                <tr><td>市场融合度</td><td></td><td></td><td></td><td></td></tr>
                <tr><td>技术融合度</td><td></td><td></td><td></td><td></td></tr>
                <tr><td>人员融合度</td><td></td><td></td><td></td><td></td></tr>
                <tr><td>政策依赖度</td><td></td><td></td><td></td><td></td></tr>
                <tr><td>资本依赖度</td><td></td><td></td><td></td><td></td></tr>
                <tr><td>社会文化影响度</td><td></td><td></td><td></td><td></td></tr>
            </table>
            <div style="text-align: center;margin: 20px;">
                <button class="layui-btn" lay-submit="" lay-filter="formSearch" onclick="" id="pass">通过 </button>
                <button class="layui-btn" lay-submit="" lay-filter="formSearch" onclick="inputReason()" id="dispass">不通过 </button>
                <input type="text" id="reason" placeholder="请输入反馈理由" autocomplete="off" class="layui-input" style="display: none">
                <button class="layui-btn" lay-submit="" lay-filter="formSearch" onclick="" id="submit" style="display: none">提交 </button>
            </div>
        </div>
        <div style="margin-left: 20px;margin-right: 50px;display: none" id="parameterDiv">
            <table class="table table-hover table-bordered" style="text-align:center;margin:20px;">
<%--                <tr><td rowspan="2"><table><div class="bias2"><tr><td width="60%"></td><td >园区类型</td></tr><tr><td></td><td></td></tr><tr><td>指标</td><td></td></tr></div></table></td><td colspan="2">经贸合作区</td><td colspan="2">工业园</td><td colspan="2">科技园</td><td colspan="2">资源园</td><td colspan="2">物流园/商业园</td><td colspan="2">农业园</td><td colspan="2">其他园区</td></tr>--%>
                <tr><td rowspan="2" style="padding: 0px" width="180px;"><img src="static/images/table1.png"></td><td colspan="2">经贸合作区</td><td colspan="2">工业园</td><td colspan="2">科技园</td><td colspan="2">资源园</td><td colspan="2">物流园/商业园</td><td colspan="2">农业园</td><td colspan="2">其他园区</td></tr>
                <tr><td>权重</td><td>标准</td><td>权重</td><td>标准</td><td>权重</td><td>标准</td><td>权重</td><td>标准</td><td>权重</td><td>标准</td><td>权重</td><td>标准</td><td>权重</td><td>标准</td></tr>
                <tr><td>产业融合度</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                <tr><td>市场融合度</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                <tr><td>技术融合度</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                <tr><td>人员融合度</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                <tr><td>政策依赖度</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                <tr><td>资本依赖度</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                <tr><td>社会文化影响度</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
            </table>
            <div style="text-align: center;margin: 20px;">
                <button class="layui-btn" lay-submit="" lay-filter="formSearch" onclick="" id="">修改 </button>
                <button class="layui-btn" lay-submit="" lay-filter="formSearch" onclick="" id="">保存 </button>
                <button class="layui-btn" lay-submit="" lay-filter="formSearch" onclick="" id="">取消 </button>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    function contactAdmin() {
        document.getElementById("contactAdminDiv").style.display="block";
        document.getElementById("applicationDiv").style.display="none";
        document.getElementById("parameterDiv").style.display="none";
    }

    function application() {
        document.getElementById("contactAdminDiv").style.display="none";
        document.getElementById("applicationDiv").style.display="block";
        document.getElementById("parameterDiv").style.display="none";
    }

    function parameter() {
        document.getElementById("parameterDiv").style.display="block";
        document.getElementById("contactAdminDiv").style.display="none";
        document.getElementById("applicationDiv").style.display="none";
    }

    function inputReason(){
        document.getElementById("reason").style.display="block";
        document.getElementById("submit").style.display="block";
    }
</script>
</html>
