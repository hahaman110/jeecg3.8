<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<link rel="stylesheet" href="${staticPath}/css/public.css">
	<link rel="stylesheet" href="${staticPath}/css/header.css">
	<link rel="shortcut icon" href="${staticPath }/images/favicon.ico" />
</head>
<body>
	<div class="footer">
		<p>地址： 上海市浦东新区浦东南路1271号华融大厦2003-2006  邮编：200000</p>
		<p>南京许愿树文化传播有限公司 所有 <a style="color:#8f8f8f" target="_blank" href="http://www.miitbeian.gov.cn">苏ICP备17017030号-4</a></p>
		<div class="copyright clearfix">
			<img src="${staticPath}/images/footer2.png" alt="">
			<img src="${staticPath}/images/footer3.png" alt="">
			<img src="${staticPath}/images/footer4.png" alt="">
			<img src="${staticPath}/images/footer5.png" alt="">
			<img src="${staticPath}/images/footer1.png" alt="">			
		</div>
	</div>
	<jsp:include page="/web/to/service"></jsp:include>
</body>
</html>

