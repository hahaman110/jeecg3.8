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
							<li class="active"><a href="${basePath}/web/zjkymajor"><i></i>找专业</a></li>
							<li><a href="${basePath}/web/zjkyschool">找院校</a></li>
						</ul>
					</div>
					<div class="xueke clearfix xkml">
						<h3>学科门类：</h3>
						<ul>
							<li><a href="javascript:search();" data-kind="">全部</a></li>
							<c:forEach items="${majorkindTg.TSTypes}" var="tstype">
								<li><a href="javascript:search();" data-kind="${tstype.typecode }">${tstype.typename }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="xueke clearfix zylx">
						<h3>专业类型：</h3>
						<ul>
							<li><a href="javascript:search();" data-type="">全部</a></li>
							<c:forEach items="${majortypeTg.TSTypes}" var="tstype">
								<li><a href="javascript:search();" data-type="${tstype.typecode }">${tstype.typename }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="tab_bottom">
						<div class="search_box">
							<form action="zjkymajor" id="formName" method="post">
							<input type="hidden" id="kind" name="kind"/>
							<input type="hidden" id="type" name="type"/>
							<input type="text" placeholder="输入专业名称" id="name" name="name" value="${name}">
							<div class="search_btn" onclick="search()"></div>
							</form>
						</div>
					</div>
				</div>
				<div class="major_bottom">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>专业代码</th>
							<th>专业名称</th>
							<th>所属门类</th>
							<th>所属一级学科</th>
							<th>专业类型</th>
							<th>开设院校</th>							
						</tr>
						<c:forEach items="${pageInfo.datas}" var="major" varStatus="status">
					        <tr>
								<td>${major.code }</td>
								<td>${major.name }</td>
								<td>${typemap[major.kind]}</td>
								<td>${major.flevelDiscipline }</td>
								<td>${typemap[major.type]}</td>
								<td><a href="${basePath}/web/zjkymajor/majorschools?majorid=${major.id}">共${scmjcountmap[major.id+0]}所</a></td>
							</tr>
						</c:forEach>
					</table>
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
			$("#kind").val($("div.xkml li.on a").attr("data-kind"));
			$("#type").val($("div.zylx li.on a").attr("data-type"));
			$('#formName').submit();
		}
	
		$(function(){
			var kind = "${kind}";
			if(kind!=null && kind!=""){
				$("div.xkml a[data-kind='"+kind+"']").eq(0).parent().addClass('on').siblings('li').removeClass('on');
			}else{
				$("div.xkml li").eq(0).addClass('on').siblings('li').removeClass('on');
			}
			var type = "${type}";
			if(type!=null && type!=""){
				$("div.zylx a[data-type='"+type+"']").eq(0).parent().addClass('on').siblings('li').removeClass('on');
			}else{
				$("div.zylx li").eq(0).addClass('on').siblings('li').removeClass('on');
			}
		
			// 根据选择或者定位数据 生成URL;
			function createURL(){
				var url = "${basePath}/web/zjkymajor?kind=${kind}&type=${type}&name=${name}";
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

