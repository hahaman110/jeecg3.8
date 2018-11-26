package com.jeecg.zjkyarticle.controller;
import com.jeecg.zjkyarticle.entity.ZjkyArticleEntity;
import com.jeecg.zjkyarticle.service.ZjkyArticleServiceI;
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

import org.jeecgframework.web.cgform.entity.upload.CgUploadEntity;
import org.jeecgframework.web.cgform.service.config.CgFormFieldServiceI;
import java.util.HashMap;
/**   
 * @Title: Controller  
 * @Description: 资讯
 * @author onlineGenerator
 * @date 2018-10-24 16:07:45
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/zjkyArticleController")
public class ZjkyArticleController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(ZjkyArticleController.class);

	@Autowired
	private ZjkyArticleServiceI zjkyArticleService;
	@Autowired
	private SystemService systemService;
	
	@Autowired
	private CgFormFieldServiceI cgFormFieldService;
	


	/**
	 * 资讯列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/zjkyarticle/zjkyArticleList");
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
	public void datagrid(ZjkyArticleEntity zjkyArticle,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		if(zjkyArticle!=null && StringUtil.isNotEmpty(zjkyArticle.getCategoryid())){
			zjkyArticle.setCategoryid("*"+zjkyArticle.getCategoryid()+"*");
		}
		CriteriaQuery cq = new CriteriaQuery(ZjkyArticleEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, zjkyArticle, request.getParameterMap());
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.zjkyArticleService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 删除资讯
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(ZjkyArticleEntity zjkyArticle, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		zjkyArticle = systemService.getEntity(ZjkyArticleEntity.class, zjkyArticle.getId());
		message = "资讯删除成功";
		try{
			zjkyArticleService.delete(zjkyArticle);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "资讯删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除资讯
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "资讯删除成功";
		try{
			for(String id:ids.split(",")){
				ZjkyArticleEntity zjkyArticle = systemService.getEntity(ZjkyArticleEntity.class, 
				Integer.parseInt(id)
				);
				zjkyArticleService.delete(zjkyArticle);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "资讯删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加资讯
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(ZjkyArticleEntity zjkyArticle, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "资讯添加成功";
		try{
			zjkyArticleService.save(zjkyArticle);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "资讯添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		j.setObj(zjkyArticle);
		return j;
	}
	
	/**
	 * 更新资讯
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(ZjkyArticleEntity zjkyArticle, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		message = "资讯更新成功";
		ZjkyArticleEntity t = zjkyArticleService.get(ZjkyArticleEntity.class, zjkyArticle.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(zjkyArticle, t);
			zjkyArticleService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "资讯更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 资讯新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(ZjkyArticleEntity zjkyArticle, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(zjkyArticle.getId())) {
			zjkyArticle = zjkyArticleService.getEntity(ZjkyArticleEntity.class, zjkyArticle.getId());
			req.setAttribute("zjkyArticlePage", zjkyArticle);
		}
		return new ModelAndView("com/jeecg/zjkyarticle/zjkyArticle-add");
	}
	/**
	 * 资讯编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(ZjkyArticleEntity zjkyArticle, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(zjkyArticle.getId())) {
			zjkyArticle = zjkyArticleService.getEntity(ZjkyArticleEntity.class, zjkyArticle.getId());
			req.setAttribute("zjkyArticlePage", zjkyArticle);
		}
		return new ModelAndView("com/jeecg/zjkyarticle/zjkyArticle-update");
	}
	
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","zjkyArticleController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(ZjkyArticleEntity zjkyArticle,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(ZjkyArticleEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, zjkyArticle, request.getParameterMap());
		List<ZjkyArticleEntity> zjkyArticles = this.zjkyArticleService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"资讯");
		modelMap.put(NormalExcelConstants.CLASS,ZjkyArticleEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("资讯列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,zjkyArticles);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(ZjkyArticleEntity zjkyArticle,HttpServletRequest request,HttpServletResponse response
			, DataGrid dataGrid,ModelMap modelMap) {
    	modelMap.put(NormalExcelConstants.FILE_NAME,"资讯");
    	modelMap.put(NormalExcelConstants.CLASS,ZjkyArticleEntity.class);
    	modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("资讯列表", "导出人:"+ResourceUtil.getSessionUser().getRealName(),
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
				List<ZjkyArticleEntity> listZjkyArticleEntitys = ExcelImportUtil.importExcel(file.getInputStream(),ZjkyArticleEntity.class,params);
				for (ZjkyArticleEntity zjkyArticle : listZjkyArticleEntitys) {
					zjkyArticleService.save(zjkyArticle);
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
	
	/**
	 * 获取文件附件信息
	 * 
	 * @param id zjkyArticle主键id
	 */
	@RequestMapping(params = "getFiles")
	@ResponseBody
	public AjaxJson getFiles(String id){
		List<CgUploadEntity> uploadBeans = cgFormFieldService.findByProperty(CgUploadEntity.class, "cgformId", id);
		List<Map<String,Object>> files = new ArrayList<Map<String,Object>>(0);
		for(CgUploadEntity b:uploadBeans){
			String title = b.getAttachmenttitle();//附件名
			String fileKey = b.getId();//附件主键
			String path = b.getRealpath();//附件路径
			String field = b.getCgformField();//表单中作为附件控件的字段
			Map<String, Object> file = new HashMap<String, Object>();
			file.put("title", title);
			file.put("fileKey", fileKey);
			file.put("path", path);
			file.put("field", field==null?"":field);
			files.add(file);
		}
		AjaxJson j = new AjaxJson();
		j.setObj(files);
		return j;
	}
	
}
