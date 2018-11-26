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
	<link rel="stylesheet" href="${staticPath }/css/article.css">
	<script src="${staticPath }/js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/web/header"></jsp:include>
	<div class="container clearfix">
		<div class="content_left">
			<div class="article_top">
				<h3>当前位置： <a href="javascript:;">致简考研</a>>
				<c:forEach items="${categorys }" var="category" >
					<a href="${basePath}/web/zjkyarticle?categoryid=${category[1] }">${category[0] } </a>
					>
				</c:forEach>
				<a href="javascript:;">正文 </a></h3>
				
				<h2>${article.title }</h2>
				<p>来源： ${article.author }<span><fmt:formatDate value="${article.createDate }" pattern="yyyy-MM-dd HH:mm:ss" /></span></p>
			</div>
			<div class="article_detail">
				${article.content }
	       		<a href="javascript:;"><img src="${staticPath }/images/article_detail_banner.png" height="70" width="855" alt="" class="article_detail_banner"></a>
	       		<div class="article_detail_bottom">
	       			<c:if test="${not empty preArticle }">
	       				<a href="${basePath}/web/zjkyarticle/article_detail/${preArticle[0]}">上一篇：<span>${preArticle[1]}</span></a>
	       			</c:if>
	       			<c:if test="${not empty nextArticle }">
	       				<a href="${basePath}/web/zjkyarticle/article_detail/${nextArticle[0] }">下一篇：<span>${nextArticle[1] }</span></a>
	       			</c:if>
	       		</div>
			</div>
		</div>
		<jsp:include page="/web/zjkyarticle/article_side"></jsp:include>
	</div>
	<jsp:include page="/web/to/footer"></jsp:include>
	<script src="${staticPath }/layer/layer.js"></script>
	<script>
		//友情链接
		$(".article_center li").eq(1).addClass('on').siblings('li').removeClass('on');
		$(".article_bottom").eq(0).show().siblings('.article_bottom').hide();
		$(".article_center li").mouseenter(function(){
			var idx=$(this).index()-1;
			$(this).addClass('on').siblings('li').removeClass('on');
			$('.article_bottom').eq(idx).show().siblings('.article_bottom').hide();
		})

		$(".news .title li").eq(0).addClass('test_center_on').siblings('li').removeClass('test_center_on');
			$(".news .content_right_list").eq(0).show().siblings('.content_right_list').hide();
			$(".news .title li").mouseenter(function(){
				var idx=$(this).index();
				$(this).addClass('test_center_on').siblings('li').removeClass('test_center_on');
				$('.news .content_right_list').eq(idx).show().siblings('.content_right_list').hide();
			})
		$('.refer_form_btn').click(function() {
			var name = $('#name').val();
			var phone = $('#phone').val();
			if (name == '') {
				layer.msg("请输入正确的姓名");
				return false;
			};
			if (phone == '' || !/^(1[3578]\d|14[57])[0-9]{8}$/.test(phone)) {
				layer.msg("请输入正确的电话号码");
				return false;
			};
		});
	</script>
</body>
</html>

