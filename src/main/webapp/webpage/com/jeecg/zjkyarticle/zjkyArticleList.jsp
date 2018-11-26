<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:0px;border:0px">
  <t:datagrid name="zjkyArticleList" checkbox="true" pagination="true" fitColumns="true" title="资讯" actionUrl="zjkyArticleController.do?datagrid" idField="id" sortName="createDate" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建人名称"  field="createName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建人登录名称"  field="createBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建日期"  field="createDate" formatter="yyyy-MM-dd hh:mm:ss" query="true" queryMode="group" editor="datebox" width="120"></t:dgCol>
   <t:dgCol title="更新人名称"  field="updateName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人登录名称"  field="updateBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新日期"  field="updateDate"  formatter="yyyy-MM-dd hh:mm:ss"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="标题"  field="title"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="作者OR来源"  field="author"  query="false"  queryMode="single"  width="120"></t:dgCol>
   <%-- <t:dgCol title="封面"  field="cover"  queryMode="single"  image="true" imageSize="50,50"  width="120"></t:dgCol> --%>
   <t:dgCol title="标签"  field="tags"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <%-- <t:dgCol title="简介"  field="info"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="内容"  field="content"  queryMode="single"  width="500"></t:dgCol> --%>
   <t:dgCol title="阅读数"  field="readnum"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="权重"  field="weight"  query="false"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="分类"  field="categoryid"  query="false"  queryMode="single"  dictionary="A04"  formatterjs="treeFormater" width="120"></t:dgCol>
   <t:dgCol title="状态"  field="status"  query="false"  queryMode="single"  dictionary="status"  width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="zjkyArticleController.do?doDel&id={id}" urlclass="ace_button"  urlfont="fa-trash-o"/>
   <t:dgToolBar title="录入" icon="icon-add" url="zjkyArticleController.do?goAdd" funname="add" width="1500" height="700"></t:dgToolBar>
	<t:dgToolBar title="编辑" icon="icon-edit" url="zjkyArticleController.do?goUpdate" funname="update" width="1500" height="700"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="zjkyArticleController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="zjkyArticleController.do?goUpdate" funname="detail" width="1500" height="700"></t:dgToolBar>
   <t:dgToolBar title="导入" icon="icon-put" funname="ImportXls"></t:dgToolBar>
   <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
   <t:dgToolBar title="模板下载" icon="icon-putout" funname="ExportXlsByT"></t:dgToolBar>
  </t:datagrid>
  <div id="tempSearchColums" style="display: none;">
    <div name="searchColums">
       <span>选择分类: </span><t:treeSelectTag id="categoryid" field="categoryid" code = "A04" inputClass="form-control" formStyle="ace" multiCheck="false"></t:treeSelectTag>
    </div>
</div>
  </div>
 </div>		
 <script type="text/javascript">
 $(document).ready(function(){
 	var datagrid = $("#zjkyArticleListtb");
    datagrid.find("div[name='searchColums']").find("form#zjkyArticleListForm").prepend($("#tempSearchColums div[name='searchColums']").html());
    $("#tempSearchColums").html('');
 });
 
   
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'zjkyArticleController.do?upload', "zjkyArticleList");
}

//导出
function ExportXls() {
	JeecgExcelExport("zjkyArticleController.do?exportXls","zjkyArticleList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("zjkyArticleController.do?exportXlsByT","zjkyArticleList");
}

 </script>
