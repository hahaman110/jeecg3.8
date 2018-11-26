package com.jeecg.zjkymajor.controller;
import com.jeecg.zjkymajor.entity.ZjkyMajorEntity;
import com.jeecg.zjkymajor.service.ZjkyMajorServiceI;
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
 * @Description: 专业
 * @author onlineGenerator
 * @date 2018-10-26 11:40:00
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/zjkyMajorController")
public class ZjkyMajorController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(ZjkyMajorController.class);

	@Autowired
	private ZjkyMajorServiceI zjkyMajorService;
	@Autowired
	private SystemService systemService;
	
	


	/**
	 * 专业列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/zjkymajor/zjkyMajorList");
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
	public void datagrid(ZjkyMajorEntity zjkyMajor,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(ZjkyMajorEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, zjkyMajor, request.getParameterMap());
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.zjkyMajorService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 删除专业
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(ZjkyMajorEntity zjkyMajor, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		zjkyMajor = systemService.getEntity(ZjkyMajorEntity.class, zjkyMajor.getId());
		message = "专业删除成功";
		try{
			zjkyMajorService.delete(zjkyMajor);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "专业删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除专业
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "专业删除成功";
		try{
			for(String id:ids.split(",")){
				ZjkyMajorEntity zjkyMajor = systemService.getEntity(ZjkyMajorEntity.class, 
				Integer.parseInt(id)
				);
				zjkyMajorService.delete(zjkyMajor);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "专业删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加专业
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(ZjkyMajorEntity zjkyMajor, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "专业添加成功";
		try{
			zjkyMajorService.save(zjkyMajor);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "专业添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新专业
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(ZjkyMajorEntity zjkyMajor, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "专业更新成功";
		ZjkyMajorEntity t = zjkyMajorService.get(ZjkyMajorEntity.class, zjkyMajor.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(zjkyMajor, t);
			zjkyMajorService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "专业更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 专业新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(ZjkyMajorEntity zjkyMajor, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(zjkyMajor.getId())) {
			zjkyMajor = zjkyMajorService.getEntity(ZjkyMajorEntity.class, zjkyMajor.getId());
			req.setAttribute("zjkyMajorPage", zjkyMajor);
		}
		return new ModelAndView("com/jeecg/zjkymajor/zjkyMajor-add");
	}
	/**
	 * 专业编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(ZjkyMajorEntity zjkyMajor, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(zjkyMajor.getId())) {
			zjkyMajor = zjkyMajorService.getEntity(ZjkyMajorEntity.class, zjkyMajor.getId());
			req.setAttribute("zjkyMajorPage", zjkyMajor);
		}
		return new ModelAndView("com/jeecg/zjkymajor/zjkyMajor-update");
	}
	
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","zjkyMajorController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(ZjkyMajorEntity zjkyMajor,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(ZjkyMajorEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, zjkyMajor, request.getParameterMap());
		List<ZjkyMajorEntity> zjkyMajors = this.zjkyMajorService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"专业");
		modelMap.put(NormalExcelConstants.CLASS,ZjkyMajorEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("专业列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,zjkyMajors);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(ZjkyMajorEntity zjkyMajor,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
    	modelMap.put(NormalExcelConstants.FILE_NAME,"专业");
    	modelMap.put(NormalExcelConstants.CLASS,ZjkyMajorEntity.class);
    	modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("专业列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
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
				List<ZjkyMajorEntity> listZjkyMajorEntitys = ExcelImportUtil.importExcel(file.getInputStream(),ZjkyMajorEntity.class,params);
				for (ZjkyMajorEntity zjkyMajor : listZjkyMajorEntitys) {
					zjkyMajorService.save(zjkyMajor);
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
