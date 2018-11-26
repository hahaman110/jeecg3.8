package com.jeecg.zjkyschoolmajor.service;
import com.jeecg.zjkyschoolmajor.entity.ZjkySchoolMajorEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface ZjkySchoolMajorServiceI extends CommonService{
	
 	public void delete(ZjkySchoolMajorEntity entity) throws Exception;
 	
 	public Serializable save(ZjkySchoolMajorEntity entity) throws Exception;
 	
 	public void saveOrUpdate(ZjkySchoolMajorEntity entity) throws Exception;
 	
}
