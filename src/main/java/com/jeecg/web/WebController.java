package com.jeecg.web;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.annotations.Parent;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.minidao.annotation.Param;
import org.jeecgframework.web.system.pojo.base.TSCategoryEntity;
import org.jeecgframework.web.system.service.CategoryServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jeecg.zjkyarticle.entity.ZjkyArticleEntity;
import com.jeecg.zjkyarticle.service.ZjkyArticleServiceI;
import com.jeecg.zjkyfranchise.entity.ZjkyFranchiseEntity;
import com.jeecg.zjkyfranchise.service.ZjkyFranchiseServiceI;
import com.jeecg.zjkyreserve.entity.ZjkyReserveEntity;
import com.jeecg.zjkyreserve.service.ZjkyReserveServiceI;
/**   
 * @Title: Controller  
 * @Description: 资讯
 * @author onlineGenerator
 * @date 2018-10-24 16:07:45
 * @version V1.0   
 * http://localhost:8080/jeecg3.8/web/zjkyarticle/home
 */
@Controller
@RequestMapping
public class WebController extends BaseController {

	@Autowired
	private ZjkyArticleServiceI zjkyArticleService;
	@Autowired
	private CategoryServiceI categoryService;
	@Autowired
	private ZjkyFranchiseServiceI zjkyFranchiseService;
	@Autowired
	private ZjkyReserveServiceI zjkyReserveService;

	/**
	 * 跳转页面
	 * @param path
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("to/{path}")
	public ModelAndView path(String attr, @PathVariable String path,Model model,HttpServletRequest request) {
		
		if(StringUtil.isNotEmpty(attr)) model.addAttribute("attr",attr);		
		return new ModelAndView("web/"+path);
	}
	
	/**
	 * 通用头部（考研头条部分）
	 * @param hasNav
	 * @param model
	 * @return
	 */
	@RequestMapping("header")
	public ModelAndView header(@RequestParam(value="hasNav",required=false,defaultValue="false") String hasNav, Model model) {
		TSCategoryEntity kyttCategory = categoryService.findUniqueByProperty(TSCategoryEntity.class, "name", "考研头条");
		if(kyttCategory!=null){
			String sql = "select id,title from zjky_article where find_in_set('"+kyttCategory.getCode()+"',categoryid) order by weight desc,create_date desc limit 4; ";
			List<ZjkyArticleEntity> kyttArticles = zjkyArticleService.findListbySql(sql);
			if(kyttArticles!=null) model.addAttribute("kyttArticles", kyttArticles);
		}
		
		model.addAttribute("hasNav", hasNav);
		return new ModelAndView("web/header");
	}
	
	/**
	 * 咨询预约
	 * @param reserveEntity
	 * @param request
	 * @return
	 */
	@RequestMapping(value="reserve/save",method=RequestMethod.POST)
	@ResponseBody
	public AjaxJson reserveSave(ZjkyReserveEntity reserveEntity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		j.setSuccess(false);
		
		if(reserveEntity!=null){
			reserveEntity.setCreateDate(new Date());
			reserveEntity.setReadyState("weichuli");
			try {
				zjkyReserveService.save(reserveEntity);
				j.setSuccess(true);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return j;
	}
	
	@RequestMapping("franchise")
	public ModelAndView franchise(Model model,HttpServletRequest request) {
		//加盟动态
		TSCategoryEntity jmdtCategory = categoryService.findUniqueByProperty(TSCategoryEntity.class, "name", "加盟动态");
		if(jmdtCategory!=null){
			String sql = "select id,title,cover from zjky_article where find_in_set('"+jmdtCategory.getCode()+"',categoryid) order by weight desc,create_date desc limit 3; ";
			List<ZjkyArticleEntity> jmdtArticle = zjkyArticleService.findListbySql(sql);
			if(jmdtArticle!=null) model.addAttribute("jmdtArticle", jmdtArticle);
		}
		return new ModelAndView("web/join");
	}
	
	/**
	 * 加盟
	 * @param franchiseEntity
	 * @param request
	 * @return
	 */
	@RequestMapping(value="franchise/save",method=RequestMethod.POST)
	@ResponseBody
	public AjaxJson franchiseSave(ZjkyFranchiseEntity franchiseEntity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		j.setSuccess(false);
		
		if(franchiseEntity!=null){
			franchiseEntity.setCreateDate(new Date());
			franchiseEntity.setReadyState("weichuli");
			try {
				zjkyFranchiseService.save(franchiseEntity);
				j.setSuccess(true);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return j;
	}
	
	@RequestMapping("mba_plan")
	public ModelAndView mbaPlan(@RequestParam(value="hasNav",required=false,defaultValue="false") String hasNav, Model model) {
		TSCategoryEntity qmghCategory = categoryService.findUniqueByProperty(TSCategoryEntity.class, "name", "全年规划");
		if(qmghCategory!=null){
			List<Object> mbaArticles = new ArrayList<Object>();
			for(TSCategoryEntity categoryEntity : qmghCategory.getList()){
				List<Object> obj2 = new ArrayList<Object>();
				for(TSCategoryEntity categoryEntity2 : categoryEntity.getList()){
					String sql = "select id,title from zjky_article where find_in_set('"+categoryEntity2.getCode()+"',categoryid) order by weight desc,create_date desc limit 8; ";
					List<ZjkyArticleEntity> articles = zjkyArticleService.findListbySql(sql);
					obj2.add(articles);
				}
				mbaArticles.add(obj2);
			}
			model.addAttribute("mbaArticles", mbaArticles);
		}
		return new ModelAndView("web/mba_plan");
	}

	
}
