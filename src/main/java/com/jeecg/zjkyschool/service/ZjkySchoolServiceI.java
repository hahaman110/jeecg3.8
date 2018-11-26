package com.jeecg.zjkyschool.service;
import com.jeecg.zjkyschool.entity.ZjkySchoolEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface ZjkySchoolServiceI extends CommonService{
	
 	public void delete(ZjkySchoolEntity entity) throws Exception;
 	
 	public Serializable save(ZjkySchoolEntity entity) throws Exception;
 	
 	public void saveOrUpdate(ZjkySchoolEntity entity) throws Exception;
 	
}
