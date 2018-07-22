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

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div data-role="page" id="pageone">
  <div data-role="header" data-position="fixed">
    <a href="#" class="ui-btn ui-btn-right ui-corner-all ui-shadow ui-icon-cloud ui-btn-icon-left">数据导出</a>
    <h1>查询</h1>
  </div>
  <div class="search">
      <%--<div class="sblank"><a href="#" class="ui-btn  ui-icon-calendar ui-btn-icon-notext">图标</a></div>--%>
      <form method="post" action="${pageContext.request.contextPath}/ticket/findByYears.do">
      <input name="startYear" class="searchleft" placeholder="起始:20150301"/>
      <%--<a href="#" class="ui-btn  ui-icon-calendar ui-btn-icon-notext">图标</a>--%>
      <input name="endYear" class="searchright" placeholder="结束:20150301"/>
      <input type="submit" value="查询" class="ui-btn ui-btn-inline ui-mini searchbutton  ui-corner-all">
      </form>
  </div>
    <table data-role="table" data-mode="columntoggle" class="ui-responsive ui-shadow" id="myTable" data-column-btn-text="">
        <thead>
        <tr>
            <th data-priority="1">#</th>
            <th data-priority="1">发票号码</th>
            <th data-priority="1">税前金额</th>
            <th data-priority="1">发票代码</th>
            <th data-priority="1">没过数量</th>
            <th data-priority="1">通过数量</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${tickets}" var ="ticket" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${ticket.tnumber}</td>
                <td>${ticket.tmoney}</td>
                <td>${ticket.tcode}</td>
                <td>${ticket.tnopass}</td>
                <td>${ticket.tpass}</td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
    <%--tickets--%>


  <div data-role="footer"  class="footer" data-position="fixed">
    <div data-role="navbar">
      <ul>
        <li><a href="${pageContext.request.contextPath}/ticket/toIndex.do" data-icon="home">主页</a></li>
        <li><a href="${pageContext.request.contextPath}/ticket/toSearch.do" data-icon="search" >查询</a></li>
        <li><a href="${pageContext.request.contextPath}/ticket/toCount.do" data-icon="grid" data-ajax="false">统计</a></li>
        <li><a href="#" data-icon="gear">设置</a></li>
      </ul>
    </div>
  </div>
</div> 

</body>
</html>