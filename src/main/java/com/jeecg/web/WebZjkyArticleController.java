package com.jeecg.web;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.web.system.pojo.base.TSCategoryEntity;
import org.jeecgframework.web.system.service.CategoryServiceI;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jeecg.web.util.PageInfo;
import com.jeecg.zjkyarticle.entity.ZjkyArticleEntity;
import com.jeecg.zjkyarticle.service.ZjkyArticleServiceI;
/**   
 * @Title: Controller  
 * @Description: 资讯
 * @author onlineGenerator
 * @date 2018-10-24 16:07:45
 * @version V1.0   
 * http://localhost:8080/jeecg3.8/web/zjkyarticle/home
 */
@Controller
@RequestMapping("/zjkyarticle")
public class WebZjkyArticleController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(WebZjkyArticleController.class);
	private static final int pagesize = 5;
	
	@Autowired
	private ZjkyArticleServiceI zjkyArticleService;
	@Autowired
	private CategoryServiceI categoryService;
	

	/**
	 * 资讯列表 页面跳转
	 * 
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping
	public ModelAndView index(Integer page, String categoryid, String title, Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		if(page==null) page = 1;
		
		String where = "";
		if(StringUtil.isNotEmpty(categoryid)){
			where = " find_in_set('"+categoryid+"',categoryid)>0";//用sql查询可以不加>0  用hql的话必须加
			model.addAttribute("categoryid", categoryid);
		}
		
		Map<String, Object> vagueParams = new HashMap<String, Object>();
		if(StringUtil.isNotEmpty(title)) {
			title = URLDecoder.decode(title,"utf-8");
			vagueParams.put("title", title);
			model.addAttribute("title", title);
		}
		
		PageInfo pageInfo = zjkyArticleService.findPage(ZjkyArticleEntity.class, page, pagesize, null, vagueParams, where, " id desc ");
		model.addAttribute("pageInfo", pageInfo);
		
		TSCategoryEntity zxTSCategory = categoryService.findUniqueByProperty(TSCategoryEntity.class, "name", "资讯分类");
		CriteriaQuery cq = new CriteriaQuery(TSCategoryEntity.class);
		cq.createAlias("parent", "parent");
		cq.add(Restrictions.eq("parent.code", zxTSCategory.getCode()));
		List<TSCategoryEntity> zxTSCategorys = categoryService.getListByCriteriaQuery(cq, false);
		model.addAttribute("zxTSCategorys", zxTSCategorys);
		
		return new ModelAndView("web/article_list");
	}
	
	@RequestMapping("/article_detail/{id}")
	public ModelAndView article_detail(@PathVariable String id, Model model,HttpServletRequest request) {
		ZjkyArticleEntity article = zjkyArticleService.getEntity(ZjkyArticleEntity.class, Integer.parseInt(id));
		if(article!=null){//填充分类导航
			
			String readNum = StringUtil.isEmpty(article.getReadnum())?"1":(Integer.parseInt(article.getReadnum())+1)+"";
			article.setReadnum(readNum);
			try {
				zjkyArticleService.saveOrUpdate(article);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String sql = "select c.name,c.code from t_s_category c left join zjky_article a on find_in_set(c.code,a.categoryid)  where a.id="+id;
			List<Object> categorys = zjkyArticleService.findListbySql(sql);
			if(categorys!=null) model.addAttribute("categorys", categorys);
		}
		
		//上一条
		String sql = "select id,title from zjky_article where id<"+id+" order by id desc limit 1;";
		List<Object> preArticle  = zjkyArticleService.findListbySql(sql);
		if(preArticle!=null && preArticle.size()>0) model.addAttribute("preArticle", preArticle.get(0));
		
		//下一条
		sql = "select id,title from zjky_article where id>"+id+" order by id asc limit 1;";
		List<Object> nextArticle  = zjkyArticleService.findListbySql(sql);
		if(nextArticle!=null && nextArticle.size()>0) model.addAttribute("nextArticle", nextArticle.get(0));
		
		model.addAttribute("article", article);
		return new ModelAndView("web/article_detail");
	}
	
	@RequestMapping("/article_side")
	public ModelAndView article_side(Model model,HttpServletRequest request) {
		
		String sql = "select id,cover,title,create_date from zjky_article order by weight desc,create_date desc limit 4; ";
		List<ZjkyArticleEntity> rmtjArticle = zjkyArticleService.findListbySql(sql);
		if(rmtjArticle!=null) model.addAttribute("rmtjArticle", rmtjArticle);
	
		sql = "select id,title from zjky_article order by create_date desc limit 7; ";
		List<ZjkyArticleEntity> zxzxArticle = zjkyArticleService.findListbySql(sql);
		if(zxzxArticle!=null) model.addAttribute("zxzxArticle", zxzxArticle);
		
		return new ModelAndView("web/article_side");
	}
	
	@RequestMapping("/profess_side")
	public ModelAndView profess_side(Model model,HttpServletRequest request) {
		/*SELECT * FROM zjky_article WHERE LOCATE(',A04,',concat(',',categoryid,','))>0
		select * from zjky_article where find_in_set('A04',categoryid); */
		
		TSCategoryEntity kyglCategory = categoryService.findUniqueByProperty(TSCategoryEntity.class, "name", "考研攻略");
		if(kyglCategory!=null){
			String sql = "select id,title from zjky_article where find_in_set('"+kyglCategory.getCode()+"',categoryid) order by weight desc,create_date desc limit 5; ";
			List<ZjkyArticleEntity> kyglArticle = zjkyArticleService.findListbySql(sql);
			if(kyglArticle!=null) model.addAttribute("kyglArticle", kyglArticle);
		}
		
		TSCategoryEntity dxphbCategory = categoryService.findUniqueByProperty(TSCategoryEntity.class, "name", "院校排行榜");
		if(dxphbCategory!=null){
			String sql = "select id,title from zjky_article where find_in_set('"+dxphbCategory.getCode()+"',categoryid) order by weight desc,create_date desc limit 7; ";
			List<ZjkyArticleEntity> dxphbArticle = zjkyArticleService.findListbySql(sql);
			if(dxphbArticle!=null) model.addAttribute("dxphbArticle", dxphbArticle);
		}
		
		return new ModelAndView("web/profess_side");
	}

	
}
