<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.mobile-1.4.5.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/echarts.js"></script>
  <script src="${pageContext.request.contextPath}/js/esl.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div data-role="page" id="pageone">
  <script>
    var pass= '${ticketSum.pass}';
    var nopass= '${ticketSum.nopass}';
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
              function (ec) {

                  var myChart = ec.init(document.getElementById('main'));
                  $.ajaxSettings.async = false;

                  option = {
                      title : {
                          text: '发票通过图',
                          subtext: '饼状图',
                          x:'center'
                      },
                      tooltip : {
                          trigger: 'item',
                          formatter: "{a} <br/>{b} : {c} ({d}%)"
                      },
                      legend: {
                          orient : 'vertical',
                          x : 'left',
                      },
                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {
                                  show: true,
                                  type: ['pie', 'funnel'],
                                  option: {
                                      funnel: {
                                          x: '25%',
                                          width: '50%',
                                          funnelAlign: 'left',
                                          max: 1548
                                      }
                                  }
                              },
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      calculable : true,
                      series : [
                          {
                              name:'访问来源',
                              type:'pie',
                              radius : '55%',
                              center: ['50%', '60%'],
                              data:[
                                  {value:pass, name:'通过'},
                                  {value:nopass, name:'不通过'},
                              ]
                          }
                      ]
                  };
                  myChart.setOption(option);
                  //默认加载
                  <%--$.ajax({--%>
                    <%--type: "POST",--%>
                    <%--url: "${pageContext.request.contextPath}/ticket/findSumByYear.do",--%>
                    <%--contentType: "application/json; charset=utf-8",--%>
                    <%--dataType: "json",--%>
<%--//                    data: JSON.stringify({"year": 2016, "flag":"amount","rule":2}),--%>
                    <%--success: function (res) {--%>
                    <%--option.series[0].data = 1;--%>
                    <%--option.series[1].data = 2;--%>
                    <%--myChart.setOption(option);--%>
                    <%--}--%>
                  <%--});--%>
              }
          );

  </script>
  <div data-role="header" data-position="fixed">
    <a href="#" class="ui-btn ui-btn-right ui-corner-all ui-shadow ui-icon-bars ui-btn-icon-left">功能</a>
    <h1>统计</h1>
  </div>
  <div class="search">
    <form method="post" action="${pageContext.request.contextPath}/ticket/findSumByYear.do" data-ajax="false">
      <%--<div class="sblank"><a href="#" class="ui-btn  ui-icon-calendar ui-btn-icon-notext">图标</a></div>--%>
      <input class="search2" name="year" placeholder="时间:20150301">
      <input type="submit" value="查询" class="ui-btn ui-btn-inline ui-mini searchbutton  ui-corner-all >
    </form>
  </div>

    <div data-role="main" class="ui-content">
    <table data-role="table"  class="ui-responsive ui-shadow" id="myTable" 	data-mode="reflow">
      <thead>
        <tr>
          <th data-priority="1">年份</th>
          <th data-priority="1">通过</th>
          <th data-priority="1">不通过</th>
          <th data-priority="1">通过率</th>
          <th data-priority="1">发票总额</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>${ticketSum.year}</td>
          <td>${ticketSum.pass}</td>
          <td>${ticketSum.nopass}</td>
          <td>${ticketSum.passperc}</td>
          <td>${ticketSum.sumMoney}</td>
        </tr>
      </tbody>
    </table>
     <div id="main"  >
     </div>
  </div>



  <div data-role="footer"  class="footer" data-position="fixed">
    <div data-role="navbar">
      <ul>
        <li><a href="${pageContext.request.contextPath}/ticket/toIndex.do" data-icon="home">主页</a></li>
        <li><a href="${pageContext.request.contextPath}/ticket/toSearch.do" data-icon="search">查询</a></li>
        <li><a href="${pageContext.request.contextPath}/ticket/toCount.do" data-icon="grid">统计</a></li>
        <li><a href="#" data-icon="gear">设置</a></li>
      </ul>
    </div>
  </div>
</div> 

</body>
</html>

