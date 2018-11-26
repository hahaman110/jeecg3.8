package org.jeecgframework;

import org.apache.commons.httpclient.NameValuePair;
import org.junit.Test;

import com.jeecg.web.util.FetchWebData;

public class SimpleTest{
	
	
	
	@Test
	public void test1() throws Exception {
		FetchWebData fd = new FetchWebData();
		fd.setEncoding("utf-8");
		
		NameValuePair[] nameValuePairs = new NameValuePair[]{
				new NameValuePair("name", "shops"),
				new NameValuePair("geotype", "1"),
				new NameValuePair("is_published", "1"),
				new NameValuePair("ak","ikVpT6rd4N9CXF06Vf9mKlvIGUHiUZhA")
		};
        
		String detailCon = fd.getGzipPostContent("http://api.map.baidu.com/geodata/v3/geotable/create", null, nameValuePairs);
		System.out.println(detailCon);
	}
	
	@Test
	public void test2() throws Exception {
		FetchWebData fd = new FetchWebData();
		fd.setEncoding("utf-8");
        
		String detailCon = fd.getGzipContent("http://api.map.baidu.com/geodata/v3/geotable/list?ak=ikVpT6rd4N9CXF06Vf9mKlvIGUHiUZhA", null);
		System.out.println(detailCon);
	}
	
	@Test
	public void test3() throws Exception {
		FetchWebData fd = new FetchWebData();
		fd.setEncoding("utf-8");
		
		NameValuePair[] nameValuePairs = new NameValuePair[]{
				new NameValuePair("name", "shops2"),
				new NameValuePair("geotype", "1"),
				new NameValuePair("id", "196232"),
				new NameValuePair("ak","ikVpT6rd4N9CXF06Vf9mKlvIGUHiUZhA")
		};
        
		String detailCon = fd.getGzipPostContent("http://api.map.baidu.com/geodata/v3/geotable/update", null, nameValuePairs);
		System.out.println(detailCon);
	}
	
	
	
	
	
	
	
	
	@Test
	public void test4() throws Exception {
		FetchWebData fd = new FetchWebData();
		fd.setEncoding("utf-8");
        
		String detailCon = fd.getGzipContent("http://api.map.baidu.com/geodata/v3/geotable/detail?id=196353&ak=nG5RzAGCRocdmFKXdEVH8k7FsgVU0xBL", null);
		System.out.println(detailCon);
	}
	
	
	@Test
	public void test5() throws Exception {
		FetchWebData fd = new FetchWebData();
		fd.setEncoding("utf-8");
		
		NameValuePair[] nameValuePairs = new NameValuePair[]{
				new NameValuePair("title", "shops2"),
				new NameValuePair("Address", "shops2"),
				new NameValuePair("tags", "shops2"),
				new NameValuePair("latitude", ""),
				new NameValuePair("longitude", ""),
				new NameValuePair("coord_type", "1"),
				new NameValuePair("Geotable_id", "1"),
				new NameValuePair("ak","nG5RzAGCRocdmFKXdEVH8k7FsgVU0xBL")
		};
        
		String detailCon = fd.getGzipPostContent("http://api.map.baidu.com/geodata/v3/poi/create", null, nameValuePairs);
		System.out.println(detailCon);
	}
	
	
}
