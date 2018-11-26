<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>资讯</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <t:base type="jquery,aceform,DatePicker,validform,ueditor,uploadify"></t:base>
</head>
<style type="text/css">
	.extWidth{width: 200px}
</style>
 <body>
	<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="zjkyArticleController.do?doUpdate" tiptype="1" >
			<input type="hidden" id="btn_sub" class="btn_sub"/>
			<input type="hidden" name="id" value='${zjkyArticlePage.id}' >
			
			
			<div class="tab-wrapper">
			    <!-- tab -->
			    <ul class="nav nav-tabs">
			      <li role="presentation" class="active"><a href="javascript:void(0);">资讯</a></li>
			    </ul>
			    <!-- tab内容 -->
			    <div class="con-wrapper" id="con-wrapper1" style="display: block;">
			      <div class="row form-wrapper">
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>标题：</b>
			          </div>
			          		<div class="col-xs-3">
								<input id="title" name="title" maxlength="32" type="text" class="form-control" datatype="*"  value='${zjkyArticlePage.title}' />
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">标题</label>
			          </div>
						</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>作者OR来源：</b>
			          </div>
			          		<div class="col-xs-3">
								<input id="author" name="author" maxlength="32" type="text" class="form-control" datatype="*"  value='${zjkyArticlePage.author}' />
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">作者OR来源</label>
			          </div>
						</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>封面：</b>
			          </div>
			          		<div class="col-xs-6">
			          		<div style="cursor:pointer">
						 <ul id="picsUl" class="ul_pics clearfix">
						 	<li>
						 		<input type="hidden" name="cover" value="${zjkyArticlePage.cover}" />
						 		<img src="${zjkyArticlePage.cover}" alt="" />
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
						             var html = "<input type='hidden'name='cover' value='/imgfilepath/" + picpath + "'/>\n\<img class='img_common' src='/imgfilepath/" + picpath + "'/><span class='picbg'></span><a class='pic_close' onclick=delPic2('" + picpath + "','" + file.id + "')></a>";
						             //var html = "<input type='hidden'name='cover' value='" + picpath + "'/>\n\<img class='img_common' src='img/server/" + picpath + "'/><span class='picbg'></span><a class='pic_close' onclick=delPic2('" + picpath + "','" + file.id + "')></a>";
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
			          	<span>* 建议宽度250 高度140</span>
			          	
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">封面</label>
			          </div>
						</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>标签：</b>
			          </div>
			          		<div class="col-xs-3">
								<script src="https://cdn.bootcss.com/jquery-tagsinput/1.3.6/jquery.tagsinput.min.js"></script>
								<link href="https://cdn.bootcss.com/jquery-tagsinput/1.3.6/jquery.tagsinput.min.css" rel="stylesheet">
								<input id="tags" name="tags" maxlength="32" type="text" class="form-control" datatype="*"  value='${zjkyArticlePage.tags}' />
								<span>* 如果是院校资料 请输入学校名称并回车</span>
								 <script type="text/javascript">
								 	$('#tags').tagsInput({'height':'63px','width':'600px','defaultText':'Add Tag'});
								 	$('#tags').importTags($('#tags').val());
								 </script>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">标签</label>
			          </div>
						</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>简介：</b>
			          </div>
			          		<div class="col-xs-3">
								<input id="info" name="info" type="text" class="form-control" datatype="*"  value='${zjkyArticlePage.info}' />
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">简介</label>
			          </div>
						</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>阅读数：</b>
			          </div>
			          		<div class="col-xs-3">
								<input id="readnum" name="readnum" maxlength="32" type="text" class="form-control" datatype="*"  value='${zjkyArticlePage.readnum}' />
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">阅读数</label>
			          </div>
						</div>
			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>权重：</b>
			          </div>
			          		<div class="col-xs-3">
								<input id="weight" name="weight" maxlength="32" type="text" class="form-control" datatype="*"  value='${zjkyArticlePage.weight}' />
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">权重</label>
			          </div>
						</div>

						<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>状态：</b>
			          </div>
			          		<div class="col-xs-3">
							  <t:dictSelect field="status" type="list" extendJson="{class:'form-control',style:'width:158px'}" typeGroupCode="status"  defaultVal="${zjkyArticlePage.status}"  hasLabel="false"  title="状态"></t:dictSelect>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">状态</label>
			          </div>
						</div>			          
			        
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>分类：</b>
			          </div>
			          		<div class="col-xs-3">
					<t:treeSelectTag id="categoryid" field="categoryid" code = "A04" inputClass="form-control extWidth" formStyle="ace" defaultVal="${zjkyArticlePage.categoryid}"
						multiCheck="true" selectCascadeParent="true"></t:treeSelectTag>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">分类</label>
			          </div>
						</div>
			          
			        
					<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>内容：</b>
			          </div>
			          <div class="col-xs-3">
                                <textarea name="content" id="content" style="width: 650px;height:300px">${zjkyArticlePage.content }</textarea>
							    <script type="text/javascript">
							        var content_editor = UE.getEditor('content');
							    </script>
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">内容</label>
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
   });

  var neibuClickFlag = false;
  function neibuClick() {
	  neibuClickFlag = true; 
	  $('#btn_sub').trigger('click');
  }

</script>
 </body>
</html>