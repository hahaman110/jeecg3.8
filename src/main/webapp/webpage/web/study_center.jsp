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
	<div class="banner">
		<a href="javascript:;"><img src="${staticPath }/images/study_center_banner.png" height="360" width="1920" alt=""></a>
	</div>
	<div class="study_list">
            <div class="container">
                  <div class="title">
                        <h3>STUDY CENTER</h3>
                        <h4>学习网点</h4>
                        <i></i>
                  </div>
                  <div class="list">
                        <ul>
                              <li>
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center10.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>衡阳校区</h3>
                                                <p>地址：衡阳师范学院东校区体育中心1号出口往南5米</p>
                                                <p>电话：0734-8151306</p>
                                          </div>
                                    </a>
                              </li>
                              <li>
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center1.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>长沙校区</h3>
                                                <p>地址：长沙市天心区侯家塘芙蓉中路359号佳天国际大巴北栋26楼ABC</p>
                                                <p>电话：0731-82856575</p>
                                          </div>
                                    </a>
                              </li>
                              <li>
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center2.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>长沙校区-全民学习网</h3>
                                                <p>地址：长沙市天心区侯家塘芙蓉中路359号佳天国际大巴北栋26楼EH</p>
                                                <p>电话：0731-82961653</p>
                                          </div>
                                    </a>
                              </li>
                              <li>
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center3.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>广州校区</h3>
                                                <p>地址：广州市天河区广园东路时代新世界北塔2907室</p>
                                                <p>电话：020-62993153</p>
                                          </div>
                                    </a>
                              </li>
                              <li>
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center4.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>深圳校区</h3>
                                                <p>地址：深圳市罗湖区布吉路1021号天乐大厦1706-07号</p>
                                                <p>电话：0755-32810190</p>
                                          </div>
                                    </a>
                              </li>
                              <li>
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center5.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>上海校区</h3>
                                                <p>地址：上海市杨浦区黄兴路122号光大信诚大厦14楼1408室</p>
                                                <p>电话：021-68370902</p>
                                          </div>
                                    </a>
                              </li>
                              <li>
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center6.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>上海校区</h3>
                                                <p>地址：上海市浦东新区浦东南路华融大厦2003-2006室</p>
                                                <p>电话：021-68370902</p>
                                          </div>
                                    </a>
                              </li>
                              <li>
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center7.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>南通校区</h3>
                                                <p>地址：南通市崇川区段家坝路129号工人业余大学2号楼205</p>
                                                <p>电话：15575156179</p>
                                          </div>
                                    </a>
                              </li>
                              <li>
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center8.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>武汉校区</h3>
                                                <p>地址：武汉市东湖高新区光谷大道现代光谷世贸中心三期F栋13层1305-1306室</p>
                                                <p>电话：027-86951388</p>
                                          </div>
                                    </a>
                              </li>
                              <li>
                                    <a href="javascript:;">
                                          <img src="${staticPath }/images/study_center9.png" height="180" width="180" alt="">
                                          <div class="txt">
                                                <h3>无锡校区</h3>
                                                <p>地址：无锡市南长区清扬路113号恒威大厦1301</p>
                                                <p>电话：15151533013</p>
                                          </div>
                                    </a>
                              </li>
                              <li>
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
	<jsp:include page="/web/to/footer"></jsp:include>
	<script type="text/javascript">
		$(".nav li").eq(4).addClass('on');
	</script>
</body>
</html>

