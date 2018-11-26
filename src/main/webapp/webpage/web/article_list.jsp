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
	<link rel="stylesheet" href="${staticPath }/css/page.css">
	<script src="${staticPath }/js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/web/header"></jsp:include>
	<div class="container clearfix">
		<div class="content_left">
			<div class="article_top">
				<h3>当前位置： <a href="${basePath}/web/index.html">致简考研</a><a href="javascript:;"></a><a href="javascript:;"></a></h3>
			</div>
			<div class="article_center clearfix">
				<ul>
					<li>
						<a href="javascript:;">资讯栏目：</a>
					</li>
					<c:forEach items="${zxTSCategorys }" var="categoryP">
					<li class="article_type" data-index="${categoryP.code }">
						<a href="${basePath}/web/zjkyarticle?categoryid=${categoryP.code }">${categoryP.name }</a>
					</li>
					</c:forEach>
				</ul>
			</div>
			<c:forEach items="${zxTSCategorys }" var="categoryP">
			<div class="article_bottom clearfix">
				<ul>
					<li>
						<a href="${basePath}/web/zjkyarticle?categoryid=${categoryP.code }">${categoryP.name }：</a>
					</li>
					<c:forEach items="${categoryP.list }" var="categoryC">
					<li data-index="${categoryC.code}" data-parent-index="${categoryP.code }">
						<a href="${basePath}/web/zjkyarticle?categoryid=${categoryC.code }">${categoryC.name }</a>
					</li>					
					</c:forEach>
				</ul>
			</div>
			</c:forEach>
			<div class="article_list">
				<ul>
					<c:forEach items="${pageInfo.datas}" var="article" varStatus="status">
					        <li class="clearfix">
								<a href="${basePath}/web/zjkyarticle/article_detail/${article.id }" target="_blank">
									<img src="${basePath}${article.cover }" height="140" width="250" alt="">
									<div class="txt">
										<h3>${article.title }</h3>
										<p>${article.info }</p>			
										<span><fmt:formatDate value="${article.createDate }" pattern="yyyy-MM-dd HH:mm" /><i></i>${article.author }</span>
									</div>
								</a>
							</li>
					</c:forEach>
					
				</ul>
				<!-- 分页 -->
				<div class="page_center">
					<div id="pagination" class="paging"></div>
				</div>
			</div>
		</div>
		<jsp:include page="/web/zjkyarticle/article_side"></jsp:include>
	</div>
	<jsp:include page="/web/to/footer"></jsp:include>
	<script src="${staticPath }/js/page.js"></script>
	<script>
		//分类
		$(".article_center .article_type").eq(0).addClass('on').siblings('li').removeClass('on');
		$(".article_bottom").eq(0).show().siblings('.article_bottom').hide();
		$(".article_center .article_type").mouseenter(function(){
			var idx=$(this).index()-1;
			var len=$('.article_bottom').eq(idx).find('li').length;
			if (len<=0) {
				$(".article_center .article_type").removeClass('on');
				$('.article_bottom').hide();
			}else{
				$(this).addClass('on').siblings('li').removeClass('on');
				$(".article_bottom").eq(idx).show().siblings('.article_bottom').hide();
			}
		})

		$(".news .title li").eq(0).addClass('test_center_on').siblings('li').removeClass('test_center_on');
			$(".news .content_right_list").eq(0).show().siblings('.content_right_list').hide();
			$(".news .title li").mouseenter(function(){
				var idx=$(this).index();
				$(this).addClass('test_center_on').siblings('li').removeClass('test_center_on');
				$('.news .content_right_list').eq(idx).show().siblings('.content_right_list').hide();
			})
	</script>
	<script src="${staticPath }/layer/layer.js"></script>
	<script type="text/javascript">
	
		$(function(){
			var categoryid = "${categoryid}";
			var pli = $("div.article_center li[data-index='"+categoryid+"']");
			if(pli.length>0){
				pli.addClass('on').siblings('li').removeClass('on');
				$("div.article_bottom").hide();
				$("div.article_bottom li[data-parent-index='"+categoryid+"']:first").parents("div.article_bottom").show();
				
				$(".article_top a").eq(1).html(">"+pli.find("a").first().html());
			}else{
				var cli = $("div.article_bottom li[data-index='"+categoryid+"']").eq(0);
				if(cli.length>0){
					cli.addClass('active').siblings('li').removeClass('active');
					cli.parents("div.article_bottom").eq(0).show().siblings('div.article_bottom').hide();
					
					var pli = $(".article_center .article_type[data-index='"+cli.attr("data-parent-index")+"']").eq(0);
					pli.addClass('on').siblings('li').removeClass('on');
					
					$(".article_top a").eq(1).html(">"+pli.find("a").first().html());
					$(".article_top a").eq(2).html(">"+cli.find("a").first().html());
					
					$(".article_top a").eq(1).attr("href","${basePath}/web/zjkyarticle?categoryid="+pli.attr("data-index"));
					$(".article_top a").eq(2).attr("href","${basePath}/web/zjkyarticle?categoryid="+cli.attr("data-index"));
				}
			}
					
			
		
			// 根据选择或者定位数据 生成URL;
			function createURL(){
				var url = "${basePath}/web/zjkyarticle?categoryid=${categoryid}&title=${title }";
				url=encodeURI(encodeURI(url));
				return url;
			}
			Pagination.Init(document.getElementById('pagination'), {
			        pageTotal: ${pageInfo.pages},    // 总页数
			        currentPage: ${pageInfo.currentPage},   // 当前页
			        step: 2,          // 当前页前后显示的页数
			        url: createURL()           // a的链接地址
		    });
			
		});	
</script>
</body>
</html>

