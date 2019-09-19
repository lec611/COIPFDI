<%--<!DOCTYPE html>--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <title>ECharts</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<!-- 为ECharts准备一个具备大小（宽高）的Dom -->--%>
<%--<div id="main" style="height:400px;width:800px;"></div>--%>
<%--<!-- ECharts单文件引入 -->--%>
<%--<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>--%>
<%--<script type="text/javascript">--%>
<%--    // 路径配置--%>
<%--    require.config({--%>
<%--        paths: {--%>
<%--            echarts: 'http://echarts.baidu.com/build/dist'--%>
<%--        }--%>
<%--    });--%>

<%--    // 使用--%>
<%--    require(--%>
<%--        [--%>
<%--            'echarts',--%>
<%--            'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载--%>
<%--        ],--%>
<%--        function (ec) {--%>
<%--            // 基于准备好的dom，初始化echarts图表--%>
<%--            var myChart = ec.init(document.getElementById('main'));--%>

<%--            option = {--%>
<%--                title : {--%>
<%--                    text: '某地区蒸发量和降水量',--%>
<%--                    subtext: '纯属虚构'--%>
<%--                },--%>
<%--                tooltip : {--%>
<%--                    trigger: 'axis'--%>
<%--                },--%>
<%--                legend: {--%>
<%--                    data:['蒸发量','降水量']--%>
<%--                },--%>
<%--                toolbox: {--%>
<%--                    show : true,--%>
<%--                    feature : {--%>
<%--                        mark : {show: true},//辅助线开关--%>
<%--                        dataView : {show: true, readOnly: false},--%>
<%--                        magicType : {show: true, type: ['line', 'bar']},//类型是否转换？折线和柱形互转--%>
<%--                        restore : {show: true},//还原--%>
<%--                        saveAsImage : {show: true}//保存为图片--%>
<%--                    }--%>
<%--                },--%>
<%--                calculable : true,--%>
<%--                xAxis : [--%>
<%--                    {--%>
<%--                        type : 'category',--%>
<%--                        data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']--%>
<%--                    }--%>
<%--                ],--%>
<%--                yAxis : [--%>
<%--                    {--%>
<%--                        type : 'value'--%>
<%--                    }--%>
<%--                ],--%>
<%--                series : [--%>
<%--                    {--%>
<%--                        name:'蒸发量',--%>
<%--                        type:'bar',--%>
<%--                        data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],--%>
<%--                        markPoint : {--%>
<%--                            data : [--%>
<%--                                {type : 'max', name: '最大值'},--%>
<%--                                {type : 'min', name: '最小值'}--%>
<%--                            ]--%>
<%--                        },--%>
<%--                        markLine : {--%>
<%--                            data : [--%>
<%--                                {type : 'average', name: '平均值'}--%>
<%--                            ]--%>
<%--                        }--%>
<%--                    },--%>
<%--                    {--%>
<%--                        name:'降水量',--%>
<%--                        type:'bar',--%>
<%--                        data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],--%>
<%--                        markPoint : {--%>
<%--                            data : [--%>
<%--                                {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183, symbolSize:18},--%>
<%--                                {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}--%>
<%--                            ]--%>
<%--                        },--%>
<%--                        markLine : {--%>
<%--                            data : [--%>
<%--                                {type : 'average', name : '平均值'}--%>
<%--                            ]--%>
<%--                        }--%>
<%--                    }--%>
<%--                ]--%>
<%--            };--%>



<%--            // 为echarts对象加载数据--%>
<%--            myChart.setOption(option);--%>
<%--        }--%>
<%--    );--%>
<%--</script>--%>
<%--</body>--%>


<%--<!DOCTYPE html>--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <title>ECharts</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<!-- 为ECharts准备一个具备大小（宽高）的Dom -->--%>
<%--<div id="main" style="height:400px;width:800px;"></div>--%>
<%--<!-- ECharts单文件引入 -->--%>
<%--<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>--%>
<%--<script type="text/javascript">--%>
<%--    // 路径配置--%>
<%--    require.config({--%>
<%--        paths: {--%>
<%--            echarts: 'http://echarts.baidu.com/build/dist'--%>
<%--        }--%>
<%--    });--%>

