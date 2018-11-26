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
	<link rel="stylesheet" href="${staticPath }/css/detail/mdetail.css">
	<link rel="shortcut icon" href="">
	<script src="${staticPath }/js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/web/header?hasNav=true"></jsp:include>
	<div class="nav_detail">
		<div class="container clearfix">
			<div class="left">
				<a href="${basePath}/web/index.html"><p>首页</p></a>
				<img src="${staticPath }/images/detail/arrow.png" alt="">
				<p class="classes">致简精品全程班</p>
				<img src="${staticPath }/images/detail/arrow.png" alt="">
				<p class="course">致简集训班</p>
			</div>
			<!-- <div class="right">
				<a href="course.html"><span>GO 更多课程 >></span></a>
			</div> -->
		</div>
	</div>
	<a href="javascript:;" class="banner"><img src="${staticPath }/images/detail/mdetail_banner.png" height="auto" width="100%" alt=""></a>
	<div class="content">
		<img class="mtext" src="${staticPath }/images/detail/mtext.png" alt="">
		<img class="face" src="${staticPath }/images/detail/face.png" alt="">
		<div class="intro">
			<img src="${staticPath }/images/detail/left_stars.png" alt="">
			<p><span>致简考研个性化课程，</span>梳理知识体系，夯实基础强化提升，精解答题技巧</p>
			<img src="${staticPath }/images/detail/right_stars.png" alt="">
			<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="button">点击了解详情</a>
		</div>
		<div class="detail jixun">
			<div class="container">
				<div class="title">
					<img src="${staticPath }/images/detail/mtitle1.png" alt="">
				</div>
				<div class="sm_title">
					<i></i>
					<h2>致简集训班</h2>
				</div>
				<div class="tab" style="padding-bottom:10px">
					<div class="tab_nav clearfix">
						<ul>
							<li class="mactive">考研政治</li>
							<li>考研英语</li>
							<li>考研数学</li>
						</ul>
					</div>
					<div class="tab_list">
						<ul>
							<li>
								<table>
								  <tr>
								    <th><i></i>课程名称</th>
								    <th><i></i>课时</th>
								    <th><i></i>总课时</th>
								    <th><i></i>开课时间</th>
								  </tr>
								  <tr>
								    <td><i></i>导学班</td>
								    <td>8</td>
								    <td rowspan="5">104</td>
								    <td>2018年10-12月</td>
								  </tr>
								  <tr>
								    <td><i></i>基础班</td>
								    <td>24</td>
								    <td>2019年1-3月</td>
								  </tr>
								  <tr>
								    <td><i></i>提高班</td>
								    <td>40</td>
								    <td>2019年9-10月</td>
								  </tr>
								  <tr>
								    <td><i></i>冲刺班</td>
								    <td>24</td>
								    <td>2019年11-12月</td>
								  </tr>
								  <tr>
								    <td><i></i>点题预测班</td>
								    <td>8</td>
								    <td>2019年12月</td>
								  </tr>
								</table>
								<div class="empty"></div>
								<div class="tab_footer">
									<p>集训班收费标准</p>
									<span><i>￥</i>16800</span>
									<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
								</div>
							</li>
							<li>
								<table>
								  <tr>
								    <th><i></i>课程名称</th>
								    <th><i></i>课时</th>
								    <th><i></i>总课时</th>
								    <th><i></i>开课时间</th>
								  </tr>
								  <tr>
								    <td><i></i>导学班</td>
								    <td>40</td>
								    <td rowspan="6">104</td>
								    <td>2018年10-12月</td>
								  </tr>
								  <tr>
								    <td><i></i>寒假集训</td>
								    <td>8</td>
								    <td>2019年1月</td>
								  </tr>
								  <tr>
								    <td><i></i>基础班</td>
								    <td>32</td>
								    <td>2019年1-3月</td>
								  </tr>
								  <tr>
								    <td><i></i>提高班</td>
								    <td>32</td>
								    <td>2019年9-10月</td>
								  </tr>
								  <tr>
								    <td><i></i>冲刺班</td>
								    <td>20</td>
								    <td>2019年11-12月</td>
								  </tr>
								  <tr>
								    <td><i></i>点题预测班</td>
								    <td>8</td>
								    <td>2019年12月</td>
								  </tr>
								</table>
								<div class="empty"></div>
								<div class="tab_footer">
									<p>集训班收费标准</p>
									<span><i>￥</i>16800</span>
									<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
								</div>
							</li>
							<li>
								<table>
								  <tr>
								    <th><i></i>课程名称</th>
								    <th><i></i>课时</th>
								    <th><i></i>总课时</th>
								    <th><i></i>开课时间</th>
								  </tr>
								  <tr>
								    <td><i></i>导学班</td>
								    <td>48</td>
								    <td rowspan="6">204</td>
								    <td>2018年9-10月</td>
								  </tr>
								  <tr>
								    <td><i></i>寒假集训</td>
								    <td>8</td>
								    <td>2019年1月</td>
								  </tr>
								  <tr>
								    <td><i></i>基础班</td>
								    <td>88</td>
								    <td>2019年1-3月</td>
								  </tr>
								  <tr>
								    <td><i></i>提高班</td>
								    <td>16</td>
								    <td>2019年9-10月</td>
								  </tr>
								  <tr>
								    <td><i></i>冲刺班</td>
								    <td>36</td>
								    <td>2019年11-12月</td>
								  </tr>
								  <tr>
								    <td><i></i>点题预测班</td>
								    <td>8</td>
								    <td>2019年12月</td>
								  </tr>
								</table>
								<div class="empty"></div>
								<div class="tab_footer">
									<p>集训班收费标准</p>
									<span><i>￥</i>16800</span>
									<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="detail mixun">
			<div class="title">
				<img src="${staticPath }/images/detail/mtitle1.png" alt="">
			</div>
			<div class="sm_title">
				<i></i>
				<h2>致简密训班</h2>
			</div>
			<div class="tab" style="padding-bottom:10px">
				<div class="tab_nav clearfix">
					<ul>
						<li class="mactive">考研政治</li>
						<li>考研英语</li>
						<li>考研数学</li>
						<li>专业课</li>
					</ul>
				</div>
				<div class="tab_list">
					<ul>
						<li>
							<table>
							  <tr>
							    <th><i></i>课程名称</th>
							    <th><i></i>课时</th>
							    <th><i></i>总课时</th>
							    <th><i></i>开课时间</th>
							  </tr>
							  <tr>
							    <td><i></i>导学班</td>
							    <td>8</td>
							    <td rowspan="6">122</td>
							    <td>2018年10-12月</td>
							  </tr>
							  <tr>
							    <td><i></i>基础班</td>
							    <td>24</td>
							    <td>2019年1-3月</td>
							  </tr>
							  <tr>
							    <td><i></i>提高班</td>
							    <td>40</td>
							    <td>2019年9-10月</td>
							  </tr>
							  <tr>
							    <td><i></i>冲刺班</td>
							    <td>24</td>
							    <td>2019年11-12月</td>
							  </tr>
							  <tr>
							    <td><i></i>点题预测班</td>
							    <td>8</td>
							    <td>2019年12月</td>
							  </tr>
							  <tr>
							    <td><i></i>模块教学</td>
							    <td>18</td>
							    <td>周一、三、五晚</td>
							  </tr>                       
							</table>
							<div class="empty"></div>
							<div class="tab_footer">
								<p>集训班收费标准</p>
								<span><i>￥</i>22800</span>
								<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
							</div>
						</li>
						<li>
							<table>
							  <tr>
							    <th><i></i>课程名称</th>
							    <th><i></i>课时</th>
							    <th><i></i>总课时</th>
							    <th><i></i>开课时间</th>
							  </tr>
							  <tr>
							    <td><i></i>导学班</td>
							    <td>40</td>
							    <td rowspan="9">263</td>
							    <td>2018年10-12月</td>
							  </tr>
							  <tr>
							    <td><i></i>寒假集训</td>
							    <td>8</td>
							    <td>2019年1月</td>
							  </tr>
							  <tr>
							    <td><i></i>基础班</td>
							    <td>32</td>
							    <td>2019年1-3月</td>
							  </tr>
							  <tr>
							    <td><i></i>提高班</td>
							    <td>32</td>
							    <td>2019年9-10月</td>
							  </tr>
							  <tr>
							    <td><i></i>冲刺班</td>
							    <td>20</td>
							    <td>2019年11-12月</td>
							  </tr>
							  <tr>
							    <td><i></i>点题预测班</td>
							    <td>8</td>
							    <td>2019年12月</td>
							  </tr>
							  <tr>
							    <td><i></i>模块教学</td>
							    <td>39</td>
							    <td>周一、三、五晚</td>
							  </tr>
							  <tr>
							    <td><i></i>录播课</td>
							    <td>60</td>
							    <td>2019年1月</td>
							  </tr>
							  <tr>
							    <td><i></i>直播课</td>
							    <td>24</td>
							    <td>2019年4月</td>
							  </tr>
							</table>
							<div class="empty"></div>
							<div class="tab_footer">
								<p>集训班收费标准</p>
								<span><i>￥</i>22800</span>
								<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
							</div>
						</li>
						<li>
							<table>
							  <tr>
							    <th><i></i>课程名称</th>
							    <th><i></i>课时</th>
							    <th><i></i>总课时</th>
							    <th><i></i>开课时间</th>
							  </tr>
							  <tr>
							    <td><i></i>导学班</td>
							    <td>48</td>
							    <td rowspan="7">249</td>
							    <td>2018年9-10月</td>
							  </tr>
							  <tr>
							    <td><i></i>寒假集训</td>
							    <td>8</td>
							    <td>2019年1月</td>
							  </tr>
							  <tr>
							    <td><i></i>基础班</td>
							    <td>88</td>
							    <td>2019年1-3月</td>
							  </tr>
							  <tr>
							    <td><i></i>提高班</td>
							    <td>16</td>
							    <td>2019年9-10月</td>
							  </tr>
							  <tr>
							    <td><i></i>冲刺班</td>
							    <td>36</td>
							    <td>2019年11-12月</td>
							  </tr>
							  <tr>
							    <td><i></i>点题预测班</td>
							    <td>8</td>
							    <td>2019年12月</td>
							  </tr>
							  <tr>
							    <td><i></i>模块教学</td>
							    <td>45</td>
							    <td>周一、三、五晚</td>
							  </tr>							
							</table>
							<div class="empty"></div>
							<div class="tab_footer">
								<p>集训班收费标准</p>
								<span><i>￥</i>22800</span>
								<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
							</div>
						</li>
						<li>
							<table>
							  <tr>
							    <th><i></i>课程名称</th>
							    <th><i></i>课时</th>
							    <th><i></i>总课时</th>
							    <th><i></i>开课时间</th>
							  </tr>
							  <tr>
							    <td rowspan="2">150分</td>
							    <td>45</td>
							    <td rowspan="2">53</td>
							    <td rowspan="4">协商制定</td>
							  </tr>
							  <tr>
							    <td>8</td>
							  </tr>
							  <tr>
							  	<td rowspan="2">300分</td>
							    <td>75</td>
							    <td rowspan="2">83</td>
							  </tr>
							  <tr>
							    <td>8</td>
							  </tr>
							</table>
							<div class="empty"></div>
							<div class="tab_footer">
								<p>集训班收费标准</p>
								<span><i>￥</i>22800</span>
								<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="detail texun">
			<div class="title">
				<img src="${staticPath }/images/detail/mtitle1.png" alt="">
			</div>
			<div class="sm_title">
				<i></i>
				<h2>致简特训班</h2>
			</div>
			<div class="tab" style="padding-bottom:10px">
				<div class="tab_nav clearfix">
					<ul>
						<li class="mactive">考研政治</li>
						<li>考研英语</li>
						<li>考研数学</li>
						<li>专业课、公共课</li>
					</ul>
				</div>
				<div class="tab_list">
					<ul>
						<li>
							<table>
							  <tr>
							    <th><i></i>课程名称</th>
							    <th><i></i>课时</th>
							    <th><i></i>总课时</th>
							    <th><i></i>开课时间</th>
							  </tr>
							  <tr>
							    <td><i></i>导学班</td>
							    <td>8</td>
							    <td rowspan="6">122</td>
							    <td>2018年10-12月</td>
							  </tr>
							  <tr>
							    <td><i></i>基础班</td>
							    <td>24</td>
							    <td>2019年1-3月</td>
							  </tr>
							  <tr>
							    <td><i></i>提高班</td>
							    <td>40</td>
							    <td>2019年9-10月</td>
							  </tr>
							  <tr>
							    <td><i></i>冲刺班</td>
							    <td>24</td>
							    <td>2019年11-12月</td>
							  </tr>
							  <tr>
							    <td><i></i>点题预测班</td>
							    <td>8</td>
							    <td>2019年12月</td>
							  </tr>
							  <tr>
							    <td><i></i>模块教学</td>
							    <td>18</td>
							    <td>周一、三、五晚</td>
							  </tr>
							</table>
							<div class="empty"></div>
							<div class="tab_footer">
								<p>集训班收费标准</p>
								<span><i>￥</i>22800</span>
								<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
							</div>
						</li>
						<li>
							<table>
							  <tr>
							    <th><i></i>课程名称</th>
							    <th><i></i>课时</th>
							    <th><i></i>总课时</th>
							    <th><i></i>开课时间</th>
							  </tr>
							  <tr>
							    <td><i></i>导学班</td>
							    <td>40</td>
							    <td rowspan="9">263</td>
							    <td>2018年10-12月</td>
							  </tr>
							  <tr>
							    <td><i></i>寒假集训</td>
							    <td>8</td>
							    <td>2019年1月</td>
							  </tr>
							  <tr>
							    <td><i></i>基础班</td>
							    <td>32</td>
							    <td>2019年1-3月</td>
							  </tr>
							  <tr>
							    <td><i></i>提高班</td>
							    <td>32</td>
							    <td>2019年9-10月</td>
							  </tr>
							  <tr>
							    <td><i></i>冲刺班</td>
							    <td>20</td>
							    <td>2019年11-12月</td>
							  </tr>
							  <tr>
							    <td><i></i>点题预测班</td>
							    <td>8</td>
							    <td>2019年12月</td>
							  </tr>
							  <tr>
							    <td><i></i>模块教学</td>
							    <td>39</td>
							    <td>周一、三、五晚</td>
							  </tr>
							  <tr>
							    <td><i></i>录播课</td>
							    <td>60</td>
							    <td>2019年1月</td>
							  </tr>
							  <tr>
							    <td><i></i>直播课</td>
							    <td>24</td>
							    <td>2019年4月</td>
							  </tr>
							</table>
							<div class="empty"></div>
							<div class="tab_footer">
								<p>集训班收费标准</p>
								<span><i>￥</i>22800</span>
								<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
							</div>
						</li>
						<li>
							<table>
							  <tr>
							    <th><i></i>课程名称</th>
							    <th><i></i>课时</th>
							    <th><i></i>总课时</th>
							    <th><i></i>开课时间</th>
							  </tr>
							  <tr>
							    <td><i></i>导学班</td>
							    <td>48</td>
							    <td rowspan="7">249</td>
							    <td>2018年9-10月</td>
							  </tr>
							  <tr>
							    <td><i></i>寒假集训</td>
							    <td>8</td>
							    <td>2019年1月</td>
							  </tr>
							  <tr>
							    <td><i></i>基础班</td>
							    <td>88</td>
							    <td>2019年1-3月</td>
							  </tr>
							  <tr>
							    <td><i></i>提高班</td>
							    <td>16</td>
							    <td>2019年9-10月</td>
							  </tr>
							  <tr>
							    <td><i></i>冲刺班</td>
							    <td>36</td>
							    <td>2019年11-12月</td>
							  </tr>
							  <tr>
							    <td><i></i>点题预测班</td>
							    <td>8</td>
							    <td>2019年12月</td>
							  </tr>
							  <tr>
							    <td><i></i>模块教学</td>
							    <td>45</td>
							    <td>周一、三、五晚</td>
							  </tr>							
							</table>
							<div class="empty"></div>
							<div class="tab_footer">
								<p>集训班收费标准</p>
								<span><i>￥</i>22800</span>
								<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
							</div>
						</li>
						<li>
							<table>
							  <tr>
							    <th colspan="2"><i></i>课程名称</th>
							    <th><i></i>课时</th>
							    <th><i></i>总课时</th>
							    <th><i></i>开课时间</th>
							  </tr>
							  <tr>
							    <td rowspan="4"><i></i>专业课</td>
							    <td rowspan="2">150分</td>
							    <td>45（复试）</td>
							    <td rowspan="2">53</td>
							    <td rowspan="7">协商制定</td>
							  </tr>
							  <tr>
							  	<td>8（复试）</td>
							  </tr>
							  <tr>
							  	<td rowspan="2">300分</td>
							  	<td>75（复试）</td>
							  	<td rowspan="2">83</td>
							  </tr>
							  <tr>
							  	<td>8（复试）</td>
							  </tr>
							  <tr>
							  	<td rowspan="3"><i></i>公共课</td>
							  	<td rowspan="3">一对一</td>
							  	<td>16（政治）</td>
							  	<td>16</td>
							  </tr>
							  <tr>
							  	<td>20（英语）</td>
							  	<td>20</td>
							  </tr>
							  <tr>
							  	<td>20（数学）</td>
							  	<td>20</td>
							  </tr>
							</table>
							<div class="empty"></div>
							<div class="tab_footer">
								<p>集训班收费标准</p>
								<span><i>￥</i>22800</span>
								<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="detail liankao">
			<div class="title">
				<img src="${staticPath }/images/detail/mtitle1.png" alt="">
			</div>
			<div class="sm_title">
				<i></i>
				<h2>致简管理联考班</h2>
			</div>
			<div class="tab" style="padding-bottom:10px">
				<div class="tab_nav clearfix">
					<ul>
						<li class="mactive">管综</li>
						<li>英语二</li>
					</ul>
				</div>
				<div class="tab_list">
					<ul>
						<li>
							<table>
							  <tr>
							    <th><i></i>课程名称</th>
							    <th><i></i>内容</th>
							    <th><i></i>课时</th>
							    <th><i></i>合计</th>
							    <th><i></i>开课时间</th>
							  </tr>
							  <tr>
							    <td rowspan="2"><i></i>导学班</td>
							    <td>数学导学课程</td>
							    <td rowspan="2">40</td>
							    <td rowspan="10">386</td>
							    <td rowspan="2">2018年10-11月</td>
							  </tr>
							  <tr>
							  	<td>逻辑导学课程</td>
							  </tr>
							  <tr>
							    <td rowspan="3"><i></i>基础班</td>
							    <td>数学基础课程</td>
							    <td rowspan="3">80</td>
							    <td rowspan="3">2019年2-6月</td>
							  </tr>
							  <tr>
							  	<td>写作基础课程</td>
							  </tr>
							  <tr>
							  	<td>逻辑基础课程</td>
							  </tr>
							  <tr>
							    <td rowspan="2"><i></i>秋季提高班</td>
							    <td>数学真题讲解</td>
							    <td rowspan="2">32</td>
							    <td rowspan="2">2019年10-11月</td>
							  </tr>
							  <tr>
							  	<td>逻辑真题讲解</td>
							  </tr>
							  <tr>
							    <td rowspan="3"><i></i>管理冲刺预测</td>
							    <td>数学冲刺预测</td>
							    <td rowspan="3">52</td>
							    <td rowspan="3">2019年12月</td>
							  </tr>
							  <tr>
							  	<td>逻辑冲刺预测</td>
							  </tr>
							  <tr>
							  	<td>写作冲刺预测</td>
							  </tr>
							</table>
							<div class="empty"></div>
							<div class="tab_footer">
								<p>集训班收费标准</p>
								<span><i>￥</i>14800</span>
								<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
							</div>
						</li>
						<li>
							<table>
							  <tr>
							    <th><i></i>课程名称</th>
							    <th><i></i>内容</th>
							    <th><i></i>课时</th>
							    <th><i></i>合计</th>
							    <th><i></i>开课时间</th>
							  </tr>
							  <tr>
							    <td rowspan="3"><i></i>导学班</td>
							    <td>考研核心词汇</td>
							    <td rowspan="3">56</td>
							    <td rowspan="14">386</td>
							    <td rowspan="3">2018年9-12月</td>
							  </tr>
							  <tr>
							  	<td>考验语法</td>
							  </tr>
							  <tr>
							  	<td>长难句</td>
							  </tr>
							  <tr>
							    <td rowspan="3"><i></i>寒假集训</td>
							    <td>长难句</td>
							    <td rowspan="3">24</td>
							    <td rowspan="3">2019年寒假</td>
							  </tr>
							  <tr>
							  	<td>基础阅读</td>
							  </tr>
							  <tr>
							  	<td>基础写作</td>
							  </tr>
							  <tr>
							    <td rowspan="2"><i></i>基础班</td>
							    <td>基础写作</td>
							    <td rowspan="2">52</td>
							    <td rowspan="2">2019年2-6月</td>
							  </tr>
							  <tr>
							  	<td>考研英语阅读基础班</td>
							  </tr>
							  <tr>
							    <td rowspan="5"><i></i>冲刺班</td>
							    <td>阅读</td>
							    <td rowspan="5">42</td>
							    <td rowspan="5">2019年9-11月</td>
							  </tr>
							  <tr>
							  	<td>写作</td>
							  </tr>
							  <tr>
							  	<td>新题型</td>
							  </tr>
							  <tr>
							  	<td>翻译</td>
							  </tr>
							  <tr>
							  	<td>完形填空</td>
							  </tr>
							  <tr>
							  	<td><i></i>点题预测班</td>
							  	<td>作文押题班</td>
							  	<td>8</td>
							  	<td>2019年11月</td>
							  </tr>
							</table>
							<div class="empty"></div>
							<div class="tab_footer">
								<p>集训班收费标准</p>
								<span><i>￥</i>14800</span>
								<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="detail shuoshi">
			<div class="title">
				<img src="${staticPath }/images/detail/mtitle1.png" alt="">
			</div>
			<div class="sm_title">
				<i></i>
				<h2>致简法律硕士直通班</h2>
			</div>
			<div class="tab" style="padding-bottom:10px">
				<div class="tab_nav clearfix">
					<ul>
						<li class="mactive">考研政治</li>
						<li>考研英语</li>
						<li>专业课、公共课</li>
					</ul>
				</div>
				<div class="tab_list">
					<ul>
						<li>
							<table>
							  <tr>
							    <th><i></i>课程名称</th>
							    <th><i></i>课时</th>
							    <th><i></i>总课时</th>
							    <th><i></i>开课时间</th>
							  </tr>
							  <tr>
							    <td><i></i>导学班</td>
							    <td>8</td>
							    <td rowspan="4">104</td>
							    <td rowspan="2">2019年3-6月</td>
							  </tr>	
							  <tr>
							    <td>基础班</td>
							    <td>24</td>
							  </tr>	
							  <tr>
							    <td><i></i>冲刺班</td>
							    <td>64</td>
							    <td>2018年9-11月</td>
							  </tr>
							  <tr>
							    <td><i></i>点题预测班</td>
							    <td>8</td>
							    <td>2018年12月</td>
							  </tr>	
							</table>
							<div class="empty"></div>
							<div class="tab_footer">
								<p>集训班收费标准</p>
								<span><i>￥</i>14800</span>
								<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
							</div>
						</li>
						<li>
							<table>
							  <tr>
							    <th><i></i>课程名称</th>
							    <th><i></i>课时</th>
							    <th><i></i>总课时</th>
							    <th><i></i>开课时间</th>
							  </tr>
							  <tr>
							    <td><i></i>基础班</td>
							    <td>212</td>
							    <td rowspan="3">286</td>
							    <td>2019年3-6月</td>
							  </tr>	
							  <tr>
							    <td><i></i>冲刺班</td>
							    <td>66</td>
							    <td>2019年9-10月</td>
							  </tr>	
							  <tr>
							    <td><i></i>点题预测班</td>
							    <td>8</td>
							    <td>2019年12月</td>
							  </tr>
							</table>
							<div class="empty"></div>
							<div class="tab_footer">
								<p>集训班收费标准</p>
								<span><i>￥</i>14800</span>
								<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
							</div>
						</li>
						<li>
							<table>
							  <tr>
							    <th colspan="2"><i></i>课程名称</th>
							    <th><i></i>课时</th>
							    <th><i></i>总课时</th>
							    <th><i></i>开课时间</th>
							  </tr>
							  <tr>
							    <td rowspan="2"><i></i>专业课</td>
							    <td>初试</td>
							    <td>104</td>
							    <td rowspan="2">132</td>
							    <td rowspan="4">协商制定</td>
							  </tr>
							  <tr>
							  	<td>复试</td>
							  	<td>28</td>
							  </tr>
							  <tr>
							  	<td rowspan="2"><i></i>公共课</td>
							  	<td rowspan="2">一对一</td>
							  	<td>24（政治）</td>
							  	<td rowspan="2">56</td>
							  </tr>
							  <tr>
							  	<td>32（英语）</td>
							  </tr>
							</table>
							<div class="empty"></div>
							<div class="tab_footer">
								<p>集训班收费标准</p>
								<span><i>￥</i>14800</span>
								<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4">立即咨询</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="orgnize">
			<div class="title"><img src="${staticPath }/images/detail/mtitle2.png" alt=""></div>
			<div class="org_list">
				<table>
					<tr>
						<th>考研课程</th>
						<th>致简考研在线</th>
						<th>其它机构<span>(其它面授小机构、录像班、天价VIP班等)</span></th>
					</tr>
					<tr>
						<td>师资实力</td>
						<td>业内严选师资团队</td>
						<td>师资不明或师资水平参差不齐</td>
					</tr>
					<tr>
						<td>授课形式</td>
						<td>高清录播+互动直播，实时更新</td>
						<td>线下课程翻录，躁音明显，画面质量差，听不清老师讲课</td>
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
						<td>致简考研官方网络品牌</td>
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
	</div>
	<div class="mteacher">
		<div class="title">
			<img src="${staticPath }/images/detail/mtitle3.png" alt="">
		</div>
		<a href="javascript:;"><img src="${staticPath }/images/detail/sm_banner2.png" height="100%" width="100%" alt=""></a>
		<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="banner_footer"><img src="${staticPath }/images/detail/mbanner_footer.png" alt=""></a>
	</div>
	<jsp:include page="/web/to/footer"></jsp:include>
