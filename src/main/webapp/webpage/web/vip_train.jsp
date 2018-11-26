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
	<link rel="stylesheet" href="${staticPath }/css/vip_train.css">
</head>
<body>
	<jsp:include page="/web/header?hasNav=true"></jsp:include>
	<a href="javascript:;" class="banner"><img src="${staticPath }/images/vip-banner.png" height="auto" width="100%" alt=""></a>
	<div class="sm_banner">
		<div class="title">
			<h3>冲刺黄金期，你有高效备考计划吗？</h3>
			<h4>你是否也有同样的苦恼？</h4>
		</div>
		<div class="list">
			<ul class="list_left">
				<li>
					<a href="javascript:;">看不懂</a>
				</li>
				<li>
					<a href="javascript:;">难自律</a>
				</li>
				<li>
					<a href="javascript:;">无规划</a>
				</li>
			</ul>
			<ul class="list_right">
				<li>
					<a href="javascript:;">缺答疑</a>
				</li>
				<li>
					<a href="javascript:;">效率低</a>
				</li>
				<li>
					<a href="javascript:;">记不住</a>
				</li>
			</ul>
			<img src="${staticPath }/images/sm_banner_center.png" height="556" width="630" alt="">
		</div>
		<p>致简考研个性化课程，梳理知识体系，夯实基础强化提升，精解答题技巧</p>
		<a href="javascript:;" class="sm_banner_btn">点击了解详情</a>
	</div>
	<div class="content">
		<div class="detail texun">
			<div class="title">
				<img src="${staticPath }/images/mtitle1.png" alt="">
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
		<div class="orgnize">
			<div class="title"><img src="${staticPath }/images/mtitle2.png" alt=""></div>
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
			<img src="${staticPath }/images/mtitle3.png" alt="">
		</div>
		<a href="javascript:;"><img src="${staticPath }/images/sm_banner2.png" height="100%" width="100%" alt=""></a>
		<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" class="banner_footer"><img src="${staticPath }/images/mbanner_footer.png" alt=""></a>
	</div>
	<jsp:include page="/web/to/footer"></jsp:include>
<script src="${staticPath }/js/jquery.min.js"></script>
<script>
$(function(){
	$(".nav li").eq(2).addClass('on');
	
	$('.detail .tab_nav li').click(function(){
		var idx=$(this).index();
		$(this).addClass('mactive').siblings().removeClass('mactive');
		$(this).parent().parent('.tab_nav').siblings('.tab_list').find('li').eq(idx).show().siblings('li').hide();
	})
	$('.detail .tab_nav li').eq(0).trigger('click');
});
</script>
</body>
</html>