<%--    // 使用--%>
<%--    require(--%>
<%--        [--%>
<%--            'echarts',--%>
<%--            'echarts/chart/pie' // 使用饼图就加载pie模块，按需加载--%>
<%--        ],--%>
<%--        function (ec) {--%>
<%--            // 基于准备好的dom，初始化echarts图表--%>
<%--            var myChart = ec.init(document.getElementById('main'));--%>

<%--            option = {--%>
<%--                title : {--%>
<%--                    text: '某站点用户访问来源',--%>
<%--                    subtext: '纯属虚构',--%>
<%--                    x:'center'--%>
<%--                },--%>
<%--                tooltip : {--%>
<%--                    trigger: 'item',--%>
<%--                    formatter: "{a} <br/>{b} : {c} ({d}%)"--%>
<%--                },--%>
<%--                legend: {--%>
<%--                    orient : 'vertical',--%>
<%--                    x : 'left',--%>
<%--                    data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']--%>
<%--                },--%>
<%--                toolbox: {--%>
<%--                    show : true,--%>
<%--                    feature : {--%>
<%--                        mark : {show: true},--%>
<%--                        dataView : {show: true, readOnly: false},--%>
<%--                        magicType : {--%>
<%--                            show: true,--%>
<%--                            type: ['pie', 'funnel'],--%>
<%--                            option: {--%>
<%--                                funnel: {--%>
<%--                                    x: '25%',--%>
<%--                                    width: '50%',--%>
<%--                                    funnelAlign: 'left',--%>
<%--                                    max: 1548--%>
<%--                                }--%>
<%--                            }--%>
<%--                        },--%>
<%--                        restore : {show: true},--%>
<%--                        saveAsImage : {show: true}--%>
<%--                    }--%>
<%--                },--%>
<%--                calculable : true,--%>
<%--                series : [--%>
<%--                    {--%>
<%--                        name:'访问来源',--%>
<%--                        type:'pie',--%>
<%--                        radius : '55%',--%>
<%--                        center: ['50%', '60%'],--%>
<%--                        data:[--%>
<%--                            {value:335, name:'直接访问'},--%>
<%--                            {value:310, name:'邮件营销'},--%>
<%--                            {value:234, name:'联盟广告'},--%>
<%--                            {value:135, name:'视频广告'},--%>
<%--                            {value:1548, name:'搜索引擎'}--%>
<%--                        ]--%>
<%--                    }--%>
<%--                ]--%>
<%--            };--%>





<%--            // 为echarts对象加载数据--%>
<%--            myChart.setOption(option);--%>
<%--        }--%>
<%--    );--%>
<%--</script>--%>
<%--</body>--%>


<%--<!DOCTYPE html>--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <title>ECharts</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<!-- 为ECharts准备一个具备大小（宽高）的Dom -->--%>
<%--<div id="main" style="height:400px;width:800px;"></div>--%>
<%--<!-- ECharts单文件引入 -->--%>
<%--<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>--%>
<%--<script type="text/javascript">--%>
<%--    // 路径配置--%>
<%--    require.config({--%>
<%--        paths: {--%>
<%--            echarts: 'http://echarts.baidu.com/build/dist'--%>
<%--        }--%>
<%--    });--%>

<%--    // 使用--%>
<%--    require(--%>
<%--        [--%>
<%--            'echarts',--%>
<%--            'echarts/chart/line' // 使用折线图就加载line模块，按需加载--%>
<%--        ],--%>
<%--        function (ec) {--%>
<%--            // 基于准备好的dom，初始化echarts图表--%>
<%--            var myChart = ec.init(document.getElementById('main'));--%>

<%--            option = {--%>
<%--                title : {--%>
<%--                    text: '未来一周气温变化',--%>
<%--                    subtext: '纯属虚构'--%>
<%--                },--%>
<%--                tooltip : {--%>
<%--                    trigger: 'axis'--%>
<%--                },--%>
<%--                legend: {--%>
<%--                    data:['最高气温','最低气温']--%>
<%--                },--%>
<%--                toolbox: {--%>
<%--                    show : true,--%>
<%--                    feature : {--%>
<%--                        mark : {show: true},--%>
<%--                        dataView : {show: true, readOnly: false},--%>
<%--                        magicType : {show: true, type: ['line', 'bar']},--%>
<%--                        restore : {show: true},--%>
<%--                        saveAsImage : {show: true}--%>
<%--                    }--%>
<%--                },--%>
<%--                calculable : true,--%>
<%--                xAxis : [--%>
<%--                    {--%>
<%--                        type : 'category',--%>
<%--                        boundaryGap : false,--%>
<%--                        data : ['周一','周二','周三','周四','周五','周六','周日']--%>
<%--                    }--%>
<%--                ],--%>
<%--                yAxis : [--%>
<%--                    {--%>
<%--                        type : 'value',--%>
<%--                        axisLabel : {--%>
<%--                            formatter: '{value} °C'--%>
<%--                        }--%>
<%--                    }--%>
<%--                ],--%>
<%--                series : [--%>
<%--                    {--%>
<%--                        name:'最高气温',--%>
<%--                        type:'line',--%>
<%--                        data:[11, 11, 15, 13, 12, 13, 10],--%>
<%--                        markPoint : {--%>
<%--                            data : [--%>
<%--                                {type : 'max', name: '最大值'},--%>
<%--                                {type : 'min', name: '最小值'}--%>
<%--                            ]--%>
<%--                        },--%>
<%--                        markLine : {--%>
<%--                            data : [--%>
<%--                                {type : 'average', name: '平均值'}--%>
<%--                            ]--%>
<%--                        }--%>
<%--                    },--%>
<%--                    {--%>
<%--                        name:'最低气温',--%>
<%--                        type:'line',--%>
<%--                        data:[1, -2, 2, 5, 3, 2, 0],--%>
<%--                        markPoint : {--%>
<%--                            data : [--%>
<%--                                {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}--%>
<%--                            ]--%>
<%--                        },--%>
<%--                        markLine : {--%>
<%--                            data : [--%>
<%--                                {type : 'average', name : '平均值'}--%>
<%--                            ]--%>
<%--                        }--%>
<%--                    }--%>
<%--                ]--%>
<%--            };--%>




<%--            // 为echarts对象加载数据--%>
<%--            myChart.setOption(option);--%>
<%--        }--%>
<%--    );--%>
<%--</script>--%>
<%--</body>--%>

