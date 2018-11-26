package com.jeecg.zjkyarticle.service;
import java.io.Serializable;
import java.util.Map;

import org.jeecgframework.core.common.service.CommonService;

import com.jeecg.web.util.PageInfo;
import com.jeecg.zjkyarticle.entity.ZjkyArticleEntity;

public interface ZjkyArticleServiceI extends CommonService{
	
 	public void delete(ZjkyArticleEntity entity) throws Exception;
 	
 	public Serializable save(ZjkyArticleEntity entity) throws Exception;
 	
 	public void saveOrUpdate(ZjkyArticleEntity entity) throws Exception;

}
