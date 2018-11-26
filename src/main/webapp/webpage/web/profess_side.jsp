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
	<link rel="stylesheet" href="${staticPath}/css/swiper.css">
	<script src="${staticPath}/js/jquery.min.js"></script>
</head>
<body>
	<div class="content_right clearfix">
		<div class="major_right_top">
			<div class="swiper-container">
			    <div class="swiper-wrapper">
			      <div class="swiper-slide">
			      	<a href="javascript:;">
			      		<img src="${staticPath}/images/major_banner1.png" height="328" width="341" alt="">
			      		<div class="mask">
			      			<h3>秋季冲刺</h3>
			      		</div>
			      	</a>
			      </div>
			      <div class="swiper-slide">
			      	<a href="javascript:;">
			      		<img src="${staticPath}/images/major_banner1.png" height="328" width="341" alt="">
			      		<div class="mask">
			      			<h3>秋季冲刺</h3>
			      		</div>
			      	</a>
			      </div>
			      <div class="swiper-slide">
			      	<a href="javascript:;">
			      		<img src="${staticPath}/images/major_banner1.png" height="328" width="341" alt="">
			      		<div class="mask">
			      			<h3>秋季冲刺</h3>
			      		</div>
			      	</a>
			      </div>
			    </div>
			    <!-- Add Pagination -->
			   <div class="swiper-pagination"></div>
			</div>
		</div>
		<div class="major_right_mark clearfix">
			<ul>
				<li>
					<a href="${basePath}/web/zjkyarticle?categoryid=A04A01A01">常识须知</a>
				</li>
				<li>
					<a href="${basePath}/web/zjkyschool">院校选择</a>
				</li>
				<li>
					<a href="${basePath}/web/zjkyarticle?categoryid=A04A09">考研真题</a>
				</li>
				<li>
					<a href="${basePath}/web/zjkyarticle?categoryid=A04A01A02">备考要点</a>
				</li>
				<li>
					<a href="${basePath}/web/zjkymajor">选择专业</a>
				</li>
				<li>
					<a href="${basePath}/web/zjkyarticle?categoryid=A04A02A01">复习指南</a>
				</li>
			</ul>
		</div>
		<div class="major_right_gongnue clearfix">
			<div class="title">
				<h3>考研攻略</h3>
			</div>
			<ul>
				<c:forEach items="${kyglArticle}" var="article">
					<li><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }"><i></i>${article[1] }</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="major_right_gongnue clearfix">
			<div class="title">
				<h3>2019年考研及课程辅导咨询预约</h3>
			</div>
			<div class="refer_form">
				<div class="user_name">
					<i></i>姓名：<input type="text" class="name" id="name">
				</div>
				<div class="user_phone">
					<i></i>手机：<input type="text" class="phone" id="phone">
				</div>
				<div class="user_type">
					<i></i>考生类型：
					<select class="type">
					  <option value ="">选择类型</option>
					  <option value ="daerzaidu">大二在读</option>
					  <option value ="dasanzaidu">大三在读</option>
					  <option value ="dasizaidu">大四在读</option>
					  <option value ="zaizhirenyuan">在职人员</option>
					  <option value ="qita">其他</option>
					</select>
				</div>
				<div class="user_major">
					<i></i>报考专业：<input type="text" class="major">
				</div>
				<a href="javascript:;" class="refer_form_btn">点击提交</a>
			</div>
		</div>
		<div class="major_right_peihang clearfix">
			<div class="title">
				<h3>大学排行榜</h3>
			</div>
			<ul>
				<c:forEach items="${dxphbArticle}" var="article">
					<li><a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }"><i></i>${article[1] }</a></li>
				</c:forEach>
			</ul>
			<a href="${basePath}/web/zjkyarticle?categoryid=A04A01A04" class="peihang_form_btn">查看更多榜单</a>
		</div>
	</div>			
	<script src="${staticPath}/js/swiper.min.js"></script>
	<script src="${staticPath}/layer/layer.js"></script>
	<script type="text/javascript">
		var swiper = new Swiper('.swiper-container', {
			autoplay:true,
			loop: true,
	     	pagination: {
	        	el: '.swiper-pagination',
	      	},
	    });
		$(function(){
			$('.refer_form_btn').click(function() {
				var name = $('.refer_form .name').val();
				var phone = $('.refer_form .phone').val();
				if (name == '') {
					layer.msg("请输入正确的姓名");
					return false;
				};
				if (phone == '' || !/^(1[3578]\d|14[57])[0-9]{8}$/.test(phone)) {
					layer.msg("请输入正确的电话号码");
					return false;
				};
				
				var userType = $(".refer_form select:first").val();
				if (userType == '') {
					layer.msg("请选择考生类型");
					return false;
				}
				var major = $(".refer_form .major").val();
				if (major == '') {
					layer.msg("请输入报考专业");
					return false;
				}
				
				var form = new FormData();
				form.append("name",name);
				form.append("phone",phone);
				form.append("userType",userType);
				form.append("major",major);
				$.ajax({
	                url:"${basePath}/web/reserve/save",
	                type:"post",
	                data:form,
	                dataType: "json",
	                processData:false,
	                contentType:false,
	                success:function(data){
	                	if (data.success) {
	                        layer.msg(data.msg);
	                        $(".refer_form input").val("");
	                        $(".refer_form select option:first").prop("selected", 'selected');  	
	                    }
	                }
				});
				
			});
		});	
</script>
</body>
</html>

