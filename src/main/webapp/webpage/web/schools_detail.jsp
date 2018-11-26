<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<link rel="stylesheet" href="${staticPath }/css/public.css">
	<link rel="stylesheet" href="${staticPath }/css/professional.css">
	<link rel="stylesheet" href="${staticPath }/css/schools_detail.css">
	<script src="${staticPath }/js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/web/header?hasNav=true"></jsp:include>
	<div class="schools_detail">
		<div class="container clearfix">
			<jsp:include page="/web/to/detail_header_side?attr=0"></jsp:include>
			<div class="schools_left clearfix">
				<div class="introduce">
					<h3>${schoolEntity.name }简介</h3>
					<div class="txt">
						${schoolEntity.info }
					</div>
				</div>
				<div class="introduce states">
					<h3>${schoolEntity.name }最新动态</h3>
					<div class="introduce_list">
						<ul>
							<c:forEach items="${zxdtArticle }" var="article">
								<li><a href="${basePath}/web/zjkyarticle/article_detail/${article[0]}" target="_blank"><i></i>${article[1] }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="introduce states">
					<h3>${schoolEntity.name }热门招生专业<a href="${basePath}/web/zjkymajor"><span>招生专业</span></a></h3>
					<div class="introduce_tab">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th>招生年份</th>
								<th>院系</th>
								<th>专业</th>
								<th>专业类型</th>							
							</tr>
							<c:forEach items="${zszy }" var="zy">
							<tr>
								<td>${zy[0] }</td>
								<td>${zy[1] }</td>
								<td>${zy[2] }</td>
								<td>${typemap[zy[3]] }</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="introduce states">
					<h3>${schoolEntity.name }学费及奖助学金</h3>
					<div class="introduce_burse">
						${schoolEntity.tuition }
					</div>
					<a href="javascript:;" class="view_all">显示全部</a>
					<a href="javascript:;" class="hide_all">点击隐藏</a>
				</div>
			</div>
			<jsp:include page="/web/to/detail_right_side"></jsp:include>
		</div>
		<div class="state container">
			<h3>免责声明</h3>
			<p>1.本平台数据来源于学校官网及权威教育网站。</p>
			<p>2.部分数据为空可能是学校未公布官方信息；如果各招生数据与院校公布数据不一致，请以各高校正式公布的数据为准。</p>
			<p>3.考研报考决策是一个动态变化的过程，本平台历年高校数据仅作为考生报考决策参考，请综合各种信息进行报考。</p>
		</div>
	</div>
	<jsp:include page="/web/to/footer"></jsp:include>
	<script type="text/javascript">
		$(function(){
			var txtHeight=$(".schools_left .introduce_burse").height();
			var nextHeight=txtHeight-txtHeight/2;
			$(".schools_left .introduce_burse").css('height', nextHeight);
			$(".view_all").click(function(){
				$(".schools_left .introduce_burse").animate({height:txtHeight},500);
				$(this).hide();
				$(".hide_all").css("display","block");
			})
			$(".hide_all").click(function(){
				$(".schools_left .introduce_burse").animate({height:nextHeight},500);
				$(this).hide();
				$(".view_all").show();
			})
		});	
	</script>
</body>
</html>

