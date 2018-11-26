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
	<link rel="stylesheet" href="${staticPath }/css/professional.css">
	<link rel="stylesheet" href="${staticPath }/css/schools_detail.css">
	<script src="${staticPath }/js/jquery.min.js"></script>
</head>
<body>
	<div class="schools_detail_top">
		<div class="search_box">
			<i></i>
			<select>
				<option value="院校选择">院校选择</option>
				<option value="专业选择">专业选择</option>
			</select>
			<input type="text" placeholder="输入学校/专业名称">
			<a href="javascript:;" class="search_btn" id="detail_header_search">点击搜索</a>
		</div>
	</div>
	<div class="location">
		您的位置：<a href="javascript:;">首页</a>><a href="javascript:;">${major.name }</a>
	</div>
	<script type="text/javascript">
	$(function(){
		$("#detail_header_search").click(function(){
			var url;
			if("院校选择"==$(".search_box select").val()){
				url="${basePath}/web/zjkyschool?name="+$(".search_box input").val();
			}else{
				url="${basePath}/web/zjkymajor?name="+$(".search_box input").val();
			}
			location.href=encodeURI(encodeURI(url));
		})
		
	})
	</script>
</body>
</html>

