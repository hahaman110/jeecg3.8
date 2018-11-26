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
	<link rel="stylesheet" href="${staticPath }/css/mba_plan.css">
	<script src="${staticPath }/js/jquery.min.js"></script>
</head>
<body>
	<div class="banner">
		<div class="plan_container">
			<div class="time">
				<p>距离考研初试 &nbsp;还有<span>56</span>天</p>
			</div>
		</div>
	</div>
	<div class="plan_nav">
		<div class="plan_container">
			<ul class="clearfix">
				<li><a href="${basePath}/web/index.html">致简首页</a>|</li>
				<li><a href="${basePath}/web/zjkyarticle?categoryid=A04A01A01">常识须知</a>|</li>
				<li><a href="${basePath}/web/zjkyschool.html">院校选择</a>|</li>
				<li><a href="${basePath}/web/zjkyarticle?categoryid=A04A09">考研真题</a>|</li>
				<li><a href="${basePath}/web/zjkyarticle?categoryid=A04A03">备考要点</a>|</li>
				<li><a href="${basePath}/web/zjkymajor.html">选择专业</a>|</li>
				<li><a href="${basePath}/web/zjkyarticle?categoryid=A04A02">复习指南</a></li>
			</ul>
		</div>
	</div>
	<div class="plan_bgc" id="hang1">
		<div class="plan_container">
			<div class="title_txt">
				<img src="${staticPath}/images/pages/title_txt_icon1.png" height="15" width="20" alt="">
				<p><span>梦想的周期 </span>可以只有一年 不同的人生更轨迹  起点只是一个不同的选择 在年轻的时候选择拼一次 理想不休 奋斗不止 我们愿意为你的梦想奉献自己的力量</p>
				<img src="${staticPath}/images/pages/title_txt_icon2.png" height="15" width="20" alt="" class="title_txt_icon">
			</div>
			<div class="plan_score clearfix">
				<div class="title">
					<img src="${staticPath}/images/pages/title1.png" height="75" width="378" alt="">
				</div>
				<div class="left clearfix">
					<ul>
						<li>
							<div class="sm_title">
								<h3>考研成绩</h3>
							</div>
							<div class="txt">
								<p>根据近几年考研查分时间可知，考研成绩查询在每年2月中旬至三月初。查询方式一般有两种：一，登录各大院校研究生招生网进行网上成绩查询(免费);二是通过拨打声讯电话，进行付费式查询。</p>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>考研复试分数线</h3>
							</div>
							<div class="txt">
								<p>考研复试分数线是指全国硕士研究生入学考试录取的最低分数要求，参加硕士研究生网上调剂的最基本要求。中国的考研复试分数线分为国家统一划定的分数线和34所自主划定分数线的高校分数线。</p>
							</div>
							<a href="javascript:;"><img src="${staticPath}/images/pages/plan_button1.png" height="50" width="200" alt="" class="plan_btn"></a>
						</li>
					</ul>
				</div>
				<div class="right">
					<ul>
						<li>
							<div class="sm_title">
								<h3>本月热点</h3>
							</div>
							<div class="list clearfix">
								<dl>
									<c:forEach items="${mbaArticles[0][0] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>小贴士</h3>
							</div>
							<div class="list list_tips clearfix">
								<dl>
									<c:forEach items="${mbaArticles[0][1] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>考研备考指导</h3>
							</div>
							<div class="list list_guide clearfix">
								<dl>
									<c:forEach items="${mbaArticles[0][2] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="plan_bgc_two" id="hang2">
		<div class="plan_container">
			<div class="plan_score plan_adjust clearfix">
				<div class="title">
					<img src="${staticPath}/images/pages/title2.png" height="76" width="378" alt="">
				</div>
				<div class="left clearfix">
					<ul>
						<li>
							<div class="sm_title">
								<h3>2018考研复试</h3>
							</div>
							<div class="txt">
								<p>考研复试是考生在通过初试的基础上，对考生业务水平和实际能力的进一步考察。考研复试关系到研究生是否能最终入选，是最后一道程序，因此在考研过程中起到了举足轻重的作用。</p>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>2018考研调剂</h3>
							</div>
							<div class="txt">
								<p>在研究生招生工作中，由于招生计划的限制，有些考生虽然达到分数线，但并不能被安排复试或复试后并不能被录取，对这些考生，招生单位将负责把其全部材料及时转至第二志愿单位，这个过程即称为考研调剂。</p>
							</div>
							<a href="javascript:;"><img src="${staticPath}/images/pages/plan_button2.png" height="50" width="200" alt="" class="plan_btn"></a>
						</li>
					</ul>
				</div>
				<div class="right">
					<ul>
						<li>
							<div class="sm_title">
								<h3>本月热点</h3>
							</div>
							<div class="list clearfix">
								<dl>
									<c:forEach items="${mbaArticles[1][0] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>小贴士</h3>
							</div>
							<div class="list list_tips clearfix">
								<dl>
									<c:forEach items="${mbaArticles[1][1] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>考研备考指导</h3>
							</div>
							<div class="list list_guide clearfix">
								<dl>
									<c:forEach items="${mbaArticles[1][2] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="plan_bgc" id="hang3">
		<div class="plan_container">
			<div class="plan_score plan_admit clearfix">
				<div class="title">
					<img src="${staticPath}/images/pages/title3.png" height="74" width="300" alt="">
				</div>
				<div class="left clearfix">
					<ul>
						<li>
							<div class="sm_title">
								<h3>考研录取通知</h3>
							</div>
							<div class="txt">
								<p>随着考研录取通知书的陆续发放，预示着考生们一年甚至更久的努力有了结果。</p>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>跨考成功学员</h3>
							</div>
							<div class="txt">
								<p>有一群人付出的更多，所以收获的更多，在2014年他们脱颖而出，他们因为跨考而更成功。</p>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>专科生考研</h3>
							</div>
							<div class="txt">
								<p>很多专科生咨询考研难吗？专科生考研条件是什么。跨考小编为大家一一解读。</p>
							</div>
							<a href="javascript:;"><img src="${staticPath}/images/pages/plan_button3.png" height="50" width="200" alt="" class="plan_btn"></a>
						</li>
					</ul>
				</div>
				<div class="right">
					<ul>
						<li>
							<div class="sm_title">
								<h3>本月热点</h3>
							</div>
							<div class="list clearfix">
								<dl>
									<c:forEach items="${mbaArticles[2][0] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>小贴士</h3>
							</div>
							<div class="list list_tips clearfix">
								<dl>
									<c:forEach items="${mbaArticles[2][1] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>考研免费视频</h3>
							</div>
							<div class="list list_guide clearfix">
								<dl>
									<c:forEach items="${mbaArticles[2][2] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="plan_bgc_two" id="hang4">
		<div class="plan_container">
			<div class="plan_score plan_program clearfix">
				<div class="title">
					<img src="${staticPath}/images/pages/title4.png" height="76" width="300" alt="">
				</div>
				<div class="left clearfix">
					<ul>
						<li>
							<div class="sm_title">
								<h3>考研大纲</h3>
							</div>
							<div class="txt">
								<p>考研大纲指由教育部考试中心组织编写，规定当年全国硕士研究生入学考试相应科目的考试范围考试要求、考试形式、试卷结构等权威政策指导性考研。</p>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>考研招简</h3>
							</div>
							<div class="txt">
								<p>招生简章是介绍学校基本情况，是学生了解该学校和进行报考的重要依据。简章中会有学校所开设的课程报考条件、日程、联系方式等。在招生宣传中，招生学校必须将名称、地址、类别、层次、专业等事项按照审批机关审批的内容加以规范。</p>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>公共课考研大纲</h3>
							</div>
							<div class="list clearfix">
								<dl>
									<c:forEach items="${mbaArticles[3][3] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
							<a href="javascript:;"><img src="${staticPath}/images/pages/plan_button4.png" height="50" width="200" alt="" class="plan_btn"></a>
						</li>
					</ul>
				</div>
				<div class="right">
					<ul>
						<li>
							<div class="sm_title">
								<h3>本月热点</h3>
							</div>
							<div class="list clearfix">
								<dl>
									<c:forEach items="${mbaArticles[3][0] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>小贴士</h3>
							</div>
							<div class="list list_tips clearfix">
								<dl>
									<c:forEach items="${mbaArticles[3][1] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>考研免费视频</h3>
							</div>
							<div class="list list_guide clearfix">
								<dl>
									<c:forEach items="${mbaArticles[3][2] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="plan_bgc" id="hang5">
		<div class="plan_container">
			<div class="plan_score plan_register clearfix">
				<div class="title">
					<img src="${staticPath}/images/pages/title5.png" height="76" width="324" alt="">
				</div>
				<div class="left clearfix">
					<ul>
						<li>
							<div class="sm_title">
								<h3>考研报名</h3>
							</div>
							<div class="txt">
								<p>考研首先要符合国家标准，其次按照程序：与学校联系、先期准备、报名、初试、调剂、复试、复试调剂、录取、毕业生就业、其他等方面依次进行。</p>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>现场确认</h3>
							</div>
							<div class="txt">
								<p>在研究生招生工作中，由于招生计划的限制，有些考生虽然达到分数线，但并不能被安排复试或复试后并不能被录取，对这些考生，招生单位将负责把其全部材料及时转至第二志愿单位，这个过程即称为考研调剂。</p>
							</div>
							<a href="javascript:;"><img src="${staticPath}/images/pages/plan_button5.png" height="50" width="200" alt="" class="plan_btn"></a>
						</li>
					</ul>
				</div>
				<div class="right">
					<ul>
						<li>
							<div class="sm_title">
								<h3>本月热点</h3>
							</div>
							<div class="list clearfix">
								<dl>
									<c:forEach items="${mbaArticles[4][0] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>小贴士</h3>
							</div>
							<div class="list list_tips clearfix">
								<dl>
									<c:forEach items="${mbaArticles[4][1] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>考研复习指导</h3>
							</div>
							<div class="list list_guide clearfix">
								<dl>
									<c:forEach items="${mbaArticles[4][2] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="plan_bgc_two last_bgc" id="hang6">
		<div class="plan_container">
			<div class="plan_score plan_test clearfix">
				<div class="title">
					<img src="${staticPath}/images/pages/title6.png" height="76" width="333" alt="">
				</div>
				<div class="left clearfix">
					<ul>
						<li>
							<div class="sm_title">
								<h3>考研初试</h3>
							</div>
							<div class="txt">
								<p>2019年研究生考试初试时间预计为12月24日至12月25日(超过3小时的考试科目在12月26日进行)。考试时间以北京时间为准，上午8:30-11:30,下午14:00-17:00 。</p>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>考研科目</h3>
							</div>
							<div class="txt">
								<p>12月24日上午：思想政治理论、管理类联考综合能力；12月24日下午：外国语；12月25日上午：业务课一；12月25日下午 业务课二；12月26日：考试时间超过3小时的考试科目；每科考试时间一般为3小时;建筑设计等特殊科目考试时间最长不超过6小时。</p>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>考研真题下载</h3>
							</div>
							<div class="list clearfix">
								<dl>
									<c:forEach items="${mbaArticles[5][3] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
							<a href="javascript:;"><img src="${staticPath}/images/pages/plan_button6.png" height="50" width="200" alt="" class="plan_btn"></a>
						</li>
					</ul>
				</div>
				<div class="right">
					<ul>
						<li>
							<div class="sm_title">
								<h3>本月热点</h3>
							</div>
							<div class="list clearfix">
								<dl>
									<c:forEach items="${mbaArticles[5][0] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>小贴士</h3>
							</div>
							<div class="list list_tips clearfix">
								<dl>
									<c:forEach items="${mbaArticles[5][1] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
						<li>
							<div class="sm_title">
								<h3>考研视频</h3>
							</div>
							<div class="list list_guide clearfix">
								<dl>
									<c:forEach items="${mbaArticles[5][2] }" var="article">
										<dd><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank"><i></i>${article[1] }</a></dd>
									</c:forEach>
								</dl>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 挂件 -->
	<div class="hang">
		<ul>
			<li class="active"><a href="#hang1">2月</a></li>
			<li><a href="#hang2">3-5月</a></li>
			<li><a href="#hang3">6-7月</a></li>
			<li><a href="#hang4">8-9月</a></li>
			<li><a href="#hang5">10-11月</a></li>
			<li><a href="#hang6">12-1月</a></li>
			<li class="back_top"><a href="javascript:;">TOP</a></li>
		</ul>
	</div>
	<div class="hang_server">
		<ul>
			<li>
				<a href="javascript:;">
					<i class="server1"></i>
					<h3>院校咨询</h3>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<i class="server2"></i>
					<h3>专业咨询</h3>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<i class="server3"></i>
					<h3>18QQ群</h3>
				</a>
			</li>
		</ul>
	</div>
	<jsp:include page="/web/to/footer"></jsp:include>
	<script>
		jQuery.extend(jQuery.easing, {
    	    easeOutSine: function(x, t, b, c, d) {
    	        return c * Math.sin(t / d * (Math.PI / 2)) + b;
    	    }
    	});     
		$(function(){
			$(window).scroll(function(){
			    var $scroll = $(document).scrollTop();
			    if($scroll>=490){
			        $(".hang").addClass("on");
			    }else{
			        $(".hang").removeClass("on");		        
			    }
			    if($scroll>=490){
			        $(".hang_server").addClass("on");
			    }else{
			        $(".hang_server").removeClass("on");		        
			    }

			    if($scroll>=490){
			    	$(".hang li:first-child").addClass('active').siblings('li').removeClass('active');
			    }
			    if($scroll>=1290){
			    	$(".hang li:nth-child(2)").addClass('active').siblings('li').removeClass('active');
			    }
			    if($scroll>=1915){
			    	$(".hang li:nth-child(3)").addClass('active').siblings('li').removeClass('active');
			    }
			    if($scroll>=2561){
			    	$(".hang li:nth-child(4)").addClass('active').siblings('li').removeClass('active');
			    }
			    if($scroll>=3244){
			    	$(".hang li:nth-child(5)").addClass('active').siblings('li').removeClass('active');
			    }
			    if($scroll>=3669){
			    	$(".hang li:nth-child(6)").addClass('active').siblings('li').removeClass('active');
			    }
			}) 

			var win_height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
		    var href_click = false;
		    $('.hang').on('click', 'li', function (event) {
		    	$(this).addClass('active').siblings('li').removeClass('active');
		        event.preventDefault();
		        event.stopPropagation();
		        href_click = true;  
		        var t = $($(this).find('a').attr('href')).offset().top;
		        var h = $(this).closest(".hang").height();
		        setTimeout(function () {
		            href_click = false;
		        }, 500);
		        $('body,html').stop().animate({
		            'scrollTop': t+25
		        }, 500, 'easeOutSine', function () {
		            href_click = false;
		        });
		    })

			var date1 = new Date();
        	var date2 = new Date('2018-12-22');
        	var date11 = (date2.getTime() - date1.getTime()) / (24 * 60 * 60 * 1000);
        	var date=parseInt(date11);
        	$(".banner .time span").html(date);

        	 //返回顶部 
	        $(".back_top").click(function() {	        	
	            $('body,html').animate({
	                scrollTop: 0 + 'px'
	            }, 400);
	            return false;
	        });
		})
    </script>
</body>
</html>

