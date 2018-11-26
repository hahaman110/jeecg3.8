package com.jeecg.zjkyreserve.service;
import com.jeecg.zjkyreserve.entity.ZjkyReserveEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface ZjkyReserveServiceI extends CommonService{
	
 	public void delete(ZjkyReserveEntity entity) throws Exception;
 	
 	public Serializable save(ZjkyReserveEntity entity) throws Exception;
 	
 	public void saveOrUpdate(ZjkyReserveEntity entity) throws Exception;
 	
}
