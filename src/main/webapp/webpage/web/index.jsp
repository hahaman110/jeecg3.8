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
	<link rel="stylesheet" href="${staticPath }/css/index.css">
	<link rel="stylesheet" href="${staticPath }/css/swiper.css">
	<script src="${staticPath }/js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/web/header?hasNav=true"></jsp:include>
	<div class="banner">
		<div class="swiper-container">
	    <div class="swiper-wrapper">
      	<div class="swiper-slide">
      		<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" target="_blank"><img src="${staticPath }/images/banner2.png" height="360" width="100%" alt=""></a>
      	</div>
      	<div class="swiper-slide">
      		<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" target="_blank"><img src="${staticPath }/images/banner1.png" height="360" width="100%" alt=""></a>
      	</div>
      	<div class="swiper-slide">
      		<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" target="_blank"><img src="${staticPath }/images/banner3.png" height="360" width="100%" alt=""></a>
      	</div>
      	<div class="swiper-slide">
      		<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" target="_blank"><img src="${staticPath }/images/banner4.png" height="360" width="100%" alt=""></a>
      	</div>
      </div>
	    <!-- Add Pagination -->
	    <div class="swiper-pagination"></div>
	    <!-- Add Arrows -->
	    <div class="swiper-button-prev"><img src="${staticPath }/images/prev_icon1.png" height="36" width="36" alt=""></div>
	    <div class="swiper-button-next"><img src="${staticPath }/images/next_icon1.png" height="36" width="36" alt=""></div>
		</div>
		<div class="container">
			<div class="side_bar">
				<ul>
					<li>
						<a href="${basePath}/web/zjkymajor.html" class="side_classify"><img src="${staticPath}/images/side_icon01.png" alt="">找专业</a>
						<div class="side_content">
							<c:forEach items="${majorkindTg.TSTypes}" var="tstype">
								<a href="${basePath}/web/zjkymajor?kind=${tstype.typecode }" target="_blank">${tstype.typename }</a>
							</c:forEach>
							<a href="${basePath}/web/zjkymajor.html" target="_blank">更多>></a>
							<img src="${staticPath}/images/qrcode.png" height="258" width="256" alt="">
						</div>
					</li>
					<li>
						<a href="${basePath}/web/zjkyschool.html" class="side_classify"><img src="${staticPath}/images/side_icon02.png" alt="">找学校</a>
						<div class="side_content">
							<c:forEach items="${schoolsBy211985List}" var="sc">
								<a href="${basePath}/web/zjkyschool/detail/schools_detail/${sc[0]}" target="_blank">${sc[1] }</a>	
							</c:forEach>							
							<a href="${basePath}/web/zjkyschool.html" target="_blank">更多>></a>
							<img src="${staticPath}/images/qrcode.png" height="258" width="256" alt="">
						</div>
					</li>
					<li>
						<a href="${basePath}/web/zjkyarticle" class="side_classify"><img src="${staticPath}/images/side_icon03.png" alt="">找信息</a>
						<div class="side_content">
							<c:forEach items="${articleCatogorys}" var="ac">
								<a href="${basePath}/web/zjkyarticle?categoryid=${ac.code}" target="_blank">${ac.name}</a>	
							</c:forEach>
							<img src="${staticPath}/images/qrcode.png" height="258" width="256" alt="">
						</div>
					</li>
					<!-- <li>
						<a href="javascript:;" class="side_classify"><img src="${staticPath}/images/side_icon04.png" alt="">院校库</a>
						<div class="side_content">
							<a href="javascript:;" target="_blank">哲学</a>
							<a href="javascript:;" target="_blank">经济学</a>
							<a href="javascript:;" target="_blank">经济学</a>
							<a href="javascript:;" target="_blank">经济学</a>
							<a href="javascript:;" target="_blank">经济学</a>
							<img src="${staticPath}/images/qrcode.png" height="258" width="256" alt="">
						</div>
					</li> -->
					<li>
						<a href="javascript:;" class="side_classify"><img src="${staticPath}/images/side_icon05.png" alt="">找课程</a>
						<div class="side_content">
							<a href="javascript:;" target="_blank">哲学</a>
							<a href="javascript:;" target="_blank">经济学</a>
							<a href="javascript:;" target="_blank">经济学</a>
							<a href="javascript:;" target="_blank">经济学</a>
							<a href="javascript:;" target="_blank">经济学</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="side_right">
				<p>24小时咨询电话：400 061 2232</p>
				<a href="${basePath}/web/franchise.html" class="invite">
					诚邀加盟
				</a>
				<div class="teacher clearfix">
					<img src="${staticPath}/images/aractor.png" height="50" width="50" alt="">
					<div class="txt">
						<h3>考研名师朱伟来了！</h3>
						<span>2019考研专业课</span>
					</div>
					<a href="javascript:;" class="more_btn">了解课程</a>
				</div>
			</div>
		</div>
	</div>
	<div class="flow container clearfix">
		<a href="${basePath}/web/zjkyschool.html"><img src="${staticPath}/images/1.png" alt=""></a>
		<a href="${basePath}/web/mba_plan.html"><img src="${staticPath}/images/2.png" alt=""></a>
		<a href="${basePath}/web/zjkyarticle?categoryid=A04A08"><img src="${staticPath}/images/4.png" alt=""></a>
		<a href="${basePath}/web/zjkyarticle/article_detail/779"><img src="${staticPath}/images/5.png" alt=""></a>
		<a href="${basePath}/web/zjkyarticle?categoryid=A04A09"><img src="${staticPath}/images/6.png" alt=""></a>
		<a href="${basePath}/web/zjkyarticle?categoryid=A04A02A01"><img src="${staticPath}/images/7.png" alt=""></a>
	</div>
		<div class="course container">
		<div class="title">
			<ul class="clearfix">
				<li class="active"><a href="javascript:;">致简精品全程班</a></li>
				<li><a href="javascript:;">公共课全程班</a></li>
				<li><a href="javascript:;">公共课精品班</a></li>
			</ul>
		</div>
		<div class="course_list course_list1">
			<div class="swiper-container">
			    <div class="swiper-wrapper">
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/banner11.png" height="154" width="220" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>致简集训班</h3>
					      	<p>2019考研</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/banner22.png" height="154" width="220" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>致简密训班</h3>
					      	<p>2019考研</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/banner33.png" height="154" width="220" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>致简特训班</h3>
					      	<p>2019考研</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/banner44.png" height="154" width="220" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>致简管理联考班</h3>
					      	<p>2019考研</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/banner55.png" height="154" width="220" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>致简法律硕士直通班</h3>
					      	<p>2019考研</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			    </div>
			 </div>
		</div>
		<div class="course_list course_list2">
			<div class="swiper-container">
			    <div class="swiper-wrapper">
			      <div class="swiper-slide">
			      	<div class="content">
			      		<img src="${staticPath }/images/whole_course1.png" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>考研政治</h3>
					      	<p>考研政治全程班</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/whole_course2.png" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>考研英语一</h3>
					      	<p>考研英语一全程班</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/whole_course3.png" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>考研英语二</h3>
					      	<p>考研英语二全程班</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/whole_course4.png" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>考研数学一</h3>
					      	<p>考研数学一全程班</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/whole_course5.png" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>考研数学二</h3>
					      	<p>考研数学二全程班</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/whole_course6.png" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>考研数学三</h3>
					      	<p>考研数学三全程班</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			    </div>
			 </div>
			 <!-- Add Pagination -->
			<div class="swiper-button-next"><img src="${staticPath }/images/next_icon.png" height="50" width="16" alt=""></div>
    		<div class="swiper-button-prev"><img src="${staticPath }/images/prev_icon.png" height="50" width="16" alt=""></div>
		</div>
		<div class="course_list course_list3">
			<div class="swiper-container">
			    <div class="swiper-wrapper">
			      <div class="swiper-slide">
			      	<div class="content">
			      		<img src="${staticPath }/images/jinping1.png" height="190" width="270" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>考研政治</h3>
					      	<p>考研政治精品班</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/jinping2.png" height="190" width="270" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>考研英语一</h3>
					      	<p>考研英语一精品班</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/jinping3.png" height="190" width="270" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>考研英语二</h3>
					      	<p>考研英语二精品班</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/jinping4.png" height="190" width="270" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>考研数学一</h3>
					      	<p>考研数学一精品班</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/jinping5.png" height="190" width="270" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>考研数学二</h3>
					      	<p>考研数学二精品班</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<img src="${staticPath }/images/jinping6.png" height="190" width="270" alt="" class="slide_img">
				      	<div class="txt">
					      	<h3>考研数学三</h3>
					      	<p>考研数学三精品班</p>
					      	<a href="javascript:;" class="more_btn">了解更多</a>
				      	</div>
			      	</div>
			      </div>
			    </div>
			 </div>
			 <!-- Add Pagination -->
			<div class="swiper-button-next"><img src="${staticPath }/images/next_icon.png" height="50" width="16" alt=""></div>
    		<div class="swiper-button-prev"><img src="${staticPath }/images/prev_icon.png" height="50" width="16" alt=""></div>
		</div>
	</div>
	<div class="test_center container clearfix">
		<h3>备考中心</h3>
		<div class="content_left">
			<div class="title clearfix">
				<ul>
					<c:forEach items="${bkzxCategory.list}" var="bkzx1">
						<li><a href="${basePath }/web/zjkyarticle?categoryid=${bkzx1.code }" target="_blank">${bkzx1.name }</a></li>	
					</c:forEach>
				</ul>
			</div>
			<c:forEach items="${bkzxCategory.list}" var="bkzx1">
				<div class="test_center_list clearfix">
					<div class="notice_test">
						<p><img src="${staticPath}/images/notice_icon2.png" height="16" width="17" alt="">2019考研政英数高效半年集训，<span>讲练结合全方位提升成绩！</span>
						<a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" target="_blank" class="test_center_more">进入咨询报名</a></p>
					</div>
					<ul>
						<c:forEach items="${bkzx1.list}" var="bkzx2">
							<li>
								<h4>${bkzx2.name }</h4>
								<c:if test="${not empty bkzxlisMap[bkzx2.code] and fn:length(bkzxlisMap[bkzx2.code])>0}">
									<a href="${basePath }/web/zjkyarticle/article_detail/${bkzxlisMap[bkzx2.code][0][0]}"><img src="${bkzxlisMap[bkzx2.code][0][2] }" height="110" width="270" alt=""></a>
								</c:if>
								<dl>
									<c:forEach items="${bkzxlisMap[bkzx2.code]}" var="article">
										<a href="${basePath }/web/zjkyarticle/article_detail/${article[0]}" target="_blank"><dd>${article[1]}</dd></a>
									</c:forEach>			
								</dl>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:forEach>
		</div>
		<div class="content_right">
			<div class="title clearfix">
				<ul>
					<li class="test_center_on"><a href="javascript:;">热门专业</a></li>
					<li><a href="javascript:;">成功学员</a></li>
				</ul>
			</div>
			<div class="content_right_list">
				<ul class="clearfix content_major_list">
					<c:forEach items="${majorsHot}" var="major">
					<li>
						<i></i>
						<div class="txt">
							<a href="javascript:location.href=encodeURI(encodeURI('${basePath}/web/zjkymajor.html?name=${major[1]}'))" class="txt_hot">${major[1]}</a>
						</div>
					</li>
					</c:forEach>
				</ul>
				<a href="${basePath}/web/zjkymajor.html" class="panel_btn">查看完整名单</a>
			</div>
			<div class="content_right_list">
				<ul class="clearfix content_student_list">
					<li>
						<a href="javascript:;"><img src="${staticPath }/images/pages/student11.png" height="65" width="65" alt=""></a>
						<div class="txt txt_detail">
							<h4>贾同学</h4>
							<p>通过专业课私密一对一考入复旦大学国际商务专业<a href="javascript:;"><span>...详情</span></a></p> 
						</div>
					</li>
					<li>
						<a href="javascript:;"><img src="${staticPath }/images/pages/student22.png" height="65" width="65" alt=""></a>
						<div class="txt txt_detail">
							<h4>李同学</h4>
							<p>通过半年集训考入中国人民大学经济学<a href="javascript:;"><span>...详情</span></a></p> 
						</div>
					</li>
					<li>
						<a href="javascript:;"><img src="${staticPath }/images/pages/student33.png" height="65" width="65" alt=""></a>
						<div class="txt txt_detail">
							<h4>王同学</h4>
							<p>通过全年集训浙江大学自动化专业<a href="javascript:;"><span>...详情</span></a></p> 
						</div>
					</li>
					<li>
						<a href="javascript:;"><img src="${staticPath }/images/pages/student44.png" height="65" width="65" alt=""></a>
						<div class="txt txt_detail">
							<h4>付同学</h4>
							<p>通过半年集训保过考入浙江财经大学金融学<a href="javascript:;"><span>...详情</span></a></p> 
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 专业硕士 -->
	<div class="mba_center container clearfix">
		<h3>专业硕士</h3>
		<div class="content_left">
			<div class="title clearfix">
				<ul>
					<c:forEach items="${zyssCategory.list}" var="zyss1">
						<li><a href="${basePath }/web/zjkyarticle?categoryid=${zyss1.code }" target="_blank">${zyss1.name }</a></li>	
					</c:forEach>
				</ul>
			</div>
			<c:forEach items="${zyssCategory.list}" var="zyss1">
			<div class="test_center_list clearfix">
				<div class="notice_test clearfix notice_mba_news">
					<dl class="notice_mba" id="notice_mba">
						<dd><a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" target="_blank"><p>2019${zyss1.name }特训，<span>${zyss1.name }考研密训，轻松晋级名校研究生！</span></p></a></dd>
						<dd><a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" target="_blank"><p>2019${zyss1.name }定向通关班，<span>助你轻松通关！！</span></p></a></dd>
						<dd><a href="https://www5c1.53kf.com/webCompany.php?arg=10175420&kf_sign=TA5OTMTUzNYxNDEwNDY1NjA5OTA0MDA1&style=4" target="_blank"><p>2019${zyss1.name }高效实战全程班，<span> 省心省力 通关式课程模式！</span></p></a></dd>
					</dl>
				</div>
				<ul>
					<c:forEach items="${zyss1.list}" var="zyss2">
						<li>
							<h4>${zyss2.name }</h4>
							<c:if test="${not empty zysslisMap[zyss2.code] and fn:length(zysslisMap[zyss2.code])>0}">
								<a href="${basePath }/web/zjkyarticle/article_detail/${zysslisMap[zyss2.code][0][0] }"><img src="${zysslisMap[zyss2.code][0][2] }" height="110" width="270" alt=""></a>
							</c:if>
							<dl>
								<c:forEach items="${zysslisMap[zyss2.code]}" var="article">
									<a href="${basePath }/web/zjkyarticle/article_detail/${article[0]}" target="_blank"><dd>${article[1]}</dd></a>
								</c:forEach>			
							</dl>
						</li>
					</c:forEach>
				</ul>
			</div>
			</c:forEach>
		</div>
		<div class="content_right">
			<div class="title clearfix">
				<h3>热门院校</h3>
				<a href="${basePath}/web/zjkyschool" class="dot"><i></i><i></i><i></i></a>
			</div>
			<div class="content_right_list">
				<ul class="clearfix">
					<c:forEach items="${schoolsBy211985List}" var="schools" varStatus="st">
					<li>
						<c:set var="indexClass" value=""></c:set>
						<c:if test="${st.index==0}"><c:set var="indexClass" value="first"></c:set></c:if>
						<c:if test="${st.index==1}"><c:set var="indexClass" value="second"></c:set></c:if>
						<c:if test="${st.index==2}"><c:set var="indexClass" value="three"></c:set></c:if>
						<i class="${indexClass }">${st.index+1}</i>
						<div class="txt">
							<a href="${basePath}/web/zjkyschool/detail/schools_detail/${schools[0]}">${schools[1]}</a>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!-- 致简学员 -->
	<div class="student_center container clearfix">
		<h3>致简学员</h3>
		<div class="content_left">
			<div class="title clearfix">
				<ul>
					<li class="test_center_on"><a href="javascript:;">集训营</a></li>
					<li><a href="javascript:;">成功经验</a></li>
				</ul>
			</div>
			<div class="test_center_list clearfix">
				<ul>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/student_train1.png" height="156" width="270" alt="">
							<div class="mask">致简考研集训营现场活动</div>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/student_train2.png" height="156" width="270" alt="">
							<div class="mask">致简考研集训营现场活动</div>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/student_train3.png" height="156" width="270" alt="">
							<div class="mask">致简考研集训营现场活动</div>
						</a>
					</li>
				</ul>
			</div>
			<div class="test_center_list clearfix student_list">
				<ul>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/student1.png" height="65" width="65" alt="">
							<div class="txt">
								<p>张同学</p>
								<p>中南大学</p>
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/student2.png" height="65" width="65" alt="">
							<div class="txt">
								<p>赵同学</p>
								<p>中南林业科技大学</p>
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/student3.png" height="65" width="65" alt="">
							<div class="txt">
								<p>李同学</p>
								<p>长沙理工大学</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="content_right">
			<div class="title clearfix">
				<h3>有致简助力读研不再是梦想</h3>
			</div>
			<div class="txt">
				<p><span>实力： </span>6大研究院、420位全职师资，3200名专业课签约师资！</p>
				<p><span>功绩：  </span>2017年<span>26001</span>名学员成功实现读研梦想，其中<span>1321</span>名学员成功跻身“211”“985”名校，更有<span>5306</span>名学员步入理想学府。</p>
			</div>
		</div>
	</div>
	<!-- 致简分校 -->
	<div class="school_center container clearfix">
		<h3>致简分校</h3>
		<div class="content_left">
			<div class="title clearfix">
				<ul>
					<li class="test_center_on"><a href="javascript:;">衡阳校区</a></li>
					<li><a href="javascript:;">长沙校区</a></li>
					<li><a href="javascript:;">广州校区</a></li>
					<li><a href="javascript:;">深圳校区</a></li>
					<li><a href="javascript:;">上海校区</a></li>
					<li><a href="javascript:;">南通校区</a></li>
					<li><a href="javascript:;">武汉校区</a></li>
					<li><a href="javascript:;">无锡校区</a></li>
					<li><a href="javascript:;">成都校区</a></li>
				</ul>
			</div>
			<div class="test_center_list clearfix">
				<ul>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/school_center9.png" height="230" width="435" alt="">
							<div class="txt">
								<p>致简考研，专为在职人员以及应届、往届毕业生提供考研辅导和培训，涵盖考研公共课、专研专业课、考研集训营、MBA辅导、考研高端辅导、GCT辅导等服务。致简考研汇聚全国考研业界一线名师团队，致力于为广大学员提供丰富、专业、系统的学习课程和教学服务，让学员快速冲刺备考，轻松考取理想院校。</p>
								<p><span>网址： </span>www.zhijianky.com</p>
								<p><span>地点：  </span>衡阳师范学院东校区体育中心1号出口往南5米</p>
								<p><span>联系电话： </span>0734-8151306 </p>
							</div>
						</a>
					</li>
				</ul>
			</div>
			<div class="test_center_list clearfix">
				<ul>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/school_center1.png" height="230" width="435" alt="">
							<div class="txt">
								<p>致简考研，专为在职人员以及应届、往届毕业生提供考研辅导和培训，涵盖考研公共课、专研专业课、考研集训营、MBA辅导、考研高端辅导、GCT辅导等服务。致简考研汇聚全国考研业界一线名师团队，致力于为广大学员提供丰富、专业、系统的学习课程和教学服务，让学员快速冲刺备考，轻松考取理想院校。</p>
								<p><span>网址： </span>www.zhijianky.com</p>
								<p><span>地点：  </span>长沙市天心区侯家塘芙蓉中路359号佳天国际大廈北栋26楼ABC</p>
								<p><span>联系电话： </span>0731-82856575</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
			<div class="test_center_list clearfix">
				<ul>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/school_center2.png" height="230" width="435" alt="">
							<div class="txt">
								<p>致简考研，专为在职人员以及应届、往届毕业生提供考研辅导和培训，涵盖考研公共课、专研专业课、考研集训营、MBA辅导、考研高端辅导、GCT辅导等服务。致简考研汇聚全国考研业界一线名师团队，致力于为广大学员提供丰富、专业、系统的学习课程和教学服务，让学员快速冲刺备考，轻松考取理想院校。</p>
								<p><span>网址： </span>www.zhijianky.com</p>
								<p><span>地点：  </span>广州市天河区广园东路时代新世界北塔2907室</p>
								<p><span>联系电话： </span>020-62993153</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
			<div class="test_center_list clearfix">
				<ul>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/school_center3.png" height="230" width="435" alt="">
							<div class="txt">
								<p>致简考研，专为在职人员以及应届、往届毕业生提供考研辅导和培训，涵盖考研公共课、专研专业课、考研集训营、MBA辅导、考研高端辅导、GCT辅导等服务。致简考研汇聚全国考研业界一线名师团队，致力于为广大学员提供丰富、专业、系统的学习课程和教学服务，让学员快速冲刺备考，轻松考取理想院校。</p>
								<p><span>网址： </span>www.zhijianky.com</p>
								<p><span>地点：  </span>深圳市罗湖区布吉路1021号天乐大厦1706-07号</p>
								<p><span>联系电话： </span>0755-32810190</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
			<div class="test_center_list clearfix">
				<ul>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/school_center4.png" height="230" width="435" alt="">
							<div class="txt">
								<p>致简考研，专为在职人员以及应届、往届毕业生提供考研辅导和培训，涵盖考研公共课、专研专业课、考研集训营、MBA辅导、考研高端辅导、GCT辅导等服务。致简考研汇聚全国考研业界一线名师团队，致力于为广大学员提供丰富、专业、系统的学习课程和教学服务，让学员快速冲刺备考，轻松考取理想院校。</p>
								<p><span>网址： </span>www.zhijianky.com</p>
								<p><span>地点：  </span>上海市浦东新区浦东南路华融大厦2003-2006室</p>
								<p><span>联系电话： </span>021-68370902</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
			<div class="test_center_list clearfix">
				<ul>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/school_center5.png" height="230" width="435" alt="">
							<div class="txt">
								<p>致简考研，专为在职人员以及应届、往届毕业生提供考研辅导和培训，涵盖考研公共课、专研专业课、考研集训营、MBA辅导、考研高端辅导、GCT辅导等服务。致简考研汇聚全国考研业界一线名师团队，致力于为广大学员提供丰富、专业、系统的学习课程和教学服务，让学员快速冲刺备考，轻松考取理想院校。</p>
								<p><span>网址： </span>www.zhijianky.com</p>
								<p><span>地点：  </span>南通市崇川区段家坝路129号工人业余大学2号楼205</p>
								<p><span>联系电话： </span>15575156179</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
			<div class="test_center_list clearfix">
				<ul>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/school_center6.png" height="230" width="435" alt="">
							<div class="txt">
								<p>致简考研，专为在职人员以及应届、往届毕业生提供考研辅导和培训，涵盖考研公共课、专研专业课、考研集训营、MBA辅导、考研高端辅导、GCT辅导等服务。致简考研汇聚全国考研业界一线名师团队，致力于为广大学员提供丰富、专业、系统的学习课程和教学服务，让学员快速冲刺备考，轻松考取理想院校。</p>
								<p><span>网址： </span>www.zhijianky.com</p>
								<p><span>地点：  </span>武汉市东湖高新区光谷大道现代光谷世贸中心三期F栋13层1305-1306室</p>
								<p><span>联系电话： </span>027-86951388</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
			<div class="test_center_list clearfix">
				<ul>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/school_center7.png" height="230" width="435" alt="">
							<div class="txt">
								<p>致简考研，专为在职人员以及应届、往届毕业生提供考研辅导和培训，涵盖考研公共课、专研专业课、考研集训营、MBA辅导、考研高端辅导、GCT辅导等服务。致简考研汇聚全国考研业界一线名师团队，致力于为广大学员提供丰富、专业、系统的学习课程和教学服务，让学员快速冲刺备考，轻松考取理想院校。</p>
								<p><span>网址： </span>www.zhijianky.com</p>
								<p><span>地点：  </span>无锡市南长区清扬路113号恒威大厦1301</p>
								<p><span>联系电话： </span>15151533013</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
			<div class="test_center_list clearfix">
				<ul>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/school_center8.png" height="230" width="435" alt="">
							<div class="txt">
								<p>致简考研，专为在职人员以及应届、往届毕业生提供考研辅导和培训，涵盖考研公共课、专研专业课、考研集训营、MBA辅导、考研高端辅导、GCT辅导等服务。致简考研汇聚全国考研业界一线名师团队，致力于为广大学员提供丰富、专业、系统的学习课程和教学服务，让学员快速冲刺备考，轻松考取理想院校。</p>
								<p><span>网址： </span>www.zhijianky.com</p>
								<p><span>地点：  </span>四川省成都青羊区光华街道青羊区西环广场1栋</p>
								<p><span>联系电话： </span>19950377350</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="content_right">
			<div class="title clearfix">
				<h3>诚邀加盟</h3>
			</div>
			<div class="txt">
				<div class="input_box clearfix">
					<img src="${staticPath }/images/name.png" height="14" width="14" alt="">
					<input type="text" class="user_name" placeholder="输入姓名">
				</div>
				<div class="input_box clearfix">
					<img src="${staticPath }/images/phone.png" height="16" width="10" alt="">
					<input type="text" class="phone" placeholder="输入电话">
				</div>
				<div class="hide_box">
					<div class="input_box clearfix">
						<img src="${staticPath }/images/location_icon1.png" height="16" width="12" alt="">
						<input type="text" class="user_name" placeholder="请输入意向加盟城市及省份">
					</div>
					<div class="input_box clearfix">
						<img src="${staticPath }/images/info_icon1.png" height="16" width="15" alt="">
						<input type="text" class="phone" placeholder="请详细说明您的个人情况">
					</div>
				</div>
				<a href="javascript:;" class="more_btn">点击展开</a>
				<a href="javascript:;" class="submit_btn">提交加盟信息</a>
				<p>目前致简在全国有150家加盟分校，留下联系方式，<span>致简考研老师会在24小时内联系您！</span></p>				
			</div>
		</div>
	</div>
	
	<div class="tips container">
		<div class="top_tab clearfix">
			<ul>
				<li class="on">合作机构</li>
				<li>友情链接</li>
				<li>人才招聘</li>
			</ul>
		</div>
		<div class="tips_list clearfix">
			<ul>
				<li><a href="javascript:;"><img src="${staticPath }/images/jigou1.png" height="51" width="152" alt=""></a></li>
				<li><a href="javascript:;"><img src="${staticPath }/images/jigou2.png" height="51" width="152" alt=""></a></li>
				<li><a href="javascript:;"><img src="${staticPath }/images/jigou3.png" height="51" width="152" alt=""></a></li>
				<li><a href="javascript:;"><img src="${staticPath }/images/jigou4.png" height="51" width="152" alt=""></a></li>
				<li><a href="javascript:;"><img src="${staticPath }/images/jigou5.png" height="51" width="152" alt=""></a></li>
				<li><a href="javascript:;"><img src="${staticPath }/images/jigou6.png" height="51" width="152" alt=""></a></li>
			</ul>
		</div>
		<div class="tips_list clearfix">
			<ul>
				<li><a href="http://www.qmsdjy.com" target="_blank">全铭时代教育</a></li>
				<li><a href="http://www.xysxljy.com" target="_blank">许愿树教育</a></li>
				<li><a href="http://www.sxmdedu.com" target="_blank">书香门第教育</a></li>
				<li><a href="http://www.jsxwjy.com" target="_blank">金色希望教育</a></li>
				<li><a href="http://www.qmlearn.com" target="_blank">全民学习网</a></li>
			</ul>
		</div>
		<div class="tips_list clearfix tips_banner">
			<div class="swiper-container">
			    <div class="swiper-wrapper">
			      <div class="swiper-slide">
			      	<div class="content">
				      	<div class="txt">
					      	<h3>考研政治讲师</h3>
					      	<a href="${basePath}/web/to/teacher_settled.html" class="more_btn">更多>></a>
					      	<p>长沙  |  3年以上经验  |  本科  </p>
					      	<p><span>职位要求：</span>1、本科及以上学历，有教学经验或者突出专项能力者可优先考虑；2、语言表达流畅，具备较强的学习能力和创新能力；</p>
					      	<p><span>工作地址：</span>上海市浦东新区浦东南路1271号华融海市浦东新区浦东南路海市浦东新区浦东南路...</p>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<div class="txt">
					      	<h3>考研数学讲师</h3>
					      	<a href="${basePath}/web/to/teacher_settled.html" class="more_btn">更多>></a>
					      	<p>长沙  |  3年以上经验  |  本科</p>
					      	<p><span>职位要求：</span>1、本科及以上学历，有教学经验或者突出专项能力者可优先考虑；2、语言表达流畅，具备较强的学习能力和创新能力；</p>
					      	<p><span>工作地址：</span>上海市浦东新区浦东南路1271号华融...</p>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<div class="txt">
					      	<h3>考研英语讲师</h3>
					      	<a href="${basePath}/web/to/teacher_settled.html" class="more_btn">更多>></a>
					      	<p>长沙  |  3年以上经验  |  本科</p>
					      	<p><span>职位要求：</span>1、本科及以上学历，有教学经验或者突出专项能力者可优先考虑；2、语言表达流畅，具备较强的学习能力和创新能力；</p>
					      	<p><span>工作地址：</span>上海市浦东新区浦东南路1271号华融...</p>
				      	</div>
			      	</div>
			      </div>
			      <div class="swiper-slide">
			      	<div class="content">
				      	<div class="txt">
					      	<h3>考研政治讲师</h3>
					      	<a href="${basePath}/web/to/teacher_settled.html" class="more_btn">更多>></a>
					      	<p>长沙  |  3年以上经验  |  本科  </p>
					      	<p><span>职位要求：</span>1、本科及以上学历，有教学经验或者突出专项能力者可优先考虑；2、语言表达流畅，具备较强的学习能力和创新能力；</p>
					      	<p><span>工作地址：</span>上海市浦东新区浦东南路1271号华融海市浦东新区浦东南路海市浦东新区浦东南路...</p>
				      	</div>
			      	</div>
			      </div>
			    </div>
			 </div>
		 	<!-- Add Pagination -->
		    <div class="swiper-button-next"><img src="${staticPath }/images/next_icon.png" height="50" width="16" alt=""></div>
			<div class="swiper-button-prev"><img src="${staticPath }/images/prev_icon.png" height="50" width="16" alt=""></div>
		</div>
	</div>
	<jsp:include page="/web/to/footer"></jsp:include>
	<script type="text/javascript" src="${staticPath }/js/scrolltext.js"></script>
	<script src="${staticPath }/js/swiper.min.js"></script>
	<script src="${staticPath }/layer/layer.js"></script>
	<script src="${staticPath }/js/index.js"></script>
	<script>
		if(document.getElementById("notice_mba")){
			var scrollup = new ScrollText("notice_mba");
			scrollup.LineHeight = 60;        
			scrollup.Amount = 1;           
			scrollup.Delay = 15;           
			scrollup.Start();             
			scrollup.Direction = "up"; 
		}
		
		var swiper = new Swiper('.banner .swiper-container', {
	     	pagination: {
	        	el: '.banner .swiper-pagination',
	      	},
	      	navigation: {
		        nextEl: '.banner .swiper-button-next',
		        prevEl: '.banner .swiper-button-prev',
		     },
		    autoplay:true,
			loop: true,
	    });

	    $(".banner").mouseenter(function(){
			$(".banner .swiper-button-next").show();
			$(".banner .swiper-button-prev").show();
		})
		$(".banner").mouseleave(function(){
			$(".banner .swiper-button-next").hide();
			$(".banner .swiper-button-prev").hide();
		})

		var swiper = new Swiper('.course_list .swiper-container', {
	      slidesPerView: 5,
	      spaceBetween: 12,
	      pagination: {
	        el: '.course_list .swiper-pagination',
	        clickable: true,
	      },
	      navigation: {
	        nextEl: '.course_list .swiper-button-next',
	        prevEl: '.course_list .swiper-button-prev',
	      },
	    });
	    var swiper = new Swiper('.tips_list .swiper-container', {
	      slidesPerView: 3.5,
	      spaceBetween: 12,
	      pagination: {
	        el: '.tips_list .swiper-pagination',
	        clickable: true,
	      },
	      navigation: {
	        nextEl: '.tips_list .swiper-button-next',
	        prevEl: '.tips_list .swiper-button-prev',
	      },
	    });
		$(function(){
			$(".nav li").eq(5).addClass('mark');
			
			setInterval(function(){$('.mark').toggleClass('on');},1000)
			
			$(".course .title li").eq(0).addClass('active').siblings('li').removeClass('active');
			$(".course_list").eq(0).show().siblings('.course_list').hide();
			$(".course .title li").mouseenter(function(){
				var idx=$(this).index();
				$(this).addClass('active').siblings('li').removeClass('active');
				$('.course_list').eq(idx).show().siblings('.course_list').hide();
			})
			//备考中心
			$(".test_center .content_left .title li").eq(0).addClass('test_center_on').siblings('li').removeClass('test_center_on');
			$(".test_center .test_center_list").eq(0).show().siblings('.test_center_list').hide();
			$(".test_center .content_left .title li").mouseenter(function(){
				var idx=$(this).index();
				$(this).addClass('test_center_on').siblings('li').removeClass('test_center_on');
				$('.test_center .test_center_list').eq(idx).show().siblings('.test_center_list').hide();
			})

			$(".test_center .content_right .title li").eq(0).addClass('test_center_on').siblings('li').removeClass('test_center_on');
			$(".test_center .content_right_list").eq(0).show().siblings('.content_right_list').hide();
			$(".test_center .content_right .title li").mouseenter(function(){
				var idx=$(this).index();
				$(this).addClass('test_center_on').siblings('li').removeClass('test_center_on');
				$('.test_center .content_right_list').eq(idx).show().siblings('.content_right_list').hide();
			})

			//专业硕士
			$(".mba_center .content_left .title li").eq(0).addClass('test_center_on').siblings('li').removeClass('test_center_on');
			$(".mba_center .test_center_list").eq(0).show().siblings('.test_center_list').hide();
			$(".mba_center .content_left .title li").mouseenter(function(){
				var idx=$(this).index();
				$(this).addClass('test_center_on').siblings('li').removeClass('test_center_on');
				$('.mba_center .test_center_list').eq(idx).show().siblings('.test_center_list').hide();
			})
			//致简学员
			$(".student_center .content_left .title li").eq(0).addClass('test_center_on').siblings('li').removeClass('test_center_on');
			$(".student_center .test_center_list").eq(0).show().siblings('.test_center_list').hide();
			$(".student_center .content_left .title li").mouseenter(function(){
				var idx=$(this).index();
				$(this).addClass('test_center_on').siblings('li').removeClass('test_center_on');
				$('.student_center .test_center_list').eq(idx).show().siblings('.test_center_list').hide();
			})
			//致简分校
			$(".school_center .content_left .title li").eq(0).addClass('test_center_on').siblings('li').removeClass('test_center_on');
			$(".school_center .test_center_list").eq(0).show().siblings('.test_center_list').hide();
			$(".school_center .content_left .title li").mouseenter(function(){
				var idx=$(this).index();
				$(this).addClass('test_center_on').siblings('li').removeClass('test_center_on');
				$('.school_center .test_center_list').eq(idx).show().siblings('.test_center_list').hide();
			})
			//友情链接
			$(".tips .top_tab li").eq(0).addClass('on').siblings('li').removeClass('on');
			$(".tips .tips_list").eq(0).show().siblings('.tips_list').hide();
			$(".tips .top_tab li").mouseenter(function(){
				var idx=$(this).index();
				$(this).addClass('on').siblings('li').removeClass('on');
				$('.tips .tips_list').eq(idx).show().siblings('.tips_list').hide();
			})

			$('.school_center .more_btn').click(function(){
				$(this).hide();
				$(".hide_box").show();
				$(".submit_btn").css("display","block");
			})

			$('.school_center .submit_btn').click(function() {
				var name = $('.input_box .user_name').val();
				var phone = $('.input_box .phone').val();
				if (name == '') {
					layer.msg("请输入正确的姓名");
					return false;
				};
				if (phone == '' || !/^(1[3578]\d|14[57])[0-9]{8}$/.test(phone)) {
					layer.msg("请输入正确的电话号码");
					return false;
				};
			});
			
			
			$('.school_center .submit_btn').click(function() {
				var name = $('.input_box input:eq(0)').val();
				var phone = $('.input_box input:eq(1)').val();
				var province = $('.input_box input:eq(2)').val();
				var detailInfo = $('.input_box input:eq(3)').val();
				if (name == '') {
					layer.msg("请输入正确的姓名");
					return false;
				};
				if (phone == '' || !/^(1[3578]\d|14[57])[0-9]{8}$/.test(phone)) {
					layer.msg("请输入正确的电话号码");
					return false;
				};
				if (province == '') {
					layer.msg("请输入意向加盟城市及省份");
					return false;
				};
				if (detailInfo == '') {
					layer.msg("请详细说明您的个人情况");
					return false;
				};
				
				var form = new FormData();
				form.append("name",name);
				form.append("phone",phone);
				form.append("province",province);
				form.append("detailInfo",detailInfo);
				$.ajax({
	                url:"${basePath}/web/franchise/save",
	                type:"post",
	                data:form,
	                dataType: "json",
	                processData:false,
	                contentType:false,
	                success:function(data){
	                	if (data.success) {
	                        layer.msg(data.msg);
	                        $(".school_center .content_right input").val("");
	                    }
	                }
				});
			});
			
		})
	</script>
</body>
</html>
