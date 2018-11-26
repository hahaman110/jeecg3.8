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
	<link rel="stylesheet" href="${staticPath }/css/article.css">
	<script src="${staticPath }/js/jquery.min.js"></script>
</head>
<body>
		<div class="content_right">
			<div class="counsel">
				<div class="title">
					<h3>辅导课程</h3>
				</div>
				<div class="counsel_list clearfix">
					<ul class="counsel_list_ul"> 
						<li><a href="javascript:;">高收入”专业：金融学高收入”专业高收入”专业高收入”专业高收入”专业</a></li>
						<li><a href="javascript:;">高收入”专业：金融学</a></li>
						<li><a href="javascript:;">高收入”专业：金融学</a></li>
						<li><a href="javascript:;">高收入”专业：金融学</a></li>
						<li><a href="javascript:;">高收入”专业：金融学</a></li>
						<li><a href="javascript:;">高收入”专业：金融学</a></li>
						<li><a href="javascript:;">高收入”专业：金融学</a></li>
						<li><a href="javascript:;">高收入”专业：金融学</a></li>
					</ul>
				</div>
				<img src="${staticPath }/images/side_qrcode.png" height="149" width="242" alt="">
			</div>
			<div class="counsel refer">
				<div class="title">
					<h3>2019年考研及课程辅导咨询预约</h3>
				</div>
				<div class="refer_form">
					<div class="user_name">
						姓名：<input type="text" class="name" id="name">
					</div>
					<div class="user_phone">
						手机：<input type="text" class="phone" id="phone">
					</div>
					<div class="user_type">
						考生类型：
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
						报考专业：<input type="text" class="major">
					</div>
					<a href="javascript:;" class="refer_form_btn">点击提交</a>
				</div>
			</div>
			<div class="news">
				<div class="title clearfix">
					<ul>
						<li class="test_center_on"><a href="javascript:;">热门推荐</a></li>
						<li><a href="javascript:;">最新资讯</a></li>
					</ul>
				</div>
				<div class="content_right_list">
					<ul class="clearfix article_news_ul">
						<c:forEach items="${rmtjArticle}" var="article">
							<li>
								<a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" target="_blank">
									<img src="${basePath}${article[1] }" height="65" width="65" alt="">
									<div class="txt txt_detail">
										<p>${article[2] }</p>
										<span><fmt:formatDate value="${article[3] }" pattern="yyyy-MM-dd" /></span>
									</div>
								</a>							
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="content_right_list">
					<ul class="clearfix article_right_news">
						<c:forEach items="${zxzxArticle}" var="article">
							<li>
								<i></i>
								<div class="txt">
									<a href="${basePath}/web/zjkyarticle/article_detail/${article[0] }" class="txt_hot" target="_blank">${article[1] }</a>
								</div>
							</li>
						</c:forEach>
					</ul>
					<a href="${basePath}/web/zjkyarticle" class="panel_btn">查看完整名单</a>
				</div>
			</div>
		</div>
	<script>
		$(".news .title li").eq(0).addClass('test_center_on').siblings('li').removeClass('test_center_on');
			$(".news .content_right_list").eq(0).show().siblings('.content_right_list').hide();
			$(".news .title li").mouseenter(function(){
				var idx=$(this).index();
				$(this).addClass('test_center_on').siblings('li').removeClass('test_center_on');
				$('.news .content_right_list').eq(idx).show().siblings('.content_right_list').hide();
			})
	</script>
	<script src="${staticPath }/layer/layer.js"></script>
	<script type="text/javascript">
		$(function(){
			$('.refer_form_btn').click(function() {
				var name = $('#name').val();
				var phone = $('#phone').val();
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

