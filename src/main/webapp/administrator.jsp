<%--
  Created by IntelliJ IDEA.
  User: wuchangjiao
  Date: 2019/9/14
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
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
            <!--禁止删除-->
            <li class="layui-nav-item" id="adminMenu">

            </li>
        </ul>
        <ul class="layui-nav layui-layout-right head-nav-right">
            <button type="button" class="btn btn-primary btn-lg" style="font-size:12px;margin-right:20px" id="userInfoButton">
                <span class="glyphicon glyphicon-user"></span>
            </button>
        </ul>

        <a class="small-doc-navicon" href="javascript:;" onclick="showLeftNav();">
            <i class="fa fa-navicon"></i>
        </a>
    </div>

    <div class="blog-main">
        <div style="margin-left: 20px;margin-right: 50px;" id="parameterDiv">
            <table class="table table-hover table-bordered" style="text-align:center;margin:20px;">
                <%--    <tr><td rowspan="2"><table><div class="bias2"><tr><td width="60%"></td><td >园区类型</td></tr><tr><td></td><td></td></tr><tr><td>指标</td><td></td></tr></div></table></td><td colspan="2">经贸合作区</td><td colspan="2">工业园</td><td colspan="2">科技园</td><td colspan="2">资源园</td><td colspan="2">物流园/商业园</td><td colspan="2">农业园</td><td colspan="2">其他园区</td></tr>--%>
                <tr><td rowspan="2" style="padding: 0px" width="180px;"><img src="static/images/table1.png"></td><td colspan="2">经贸合作区</td><td colspan="2">工业园</td><td colspan="2">科技园</td><td colspan="2">资源园</td><td colspan="2">物流园/商业园</td><td colspan="2">农业园</td><td colspan="2">其他园区</td></tr>
                <tr><td>权重</td><td>标准</td><td>权重</td><td>标准</td><td>权重</td><td>标准</td><td>权重</td><td>标准</td><td>权重</td><td>标准</td><td>权重</td><td>标准</td><td>权重</td><td>标准</td></tr>
                <tr><td>产业融合度</td><td id="industry0"></td><td id="industry1"></td><td id="industry2"></td><td id="industry3"></td><td id="industry4"></td><td id="industry5"></td><td id="industry6"></td><td id="industry7"></td><td id="industry8"></td><td id="industry9"></td><td id="industry10"></td><td id="industry11"></td><td id="industry12"></td><td id="industry13"></td></tr>
                <tr><td>市场融合度</td><td id="market0"></td><td id="market1"></td><td id="market2"></td><td id="market3"></td><td id="market4"></td><td id="market5"></td><td id="market6"></td><td id="market7"></td><td id="market8"></td><td id="market9"></td><td id="market10"></td><td id="market11"></td><td id="market12"></td><td id="market13"></td></tr>
                <tr><td>技术融合度</td><td id="technology0"></td><td id="technology1"></td><td id="technology2"></td><td id="technology3"></td><td id="technology4"></td><td id="technology5"></td><td id="technology6"></td><td id="technology7"></td><td id="technology8"></td><td id="technology9"></td><td id="technology10"></td><td id="technology11"></td><td id="technology12"></td><td id="technology13"></td></tr>
                <tr><td>人员融合度</td><td id="hr0"></td><td id="hr1"></td><td id="hr2"></td><td id="hr3"></td><td id="hr4"></td><td id="hr5"></td><td id="hr6"></td><td id="hr7"></td><td id="hr8"></td><td id="hr9"></td><td id="hr10"></td><td id="hr11"></td><td id="hr12"></td><td id="hr13"></td></tr>
                <tr><td>政策依赖度</td><td id="policy0"></td><td id="policy1"></td><td id="policy2"></td><td id="policy3"></td><td id="policy4"></td><td id="policy5"></td><td id="policy6"></td><td id="policy7"></td><td id="policy8"></td><td id="policy9"></td><td id="policy10"></td><td id="policy11"></td><td id="policy12"></td><td id="policy13"></td></tr>
                <tr><td>资本依赖度</td><td id="capital0"></td><td id="capital1"></td><td id="capital2"></td><td id="capital3"></td><td id="capital4"></td><td id="capital5"></td><td id="capital6"></td><td id="capital7"></td><td id="capital8"></td><td id="capital9"></td><td id="capital10"></td><td id="capital11"></td><td id="capital12"></td><td id="capital13"></td></tr>
                <tr><td>社会文化影响度</td><td id="culture0"></td><td id="culture1"></td><td id="culture2"></td><td id="culture3"></td><td id="culture4"></td><td id="culture5"></td><td id="culture6"></td><td id="culture7"></td><td id="culture8"></td><td id="culture9"></td><td id="culture10"></td><td id="culture11"></td><td id="culture12"></td><td id="culture13"></td></tr>
            </table>
            <div style="text-align: center;margin: 60px;position: relative">
                <input type="file" id="inputFile" class="form-control" name="inputFile" style="width: 80%;float: left">
                <button class="layui-btn" lay-submit="" lay-filter="formSearch" onclick="updateData()" id="" style="float: left">上传文件 </button>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    //加载数据
    $(function () {
        $.ajax({
            url:'${ctx}/admin/showWS',	//后台接收数据地址
            data:"",
            type: "POST",
            dataType: "json",
            cache: false,			//上传文件无需缓存
            processData: false,		//用于对data参数进行序列化处理 这里必须false
            contentType: false,
            success:function(result){
                var data=eval('('+result+')');

                var j=0;
                for(var i=0;i<14;i++){
                    document.getElementById('industry'+j).innerText=data[i]['industry'];
                    document.getElementById('market'+j).innerText=data[i]['market'];
                    document.getElementById('technology'+j).innerText=data[i]['technology'];
                    document.getElementById('hr'+j).innerText=data[i]['hr'];
                    document.getElementById('policy'+j).innerText=data[i]['policy'];
                    document.getElementById('capital'+j).innerText=data[i]['capital'];
                    document.getElementById('culture'+j).innerText=data[i]['culture'];
                    j++;
                }
            },
            failure: function (data) {
                alert(data+"文件上传失败！");
            }
        })
        var name = "<%=session.getAttribute("name")%>";
        var ticket = "<%=session.getAttribute("ticket")%>";

        if (name != null && ticket != null && name != "null" && ticket != "null") {
            var html = "";
            html = html + '<a href="${ctx}/userInfo.jsp;" style="color:white;">欢迎' + name + '</a>';
            $("#userInfoButton").html(html);
        }
    })

    //更新数据
    function updateData(){
        var formData = new FormData();
        formData.append('file', $('#inputFile')[0].files[0]); // 固定格式

        $.ajax({
            url:'${ctx}/admin/updateWS',	//后台接收数据地址
            data:formData,
            type: "POST",
            dataType: "json",
            cache: false,			//上传文件无需缓存
            processData: false,		//用于对data参数进行序列化处理 这里必须false
            contentType: false,
            success: function(result){
                if(result === "success"){
                    alert("默认数据修改成功！");
                    //刷新界面
                    history.go(0);
                }else if(result === "error"){
                    alert("非管理员用户无修改权限！");
                }else if(result === "empty file"){
                    alert("管理员输入的文件为空！");
                }
            },
            failure: function (data) {
                alert(data+"\n文件传输出错！");
            }
        })
    }

</script>
</html>
