<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>院校</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <t:base type="jquery,aceform,DatePicker,validform,ueditor,uploadify"></t:base>
  <link rel="stylesheet" href="plug-in/select2/css/select2.min.css">
  <script type="text/javascript" src="plug-in/select2/js/select2.full.min.js"></script>
</head>

 <body>
	<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="zjkySchoolController.do?doUpdate" tiptype="1" >
			<input type="hidden" id="btn_sub" class="btn_sub"/>
			<input type="hidden" name="id" value='${zjkySchoolPage.id}' >
			
			
			<div class="tab-wrapper">
			    <!-- tab -->
			    <ul class="nav nav-tabs">
			      <li role="presentation" class="active"><a href="javascript:void(0);">院校</a></li>
			    </ul>
			    <!-- tab内容 -->
			    <div class="con-wrapper" id="con-wrapper1" style="display: block;">
			      <div class="row form-wrapper">
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>代码：</b>
			          </div>
			          		<div class="col-xs-3">
								<input id="code" name="code" maxlength="32" type="text" class="form-control" ignore="ignore"  value='${zjkySchoolPage.code}' />
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">代码</label>
			          </div>
						</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>名称：</b>
			          </div>
			          		<div class="col-xs-3">
								<input id="name" name="name" maxlength="50" type="text" class="form-control" ignore="ignore"  value='${zjkySchoolPage.name}' />
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">名称</label>
			          </div>
						</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>Logo：</b>
			          </div>
			          		<div class="col-xs-3">
			          		
			          		<div style="cursor:pointer">
						 <ul id="picsUl" class="ul_pics clearfix">
						 	<li>
						 		<input type="hidden" name="logo" value="${zjkySchoolPage.logo}" />
						 		<img src="${zjkySchoolPage.logo}" alt="" />
						 	</li> 
						     <li id="local_upload1">
						     	<img src="plug-in/plupload/jquery.ui.plupload/img/local_upload.png" id="picsPicker"/>
						     </li> 
						 </ul> 
						 <link rel="stylesheet" href="plug-in/plupload/jquery.ui.plupload/css/extend.css" type="text/css">
						<script>
						var uploader2 = new plupload.Uploader({//创建实例的构造方法
						    runtimes: 'gears,html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
						    browse_button: 'picsPicker', // 上传按钮
						    url: "systemController/filedeal.do", //远程上传地址
						    flash_swf_url: 'plug-in/plupload/Moxie.swf', //flash文件地址
						    silverlight_xap_url: 'plug-in/plupload/Moxie.xap', //silverlight文件地址
						    filters: {
						        max_file_size: '10mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
						        mime_types: [//允许文件上传类型
						            {title: "files", extensions: "jpg,png,gif,jpeg"}
						        ]
						    },
						    multipart_params:{isup:"1"},
						    multi_selection: false, //true:ctrl多文件上传, false 单文件上传
						    init: {
						        FilesAdded: function(up, files) { //文件上传前
						            var li = '';
						            plupload.each(files, function(file) { //遍历文件
						            	li += "<li class='li_upload' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></li>";
						            });
						            $("#picsUl li:not(:last)").remove();
						            $("#picsUl").prepend(li);
						            uploader2.start();
						        },
						        UploadProgress: function(up, file) { //上传中，显示进度条
						            var percent = file.percent;
						            $("#" + file.id).find('.bar').css({"width": percent + "%"});
						            $("#" + file.id).find(".percent").text(percent + "%");
						        },
						        FileUploaded: function(up, file, info) { //文件上传成功的时候触发
						             var data = eval("(" + info.response + ")");//解析返回的json数据
						             var picpath = data.obj;
						             while(picpath.indexOf('\\')>=0){
						             	picpath = picpath.replace("\\","/");
						             }
						             var html = "<input type='hidden'name='logo' value='/imgfilepath/" + picpath + "'/>\n\<img class='img_common' src='/imgfilepath/" + picpath + "'/><span class='picbg'></span><a class='pic_close' onclick=delPic2('" + picpath + "','" + file.id + "')></a>";
						             //var html = "<input type='hidden'name='logo' value='" + picpath + "'/>\n\<img class='img_common' src='img/server/" + picpath + "'/><span class='picbg'></span><a class='pic_close' onclick=delPic2('" + picpath + "','" + file.id + "')></a>";
						             $("#" + file.id).html(html);
						        },
						        Error: function(up, err) { //上传出错的时候触发
						            alert(err.message);
						        }
						    }
						});
						uploader2.init();
						</script>
						</div>
			          	<span>* 建议宽度136 高度136</span>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">Logo</label>
			          </div>
						</div>
			          
			          <div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>封面：</b>
			          </div>
			          		<div class="col-xs-3">
			          		
			          		<div style="cursor:pointer">
						 <ul id="picsUl2" class="ul_pics clearfix">
						 	<li>
						 		<input type="hidden" name="cover" value="${zjkySchoolPage.cover}" />
						 		<img src="${zjkySchoolPage.cover}" alt="" />
						 	</li> 
						     <li id="local_upload2">
						     	<img src="plug-in/plupload/jquery.ui.plupload/img/local_upload.png" id="picsPicker2"/>
						     </li> 
						 </ul> 
						 <link rel="stylesheet" href="plug-in/plupload/jquery.ui.plupload/css/extend.css" type="text/css">
						<script>
						var uploader3 = new plupload.Uploader({//创建实例的构造方法
						    runtimes: 'gears,html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
						    browse_button: 'picsPicker2', // 上传按钮
						    url: "systemController/filedeal.do", //远程上传地址
						    flash_swf_url: 'plug-in/plupload/Moxie.swf', //flash文件地址
						    silverlight_xap_url: 'plug-in/plupload/Moxie.xap', //silverlight文件地址
						    filters: {
						        max_file_size: '10mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
						        mime_types: [//允许文件上传类型
						            {title: "files", extensions: "jpg,png,gif,jpeg"}
						        ]
						    },
						    multipart_params:{isup:"1"},
						    multi_selection: false, //true:ctrl多文件上传, false 单文件上传
						    init: {
						        FilesAdded: function(up, files) { //文件上传前
						            var li = '';
						            plupload.each(files, function(file) { //遍历文件
						            	li += "<li class='li_upload' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></li>";
						            });
						            $("#picsUl2 li:not(:last)").remove();
						            $("#picsUl2").prepend(li);
						            uploader3.start();
						        },
						        UploadProgress: function(up, file) { //上传中，显示进度条
						            var percent = file.percent;
						            $("#" + file.id).find('.bar').css({"width": percent + "%"});
						            $("#" + file.id).find(".percent").text(percent + "%");
						        },
						        FileUploaded: function(up, file, info) { //文件上传成功的时候触发
						             var data = eval("(" + info.response + ")");//解析返回的json数据
						             var picpath = data.obj;
						             while(picpath.indexOf('\\')>=0){
						             	picpath = picpath.replace("\\","/");
						             }
						             var html = "<input type='hidden'name='cover' value='/imgfilepath/" + picpath + "'/>\n\<img class='img_common' src='/imgfilepath/" + picpath + "'/><span class='picbg'></span><a class='pic_close' onclick=delPic2('" + picpath + "','" + file.id + "')></a>";
						             //var html = "<input type='hidden'name='cover' value='" + picpath + "'/>\n\<img class='img_common' src='img/server/" + picpath + "'/><span class='picbg'></span><a class='pic_close' onclick=delPic2('" + picpath + "','" + file.id + "')></a>";
						             $("#" + file.id).html(html);
						        },
						        Error: function(up, err) { //上传出错的时候触发
						            alert(err.message);
						        }
						    }
						});
						uploader3.init();
						</script>
						</div>
			          	<span>* 建议宽度1180 高度240</span>
			          	
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">Logo</label>
			          </div>
						</div>
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>城市：</b>
			          </div>
			          		<div class="col-xs-3">
							  <%-- <t:dictSelect field="city" type="list" extendJson="{class:'form-control',style:'width:158px'}" typeGroupCode=""  defaultVal="${zjkySchoolPage.city}"  hasLabel="false"  title="城市"></t:dictSelect> --%>
							  <input type="text" id="city" name="city" class="ac_input" value="${zjkySchoolPage.city}">
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">城市</label>
			          </div>
						</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>属性：</b>
			          </div>
			          		<div class="col-xs-3">
							  <%-- <t:dictSelect field="attribute" type="list" extendJson="{class:'form-control',style:'width:158px'}" typeGroupCode="schoolAttr"  defaultVal="${zjkySchoolPage.attribute}"  hasLabel="false"  title="属性"></t:dictSelect> --%>
							  <t:dictSelect field="attribute" type="checkbox" typeGroupCode="schoolAttr" defaultVal="${zjkySchoolPage.attribute}" title="属性"></t:dictSelect>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">属性</label>
			          </div>
						</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>类型：</b>
			          </div>
			          		<div class="col-xs-3">
							  <t:dictSelect field="kind" type="list" extendJson="{class:'form-control',style:'width:158px'}" typeGroupCode="schoolKind"  defaultVal="${zjkySchoolPage.kind}"  hasLabel="false"  title="类型"></t:dictSelect>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">类型</label>
			          </div>
						</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>隶属：</b>
			          </div>
			          		<div class="col-xs-3">
							  <%-- <t:dictSelect field="subjection" type="list" extendJson="{class:'form-control',style:'width:158px'}" typeGroupCode="schoolLs"  defaultVal="${zjkySchoolPage.subjection}"  hasLabel="false"  title="隶属"></t:dictSelect> --%>
							  <t:dictSelect field="subjection" type="radio" typeGroupCode="schoolLs"  defaultVal="${zjkySchoolPage.subjection}"  title="隶属"></t:dictSelect>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">隶属</label>
			          </div>
						</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>备注：</b>
			          </div>
			          		<div class="col-xs-3">
								<input id="remark" name="remark" maxlength="32" type="text" class="form-control" ignore="ignore"  value='${zjkySchoolPage.remark}' />
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">备注</label>
			          </div>
						</div>
			          
			        
					<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>简介：</b>
			          </div>
			          <div class="col-xs-3">
								<script type="text/javascript"  charset="utf-8" src="plug-in/ueditor/ueditor.config.js"></script>
								<script type="text/javascript"  charset="utf-8" src="plug-in/ueditor/ueditor.all.min.js"></script>
                                <textarea name="info" id="info" style="width: 650px;height:300px">${zjkySchoolPage.info }</textarea>
							    <script type="text/javascript">
							        var info_editor = UE.getEditor('info');
							    </script>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">简介</label>
			          </div>
						</div>
					<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>招生简章：</b>
			          </div>
			          <div class="col-xs-3">
                                <textarea name="guide" id="guide" style="width: 650px;height:300px">${zjkySchoolPage.guide }</textarea>
							    <script type="text/javascript">
							        var guide_editor = UE.getEditor('guide');
							    </script>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">招生简章</label>
			          </div>
						</div>
					<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>学费：</b>
			          </div>
			          <div class="col-xs-3">
                                <textarea name="tuition" id="tuition" style="width: 650px;height:300px">${zjkySchoolPage.tuition }</textarea>
							    <script type="text/javascript">
							        var tuition_editor = UE.getEditor('tuition');
							    </script>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">学费</label>
			          </div>
						</div>
					<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>分数线：</b>
			          </div>
			          <div class="col-xs-3">
                                <textarea name="score" id="score" style="width: 650px;height:300px">${zjkySchoolPage.score }</textarea>
							    <script type="text/javascript">
							        var score_editor = UE.getEditor('score');
							    </script>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">分数线</label>
			          </div>
						</div>
					<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>复试：</b>
			          </div>
			          <div class="col-xs-3">
                                <textarea name="retest" id="retest" style="width: 650px;height:300px">${zjkySchoolPage.retest }</textarea>
							    <script type="text/javascript">
							        var retest_editor = UE.getEditor('retest');
							    </script>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">复试</label>
			          </div>
						</div>
			          <div class="row" id = "sub_tr" style="display: none;">
				        <div class="col-xs-12 layout-header">
				          <div class="col-xs-6"></div>
				          <div class="col-xs-6"><button type="button" onclick="neibuClick();" class="btn btn-default">提交</button></div>
				        </div>
				      </div>
			     </div>
			   </div>
			   
			   <div class="con-wrapper" id="con-wrapper2" style="display: block;"></div>
			 </div>
  </t:formvalid>

