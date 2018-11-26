package com.jeecg.zjkyreserve.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.entity.vo.NormalExcelConstants;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.service.SystemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jeecg.zjkyreserve.entity.ZjkyReserveEntity;
import com.jeecg.zjkyreserve.service.ZjkyReserveServiceI;

/**   
 * @Title: Controller  
 * @Description: 咨询预约
 * @author onlineGenerator
 * @date 2018-11-01 09:47:41
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/zjkyReserveController")
public class ZjkyReserveController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(ZjkyReserveController.class);

	@Autowired
	private ZjkyReserveServiceI zjkyReserveService;
	@Autowired
	private SystemService systemService;
	
	


	/**
	 * 咨询预约列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/zjkyreserve/zjkyReserveList");
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
	public void datagrid(ZjkyReserveEntity zjkyReserve,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(ZjkyReserveEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, zjkyReserve, request.getParameterMap());
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.zjkyReserveService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 删除咨询预约
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(ZjkyReserveEntity zjkyReserve, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		zjkyReserve = systemService.getEntity(ZjkyReserveEntity.class, zjkyReserve.getId());
		message = "咨询预约删除成功";
		try{
			zjkyReserveService.delete(zjkyReserve);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "咨询预约删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除咨询预约
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "咨询预约删除成功";
		try{
			for(String id:ids.split(",")){
				ZjkyReserveEntity zjkyReserve = systemService.getEntity(ZjkyReserveEntity.class, 
				Integer.parseInt(id)
				);
				zjkyReserveService.delete(zjkyReserve);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "咨询预约删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加咨询预约
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(ZjkyReserveEntity zjkyReserve, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "咨询预约添加成功";
		try{
			zjkyReserveService.save(zjkyReserve);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "咨询预约添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新咨询预约
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(ZjkyReserveEntity zjkyReserve, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "咨询预约更新成功";
		ZjkyReserveEntity t = zjkyReserveService.get(ZjkyReserveEntity.class, zjkyReserve.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(zjkyReserve, t);
			zjkyReserveService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "咨询预约更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 咨询预约新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(ZjkyReserveEntity zjkyReserve, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(zjkyReserve.getId())) {
			zjkyReserve = zjkyReserveService.getEntity(ZjkyReserveEntity.class, zjkyReserve.getId());
			req.setAttribute("zjkyReservePage", zjkyReserve);
		}
		return new ModelAndView("com/jeecg/zjkyreserve/zjkyReserve-add");
	}
	/**
	 * 咨询预约编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(ZjkyReserveEntity zjkyReserve, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(zjkyReserve.getId())) {
			zjkyReserve = zjkyReserveService.getEntity(ZjkyReserveEntity.class, zjkyReserve.getId());
			req.setAttribute("zjkyReservePage", zjkyReserve);
		}
		return new ModelAndView("com/jeecg/zjkyreserve/zjkyReserve-update");
	}
	
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","zjkyReserveController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(ZjkyReserveEntity zjkyReserve,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(ZjkyReserveEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, zjkyReserve, request.getParameterMap());
		List<ZjkyReserveEntity> zjkyReserves = this.zjkyReserveService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"咨询预约");
		modelMap.put(NormalExcelConstants.CLASS,ZjkyReserveEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("咨询预约列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,zjkyReserves);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(ZjkyReserveEntity zjkyReserve,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
    	modelMap.put(NormalExcelConstants.FILE_NAME,"咨询预约");
    	modelMap.put(NormalExcelConstants.CLASS,ZjkyReserveEntity.class);
    	modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("咨询预约列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
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
				List<ZjkyReserveEntity> listZjkyReserveEntitys = ExcelImportUtil.importExcel(file.getInputStream(),ZjkyReserveEntity.class,params);
				for (ZjkyReserveEntity zjkyReserve : listZjkyReserveEntitys) {
					zjkyReserveService.save(zjkyReserve);
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
