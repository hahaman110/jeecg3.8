package com.jeecg.zjkymajor.service;
import com.jeecg.zjkymajor.entity.ZjkyMajorEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface ZjkyMajorServiceI extends CommonService{
	
 	public void delete(ZjkyMajorEntity entity) throws Exception;
 	
 	public Serializable save(ZjkyMajorEntity entity) throws Exception;
 	
 	public void saveOrUpdate(ZjkyMajorEntity entity) throws Exception;
 	
}