<script type="text/javascript">
   $(function(){
    //查看模式情况下,删除和上传附件功能禁止使用
	if(location.href.indexOf("load=detail")!=-1){
		$(".jeecgDetail").hide();
	}
	
	if(location.href.indexOf("mode=read")!=-1){
		//查看模式控件禁用
		$("#formobj").find(":input").attr("disabled","disabled");
	}
	if(location.href.indexOf("mode=onbutton")!=-1){
		//其他模式显示提交按钮
		$("#sub_tr").show();
	}
	
	var select2Data = new Array();
	$.ajax({
		url:'jeecgFormDemoController.do?regionSelect&pid=1',
		type:'GET',
		dataType:'JSON',
		delay: 250,
		cache: true,
		success: function(data){
			for(var i = 0; i < data.length; i++){
				var select2Obj = {};
				select2Obj.id = data[i].id;
				select2Obj.text = data[i].name;
				select2Data.push(select2Obj);
			}
			$("#city").select2({
				data: select2Data,
				placeholder:'请选择省份',//默认文字提示
			    language: "zh-CN",//汉化
			    allowClear: true//允许清空
			});
		}
	});
	
   });

  var neibuClickFlag = false;
  function neibuClick() {
	  neibuClickFlag = true; 
	  $('#btn_sub').trigger('click');
  }

</script>
 </body>
</html>