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
	<link rel="stylesheet" href="${staticPath}/css/public.css">
	<link rel="stylesheet" href="${staticPath}/css/professional.css">
	<link rel="stylesheet" href="${staticPath}/css/page.css">
	<link rel="stylesheet" href="${staticPath}/css/swiper.css">
	<script src="${staticPath}/js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/web/header"></jsp:include>
	<div class="major">
		<div class="container clearfix">
			<div class="content_left clearfix">
				<div class="major_top">
					<div class="tab_title clearfix">
						<ul>
							<li><a href="${basePath}/web/zjkymajor">找专业</a></li>
							<li class="active"><a href="${basePath}/web/zjkyschool"><em></em>找院校</a></li>
						</ul>
					</div>
					<div class="xueke clearfix ssdq">
						<h3>所属地区：</h3>
						<ul>
							<li class="on"><a href="javascript:search();" data-index="">全部</a></li>
							<c:forEach items="${citys}" var="city">
								<li><a href="javascript:search();" data-index="${city['id'] }">${city['name'] }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="xueke clearfix xxsx">
						<h3>学校属性：</h3>
						<ul>
							<li class="on"><a href="javascript:search();" data-index="">全部</a></li>
							<c:forEach items="${schoolattrTg.TSTypes}" var="tstype">
								<li><a href="javascript:search();" data-index="${tstype.typecode }">${tstype.typename }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="xueke clearfix xxlx">
						<h3>学校类型：</h3>
						<ul>
							<li class="on"><a href="javascript:search();" data-index="">全部</a></li>
							<c:forEach items="${schoolkindTg.TSTypes}" var="tstype">
								<li><a href="javascript:search();" data-index="${tstype.typecode }">${tstype.typename }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="xueke clearfix xxls">
						<h3>学校隶属：</h3>
						<ul>
							<li class="on"><a href="javascript:search();" data-index="">全部</a></li>
							<c:forEach items="${schoollsTg.TSTypes}" var="tstype">
								<li><a href="javascript:search();" data-index="${tstype.typecode }">${tstype.typename }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="tab_bottom">
						<div class="search_box">
							<form action="zjkyschool" id="formName" method="post">
							<input type="hidden" id="city" name="city"/>
							<input type="hidden" id="attribute" name="attribute"/>
							<input type="hidden" id="kind" name="kind"/>
							<input type="hidden" id="subjection" name="subjection"/>
							<input type="text" placeholder="输入学校名称" id="name" name="name" value="${name}">
							<div class="search_btn" onclick="search()"></div>
							</form>
						</div>
					</div>
				</div>
				<div class="major_bottom">
					<div class="schools_list clearfix">
						<ul>
							<c:forEach items="${pageInfo.datas}" var="school" varStatus="status">
							<li class="clearfix">								
								<div class="list_left">
									<a href="${basePath}/web/zjkyschool/detail/schools_detail/${school.id }">
										<img src="${basePath}${school.logo }" height="140" width="140" alt="">
										<h3>${school.name }</h3>
									</a>
								</div>									
								<div class="txt">
									<div class="txt_top clearfix">
										<dl>
											<c:set value="${fn:split(school.attribute, ',') }" var="attrs" />
											<c:forEach items="${attrs}" var="attr">
												<c:if test="${not empty attr}">
													<dd><a href="javascript:;">${typemap[attr]}</a></dd>
												</c:if>
											 </c:forEach>
											<dd><a href="javascript:;">${typemap[school.subjection]}</a></dd>
										</dl>
									</div>
									<div class="txt_location clearfix">
										<dl>
											<dd><a href="javascript:;">地点：${citymap[school.city] }<i>|</i></a></dd>
											<dd><a href="javascript:;">院校类型：${typemap[school.kind]}</a></dd>
										</dl>
									</div>
									<div class="txt_location txt_center clearfix">
										<dl>
											<dd><a target="_blank" href="${basePath}/web/zjkyschool/detail/schools_intro/${school.id}">学校简介<i>|</i></a></dd>
											<dd><a target="_blank" href="${basePath}/web/zjkyschool/detail/schools_guide/${school.id}">招生简章<i>|</i></a></dd>
											<dd><a target="_blank" href="${basePath}/web/zjkyschool/detail/schools_profess/${school.id}">招生专业<i>|</i></a></dd>
											<dd><a target="_blank" href="${basePath}/web/zjkyschool/detail/schools_score/${school.id}">分数线<i>|</i></a></dd>
											<dd><a target="_blank" href="${basePath}/web/zjkyschool/detail/schools_retest/${school.id}">复试</a></dd>
										</dl>
									</div>
									<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" target="_blank" class="btn">在线咨询</a>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
					<!-- 分页 -->
					<div class="page_center">
						<div id="pagination" class="paging"></div>
					</div>
				</div>
			</div>
			<jsp:include page="/web/zjkyarticle/profess_side"></jsp:include>	
		</div>
		<div class="state container">
			<h3>免责声明</h3>
			<p>1.本平台数据来源于学校官网及权威教育网站。</p>
			<p>2.部分数据为空可能是学校未公布官方信息；如果各招生数据与院校公布数据不一致，请以各高校正式公布的数据为准。</p>
			<p>3.考研报考决策是一个动态变化的过程，本平台历年高校数据仅作为考生报考决策参考，请综合各种信息进行报考。</p>
		</div>
	</div>
	<jsp:include page="/web/to/footer"></jsp:include>
	<script src="${staticPath}/js/page.js"></script>
	<script type="text/javascript">
	    //为了url美观简洁 把参数都放在一个form里面处理
		function search(){
			$("#city").val($("div.ssdq li.on a").attr("data-index"));
			$("#attribute").val($("div.xxsx li.on a").attr("data-index"));
			$("#kind").val($("div.xxlx li.on a").attr("data-index"));
			$("#subjection").val($("div.xxls li.on a").attr("data-index"));
			$('#formName').submit();
		}
		
		$(function(){
			var city = "${city}";
			if(city!=null && city!=""){
				$("div.ssdq a[data-index='"+city+"']").eq(0).parent().addClass('on').siblings('li').removeClass('on');
			}else{
				$("div.ssdq li").eq(0).addClass('on').siblings('li').removeClass('on');
			}
			var attribute = "${attribute}";
			if(attribute!=null && attribute!=""){
				$("div.xxsx a[data-index='"+attribute+"']").eq(0).parent().addClass('on').siblings('li').removeClass('on');
			}else{
				$("div.xxsx li").eq(0).addClass('on').siblings('li').removeClass('on');
			}
			var kind = "${kind}";
			if(kind!=null && kind!=""){
				$("div.xxlx a[data-index='"+kind+"']").eq(0).parent().addClass('on').siblings('li').removeClass('on');
			}else{
				$("div.xxlx li").eq(0).addClass('on').siblings('li').removeClass('on');
			}
			var subjection = "${subjection}";
			if(subjection!=null && subjection!=""){
				$("div.xxls a[data-index='"+subjection+"']").eq(0).parent().addClass('on').siblings('li').removeClass('on');
			}else{
				$("div.xxls li").eq(0).addClass('on').siblings('li').removeClass('on');
			}
		
			// 根据选择或者定位数据 生成URL;
			function createURL(){
				var url = "${basePath}/web/zjkyschool?city=${city}&attribute=${attribute}&kind=${kind}&subjection=${subjection}&name=${name}";
				url = encodeURI(encodeURI(url));
				return url;
			}
			
			var pageUrl = createURL();
			Pagination.Init(document.getElementById('pagination'), {
			       	pageTotal: ${pageInfo.pages},    // 总页数
	        		currentPage: ${pageInfo.currentPage},   // 当前页
			        step: 2,          // 当前页前后显示的页数
			        url: pageUrl           // a的链接地址
		    });
		    
		    $("div.xueke li").click(function(){
		    	$(this).addClass('on').siblings('li').removeClass('on');
		    })
		    
		});	
</script>
</body>
</html>

