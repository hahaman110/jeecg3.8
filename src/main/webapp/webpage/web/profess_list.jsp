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
	<div class="schools_detail profess_list">
		<div class="container clearfix">
			<jsp:include page="/web/to/detail_header"></jsp:include>
			<div class="schools_left clearfix">
				<div class="introduce states">
					<h3>开设此专业的学校<span>共${count }所</span></h3>
					<div class="profess_list_loccation clearfix">
						<ul>
							<li><a href="${basePath}/web/zjkymajor/majorschools?majorid=${major.id}">全国</a></li>
							<c:forEach items="${citys}" var="city">
								<li><a href="${basePath}/web/zjkymajor/majorschools?majorid=${major.id}&city=${city['id'] }" data-index="${city['id'] }">${city['name'] }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="introduce_tab">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th>招生年份</th>
								<th>地区</th>
								<th>所属院校</th>
								<th>所属院系</th>
								<th>操作</th>							
							</tr>
							<c:forEach items="${majorschoolList }" var="majorschool">
							<tr>
								<td>${majorschool[0] }</td>
								<td>${citymap[majorschool[1]] }</td>
								<td>${majorschool[2] }</td>
								<td>${majorschool[3] }</td>
								<td>
									<a href="${basePath}/web/zjkyschool/detail/schools_detail/${majorschool[4] }" class="profess_detail_bth"><i></i>查看详情</a>
									<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" target="_blank" class="profess_zixun_btn">在线咨询</a>
								</td>
							</tr>
							</c:forEach>

						</table>
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
			
			var city = "${city}";
			if(city!=null && city!=""){
				$("div.profess_list_loccation a[data-index='"+city+"']").eq(0).parent().addClass('on').siblings('li').removeClass('on');
			}
			
		});	
	</script>
</body>
</html>

