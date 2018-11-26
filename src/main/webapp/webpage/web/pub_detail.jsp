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
	<link rel="stylesheet" href="${staticPath }/css/detail/detail.css">
	<script src="${staticPath }/js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/web/header"></jsp:include>
	<div class="nav_detail">
		<div class="container clearfix">
			<div class="left">
				<a href="${basePath}/web/index.html"><p>首页</p></a>
				<img src="${staticPath }/images/detail/arrow.png" alt="">
				<p class="classes">全程班</p>
				<img src="${staticPath }/images/detail/arrow.png" alt="">
				<p class="course">考研政治</p>
			</div>
			<!-- <div class="right">
				<a href="course.html"><span>GO 更多课程 >></span></a>
			</div> -->
		</div>
	</div>
	<div class="content">
		<div class="container">
			<div class="people">
				<div class="title title1">
					<img src="${staticPath }/images/detail/title1.png"  alt="">
				</div>
				<div class="list">
					<ul class="quancheng_list">
						<li><i class="dot"></i><em>零基础、基础薄弱</em>没有学习规划，不知如何复习的学员</li>
						<li><i class="dot"></i>有一定的基础<em>想拔高，</em>志向考取名校的学员</li>
						<li><i class="dot"></i><em>跨专业院校，</em>想脱颖而出的学员</li>
						<li><i class="dot"></i><em>在职备考，</em>时间精力有限，想事半功倍的学员</li>
						<li><i class="dot"></i>不想到处奔波上课的学员</li>
						<li><i class="dot"></i>希望在名师专业指导下，取得<em>高分突破</em>的学员</li>
						<li><i class="dot"></i><em>自制力弱，</em>缺乏学习方法和复习规划，希望全程有人监督陪读</li>
					</ul>
					<ul class="jinping_list">
						<li><i class="dot"></i>对院校招生情况不了解，<em>无法确定目标院校，</em>目标专业的学员</li>
						<li><i class="dot"></i>对未来就业形势迷茫，<em>无法确定发展方向</em>的学员</li>
						<li><i class="dot"></i>基础薄弱，不知如何着手复习，需<em>量身定制</em>专属学习方案的学员</li>
						<li><i class="dot"></i>有一定基础，希望通过全科专业系统的培训取得高分，<em>冲刺名校</em>的学员</li>
						<li><i class="dot"></i>不想<em>到处奔波上课</em>的学员</li>
						<li><i class="dot"></i>考研跨院校、跨专业，从零开始，希望高效复习，<em>顺利进入复试</em>的学员</li>
						<li><i class="dot"></i>时间受限，<em>无法参加面授</em>的考生</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="people goal">
			<div class="container">
				<div class="title title2">
					<img src="${staticPath }/images/detail/title2.png"  alt="">
				</div>
				<div class="list">
					<ul>
						<li><i class="dot_th"></i>树立科学高效的<em>全程备考观念，</em>全面了解复习重点，平衡各科目复习时间</li>
						<li><i class="dot_th"></i><em>分阶段、分模块</em>全面掌握各科知识要点，在细化讲解中充分理解</li>
						<li><i class="dot_th"></i>以真题为核心彻底透视<em>公共课命题思路、</em>把握考试方向</li>
						<li><i class="dot_th"></i>讲练结合，名师指点，<em>熟练掌握答题技巧，</em>学以致用</li>
						<li><i class="dot_th"></i>充分利用<em>全程答疑</em>等服务，节约备考时间，事半功倍</li>
					</ul>
				</div>
			</div>
		</div>
		<img class="quancheng_list" src="${staticPath }/images/detail/goal.png" alt="">
		<div class="people course quancheng_list" id="cor_quanc">
			<div class="title">
				<img src="${staticPath }/images/detail/title3.png"  alt="" class="quancheng_list">
				<img src="${staticPath }/images/detail/title33.png"  alt="" class="jinping_list">
			</div>
			<div class="text quancheng_list">
				<table border="1" cellspacing="0" cellpadding="0">
 					<tr>
 					  <th>考研课程</th>
 					  <th>致简考研在线</th>
 					  <th>其它机构<p>(其它面授小机构、录像班、天价VIP班等)</p></th>
 					</tr>
 					<tr>
 					  <td>师资实力</td>
 					  <td>业内严选师资团队</td>
 					  <td>师资不明或师资水平参差不齐</td>
 					</tr>
 					<tr>
 					  <td>授课形式</td>
 					  <td>高清录播+互动直播，实时更新</td>
 					  <td>线下课程翻录，躁音明显，画面质量差，
						<br>听不清老师讲课</td>
 					</tr>
 					<tr>
 					  <td>教研服务</td>
 					  <td>答疑、批改、督学等全程服务</td>
 					  <td>无服务</td>
 					</tr>
 					<tr>
 					  <td>配套材料</td>
 					  <td>精编密训教材，分阶快递</td>
 					  <td>无教材或教材不全</td>
 					</tr>
 					<tr>
 					  <td>品牌保障</td>
 					  <td>新东方官方网络品牌</td>
 					  <td>品牌情况不明</td>
 					</tr>
 					<tr>
 					  <td>性价比</td>
 					  <td>6.9/小时≈25位实力师资+跟踪服务</td>
 					  <td>高价格</td>
 					</tr>
 				</table>
			</div>
		</div>
		<div class="people course jinping_list">
			<div class="title">
				<img src="${staticPath }/images/detail/title3.png"  alt="" class="quancheng_list">
				<img src="${staticPath }/images/detail/title33.png"  alt="" class="jinping_list">
			</div>
			<div class="step jinping_list clearfix">
				<ul>
					<li>
						<h2><i>Step1.  </i>夯实基础</h2>
						<div class="txt">
							<p>1、建立学科知识体系及考点概念原理</p>
							<p>2、各科考点重点精讲及加深概念理解</p>
							<p>3、掌握题型基本技巧及强化知识考点训练</p>
						</div>
						<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="button">咨询课程详情</a>
					</li>
					<li>
						<h2><i>Step2.  </i>拓展提高</h2>
						<div class="txt">
							<p>1、理解背诵核心考点及解题技巧</p>
							<p>2、强化答题技巧训练，总结解题方法</p>
							<p>3、熟练掌握各科知识体系核心考点及解题方法</p>
						</div>
						<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="button">咨询课程详情</a>
					</li>
					<li>
						<h2><i>Step3.  </i>技术突破</h2>
						<div class="txt">
							<p>1、掌握历年高考真题考点</p>
							<p>2、攻坚各科薄弱环节及遗漏知识点</p>
							<p>3、总结历年真题出题规律</p>
						</div>
						<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="button">咨询课程详情</a>
					</li>
					<li>
						<h2><i>Step4.  </i>模考冲刺</h2>
						<div class="txt">
							<p>1、考前重点难点精讲，实战查漏补缺</p>
							<p>2、应考技巧强化训练并整理易错考点</p>
							<p>3、高考技巧训练，模拟考场检验成果</p>
							<p>4、调整复习计划，调整心态，保持较好状态</p>
						</div>
						<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="button">咨询课程详情</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="people quancheng_list">
			<div class="title">
				<img src="${staticPath }/images/detail/title4.png"  alt="">
			</div>
			<div class="tab">
				<div class="tab_nav clearfix">
					<ul>
						<li class="active">
							<p>01</p>
							<div class="text">
								<span>暑期阶段<br>7月-8月</span>
							</div>
						</li>
						<li>
							<p>02</p>
							<div class="text">
								<span>提高阶段<br>9月-10月</span>
							</div>
						</li>
						<li>
							<p>03</p>
							<div class="text">
								<span>冲刺阶段<br>11月-12月</span>
							</div>
						</li>
						<li>
							<p>04</p>
							<div class="text">
								<span>预测点题<br>考前半个月</span>
							</div>
						</li>
					</ul>
				</div>
				<div class="tab_list">
					<ul>
						<li class="tab_form">
							<ol>
								<li class="tab_text">
									<p><i>学习目标：</i>  专题化梳理前序知识点，按考纲要求覆盖所有考点，吃透命题规律，掌握真题训练法</p>
								</li>
								<li class="tab_text">
									<p><i>学习时长：</i>  总390小时以上【听课≥190小时，复习+练习≥200小时】,每天约6-7小时</p>
								</li>
								<li class="tab_text">
									<p><i>全程班任务：</i>   完成直播规划课，各科考点与题型精讲录播课，刷题练习与答疑直播课</p>
								</li>
								<li class="tab_text">
									<p><i>指定配套教辅：</i> 《考研政治官方指南19考研版》、考研政治高分必刷1000题（电子版）、《高数18讲》、
                                《线代9讲》、《概率9讲》、考研数学强化讲义（电子版）、《研词》、《句句真研》、
                                《保命28分》、《考研英语高分写作》、《考研英语拆分与组合翻译法》</p>
								</li>
								<li class="tab_text">
									<p><i>推荐教学服务：</i>  知识堂答疑、班级群服务、配套教辅复习</p>
								</li>
								<li class="tab_text">
									<p><i>备考关键指数：</i> <img src="${staticPath }/images/detail/star.png" alt=""></p>
								</li>
							</ol>
						</li>
						<li class="tab_form">
							<ol>
								<li class="tab_text">
									<p><i>学习目标：</i>  按新考纲变化有针对性重点复习，进行专题化总结和高频演练，形成高分突破能力</p>
								</li>
								<li class="tab_text">
									<p><i>学习时长：</i>  总400小时以上【听课≥200小时，复习+练习≥200小时】,每天约7-8小时</p>
								</li>
								<li class="tab_text">
									<p><i>全程班任务：</i>  完成真题精讲录播课，刷题练习直播课</p>
								</li>
								<li class="tab_text">
									<p><i>指定配套教辅：</i> 考研英语强化课程讲义、《保命28分》、《考研英语高分写作》、《考研英语拆分与组合翻译法》、《考研政治官方指南19考研版》、《高数18讲》、《线代9讲》、《概率9讲》</p>
								</li>
								<li class="tab_text">
									<p><i>推荐教学服务：</i> 作文批改、知识堂答疑、班级群服务</p>
								</li>
								<li class="tab_text">
									<p><i>备考关键指数：</i> <img src="${staticPath }/images/detail/star1.png" alt=""></p>
								</li>
							</ol>
						</li>
						<li class="tab_form">
							<ol>
								<li class="tab_text">
									<p><i>学习目标：</i>  识记80%以上核心考点，把知识点转化为实际解题能力，进行冲刺复习和模拟训练</p>
								</li>
								<li class="tab_text">
									<p><i>学习时长：</i>  总360小时以上【听课≥80小时，复习+练习≥280小时】，每天约6-8小时</p>
								</li>
								<li class="tab_text">
									<p><i>全程班任务：</i>  冲刺课程，模考课程</p>
								</li>
								<li class="tab_text">
									<p><i>指定配套教辅：</i> 《考研英语/政治/数学冲刺内部讲义》</p>
								</li>
								<li class="tab_text">
									<p><i>推荐教学服务：</i>  作文批改、知识堂答疑、班级群服务</p>
								</li>
								<li class="tab_text">
									<p><i>备考关键指数：</i> <img src="${staticPath }/images/detail/star1.png" alt=""></p>
								</li>
							</ol>
						</li>
						<li class="tab_form">
							<ol>
								<li class="tab_text">
									<p><i>学习目标：</i>  考点查漏补缺，考前突击记忆，掌握热点和时效性考点，具备实战的心理素质和得分能力</p>
								</li>
								<li class="tab_text">
									<p><i>学习时长：</i>  总200小时以上【听课≥30小时，练习≥50小时，看书≥120小时】,每天约8小时</p>
								</li>
								<li class="tab_text">
									<p><i>全程班任务：</i>   直播预测课程</p>
								</li>
								<li class="tab_text">
									<p><i>指定配套教辅：</i> 《考研英语/政治/数学冲刺内部讲义》（电子版）</p>
								</li>
								<li class="tab_text">
									<p><i>推荐教学服务：</i>  知识堂答疑</p>
								</li>
								<li class="tab_text">
									<p><i>备考关键指数：</i> <img src="${staticPath }/images/detail/star1.png" alt=""></p>
								</li>
							</ol>
						</li>
					</ul>

				</div>
			</div>
		</div>
		<div class="people jinping_list" id="cor_jinp">
			<div class="title">
				<img src="${staticPath }/images/detail/title44.png"  alt="">
			</div>
			<div class="tab tab_jingping">
				<table border="1" cellspacing="0" cellpadding="0">
					<tr>
						<th></th>
						<th></th>
						<th>服务项目</th>
						<th>服务标准</th>
						<th>服务说明</th>
					</tr>
					<tr>
						<td rowspan="6" class="row_span"><p>VIP学员</p><p>专属优质</p><p>服务</p></td>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">班主任首次沟通</td>
						<td class="row_item3">报班后1个工作日内</td>
						<td class="row_item4">详细讲解课程体系，告知课程安排，提供答疑解，档案式管理学员基本信息。</td>
					</tr>
					<tr class="even">
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">纸质讲义</td>
						<td class="row_item3">报班后1个工作日，随教材发放（节假日除外）</td>
						<td class="row_item4">通盖全程备考用书，全年邮寄各科资料。</td>
					</tr>
					<tr>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">电子讲义</td>
						<td class="row_item3">报班即享，班级群资料区随心下载</td>
						<td class="row_item4">报名后在网校班级资料区下载。</td>
					</tr> 
					<tr class="even">
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">学习规划</td>
						<td class="row_item3">报班后7个工作日</td>
						<td class="row_item4">根据报名阶段定制学习规划，规划精确到每个阶段。</td>
					</tr>
					<tr>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">定期回访</td>
						<td class="row_item3">每月至少一次深度回访，随时关注学生动态和状况。</td>
						<td class="row_item4">深度了解学员当学习情况以及进度跟踪。</td>
					</tr>
					<tr class="even">
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">每月班会</td>
						<td class="row_item3">每月班会或班活动</td>
						<td class="row_item4">讲解下一阶段学习安排，提供答疑解感。</td>
					</tr>
					<tr>
						<td rowspan="6" class="row_span"><p>学习实时</p><p>跟踪</p></td>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">安排入学测试</td>
						<td class="row_item3">报班后7个工作日内</td>
						<td class="row_item4">班主任对新生进行入学测评，并将測评结果提交教研团队，根据学习水平系筑匹配班级。</td>
					</tr>
					<tr class="even">
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">课后练习</td>
						<td class="row_item3">智能测评，看课后随堂測试，查缺补漏</td>
						<td class="row_item4">实时跟踪学生学习效果和动态</td>
					</tr>
					<tr>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">阶段测评</td>
						<td class="row_item3">每月测评，阶段测评，一线名师讲评</td>
						<td class="row_item4">一月ー测，实时检测学习效果</td>
					</tr> 
					<tr class="even">
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">作文批改</td>
						<td class="row_item3">不限次，教研老师细致修改</td>
						<td class="row_item4">仅针对英语作文</td>
					</tr>
					<tr>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">学习进度智能监控</td>
						<td class="row_item3">实时监督</td>
						<td class="row_item4">网校后台实时监控学习进度</td>
					</tr>
					<tr class="even">
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">假期作业</td>
						<td class="row_item3">寒假前发放电子版塞暑假作业</td>
						<td class="row_item4">量身定制塞暑假作业，假期备考无忧</td>
					</tr>
					<tr>
						<td rowspan="5" class="row_span"><p>专业课</p><p>VIP服务</p></td>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">院校专业分析预约</td>
						<td class="row_item3">报班一个工作日可预约院校分析</td>
						<td class="row_item4">院校专业分析团队了解学生的基本情况：专业、院校、各科基础</td>
					</tr>
					<tr class="even">
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">专业院校分析</td>
						<td class="row_item3">预约后7工作日内安排专业老师进行院校和专业分析</td>
						<td class="row_item4">院校专业分析团队对学生意向专业进行评估，分析不同专业院校风险，量身定制合理化择校方案</td>
					</tr>
					<tr>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">专业课程顾问匹配</td>
						<td class="row_item3">院校和专业确认后20个工作日内（特殊院校专业会提前沟通）</td>
						<td class="row_item4">院校分析多次指导，帮助学员确定专业和院校，学员认可，填写《院校专业确认单》</td>
					</tr> 
					<tr class="even">
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">专业课一对</td>
						<td class="row_item3">匹配完专业课顾问即可预约上课</td>
						<td class="row_item4">目标院校目标专业高分学长学姐一对一制定复习计划，初试复试全程辅导授课</td>
					</tr>
					<tr>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">独家资料</td>
						<td class="row_item3">初试－复试</td>
						<td class="row_item4">目标院校目标专业专属资料（部分院校不提供，可与班主任老师确认资料）</td>
					</tr>
					<tr class="even">
						<td rowspan="3" class="row_span" style="background:#fff"><p>海量课程</p></td>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">网校录播</td>
						<td class="row_item3">报班即学，定时发布课件</td>
						<td class="row_item4">知识点精细切片讲解、历年真题强化训练、考前冲刺押题</td>
					</tr>
					<tr>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">在线直播</td>
						<td class="row_item3">每周直播，提前发放直播课表</td>
						<td class="row_item4">知识点精讲、在线答疑、查缺补漏</td>
					</tr>
					<tr class="even">
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">公共课一对</td>
						<td class="row_item3">公共课老师3个工作日内确认学生上课计划，并根据学生状况确定上课时间</td>
						<td class="row_item4">教研老师依据学员的具体学习水平，以线上直播形式，量身定制一对一课程</td>
					</tr>
					<tr>
						<td rowspan="4" class="row_span"><p>班级专属</p><p>答疑服务</p></td>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">课程后台答疑</td>
						<td class="row_item3">全程24小时内答疑</td>
						<td class="row_item4">24小时内网校助教在线答疑</td>
					</tr>
					<tr class="even">
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">直播答疑</td>
						<td class="row_item3">直播过程中全程实时答疑</td>
						<td class="row_item4">直播课堂答疑</td>
					</tr>
					<tr>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">班级群答疑</td>
						<td class="row_item3">全程24小时内专职助教答疑</td>
						<td class="row_item4">全程24小时内专职助教答疑</td>
					</tr>
					<tr class="even">
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">面授答疑</td>
						<td class="row_item3">根据学习状况确定时间答疑</td>
						<td class="row_item4">具体科目班型，集训名师面授答疑</td>
					</tr>
					<tr>
						<td rowspan="5" class="row_span"><p>VIP专有</p><p>特色服务</p></td>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">精神保障</td>
						<td class="row_item3" colspan="2" rowspan="2">备考心理辅导，人文关怀，疏导学生备考压力</td>
					</tr> 
					<tr>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">心理调控</td>
					</tr> 
					<tr class="even">
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">考前模拟</td>
						<td class="row_item3">考前集中模考</td>
						<td class="row_item4">模拟真实考卷，实战不慌</td>
					</tr> 
					<tr>
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">专享学习社区</td>
						<td class="row_item3">报班即享专属学习社区，和研友老师实时互动</td>
						<td class="row_item4">报班后从班级同学会进入考研社团，享受资料下、同学交流、作业、组队学习、考研资讯实时共享等服务</td>
					</tr> 
					<tr class="even">
						<td class="row_item1"><img class="right_icon" src="${staticPath }/images/detail/right_icon.png" alt=""></td>
						<td class="row_item2">专属学习交流群</td>
						<td class="row_item3">报班即可进入班级专属群交流</td>
						<td class="row_item4">设有专属答疑老师，每月群内活动</td>
					</tr> 

				</table>
			</div>
		</div>
		<div class="people jinping_list">
			<div class="vs jinping_list">
				<div class="title">
					<img src="${staticPath }/images/detail/title33.png"  alt="">
				</div>
				<img src="${staticPath }/images/detail/vs.png" alt="">
			</div>
		</div>
		<div class="people jinping_list"  id="cor_last">
			<div class="title">
				<img src="${staticPath }/images/detail/title66.png"  alt="">
			</div>
			<div class="step attention clearfix">
				<ul>
					<li>
						<img src="${staticPath }/images/detail/attention1.png" alt="">
						<h3><span>全职</span>师资</h3>
						<p class="text">学生评分责任制；不缩课、不推课；课前测试、课后作业全程跟踪随时答疑；</p>
						<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="button_zx">点击咨询</a>
					</li>
					<li>
						<img src="${staticPath }/images/detail/attention2.png" alt="">
						<h3><span>四重</span>管理</h3>
						<p class="text">班主任责任制；学管师督制；中公名师授制；专享顾问答疑；</p>
						<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="button_zx">点击咨询</a>
					</li>
					<li>
						<img src="${staticPath }/images/detail/attention3.png" alt="">
						<h3><span>课程</span>体验</h3>
						<p class="text">38人小班授课；6人小组学习制；24小时保姆服务和标准作息</p>
						<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="button_zx">点击咨询</a>
					</li>
					<li>
						<img src="${staticPath }/images/detail/attention4.png" alt="">
						<h3><span>M&UP</span>服务</h3>
						<p class="text">结合学员专业意向、学习情况、学习潜力进行评估；帮助学员准确定位</p>
						<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="button_zx">点击咨询</a>
					</li>
					<li>
						<img src="${staticPath }/images/detail/attention5.png" alt="">
						<h3><span>翻转式</span>课堂</h3>
						<p class="text">以问题为核心讨论；时刻与中公名师互动；随时随地答疑</p>
						<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="button_zx">点击咨询</a>
					</li>
					<li>
						<img src="${staticPath }/images/detail/attention6.png" alt="">
						<h3><span>切片化</span>教学</h3>
						<p class="text">2000多个重难点切片；针对性讲解考点循序渐进各个击破</p>
						<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="button_zx">点击咨询</a>
					</li>
					<li>
						<img src="${staticPath }/images/detail/attention7.png" alt="">
						<h3><span>TOP教学</span>体系</h3>
						<p class="text">精准、高效、专业；精准定位目标、考点；高效规划、调整、学习；专业教研、教学、训练</p>
						<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="button_zx">点击咨询</a>
					</li>
					<li>
						<img src="${staticPath }/images/detail/attention8.png" alt="">
						<h3><span>专用</span>图书</h3>
						<p class="text">专用核心讲义；考研专用教材；配套历年真题；考前冲分试卷</p>
						<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="button_zx">点击咨询</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="banner_sm"><img src="${staticPath }/images/detail/banner_sm.png" alt=""></div>
	</div>
	<jsp:include page="/web/to/footer"></jsp:include>