<script src="${staticPath }/js/jquery.min.js"></script>
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
					"name":"致简管理联考班"
				}
				,
				{
					"id":17,
					"name":"致简法律硕士直通班"
				}
			]
</script>
<script>
$(function(){
    var num = GetQueryString("type")-1;
	var text=json[num].name;
    $('.nav_detail p.course').html(text);
    $('.nav_detail p.classes').html('致简精品全程班');

    if (num==12) {
    	$('.detail').eq(0).show();
    	console.log(12)
    };
    if (num==13) {
    	$('.detail').eq(1).show();
    	console.log(13)
    };
 	if (num==14) {
    	$('.detail').eq(2).show();
    };
    if (num==15) {
    	$('.detail').eq(3).show();
    };
    if (num==16) {
    	$('.detail').eq(4).show();
    };
	$('.detail').each(function(index) {
		$('.detail:eq('+index+') .tab_list li').eq(0).show().siblings('li').hide();
	});
	$('.detail .tab_nav li').click(function(){
		var idx=$(this).index();
		$(this).addClass('mactive').siblings().removeClass('mactive');
		$(this).parent().parent('.tab_nav').siblings('.tab_list').find('li').eq(idx).show().siblings('li').hide();
	})
	$('.detail .tab_nav li').eq(0).trigger('click');
	$(".default").show();
	$(".active").hide();
})	
	function GetQueryString(name) {     
	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");     
	    var r = window.location.search.substr(1).match(reg);     
	    if (r != null) return  unescape(r[2]);
	    return null;
	}
</script>
</body>
</html>

