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
	<script src="${staticPath}/js/jquery.min.js"></script>
</head>
<body>
	<div class="top_bar">
		<p class="container">致简考研  致繁归简</p>
	</div>
	<div class="header container clearfix">
		<div class="logo">
			<a href="${basePath}/web/index.html" target="_blank"><img src="${staticPath}/images/logo.png"  alt=""></a>
		</div>
		<div class="search">
			<input type="search" placeholder="" value="${title }">
			<div class="search_btn" id="header_saerch"><i></i></div>
		</div>
		<div class="notice">
			<ul id="notice" class="noticTipTxt">
			<c:forEach items="${kyttArticles }" var="article">
				<li><a href="${basePath}/web/zjkyarticle/article_detail/${article[0]}" target="_blank"><span>考研头条：</span>${article[1] } </a></li>
			</c:forEach>
			</ul>
		</div>
	</div>
	<c:if test="${hasNav eq true}">
		<div class="nav container clearfix">
		<ul>
			<li><a href="${basePath}/web/index.html" target="_blank">致简首页</a></li>
			<li><a href="${basePath}/web/zjkyarticle.html" target="_blank">考研攻略</a></li>
			<li><a href="${basePath}/web/to/vip_train.html" target="_blank">VIP特训营</a></li>
			<li><a href="${basePath}/web/zjkyarticle?categoryid=A04A05" target="_blank">考研大纲</a></li>
			<li><a href="${basePath}/web/to/study_center.html" target="_blank">学习网点</a></li>
			<li><a href="${basePath}/web/franchise.html" target="_blank">诚邀加盟</a></li>
			<li><a href="${basePath}/web/to/teacher_settled.html" target="_blank">老师入驻</a></li>
		</ul>
		</div>
	</c:if>
	<script type="text/javascript" src="${staticPath}/js/scrolltext.js"></script>
	<script>
		$(function(){
			$("#header_saerch").click(function(){
				var url="${basePath}/web/zjkyarticle?title="+$(".search input").val();
				location.href=encodeURI(encodeURI(url));
			})
		})
	
		if(document.getElementById("notice")){
			var scrollup = new ScrollText("notice");
			scrollup.LineHeight = 22;        
			scrollup.Amount = 1;           
			scrollup.Delay = 20;           
			scrollup.Start();             
			scrollup.Direction = "up"; 
		}
	</script>
</body>
</html>