</body>
</html>
<script>
	var json=[
				{
					"id":1,
					"name":"公共课政治全程班"
				},
				{
					"id":2,
					"name":"公共课英语一全程班"	
				},
				{
					"id":3,
					"name":"公共课英语二全程班"	
				},
				{
					"id":4,
					"name":"公共课数学一全程班"	
				},
				{
					"id":5,
					"name":"公共课数学二全程班"	
				},
				{
					"id":6,
					"name":"公共课数学三全程班"	
				},
				{
					"id":7,
					"name":"公共课政治精品班"	
				},
				{
					"id":8,
					"name":"公共课英语一精品班"	
				},
				{
					"id":9,
					"name":"公共课英语二精品班"
				},
				{
					"id":10,
					"name":"公共课数学一精品班"
				},
				{
					"id":11,
					"name":"公共课数学二精品班"
				},
				{
					"id":12,
					"name":"公共课数学三精品班"
				},
				{
					"id":13,
					"name":"致简集训班"
				},
				{
					"id":14,
					"name":"致简密训班"
				},
				{
					"id":15,
					"name":"致简特训班"
				},
				{
					"id":16,
					"name":"致简管理联考版"
				}
				,
				{
					"id":17,
					"name":"致简法律硕士直通班"
				}
			]
</script>
<script>
    function GetQueryString(name) {     
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");     
        var r = window.location.search.substr(1).match(reg);     
        if (r != null) return  unescape(r[2]);
        return null;
    }
    var num = GetQueryString("type")-1;
    console.log(num);
	$(function(){
		var text=json[num].name;
		var a=text.substring(0,text.length-3);
		console.log(a)
        $('.nav_detail p.course').html(a);
        if (num<=5) {
        	$('.nav_detail p.classes').html('公共课全程班');
        	$('.quancheng_list').show();
        	$('.jinping_list').hide();
        }else{
        	$('.nav_detail p.classes').html('公共课精品班');
        	$('.quancheng_list').hide();
        	$('.jinping_list').show();
        };
	})

	$('.tab_form').eq(0).show().siblings().hide();
	$('.tab_nav li').click(function(){
		var idx=$(this).index();
		$(this).addClass('active').siblings().removeClass('active');
		$(this).parent().parent('.tab_nav ').siblings('.tab_list').find('.tab_form').eq(idx).show().siblings('.tab_form').hide();
	})	
	$(".default").show();
</script>
