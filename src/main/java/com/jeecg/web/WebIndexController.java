package com.jeecg.web;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.web.system.pojo.base.TSCategoryEntity;
import org.jeecgframework.web.system.pojo.base.TSTypegroup;
import org.jeecgframework.web.system.service.CategoryServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jeecg.zjkyarticle.entity.ZjkyArticleEntity;
import com.jeecg.zjkyarticle.service.ZjkyArticleServiceI;
import com.jeecg.zjkyfranchise.service.ZjkyFranchiseServiceI;
import com.jeecg.zjkymajor.entity.ZjkyMajorEntity;
import com.jeecg.zjkymajor.service.ZjkyMajorServiceI;
import com.jeecg.zjkyreserve.service.ZjkyReserveServiceI;
import com.jeecg.zjkyschool.service.ZjkySchoolServiceI;
/**
 * 首页
 * @author ASUS
 *
 */
@Controller
@RequestMapping("/index")
public class WebIndexController extends BaseController {

	@Autowired
	private ZjkyArticleServiceI zjkyArticleService;
	@Autowired
	private ZjkySchoolServiceI zjkySchoolServiceI;
	@Autowired
	private ZjkyMajorServiceI zjkyMajorServiceI;
	@Autowired
	private CategoryServiceI categoryService;
	@Autowired
	private ZjkyFranchiseServiceI zjkyFranchiseService;
	@Autowired
	private ZjkyReserveServiceI zjkyReserveService;


	@RequestMapping
	public ModelAndView index(Model model,HttpServletRequest request) {
		TSTypegroup majorkindTg = ResourceUtil.getCacheTypeGroup("majorkind");//获取专业分类
		model.addAttribute("majorkindTg", majorkindTg);
		
		//同時是211和985的院校
		String sql = "select id,name from zjky_school where find_in_set('211',attribute) and find_in_set('985',attribute) limit 10; ";
		List schoolsBy211985List = zjkyArticleService.findListbySql(sql);
		if(schoolsBy211985List!=null) model.addAttribute("schoolsBy211985List", schoolsBy211985List);
		
		//找信息
		TSCategoryEntity zxTSCategory = categoryService.findUniqueByProperty(TSCategoryEntity.class, "name", "资讯分类");
		CriteriaQuery cq = new CriteriaQuery(TSCategoryEntity.class);
		cq.createAlias("parent", "parent");
		cq.add(Restrictions.eq("parent.code", zxTSCategory.getCode()));
		List<TSCategoryEntity> articleCatogorys = categoryService.getListByCriteriaQuery(cq, false);
		model.addAttribute("articleCatogorys", articleCatogorys);
		
		//备考中心
		Map<String, List> bkzxlisMap = new HashMap<String, List>();
		TSCategoryEntity bkzxCategory = categoryService.findUniqueByProperty(TSCategoryEntity.class, "name", "备考中心");
		if(bkzxCategory!=null){//备考中心
			for (TSCategoryEntity bkzxCategory2:bkzxCategory.getList()) {
				if(bkzxCategory2!=null){//公开课...
					for (TSCategoryEntity bkzxCategory3:bkzxCategory2.getList()) {
						sql = "select id,title,cover from zjky_article where find_in_set('"+bkzxCategory3.getCode()+"',categoryid) order by weight desc,create_date desc limit 6; ";
						bkzxlisMap.put(bkzxCategory3.getCode(), zjkyArticleService.findListbySql(sql));
					}
				}	
			}
		}
		model.addAttribute("bkzxCategory", bkzxCategory);
		model.addAttribute("bkzxlisMap", bkzxlisMap);
		
		//专业硕士
		Map<String, List> zysslisMap = new HashMap<String, List>();
		TSCategoryEntity zyssCategory = categoryService.findUniqueByProperty(TSCategoryEntity.class, "name", "专业硕士");
		if(zyssCategory!=null){
			for (TSCategoryEntity zyssCategory2:zyssCategory.getList()) {
				if(zyssCategory2!=null){
					for (TSCategoryEntity zyssCategory3:zyssCategory2.getList()) {
						sql = "select id,title,cover from zjky_article where find_in_set('"+zyssCategory3.getCode()+"',categoryid) order by weight desc,create_date desc limit 6; ";
						zysslisMap.put(zyssCategory3.getCode(), zjkyArticleService.findListbySql(sql));
					}
				}	
			}
			
		}
		model.addAttribute("zyssCategory", zyssCategory);
		model.addAttribute("zysslisMap", zysslisMap);
		
		//热门专业
		sql = "select id,name from zjky_major ORDER BY RAND() LIMIT 7; ";
		model.addAttribute("majorsHot", zjkyMajorServiceI.findListbySql(sql));
		
		//集训营
		TSCategoryEntity jxyCategory = categoryService.findUniqueByProperty(TSCategoryEntity.class, "name", "集训营");
		if(jxyCategory!=null){
			sql = "select id,title,cover from zjky_article where find_in_set('"+jxyCategory.getCode()+"',categoryid) order by weight desc,create_date desc limit 3; ";
			List<ZjkyArticleEntity> jxyArticle = zjkyArticleService.findListbySql(sql);
			if(jxyArticle!=null) model.addAttribute("jxyArticle", jxyArticle);
		}
		
		return new ModelAndView("web/index");
		
		//会计硕士开设专业
		/*CriteriaQuery cq2 = new CriteriaQuery(ZjkyMajorEntity.class);
		cq2.add(Restrictions.eq("name", "会计"));
		cq2.setPageSize(1);
		List<ZjkyMajorEntity> kjssMajor = zjkySchoolServiceI.getListByCriteriaQuery(cq2, true);
		if(kjssMajor!=null && kjssMajor.size()>0){
			sql = "select id,name from zjky_school where id in (select schoolid from zjky_school_major where majorid="+kjssMajor.get(0).getId()+") limit 10; ";
			model.addAttribute("schoolsByKjss", zjkySchoolServiceI.findListbySql(sql));
		}*/
		
		//备考中心notice 点击量排名
		/*sql = "select id,title,cover from zjky_article where find_in_set('"+zyssCategory.getCode()+"',categoryid) order by readnum desc,create_date desc limit 3; ";
		bkzxlisMap.put("zyssReadNum", zjkyArticleService.findListbySql(sql));*/
		
	}
	
	
	
}
