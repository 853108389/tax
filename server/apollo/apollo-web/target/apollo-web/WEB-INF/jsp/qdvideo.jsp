<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <meta content="email=no" name="format-detection" />
    <!--禁止Android中自动识别页面中的邮件地址-->
    <title>HTML5 GetUserMedia Demo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.mobile-1.4.5.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"></head>
<body>
    <div data-role="page" id="pageone">
        <div data-role="header" data-position="fixed">
            <a href="#"onclick="history.go(-1)" data-role="button" class="ui-btn ui-icon-back ui-btn-icon-left ui-corner-all ui-shadow" >back</a>
            <h1>主页</h1>
        </div>
        <div data-role="main" class="ui-content">
   
            <video class="media" autoplay="autoplay"></video>
             <input type="button" title="开启摄像头" value="开启摄像头" onclick="getMedia();" />
            <input type="button" title="拍照" value="拍照" onclick="getPhoto();" />
            <canvas class="media" id="canvas1"></canvas>

     
        </div>
        <div data-role="footer"  class="footer" data-position="fixed">
            <div data-role="navbar">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/ticket/toIndex.do" data-icon="home">主页</a></li>
                    <li><a href="${pageContext.request.contextPath}/ticket/toSearch.do" data-icon="search" >查询</a></li>
                    <li><a href="${pageContext.request.contextPath}/ticket/toCount.do" data-icon="grid" >统计</a></li>
                    <li><a href="#" data-icon="gear">设置</a></li>
                </ul>
            </div>
        </div>
    </div>




    <script type="text/javascript">
    var flag = true;
    var video = document.querySelector('video');

    var canvas1 = document.getElementById('canvas1');
    var context1 = canvas1.getContext('2d');

    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    window.URL = window.URL || window.webkitURL || window.mozURL || window.msURL;

    var exArray = []; //存储设备源ID
    MediaStreamTrack.getSources(function (sourceInfos) {
        for (var i = 0; i != sourceInfos.length; ++i) {
            var sourceInfo = sourceInfos[i];
            //这里会遍历audio,video，所以要加以区分
            if (sourceInfo.kind === 'video') {
                exArray.push(sourceInfo.id);
            }
        }
    });

    function getMedia() {
        if (navigator.getUserMedia) {
            navigator.getUserMedia({
                'video': {
                    'optional': [{
                        'sourceId': exArray[1] //0为前置摄像头，1为后置
                    }]
                }
            }, successFunc, errorFunc);    //success是获取成功的回调函数
        }
        else {
            flag = false;
            alert('Native device media streaming (getUserMedia) not supported in this browser.');
        }
    }

    function successFunc(stream) {
        //alert('Succeed to get media!');
        if (video.mozSrcObject !== undefined) {
            //Firefox中，video.mozSrcObject最初为null，而不是未定义的，我们可以靠这个来检测Firefox的支持
            video.mozSrcObject = stream;
        }
        else {
            video.src = window.URL && window.URL.createObjectURL(stream) || stream;
        }

    }
    function errorFunc(e) {
        alert('Error！'+e);
    }

    //拍照
    function getPhoto() {
        if(!flag){
            return;
        }
        context1.drawImage(video, 0, 0, canvas1.width = video.videoWidth, canvas1.height = video.videoHeight);
        var image = canvas1.toDataURL("image/png").replace("data:image/png;base64,", "");
        $.ajax({
            url : '${pageContext.request.contextPath}/ticket/decoderQRCode.do',
            async : false,
            dataType: "json",
            type : 'post',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({"time": (new Date()).toString(), "img":image}),
            success : function(result) {

            },
        });
    }

</script>
</body>
</html>