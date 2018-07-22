<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.mobile-1.4.5.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"></head>
</head>
<body>

<div data-role="page" id="pageone">
    <div data-role="header" data-position="fixed">
        <a href="#" data-role="button" class="ui-btn ui-icon-user ui-btn-icon-left ui-corner-all ui-shadow">admin</a>
        <h1>主页</h1>
    </div>

    <div data-role="main" class="ui-content">
        <div data-role="popup" id="myPopup" class="ui-content" style="min-width:250px;">
            <form method="post" action="${pageContext.request.contextPath}/ticket/insert.do">
                <div>
                    <h3>手工录入</h3>
                    <label for="tnumer" class="ui-hidden-accessible">发票号码:</label>
                    <input type="text" name="tnumer" id="tnumer" placeholder="发票号码">
                    <label for="tmoney" class="ui-hidden-accessible">税前金额:</label>
                    <input type="text" name="tmoney" id="tmoney" placeholder="税前金额">
                    <label for="tcode" class="ui-hidden-accessible">发票代码:</label>
                    <input type="text" name="tcode" id="tcode" placeholder="发票代码">
                    <label for="tdate" class="ui-hidden-accessible">开票日期:</label>
                    <input type="text" name="tdate" id="tdate" placeholder="开票日期">
                    <input type="submit" data-inline="true" value="确认">
                </div>
            </form>
        </div>
    </div>



    <div data-role="main" class="content">
        <div class = "number">
            <div class="left">
                <div class="ps">
                    <p>${pass}张</p>
                    <p>验证失败发票</p>
                </div>
            </div>

            <div class="right">
                <div class="ps">
                    <p>${nopass}张</p>
                    <p>验证通过发票</p>
                </div>
            </div>
        </div>
        <div class="scanner">
            <div class="left scdiv"><a href="#myPopup" data-rel="popup">单张扫描</a></div>
            <div class="center scdiv"><a href="${pageContext.request.contextPath}/ticket/toQdvideo.do" data-ajax="false">连续扫描</a></div>
            <div class="right scdiv"><a href="#myPopup" data-rel="popup">手工录入</a></div>
        </div>
        <div class="blanker"></div>
    </div>



    <div data-role="footer"  class="footer" data-position="fixed">
        <div data-role="navbar">
            <ul>
                <li><a href="${pageContext.request.contextPath}/ticket/toIndex.do" data-icon="home">主页</a></li>
                <li><a href="${pageContext.request.contextPath}/ticket/toSearch.do" data-icon="search" >查询</a></li>
                <li><a href="${pageContext.request.contextPath}/ticket/toCount.do" data-icon="grid"  data-ajax="false">统计</a></li>
                <li><a href="#" data-icon="gear">设置</a></li>
            </ul>
        </div>
    </div>
</div>

</body>
</html>

