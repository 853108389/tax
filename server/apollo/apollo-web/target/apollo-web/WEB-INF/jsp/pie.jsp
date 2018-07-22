<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>饼状图展示</title>
    <script src="${pageContext.request.contextPath}/js/esl.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" media="screen" type="text/css"/>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600&subset=latin,latin-ext' rel='stylesheet'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">
</head>
<body>
<div>
    <div class="container">
        <div class="row">
            <span id="btn0" class="btn btn-small submit">返回</span>
            <span id="btn1" class="btn btn-small submit">收支统计</span>
            <span id="btn2" class="btn btn-small submit">税务统计</span>
        </div>
        <div class="years">
            <label id="lblSelect" class="lblSelect">
                <select id="selectPointOfInterest" class="selectPointOfInterest title="年份选择">
                <option  selected = "selected" value="2016">2016</option>
                <option value="2015">2015</option>
                <option value="2014">2014</option>
                </select>
            </label>
        </div>
    </div>

    <div style="content:'.';
                 height:20px;
                 visibility:hidden;
                 display:block;
                 clear:both;  ">
    </div>
    <div id="main" style="height:650px; width:650px ;margin-left: 5%; display: inline-block"; ></div>
    <div id="main2" style="height:650px; width:650px ; display: inline-block"></div>

</div>

