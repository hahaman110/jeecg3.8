<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="staticPath" value="${pageContext.request.contextPath}/plug-in/web"></c:set>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>致简考研</title>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-touch-fullscreen" content="yes">
	<meta name="full-screen" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link rel="stylesheet" href="${staticPath }/css/public.css">
	<link rel="stylesheet" href="${staticPath }/css/header.css">
	<script src="${staticPath }/js/jquery.min.js"></script>
</head>
<body>
	<div class="hang_server">
		<ul>
			<li>
				<a href="javascript:;">
					<i class="server1"></i>
					<h3>院校咨询</h3>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<i class="server2"></i>
					<h3>专业咨询</h3>
				</a>
			</li>
			<li class="qrcode">
				<a href="javascript:;">
					<i class="server3"></i>
					<h3>18QQ群</h3>
				</a>
				<img src="${staticPath }/images/qq_qrcode.png" height="198" width="205" alt="" class="qq_qrcode">
			</li>
			<li class="qrcode">
				<a href="javascript:;">
					<i class="server5"></i>
					<h3>二维码</h3>
				</a>
				<img src="${staticPath }/images/detail/pop_qrcode.png" alt="" class="pop_qrcode">
			</li>
			<li class="back_top">
				<a href="javascript:;">
					<i class="server6"></i>
					<h3>回顶部</h3>
				</a>
			</li>
		</ul>
		<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" target="_blank"><img class="ser_button" src="${staticPath }/images/detail/ser_button.png" height="110" width="110" alt=""></a>
	</div>
	<script>
	 //返回顶部 
    $(".back_top").click(function() {	        	
        $('body,html').animate({
            scrollTop: 0 + 'px'
        }, 400);
        return false;
    });
	</script>
</body>
</html>

