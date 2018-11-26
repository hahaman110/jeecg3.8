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
	<link rel="stylesheet" href="${staticPath }/css/public.css">
	<link rel="stylesheet" href="${staticPath }/css/professional.css">
	<link rel="stylesheet" href="${staticPath }/css/schools_detail.css">
	<script src="${staticPath }/js/jquery.min.js"></script>
</head>
<body>
	<div class="schools_right clearfix">
		<img src="${staticPath }/images/page_core.png" height="39" width="37" alt="" class="page_core">
		<div class="schools_right_txt">
			<p>研究生院网址：http://yz.tsinghua.edu.cn/</p>
			<p>联系电话：010-62782192</p>
			<p>联系邮箱：yjszb@mail.tsinghua.edu.cn</p>
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
					<em></em>
				</div>
				<div class="user_major">
					<i></i>报考专业：<input type="text" class="major">
				</div>
				<a href="javascript:;" class="refer_form_btn">点击提交</a>
			</div>
		</div>
		<a href="javascript:;"><img src="${staticPath }/images/side_qrcode2.png" height="182" width="341" alt="" class="side_qrcode"></a>
	</div>
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