</body>
<script>

    require.config({
        paths: {
            'echarts': '${pageContext.request.contextPath}/js/echarts',
            'echarts/chart/bar': '${pageContext.request.contextPath}/js/echarts',
            'echarts/chart/line': '${pageContext.request.contextPath}/js/echarts'
        }
    });

    require(
        [
            'echarts',
            'echarts/chart/bar',
            'echarts/chart/line'
        ],
        drawEcharts
    );
    function drawEcharts(ec){
        drawPie(ec);
//        drawPie2(ec);
    }
    function drawPie (ec) {

        var myChart = ec.init(document.getElementById('main'));
        var myChart2 = ec.init(document.getElementById('main2'));
        option = {
            title : {
                text: '年金额收入饼状图',
                subtext: '数据来自数据库(自拟)',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['1月','2月','3月','4月','5月','7月','8月','9月','10月','11月','12月']
            },
            series : [
                {
                    name: '详细信息',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {value:0, name:'1月'},
                        {value:0, name:'2月'},
                        {value:0, name:'3月'},
                        {value:0, name:'4月'},
                        {value:0, name:'5月'},
                        {value:0, name:'6月'},
                        {value:0, name:'7月'},
                        {value:0, name:'8月'},
                        {value:0, name:'9月'},
                        {value:0, name:'10月'},
                        {value:0, name:'11月'},
                        {value:0, name:'12月'},
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        option2 = {
            title : {
                text: '年金额支出饼状图',
                subtext: '数据来自数据库(自拟)',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['1月','2月','3月','4月','5月','7月','8月','9月','10月','11月','12月']
            },
            series : [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {value:0, name:'1月'},
                        {value:0, name:'2月'},
                        {value:0, name:'3月'},
                        {value:0, name:'4月'},
                        {value:0, name:'5月'},
                        {value:0, name:'6月'},
                        {value:0, name:'7月'},
                        {value:0, name:'8月'},
                        {value:0, name:'9月'},
                        {value:0, name:'10月'},
                        {value:0, name:'11月'},
                        {value:0, name:'12月'},
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        //默认加载
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/ticket/ajaxApolloCol.do",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify({"year": 2016, "flag":"amount","rule":2}),
            success: function (res) {
                //左图
                option.series[0].data[0].value = res.intcome[11];
                option.series[0].data[1].value = res.intcome[10];
                option.series[0].data[2].value = res.intcome[9];
                option.series[0].data[3].value = res.intcome[8];
                option.series[0].data[4].value = res.intcome[7];
                option.series[0].data[5].value = res.intcome[6];
                option.series[0].data[6].value = res.intcome[5];
                option.series[0].data[7].value = res.intcome[4];
                option.series[0].data[8].value = res.intcome[3];
                option.series[0].data[9].value = res.intcome[2];
                option.series[0].data[10].value = res.intcome[1];
                option.series[0].data[10].value = res.intcome[0];
                //右图

                option2.series[0].data[0].value = res.outcome[11];
                option2.series[0].data[1].value = res.outcome[10];
                option2.series[0].data[2].value = res.outcome[9];
                option2.series[0].data[3].value = res.outcome[8];
                option2.series[0].data[4].value = res.outcome[7];
                option2.series[0].data[5].value = res.outcome[6];
                option2.series[0].data[6].value = res.outcome[5];
                option2.series[0].data[7].value = res.outcome[4];
                option2.series[0].data[8].value = res.outcome[3];
                option2.series[0].data[9].value = res.outcome[2];
                option2.series[0].data[10].value = res.outcome[1];
                option2.series[0].data[10].value = res.outcome[0];
                myChart.setOption(option,true);
                myChart2.setOption(option2,true);
            }
        });
        //点击按钮1 amount
        $("#btn1").click(function () {
            var year=$("#selectPointOfInterest").children('option:selected').val();//这就是selected的值
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/ticket/ajaxApolloCol.do",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({"year": year,"flag":"amount","rule":2}),
                dataType: "json",
                success: function (res) {
                    //左图
                    option.title.text = "年金额收入饼状图";
                    option.series[0].data[0].value = res.intcome[11];
                    option.series[0].data[1].value = res.intcome[10];
                    option.series[0].data[2].value = res.intcome[9];
                    option.series[0].data[3].value = res.intcome[8];
                    option.series[0].data[4].value = res.intcome[7];
                    option.series[0].data[5].value = res.intcome[6];
                    option.series[0].data[6].value = res.intcome[5];
                    option.series[0].data[7].value = res.intcome[4];
                    option.series[0].data[8].value = res.intcome[3];
                    option.series[0].data[9].value = res.intcome[2];
                    option.series[0].data[10].value = res.intcome[1];
                    option.series[0].data[10].value = res.intcome[0];
                    //右图
                    option2.title.text = "年金额支出饼状图";
                    option2.series[0].data[0].value = res.outcome[11];
                    option2.series[0].data[1].value = res.outcome[10];
                    option2.series[0].data[2].value = res.outcome[9];
                    option2.series[0].data[3].value = res.outcome[8];
                    option2.series[0].data[4].value = res.outcome[7];
                    option2.series[0].data[5].value = res.outcome[6];
                    option2.series[0].data[6].value = res.outcome[5];
                    option2.series[0].data[7].value = res.outcome[4];
                    option2.series[0].data[8].value = res.outcome[3];
                    option2.series[0].data[9].value = res.outcome[2];
                    option2.series[0].data[10].value = res.outcome[1];
                    option2.series[0].data[10].value = res.outcome[0];
                    myChart.setOption(option,true);
                    myChart2.setOption(option2,true);
                }
            });
        });

        $("#btn2").click(function () {
            var year=$("#selectPointOfInterest").children('option:selected').val();//这就是selected的值
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/ticket/ajaxApolloCol.do",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({"year": year,"flag":"taxmoney","rule":2}),
                dataType: "json",
                success: function (res) {
                    option.title.text =  '年税务收入饼状图';
                    option.series[0].data[0].value = res.intcome[11];
                    option.series[0].data[1].value = res.intcome[10];
                    option.series[0].data[2].value = res.intcome[9];
                    option.series[0].data[3].value = res.intcome[8];
                    option.series[0].data[4].value = res.intcome[7];
                    option.series[0].data[5].value = res.intcome[6];
                    option.series[0].data[6].value = res.intcome[5];
                    option.series[0].data[7].value = res.intcome[4];
                    option.series[0].data[8].value = res.intcome[3];
                    option.series[0].data[9].value = res.intcome[2];
                    option.series[0].data[10].value = res.intcome[1];
                    option.series[0].data[10].value = res.intcome[0];
                    //右图
                    option2.title.text =  '年税务支出饼状图';
                    option2.series[0].data[0].value = res.outcome[11];
                    option2.series[0].data[1].value = res.outcome[10];
                    option2.series[0].data[2].value = res.outcome[9];
                    option2.series[0].data[3].value = res.outcome[8];
                    option2.series[0].data[4].value = res.outcome[7];
                    option2.series[0].data[5].value = res.outcome[6];
                    option2.series[0].data[6].value = res.outcome[5];
                    option2.series[0].data[7].value = res.outcome[4];
                    option2.series[0].data[8].value = res.outcome[3];
                    option2.series[0].data[9].value = res.outcome[2];
                    option2.series[0].data[10].value = res.outcome[1];
                    option2.series[0].data[10].value = res.outcome[0];
                    myChart.setOption(option,true);
                    myChart2.setOption(option2,true);
                }
            });
        });

        //选择年份2016
        $('#selectPointOfInterest').change(function(){
            var year=$(this).children('option:selected').val();//这就是selected的值
            var flag = option.title.text == '年金额收支统计表' ? "amount": "taxmoney";
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/ticket/ajaxApolloCol.do",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({"year": year,"flag":flag,"rule":2}),
                dataType: "json",
                success: function (res) {
                    //左图
                    option.series[0].data[0].value = res.intcome[11];
                    option.series[0].data[1].value = res.intcome[10];
                    option.series[0].data[2].value = res.intcome[9];
                    option.series[0].data[3].value = res.intcome[8];
                    option.series[0].data[4].value = res.intcome[7];
                    option.series[0].data[5].value = res.intcome[6];
                    option.series[0].data[6].value = res.intcome[5];
                    option.series[0].data[7].value = res.intcome[4];
                    option.series[0].data[8].value = res.intcome[3];
                    option.series[0].data[9].value = res.intcome[2];
                    option.series[0].data[10].value = res.intcome[1];
                    option.series[0].data[10].value = res.intcome[0];
                    //右图

                    option2.series[0].data[0].value = res.outcome[11];
                    option2.series[0].data[1].value = res.outcome[10];
                    option2.series[0].data[2].value = res.outcome[9];
                    option2.series[0].data[3].value = res.outcome[8];
                    option2.series[0].data[4].value = res.outcome[7];
                    option2.series[0].data[5].value = res.outcome[6];
                    option2.series[0].data[6].value = res.outcome[5];
                    option2.series[0].data[7].value = res.outcome[4];
                    option2.series[0].data[8].value = res.outcome[3];
                    option2.series[0].data[9].value = res.outcome[2];
                    option2.series[0].data[10].value = res.outcome[1];
                    option2.series[0].data[10].value = res.outcome[0];
                    myChart.setOption(option,true);
                    myChart2.setOption(option2,true);
                }
            });
        });
    }
    $("#btn0").click(function () {
        window.location.href="../../index2.jsp"
    });
</script>
</html>