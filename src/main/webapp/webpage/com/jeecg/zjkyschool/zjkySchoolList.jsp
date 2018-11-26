<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:0px;border:0px">
  <t:datagrid name="zjkySchoolList" checkbox="true" pagination="true" fitColumns="true" title="院校" actionUrl="zjkySchoolController.do?datagrid" idField="id" sortName="createDate" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建人名称"  field="createName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建人登录名称"  field="createBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建日期"  field="createDate"  formatter="yyyy-MM-dd"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人名称"  field="updateName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人登录名称"  field="updateBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新日期"  field="updateDate"  formatter="yyyy-MM-dd"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="代码"  field="code"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="名称"  field="name"  query="true"  queryMode="single"  width="120"></t:dgCol>
   <%-- <t:dgCol title="Logo"  field="logo"  queryMode="single"  width="120"></t:dgCol> --%>
   <t:dgCol title="城市"  field="city"  query="true" dictionary="t_s_region,id,name" dictCondition="where pid=1" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="属性"  field="attribute" query="false"  queryMode="single"  dictionary="schoolAttr"  width="120"></t:dgCol>
   <t:dgCol title="类型"  field="kind"  query="true"  queryMode="single"  dictionary="schoolKind"  width="120"></t:dgCol>
   <t:dgCol title="隶属"  field="subjection"  query="true"  queryMode="single"  dictionary="schoolLs"  width="120"></t:dgCol>
   <%-- <t:dgCol title="简介"  field="info"  queryMode="single"  width="500"></t:dgCol>
   <t:dgCol title="招生简章"  field="guide"  queryMode="single"  width="500"></t:dgCol>
   <t:dgCol title="学费"  field="tuition"  queryMode="single"  width="500"></t:dgCol>
   <t:dgCol title="分数线"  field="score"  queryMode="single"  width="500"></t:dgCol>
   <t:dgCol title="复试"  field="retest"  queryMode="single"  width="500"></t:dgCol> --%>
   <t:dgCol title="备注"  field="remark"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="zjkySchoolController.do?doDel&id={id}" urlclass="ace_button"  urlfont="fa-trash-o"/>
   <t:dgToolBar title="录入" icon="icon-add" url="zjkySchoolController.do?goAdd" funname="add" width="1500" height="700"></t:dgToolBar>
	<t:dgToolBar title="编辑" icon="icon-edit" url="zjkySchoolController.do?goUpdate" funname="update" width="1500" height="700"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="zjkySchoolController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="zjkySchoolController.do?goUpdate" funname="detail" width="1500" height="700"></t:dgToolBar>
   <t:dgToolBar title="导入" icon="icon-put" funname="ImportXls"></t:dgToolBar>
   <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
   <t:dgToolBar title="模板下载" icon="icon-putout" funname="ExportXlsByT"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>		
 <script type="text/javascript">
 $(document).ready(function(){
 });
 
   
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'zjkySchoolController.do?upload', "zjkySchoolList");
}

//导出
function ExportXls() {
	JeecgExcelExport("zjkySchoolController.do?exportXls","zjkySchoolList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("zjkySchoolController.do?exportXlsByT","zjkySchoolList");
}

 </script>
