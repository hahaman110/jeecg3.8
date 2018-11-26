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
		您的位置：<a href="javascript:;">首页</a>><a href="javascript:;">${schoolEntity.name}</a>
	</div>
	<div class="schools_banner">
		<div class="banner">
			<img src="${basePath }${schoolEntity.cover}" height="240" width="1180" alt="">
			<div class="schools_logo">
				<img src="${basePath }${schoolEntity.logo}" height="136" width="136" alt="">
				<h3>${schoolEntity.name}</h3>
			</div>
		</div>
		<div class="schools_info clearfix">
			<ul class="clearfix">
				<c:set value="${fn:split(schoolEntity.attribute, ',') }" var="attrs" />
				<c:forEach items="${attrs}" var="attr">
					<c:if test="${not empty attr}">
						<li><a href="javascript:;">${typemap[attr]}</a></li>
					</c:if>	
				 </c:forEach>
				<li><a href="javascript:;">${typemap[schoolEntity.subjection]}</a></li>
			</ul>
			<a href="javascript:;" class="code">院校代码：${schoolEntity.code}</a>
			<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" target="_blank" class="zixun"><i></i>在线咨询</a>
		</div>
	</div>
	<div class="schools_tab_nav clearfix">
		<ul>
			<li>
				<a href="${basePath}/web/zjkyschool/detail/schools_detail/${schoolEntity.id}">
					<i></i>
					<h3>首页</h3>
				</a>
			</li>
			<li>
				<a href="${basePath}/web/zjkyschool/detail/schools_intro/${schoolEntity.id}">
					<i></i>
					<h3>学校简介</h3>
				</a>
			</li>
			<li>
				<a href="${basePath}/web/zjkyschool/detail/schools_guide/${schoolEntity.id}">
					<i></i>
					<h3>招生简章</h3>
				</a>
			</li>
			<li>
				<a href="${basePath}/web/zjkyschool/detail/schools_profess/${schoolEntity.id}">
					<i></i>
					<h3>招生专业</h3>
				</a>
			</li>
			<li>
				<a href="${basePath}/web/zjkyschool/detail/schools_score/${schoolEntity.id}">
					<i></i>
					<h3>分数线</h3>
				</a>
			</li>
			<li>
				<a href="${basePath}/web/zjkyschool/detail/schools_retest/${schoolEntity.id}">
					<i></i>
					<h3>复试</h3>
				</a>
			</li>
			<li>
				<a href="${basePath}/web/zjkyschool/detail/schools_adjust/${schoolEntity.id}">
					<i></i>
					<h3>调剂</h3>
				</a>
			</li>
		</ul>
	</div>
	<script type="text/javascript">
	$(function(){
		var attr = "${attr}"; 
		if(attr){
			$(".schools_tab_nav li").eq(attr).addClass('active').siblings('li').removeClass('active');			
		}else{
			$(".schools_tab_nav li").eq(0).addClass('active').siblings('li').removeClass('active');
		}
		
		$(".schools_tab_nav li").click(function() {
			$(this).addClass('active').siblings('li').removeClass('active');
		});
		
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

