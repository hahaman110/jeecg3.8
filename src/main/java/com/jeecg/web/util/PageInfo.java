package com.jeecg.web.util;

import java.util.List;
/**
 * 分页信息工具类
 * @author zyd
 */
public class PageInfo {
	
	private long recordsTotal;     //记录总数
	private long recordsFiltered;  //过滤后的记录数量
	private int currentPage;       //当前页码
	private int pageSize;          //每页记录数
	private List<?> datas;         //当前页的记录数据
	private int pages;
	
	public int getPages() {
		return pages;
	}
	public void setPages() {
		double t = (recordsFiltered / pageSize);
		if (recordsFiltered % pageSize == 0)
			this.pages = (int) t;
		else
			this.pages = (int) t + 1;
	}
	
	public long getRecordsTotal() {
		return recordsTotal;
	}
	public void setRecordsTotal(long recordsTotal) {
		this.recordsTotal = recordsTotal;
	}
	public long getRecordsFiltered() {
		return recordsFiltered;
	}
	public void setRecordsFiltered(long recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List<?> getDatas() {
		return datas;
	}
	public void setDatas(List<?> datas) {
		this.datas = datas;
	}
	
}