<!DOCTYPE html>
<head>
    <meta charset="gb2312">
    <title>ECharts</title>
</head>
<body>

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
            <ul class="dropdown-menu" >
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
            <a href="#" data-toggle="dropdown" class="dropdown-toggle">管理员<!-- <strong class="caret"></strong> --></a>
            <ul class="dropdown-menu" >
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
            <ul class="dropdown-menu" >
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
                    <a href="#" style="color:black;" onClick="javascript:yyui_menu('.yyui_menu1');">结果显示方式</a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#" onclick="javascript:zhuzhuangChart();return false;">柱状图</a>
                        </li>
                        <li>
                            <a href="#" onclick="javascript:zhexianChart();return false;">折线图</a>
                        </li>
                        <li>
                            <a href="#" onclick="javascript:bingChart();return false;">饼图</a>
                        </li>
                        <li>
                            <a href="#" onclick="javascript:leidaChart();return false;">雷达图</a>
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
    </ul>
    <a class="small-doc-navicon" href="javascript:;" onclick="showLeftNav();">
        <i class="fa fa-navicon"></i>
    </a>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/yyui.js"></script>
<script type="text/javascript">
    yyui_menu('.yyui_menu1');
</script>
<%--<!-- 为ECharts准备一个具备大小（宽高）的Dom -->--%>
<%--<div id="main" style="height:400px;width:800px;"></div>--%>
<%--<!-- ECharts单文件引入 -->--%>
<%--<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>--%>
<%--<script type="text/javascript">--%>
<%--    // 路径配置--%>
<%--    require.config({--%>
<%--        paths: {--%>
<%--            echarts: 'http://echarts.baidu.com/build/dist'--%>
<%--        }--%>
<%--    });--%>

<%--    // 使用--%>
<%--    require(--%>
<%--        [--%>
<%--            'echarts',--%>
<%--            'echarts/chart/radar' // 使用雷达图就加载radar模块，按需加载--%>
<%--        ],--%>
<%--        function (ec) {--%>
<%--            // 基于准备好的dom，初始化echarts图表--%>
<%--            var myChart = ec.init(document.getElementById('main'));--%>


<%--            option = {--%>
<%--                title : {--%>
<%--                    text: '预算 vs 开销（Budget vs spending）',--%>
<%--                    subtext: '纯属虚构'--%>
<%--                },--%>
<%--                tooltip : {--%>
<%--                    trigger: 'axis'--%>
<%--                },--%>
<%--                legend: {--%>
<%--                    orient : 'vertical',--%>
<%--                    x : 'right',--%>
<%--                    y : 'bottom',--%>
<%--                    data:['预算分配（Allocated Budget）','实际开销（Actual Spending）']--%>
<%--                },--%>
<%--                toolbox: {--%>
<%--                    show : true,--%>
<%--                    feature : {--%>
<%--                        mark : {show: true},--%>
<%--                        dataView : {show: true, readOnly: false},--%>
<%--                        restore : {show: true},--%>
<%--                        saveAsImage : {show: true}--%>
<%--                    }--%>
<%--                },--%>
<%--                polar : [--%>
<%--                    {--%>
<%--                        indicator : [--%>
<%--                            { text: '销售（sales）', max: 6000},--%>
<%--                            { text: '管理（Administration）', max: 16000},--%>
<%--                            { text: '信息技术（Information Techology）', max: 30000},--%>
<%--                            { text: '客服（Customer Support）', max: 38000},--%>
<%--                            { text: '研发（Development）', max: 52000},--%>
<%--                            { text: '市场（Marketing）', max: 25000}--%>
<%--                        ]--%>
<%--                    }--%>
<%--                ],--%>
<%--                calculable : true,--%>
<%--                series : [--%>
<%--                    {--%>
<%--                        name: '预算 vs 开销（Budget vs spending）',--%>
<%--                        type: 'radar',--%>
<%--                        data : [--%>
<%--                            {--%>
<%--                                value : [4300, 10000, 28000, 35000, 50000, 19000],--%>
<%--                                name : '预算分配（Allocated Budget）'--%>
<%--                            },--%>
<%--                            {--%>
<%--                                value : [5000, 14000, 28000, 31000, 42000, 21000],--%>
<%--                                name : '实际开销（Actual Spending）'--%>
<%--                            }--%>
<%--                        ]--%>
<%--                    }--%>
<%--                ]--%>
<%--            };--%>


<%--            // 为echarts对象加载数据--%>
<%--            myChart.setOption(option);--%>
<%--        }--%>
<%--    );--%>
<%--</script>--%>
</body>