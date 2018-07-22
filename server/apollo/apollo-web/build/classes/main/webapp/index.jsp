<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/13
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title2222</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/controllerTest/hello.do" method="post">
    <input type="submit"/>提交
</form>

<form action="${pageContext.request.contextPath}/controllerTest/hello2.do" method="post">
    id:<input type="text" name="id">
    <input type="submit"/>提交
</form>


</form>
</body>
</html>
