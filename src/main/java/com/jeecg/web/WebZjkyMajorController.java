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
import org.jeecgframework.web.system.pojo.base.TSType;
import org.jeecgframework.web.system.pojo.base.TSTypegroup;
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
import com.jeecg.zjkyschool.service.ZjkySchoolServiceI;
/**   
 * @Title: Controller  
 * @Description: 资讯
 * @author onlineGenerator
 * @date 2018-10-24 16:07:45
 * @version V1.0   
 * http://localhost:8080/jeecg3.8/web/zjkyarticle/home
 */
@Controller
@RequestMapping("/zjkymajor")
public class WebZjkyMajorController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(WebZjkyMajorController.class);
	private static final int pagesize = 20;
	
	@Autowired
	private ZjkyMajorServiceI zjkyMajorServiceI;
	@Autowired
	private ZjkySchoolServiceI zjkySchoolServiceI;
	@Autowired
	private JeecgMinidaoDao jeecgMinidaoDao;
	
	

	@RequestMapping
	public ModelAndView index(ZjkyMajorEntity majorEntity ,Integer page,Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		Map<String, Object> accurateParams = new HashMap<String, Object>();
		Map<String, Object> vagueParams = new HashMap<String, Object>();
		if(majorEntity!=null){
			if(StringUtil.isNotEmpty(majorEntity.getKind())) {
				accurateParams.put("kind", majorEntity.getKind());
				model.addAttribute("kind", majorEntity.getKind());
			}
			if(StringUtil.isNotEmpty(majorEntity.getType())) {
				accurateParams.put("type", majorEntity.getType());
				model.addAttribute("type", majorEntity.getType());
			}
			if(StringUtil.isNotEmpty(majorEntity.getName())) {
				String name = URLDecoder.decode(majorEntity.getName(),"utf-8");
				vagueParams.put("name", name);
				model.addAttribute("name", name);
			}
		}
		
		PageInfo pageInfo = zjkyMajorServiceI.findPage(ZjkyMajorEntity.class, (page==null?1:page), pagesize, accurateParams, vagueParams, null, " id desc ");
		model.addAttribute("pageInfo", pageInfo);

		
		TSTypegroup majorkindTg = ResourceUtil.getCacheTypeGroup("majorkind");//获取专业门类
		TSTypegroup majortypeTg = ResourceUtil.getCacheTypeGroup("majortype");//获取专业分类
		model.addAttribute("majorkindTg", majorkindTg);
		model.addAttribute("majortypeTg", majortypeTg);
		
		Map<String, String> typemap = new HashMap<String, String>();
        for (TSType type : majorkindTg.getTSTypes()) {
        	typemap.put(type.getTypecode(), type.getTypename());
        }
        for (TSType type : majortypeTg.getTSTypes()) {
        	typemap.put(type.getTypecode(), type.getTypename());
        }
        model.addAttribute("typemap", typemap);
        
        //开设院校数量map
        Map<Long, String> scmjcountmap = new HashMap<Long, String>();
        for (Object obj : pageInfo.getDatas()) {
        	ZjkyMajorEntity zjkyMajorEntity = (ZjkyMajorEntity)obj;
        	Long count = zjkySchoolServiceI.getCountForJdbcParam("select count(DISTINCT(schoolid)) from zjky_school_major where majorid= ?", new Object[]{zjkyMajorEntity.getId()});
        	scmjcountmap.put(Long.parseLong(zjkyMajorEntity.getId()+""), count+"");
        }
        model.addAttribute("scmjcountmap", scmjcountmap);
        
        
		return new ModelAndView("web/professional");
	}
	
	
	@RequestMapping("majorschools")
	public ModelAndView majorschools(String majorid, String city,Model model,HttpServletRequest request) {
    	Long count = zjkySchoolServiceI.getCountForJdbcParam("select count(DISTINCT(schoolid)) from zjky_school_major where majorid= ?", majorid);
    	model.addAttribute("count", count);
    	
    	ZjkyMajorEntity major = zjkyMajorServiceI.getEntity(ZjkyMajorEntity.class, Integer.parseInt(majorid));
    	if(major!=null) model.addAttribute("major", major);
    	
    	List<Map<String, String>> citys=jeecgMinidaoDao.getProCity("1");
		model.addAttribute("citys", citys);
		
		Map<String, String> citymap = new HashMap<String, String>();
		for(Map c : citys){
			citymap.put(c.get("id").toString(), c.get("name").toString());
		}
		model.addAttribute("citymap", citymap);
		
		StringBuffer sb = new StringBuffer();
		sb.append("select sm.enrollmentyear,s.city,s.name,sm.department,s.id from zjky_school_major sm,zjky_school s where sm.schoolid=s.id and sm.majorid="+majorid+" ");
		if(StringUtil.isNotEmpty(city)) {
			sb.append("and s.city="+city);
			model.addAttribute("city", city);
		}
		sb.append(" limit 15;");
		
		List<Object> majorschoolList = zjkyMajorServiceI.findListbySql(sb.toString());
		if(majorschoolList!=null) model.addAttribute("majorschoolList", majorschoolList);
		return new ModelAndView("web/profess_list");
	}
	
	

	
}
