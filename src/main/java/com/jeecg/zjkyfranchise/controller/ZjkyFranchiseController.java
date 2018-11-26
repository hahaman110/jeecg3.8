package com.jeecg.zjkyfranchise.controller;
import com.jeecg.zjkyfranchise.entity.ZjkyFranchiseEntity;
import com.jeecg.zjkyfranchise.service.ZjkyFranchiseServiceI;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.common.TreeChildCount;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.pojo.base.TSDepart;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import java.io.OutputStream;
import org.jeecgframework.core.util.BrowserUtils;
import org.jeecgframework.poi.excel.ExcelExportUtil;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.entity.TemplateExportParams;
import org.jeecgframework.poi.excel.entity.vo.NormalExcelConstants;
import org.jeecgframework.poi.excel.entity.vo.TemplateExcelConstants;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.jeecgframework.core.util.ResourceUtil;
import java.io.IOException;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.util.Map;
import java.util.HashMap;
import org.jeecgframework.core.util.ExceptionUtil;

/**   
 * @Title: Controller  
 * @Description: 招商加盟
 * @author onlineGenerator
 * @date 2018-11-02 14:14:16
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/zjkyFranchiseController")
public class ZjkyFranchiseController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(ZjkyFranchiseController.class);

	@Autowired
	private ZjkyFranchiseServiceI zjkyFranchiseService;
	@Autowired
	private SystemService systemService;
	
	


	/**
	 * 招商加盟列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/zjkyfranchise/zjkyFranchiseList");
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(ZjkyFranchiseEntity zjkyFranchise,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(ZjkyFranchiseEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, zjkyFranchise, request.getParameterMap());
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.zjkyFranchiseService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 删除招商加盟
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(ZjkyFranchiseEntity zjkyFranchise, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		zjkyFranchise = systemService.getEntity(ZjkyFranchiseEntity.class, zjkyFranchise.getId());
		message = "招商加盟删除成功";
		try{
			zjkyFranchiseService.delete(zjkyFranchise);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "招商加盟删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除招商加盟
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "招商加盟删除成功";
		try{
			for(String id:ids.split(",")){
				ZjkyFranchiseEntity zjkyFranchise = systemService.getEntity(ZjkyFranchiseEntity.class, 
				Integer.parseInt(id)
				);
				zjkyFranchiseService.delete(zjkyFranchise);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "招商加盟删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加招商加盟
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(ZjkyFranchiseEntity zjkyFranchise, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "招商加盟添加成功";
		try{
			zjkyFranchiseService.save(zjkyFranchise);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "招商加盟添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新招商加盟
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(ZjkyFranchiseEntity zjkyFranchise, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "招商加盟更新成功";
		ZjkyFranchiseEntity t = zjkyFranchiseService.get(ZjkyFranchiseEntity.class, zjkyFranchise.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(zjkyFranchise, t);
			zjkyFranchiseService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "招商加盟更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 招商加盟新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(ZjkyFranchiseEntity zjkyFranchise, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(zjkyFranchise.getId())) {
			zjkyFranchise = zjkyFranchiseService.getEntity(ZjkyFranchiseEntity.class, zjkyFranchise.getId());
			req.setAttribute("zjkyFranchisePage", zjkyFranchise);
		}
		return new ModelAndView("com/jeecg/zjkyfranchise/zjkyFranchise-add");
	}
	/**
	 * 招商加盟编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(ZjkyFranchiseEntity zjkyFranchise, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(zjkyFranchise.getId())) {
			zjkyFranchise = zjkyFranchiseService.getEntity(ZjkyFranchiseEntity.class, zjkyFranchise.getId());
			req.setAttribute("zjkyFranchisePage", zjkyFranchise);
		}
		return new ModelAndView("com/jeecg/zjkyfranchise/zjkyFranchise-update");
	}
	
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","zjkyFranchiseController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(ZjkyFranchiseEntity zjkyFranchise,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(ZjkyFranchiseEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, zjkyFranchise, request.getParameterMap());
		List<ZjkyFranchiseEntity> zjkyFranchises = this.zjkyFranchiseService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"招商加盟");
		modelMap.put(NormalExcelConstants.CLASS,ZjkyFranchiseEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("招商加盟列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,zjkyFranchises);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(ZjkyFranchiseEntity zjkyFranchise,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
    	modelMap.put(NormalExcelConstants.FILE_NAME,"招商加盟");
    	modelMap.put(NormalExcelConstants.CLASS,ZjkyFranchiseEntity.class);
    	modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("招商加盟列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
    	"导出信息"));
    	modelMap.put(NormalExcelConstants.DATA_LIST,new ArrayList());
    	return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "importExcel", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson importExcel(HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			MultipartFile file = entity.getValue();// 获取上传文件对象
			ImportParams params = new ImportParams();
			params.setTitleRows(2);
			params.setHeadRows(1);
			params.setNeedSave(true);
			try {
				List<ZjkyFranchiseEntity> listZjkyFranchiseEntitys = ExcelImportUtil.importExcel(file.getInputStream(),ZjkyFranchiseEntity.class,params);
				for (ZjkyFranchiseEntity zjkyFranchise : listZjkyFranchiseEntitys) {
					zjkyFranchiseService.save(zjkyFranchise);
				}
				j.setMsg("文件导入成功！");
			} catch (Exception e) {
				j.setMsg("文件导入失败！");
				logger.error(e.getMessage());
			}finally{
				try {
					file.getInputStream().close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return j;
	}
	
	
}
