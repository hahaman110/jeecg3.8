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
	<link rel="stylesheet" href="${staticPath }/css/study_center.css">
	<script src="${staticPath }/js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/web/header?hasNav=true"></jsp:include>
	<a href="javascript:;" class="banner"><img src="${staticPath }/images/teacher_banner.png" height="600" width="100%" alt=""></a>
	<div class="teacher_box container">
		<div class="title">
			<h3>职位列表</h3>
		</div>
		<div class="title_header clearfix">
			<ul>
				<li>职位</li>
				<li>工作年限</li>
				<li>学历</li>
				<li>工作地点</li>
				<li>操作</li>
			</ul>
		</div>
		<div class="teacher_list">
			<ul>
				<li>
					<div class="list_header">
						<dl class="clearfix">
							<dd>考研政治讲师<i>HOT</i><em></em></dd>
							<dd>3年以上经验</dd>
							<dd>本科</dd>
							<dd>长沙</dd>
							<dd><a href="mailto:hr@qmlearn.com">现在申请</a></dd>
						</dl>
					</div>
					<div class="list_txt">
						<div class="top_txt">
							<h3>岗位职责：</h3>
							<ol>
								<li>1、负责相关课程的讲授以及后续的学员辅导等工作，保障教学任务的完成；</li>
								<li>2、参与授课方向所需资料的编写和研发；</li>
								<li>3、承担教学课题的研究，着力进行各专项命题趋势、解题技巧以及教学方法与教学技巧的研究。</li>
							</ol>
						</div>
						<div class="bottom_txt">
							<h3>任职资格：</h3>
							<ol>
								<li>1、本科及以上学历，有教学经验或者突出专项能力者可优先考虑；</li>
								<li>2、语言表达流畅，具备较强的学习能力和创新能力；</li>
								<li>3、热爱教师职业，对工作充满热情，责任心强；</li>
								<li>4、良好的道德修养，认同许愿树教育企业文化；</li>
								<li>5、精力充沛，接受出差授课任务。</li>
							</ol>
						</div>
					</div>
				</li>
				<li>
					<div class="list_header">
						<dl class="clearfix">
							<dd>考研数学讲师<i style="background:#6ba1f1">NEW</i><em></em></dd>
							<dd>3年以上经验</dd>
							<dd>本科</dd>
							<dd>长沙</dd>
							<dd><a href="mailto:hr@qmlearn.com">现在申请</a></dd>
						</dl>
					</div>
					<div class="list_txt">
						<div class="top_txt">
							<h3>岗位职责：</h3>
							<ol>
								<li>1、负责相关课程的讲授以及后续的学员辅导等工作，保障教学任务的完成；</li>
								<li>2、参与授课方向所需资料的编写和研发；</li>
								<li>3、承担教学课题的研究，着力进行各专项命题趋势、解题技巧以及教学方法与教学技巧的研究。</li>
							</ol>
						</div>
						<div class="bottom_txt">
							<h3>任职资格：</h3>
							<ol>
								<li>1、本科及以上学历，有教学经验或者突出专项能力者可优先考虑；</li>
								<li>2、语言表达流畅，具备较强的学习能力和创新能力；</li>
								<li>3、热爱教师职业，对工作充满热情，责任心强；</li>
								<li>4、良好的道德修养，认同许愿树教育企业文化；</li>
								<li>5、精力充沛，接受出差授课任务。</li>
							</ol>
						</div>
					</div>
				</li>
				<li>
					<div class="list_header">
						<dl class="clearfix">
							<dd>考研英语讲师<em></em></dd>
							<dd>3年以上经验</dd>
							<dd>本科</dd>
							<dd>长沙</dd>
							<dd><a href="mailto:hr@qmlearn.com">现在申请</a></dd>
						</dl>
					</div>
					<div class="list_txt">
						<div class="top_txt">
							<h3>岗位职责：</h3>
							<ol>
								<li>1、负责相关课程的讲授以及后续的学员辅导等工作，保障教学任务的完成；</li>
								<li>2、参与授课方向所需资料的编写和研发；</li>
								<li>3、承担教学课题的研究，着力进行各专项命题趋势、解题技巧以及教学方法与教学技巧的研究。</li>
							</ol>
						</div>
						<div class="bottom_txt">
							<h3>任职资格：</h3>
							<ol>
								<li>1、本科及以上学历，有教学经验或者突出专项能力者可优先考虑；</li>
								<li>2、语言表达流畅，具备较强的学习能力和创新能力；</li>
								<li>3、热爱教师职业，对工作充满热情，责任心强；</li>
								<li>4、良好的道德修养，认同许愿树教育企业文化；</li>
								<li>5、精力充沛，接受出差授课任务。</li>
							</ol>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<jsp:include page="/web/to/footer"></jsp:include>
	<script>
		$(".nav li").eq(6).addClass('on');
		
		$(".list_header dl dd:first-child").click(function(){
			$(this).parent('dl').parent(".list_header").parent('li').siblings().children('.list_txt').removeClass('on');
			$(this).parent('dl').parent(".list_header").parent('li').siblings().children('.list_header').children('dl').removeClass('active');
			$(this).parent('dl').parent(".list_header").parent('li').siblings().children('.list_header').children('dl').removeClass('rotate');
			$(this).parent('dl').parent(".list_header").siblings('.list_txt').toggleClass('on');
			$(this).parent('dl').toggleClass('active');
			$(this).parent('dl').toggleClass('rotate');
		})
	</script>
</body>
</html>

