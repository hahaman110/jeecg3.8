package com.jeecg.web;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.pojo.base.TSCategoryEntity;
import org.jeecgframework.web.system.pojo.base.TSType;
import org.jeecgframework.web.system.pojo.base.TSTypegroup;
import org.jeecgframework.web.system.service.CategoryServiceI;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jeecg.demo.dao.JeecgMinidaoDao;
import com.jeecg.web.util.PageInfo;
import com.jeecg.zjkyarticle.entity.ZjkyArticleEntity;
import com.jeecg.zjkyarticle.service.ZjkyArticleServiceI;
import com.jeecg.zjkymajor.entity.ZjkyMajorEntity;
import com.jeecg.zjkymajor.service.ZjkyMajorServiceI;
import com.jeecg.zjkyschool.entity.ZjkySchoolEntity;
import com.jeecg.zjkyschool.service.ZjkySchoolServiceI;
/**   
 * @Title: Controller  
 * @Description: 学校
 * @author onlineGenerator
 * @date 2018-10-24 16:07:45
 * @version V1.0   
 * http://localhost:8080/jeecg3.8/web/zjkyarticle/home
 */
@Controller
@RequestMapping("/zjkyschool")
public class WebZjkySchoolController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(WebZjkySchoolController.class);
	private static final int pagesize = 10;
	
	@Autowired
	private ZjkyMajorServiceI zjkyMajorServiceI;
	@Autowired
	private ZjkySchoolServiceI zjkySchoolServiceI;
	@Autowired
	private JeecgMinidaoDao jeecgMinidaoDao;
	@Autowired
	private CategoryServiceI categoryService;
	@Autowired
	private ZjkyArticleServiceI zjkyArticleService;
	
	

	@RequestMapping
	public ModelAndView index(ZjkySchoolEntity schoolEntity ,Integer page,Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		Map<String, Object> accurateParams = new HashMap<String, Object>();
		Map<String, Object> vagueParams = new HashMap<String, Object>();
		String where = "";
		
		if(schoolEntity!=null){
			if(StringUtil.isNotEmpty(schoolEntity.getCity())) {
				accurateParams.put("city", schoolEntity.getCity());
				model.addAttribute("city", schoolEntity.getCity());
			}
			
			if(StringUtil.isNotEmpty(schoolEntity.getAttribute())){
				where = " find_in_set('"+schoolEntity.getAttribute()+"',attribute)>0";
				model.addAttribute("attribute", schoolEntity.getAttribute());
			}
			
			
			if(StringUtil.isNotEmpty(schoolEntity.getKind())) {
				accurateParams.put("kind", schoolEntity.getKind());
				model.addAttribute("kind", schoolEntity.getKind());
			}
			
			if(StringUtil.isNotEmpty(schoolEntity.getSubjection())) {
				accurateParams.put("subjection", schoolEntity.getSubjection());
				model.addAttribute("subjection", schoolEntity.getSubjection());
			}
			
			if(StringUtil.isNotEmpty(schoolEntity.getName())) {
				String name = URLDecoder.decode(schoolEntity.getName(),"utf-8");
				vagueParams.put("name", name);
				model.addAttribute("name", name);
			}
		}
		
		PageInfo pageInfo = zjkySchoolServiceI.findPage(ZjkySchoolEntity.class, (page==null?1:page), pagesize, accurateParams, vagueParams, where, " id desc ");
		model.addAttribute("pageInfo", pageInfo);

		List<Map<String, String>> citys=jeecgMinidaoDao.getProCity("1");
		model.addAttribute("citys", citys);
		
		Map<String, String> citymap = new HashMap<String, String>();
		for(Map city : citys){
			citymap.put(city.get("id").toString(), city.get("name").toString());
		}
		model.addAttribute("citymap", citymap);
		
		TSTypegroup schoolattrTg = ResourceUtil.getCacheTypeGroup("schoolattr");//获取学校属性
		TSTypegroup schoolkindTg = ResourceUtil.getCacheTypeGroup("schoolkind");//获取学校分类
		TSTypegroup schoollsTg = ResourceUtil.getCacheTypeGroup("schoolls");//获取学校隶属
		model.addAttribute("schoolattrTg", schoolattrTg);
		model.addAttribute("schoolkindTg", schoolkindTg);
		model.addAttribute("schoollsTg", schoollsTg);
		
		Map<String, String> typemap = new HashMap<String, String>();
        for (TSType type : schoolattrTg.getTSTypes()) {
        	typemap.put(type.getTypecode(), type.getTypename());
        }
        for (TSType type : schoolkindTg.getTSTypes()) {
        	typemap.put(type.getTypecode(), type.getTypename());
        }
        for (TSType type : schoollsTg.getTSTypes()) {
        	typemap.put(type.getTypecode(), type.getTypename());
        }
        model.addAttribute("typemap", typemap);
        
        
		return new ModelAndView("web/schools");
	}
	
	@RequestMapping("/detail/{path}/{id}")
	public ModelAndView schools_detail(@PathVariable String path, @PathVariable String id, Model model,HttpServletRequest request) {
		
		ZjkySchoolEntity schoolEntity = zjkySchoolServiceI.getEntity(ZjkySchoolEntity.class, Integer.parseInt(id));
		if(schoolEntity!=null){
			model.addAttribute("schoolEntity", schoolEntity);
			TSTypegroup majorkindTg = ResourceUtil.getCacheTypeGroup("majorkind");//获取专业门类
			TSTypegroup schoolattrTg = ResourceUtil.getCacheTypeGroup("schoolattr");//获取学校属性
			TSTypegroup schoollsTg = ResourceUtil.getCacheTypeGroup("schoolls");//获取学校隶属
			Map<String, String> typemap = new HashMap<String, String>();
	        for (TSType type : majorkindTg.getTSTypes()) {
	        	typemap.put(type.getTypecode(), type.getTypename());
	        }
	        for (TSType type : schoolattrTg.getTSTypes()) {
	        	typemap.put(type.getTypecode(), type.getTypename());
	        }
	        for (TSType type : schoollsTg.getTSTypes()) {
	        	typemap.put(type.getTypecode(), type.getTypename());
	        }
	        model.addAttribute("typemap", typemap);
			
			if("schools_detail".equals(path)){
				
				//最新动态
				TSCategoryEntity zxdtCategory = categoryService.findUniqueByProperty(TSCategoryEntity.class, "name", "最新动态");
				if(zxdtCategory!=null){
					String sql = "select id,title from zjky_article where find_in_set('"+zxdtCategory.getCode()+"',categoryid) and find_in_set('"+schoolEntity.getName()+"',tags)  order by create_date desc limit 5;";
					List<ZjkyArticleEntity> zxdtArticle = zjkyArticleService.findListbySql(sql);
					if(zxdtArticle!=null) model.addAttribute("zxdtArticle", zxdtArticle);
				}
				
				//招生专业
				String sql = "select sm.enrollmentyear,sm.department,m.name,m.kind from zjky_school_major sm,zjky_major m where sm.majorid=m.id and sm.schoolid="+schoolEntity.getId()+" limit 15;";
				List<Object> zszy = zjkySchoolServiceI.findListbySql(sql);
				if(zszy!=null) model.addAttribute("zszy", zszy);
				
			}else if("schools_profess".equals(path)){
				//招生专业资讯列表
				TSCategoryEntity zszyCategory = categoryService.findUniqueByProperty(TSCategoryEntity.class, "name", "招生专业");
				if(zszyCategory!=null){
					String sql = "select id,cover,title,info,create_date,tags from zjky_article where find_in_set('"+zszyCategory.getCode()+"',categoryid) and find_in_set('"+schoolEntity.getName()+"',tags)  order by weight desc,create_date desc limit 4;";
					List<ZjkyArticleEntity> zszyArticle = zjkyArticleService.findListbySql(sql);
					if(zszyArticle!=null) model.addAttribute("zszyArticle", zszyArticle);
				}
				
			}else if("schools_adjust".equals(path)){ 
				//调剂资讯列表
				TSCategoryEntity tjCategory = categoryService.findUniqueByProperty(TSCategoryEntity.class, "name", "调剂");
				if(tjCategory!=null){
					String sql = "select id,cover,title,info,create_date,tags from zjky_article where find_in_set('"+tjCategory.getCode()+"',categoryid) and find_in_set('"+schoolEntity.getName()+"',tags)  order by weight desc,create_date desc limit 4;";
					List<ZjkyArticleEntity> tjArticle = zjkyArticleService.findListbySql(sql);
					if(tjArticle!=null) model.addAttribute("tjArticle", tjArticle);
				}
				
			}
			
			
			
		}
		return new ModelAndView("web/"+path);
	}

	
}
