<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	<script src="${staticPath}/js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/web/header?hasNav=true"></jsp:include>
	<div class="schools_detail">
		<div class="container clearfix">
			<jsp:include page="/web/to/detail_header_side?attr=6"></jsp:include>
			<div class="schools_left clearfix">
				<div class="introduce schools_profess clearfix">
					<dl>
						<c:forEach items="${tjArticle }" var="article">
						<dd>
							<a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank">
								<img src="${basePath}${article[1]}" height="140" width="250" alt="">
								<div class="profess_txt">
									<h4>${article[2]}</h4>
									<p>${article[3]}</p>
									<span><fmt:formatDate value="${article[4] }" pattern="yyyy-MM-dd HH:mm" />
									<c:set value="${fn:split(article[5], ',') }" var="tags" />
									<c:forEach items="${tags}" var="tag">
										<i></i>${tag }
									 </c:forEach>
									</span>
								</div>
							</a>
						</dd>
						</c:forEach>
					</dl>
				</div>
				<div class="introduce schools_intro">
					<h3>热门课程</h3>
					<div class="introduce_list clearfix">
						<ul>
							<li><a href="javascript:;"><img src="${staticPath}/images/intro_banner1.png" height="170" width="395" alt=""></a></li>
							<li><a href="javascript:;"><img src="${staticPath}/images/intro_banner2.png" height="170" width="395" alt=""></a></li>
						</ul>
					</div>
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
			$(".view_all").click(function(){
				$(".schools_intro .txt").animate({height:"400"},500);
				$(this).hide();
				$(".hide_all").css("display","block");
			})
			$(".hide_all").click(function(){
				$(".schools_intro .txt").animate({height:"207"},500);
				$(this).hide();
				$(".view_all").show();
			})
		});	
	</script>
</body>
</html>

