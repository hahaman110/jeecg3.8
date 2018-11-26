package com.jeecg.zjkyfranchise.service;
import com.jeecg.zjkyfranchise.entity.ZjkyFranchiseEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface ZjkyFranchiseServiceI extends CommonService{
	
 	public void delete(ZjkyFranchiseEntity entity) throws Exception;
 	
 	public Serializable save(ZjkyFranchiseEntity entity) throws Exception;
 	
 	public void saveOrUpdate(ZjkyFranchiseEntity entity) throws Exception;
 	
}
