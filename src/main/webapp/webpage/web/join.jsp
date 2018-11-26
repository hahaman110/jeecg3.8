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
	<link rel="stylesheet" href="${staticPath }/css/join.css">
	<link rel="shortcut icon" href="${staticPath }/images/logoico.ico">
</head>
<body>
	<div class="join_nav">
		<div class="top clearfix">
			<div class="container">
				<div class="join_logo">
					<a href="javascript:;"><img src="${staticPath }/images/pages/join_logo.png" height="38" width="156" alt=""></a>
				</div>
				<div class="center_nav">
					<ul>
						<li><a href="${basePath}/web/index.html">致简首页</a></li>
						<li><a href="${basePath}/web/zjkyarticle?categoryid=A04A01A01">常识须知</a></li>
						<li><a href="${basePath}/web/zjkyschool.html">院校选择</a></li>
						<li><a href="${basePath}/web/zjkyarticle?categoryid=A04A09">考研真题</a></li>
						<li><a href="${basePath}/web/zjkyarticle?categoryid=A04A03">备考要点</a></li>
						<li><a href="${basePath}/web/zjkymajor.html">选择专业</a></li>
						<li><a href="${basePath}/web/zjkyarticle?categoryid=A04A02">复习指南</a></li>
					</ul>
				</div>
				<div class="right_server">
					<img src="${staticPath }/images/pages/join_call.png" height="22" width="22" alt="">
					<p>加盟热线： 400-0612-232</p>
				</div>
			</div>
		</div>
		<div class="join_form">
			<div class="right">
				<h3>致简考研加盟申请</h3>
				<div class="form">
					<ul class="clearfix">
						<li>
							<i></i>
							<input type="text" placeholder="请输入您的姓名" id="name">
						</li>
						<li>
							<i></i>
							<input type="text" placeholder="请输入您的电话" id="phone">
						</li>
						<li>
							<i></i>
							<input type="text" placeholder="输入您要加盟的城市" id="city">
						</li>
					</ul>
				</div>
				<a href="javascript:;" class="join_btn">立即申请</a>
			</div>
		</div>
	</div>
	<div class="about_us">
		<div class="container">
			<div class="title">
				<h3>关于致简</h3>
				<span></span>
			</div>
			<p><em>致简考研教育，</em>是一家专注于考研培训领域的教育公司。自2002年成立至今，跨考教育已在全国创立 <i>9</i>个全日制教学基地，<i>100 </i>余个加盟分校，拥有行业优秀的<i>80</i> 多位考研全职教师，<i> 100 </i>多位择校择专业资深咨询顾问，<i></i>余位高素质教学服务保障团队，<i>800 </i>多名考研各界状元的辅导顾问团队，累计服务学员超过20万，成为考研学子心中考研辅导的择优之选。</p>
			<div class="txt">
				<ul>
					<li>
						<div class="num">25416</div>
						<div class="type">
							<div class="img_icon">
								<i></i>
								<span></span>
         						<span></span>
							</div>
						视频数量</div>
					</li>
					<li>
						<div class="num">168</div>
						<div class="type">
							<div class="img_icon">
								<i></i>
								<span></span>
         						<span></span>
							</div>
						讲师数量</div>
					</li>
					<li>
						<div class="num">65248</div>
						<div class="type">
							<div class="img_icon">
								<i></i>
								<span></span>
         						<span></span>
							</div>
						用户人数</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="branch_schools">
            <div class="container">
                  <div class="title">
                        <h3>加盟分校</h3>
                        <span></span>
                  </div>
                  <div class="tab_nav clearfix">
                        <ul>
                              <li class="on"><a href="javascript:;">衡阳校区</a></li>
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
                  <div class="tab_box clearfix">
                        <ul>
                              <li class="clearfix">
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center10.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>衡阳校区</h3>
                                                <p>地址：衡阳师范学院东校区体育中心1号出口往南5米</p>
                                                <p>电话：0734-8151306</p>
                                          </div>
                                    </a>
                              </li>
                        </ul>
                  </div>
                  <div class="tab_box clearfix">
                        <ul>
                              <li class="clearfix">
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center1.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>长沙校区</h3>
                                                <p>地址：长沙市天心区侯家塘芙蓉中路359号佳天国际大巴北栋26楼ABC</p>
                                                <p>电话：0731-82856575</p>
                                          </div>
                                    </a>
                              </li>
                              <li class="clearfix">
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center2.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>长沙校区-全民学习网</h3>
                                                <p>地址：长沙市天心区侯家塘芙蓉中路359号佳天国际大巴北栋26楼EH</p>
                                                <p>电话：0731-82961653</p>
                                          </div>
                                    </a>
                              </li>
                        </ul>
                  </div>
                  <div class="tab_box clearfix">
                        <ul>
                              <li class="clearfix">
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center3.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>广州校区</h3>
                                                <p>地址：广州市天河区广园东路时代新世界北塔2907室</p>
                                                <p>电话：020-62993153</p>
                                          </div>
                                    </a>
                              </li>
                        </ul>
                  </div>
                  <div class="tab_box clearfix">
                        <ul>
                              <li class="clearfix">
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center4.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>深圳校区</h3>
                                                <p>地址：深圳市罗湖区布吉路1021号天乐大厦1706-07号</p>
                                                <p>电话：0755-32810190</p>
                                          </div>
                                    </a>
                              </li>
                        </ul>
                  </div>
                  <div class="tab_box clearfix">
                        <ul>
                              <li class="clearfix">
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center5.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>上海校区</h3>
                                                <p>地址：上海市杨浦区黄兴路122号光大信诚大厦14楼1408室</p>
                                                <p>电话：021-68370902</p>
                                          </div>
                                    </a>
                              </li>
                              <li class="clearfix">
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center6.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>上海校区</h3>
                                                <p>地址：上海市浦东新区浦东南路华融大厦2003-2006室</p>
                                                <p>电话：021-68370902</p>
                                          </div>
                                    </a>
                              </li>
                        </ul>
                  </div>
                  <div class="tab_box clearfix">
                        <ul>
                              <li class="clearfix">
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center7.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>南通校区</h3>
                                                <p>地址：南通市崇川区段家坝路129号工人业余大学2号楼205</p>
                                                <p>电话：15575156179</p>
                                          </div>
                                    </a>
                              </li>
                        </ul>
                  </div>
                  <div class="tab_box clearfix">
                        <ul>
                              <li class="clearfix">
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center8.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>武汉校区</h3>
                                                <p>地址：武汉市东湖高新区光谷大道现代光谷世贸中心三期F栋13层1305-1306室</p>
                                                <p>电话：027-86951388</p>
                                          </div>
                                    </a>
                              </li>
                        </ul>
                  </div>
                  <div class="tab_box clearfix">
                        <ul>
                              <li class="clearfix">
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center9.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>无锡校区</h3>
                                                <p>地址：无锡市南长区清扬路113号恒威大厦1301</p>
                                                <p>电话：15151533013</p>
                                          </div>
                                    </a>
                              </li>
                        </ul>
                  </div>
                  <div class="tab_box clearfix">
                        <ul>
                              <li class="clearfix">
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center11.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>成都校区</h3>
                                                <p>地址：四川省成都青羊区光华街道青羊区西环广场1栋</p>
                                                <p>电话：19950377350</p>
                                          </div>
                                    </a>
                              </li>
                        </ul>
                  </div>                  
            </div>
      </div>
	<div class="join_state">
		<div class="container">
			<div class="title">
				<h3>加盟动态</h3>
				<span></span>
			</div>
			<div class="join_state_list clearfix">
				<ul>
					<c:forEach items="${jmdtArticle}" var="article" varStatus="st">
					<li>
						<a href="${basePath}/web/zjkyarticle/article_detail/${article[0]}">
							<img src="${basePath}${article[2]}" height="210" width="360" alt="">
							<h3>${article[1]}</h3>
						</a>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="join_path">
		<div class="container">
			<div class="title">
				<h3>加盟支持及流程</h3>
				<span></span>
			</div>
			<div class="path_list clearfix">
				<ul>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/join_path1.png" height="52" width="52" alt="">
							<div class="txt">
								<h3>01</h3>
								<p>共享品牌资源</p>
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/join_path2.png" height="52" width="52" alt="">
							<div class="txt">
								<h3>02</h3>
								<p>名师及宣讲师的面授及培训支持</p>
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/join_path3.png" height="52" width="52" alt="">
							<div class="txt">
								<h3>03</h3>
								<p>考研全程高清视频课件</p>
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/join_path4.png" height="52" width="52" alt="">
							<div class="txt">
								<h3>04</h3>
								<p>移动化学习系统管理平台</p>
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/join_path5.png" height="52" width="52" alt="">
							<div class="txt">
								<h3>05</h3>
								<p>业务知识培训及交流、学习系统平台</p>
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/join_path6.png" height="52" width="52" alt="">
							<div class="txt">
								<h3>06</h3>
								<p>行之有效的营销运营方案</p>
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/join_path7.png" height="52" width="52" alt="">
							<div class="txt">
								<h3>07</h3>
								<p>分校独立网站建设与维护</p>
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/join_path8.png" height="52" width="52" alt="">
							<div class="txt">
								<h3>08</h3>
								<p>全方位推广宣传</p>
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/join_path9.png" height="52" width="52" alt="">
							<div class="txt">
								<h3>09</h3>
								<p>各分校就近推送及联动合作</p>
							</div>
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/join_path10.png" height="52" width="52" alt="">
							<div class="txt">
								<h3>10</h3>
								<p>专业的招生运营团队全程指导</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="process">
		<div class="container">
			<div class="process_list clearfix">
				<ul>
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/process1.png" height="57" width="59" alt="">
							<div class="txt">
								<h3>01.在线申请</h3>
								<p>填写基本</p>
								<p>信息在线申请加盟</p>
							</div>							
						</a>
					</li>
					<img src="${staticPath }/images/pages/process_icon.png" height="47" width="32" alt="" class="process_icon">
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/process2.png" height="57" width="59" alt="">
							<div class="txt">
								<h3>02.信息审核</h3>
								<p>审核申请人信息，24</p>
								<p>小时内跨考总部与申请人联络</p>
							</div>
						</a>
					</li>
					<img src="${staticPath }/images/pages/process_icon.png" height="47" width="32" alt="" class="process_icon">
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/process3.png" height="57" width="59" alt="">
							<div class="txt">
								<h3>03.考察筛选</h3>
								<p>跨考总部考察申请人</p>
								<p>各方面条件是否具备</p>
							</div>
						</a>
					</li>
					<img src="${staticPath }/images/pages/process_icon.png" height="47" width="32" alt="" class="process_icon">
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/process4.png" height="57" width="59" alt="">
							<div class="txt">
								<h3>04.签署协议</h3>
								<p>考察审核无误后</p>
								<p>正式签署协议</p>
							</div>
						</a>
					</li>
					<img src="${staticPath }/images/pages/process_icon.png" height="47" width="32" alt="" class="process_icon">
					<li>
						<a href="javascript:;">
							<img src="${staticPath }/images/pages/process5.png" height="57" width="59" alt="">
							<div class="txt">
								<h3>05.授权</h3>
								<h3>并开始运作</h3>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="/web/to/footer"></jsp:include>
<script src="${staticPath }/js/jquery.min.js"></script>
<script src="${staticPath }/layer/layer.js"></script>
<script>
$(function(){
	$(".branch_schools .tab_nav li").eq(0).addClass('on').siblings('li').removeClass('on');
	$(".branch_schools .tab_box").eq(0).addClass('on').siblings('.tab_box').removeClass('on');
	$(".branch_schools .tab_nav li").click(function() {
		var idx=$(this).index();
		$(this).addClass('on').siblings('li').removeClass('on');
		$(".branch_schools .tab_box").eq(idx).addClass('on').siblings('.tab_box').removeClass('on');
	});
	$('.join_btn').click(function() {
		var name = $('.join_form li input:eq(0)').val();
		var phone = $('.join_form li input:eq(1)').val();
		var province = $('.join_form li input:eq(2)').val();
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
		var form = new FormData();
		form.append("name",name);
		form.append("phone",phone);
		form.append("province",province);
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
                       $(".join_form li input").val("");
                   }
               }
			});
	});

});
</script>
</body>
</html>

