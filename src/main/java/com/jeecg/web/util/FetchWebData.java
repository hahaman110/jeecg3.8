package com.jeecg.web.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.net.MalformedURLException;
import java.nio.charset.Charset;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.GZIPInputStream;
import java.util.zip.InflaterInputStream;

import org.apache.commons.httpclient.ConnectionPoolTimeoutException;
import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HostConfiguration;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpConnection;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpConnectionManagerParams;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.http.util.ByteArrayBuffer;

import com.fd.CommonUtil;
import com.fd.ConfigUtil;
import com.fd.MyHttpConnectionManager;

/**
 * 
 * @author zhaoyunde
 * @Description: HttpClient封装类：依赖了一个自定义的MyFD.jar，暂时放在lib下 以后可放在maven私有仓库
 * @date 2016年3月15日
 */
public class FetchWebData 
{
	private HttpClient client;   
    private GetMethod get;
    private PostMethod method;
    public static final String defaultUserAgent = "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0";
    private String userAgent = defaultUserAgent;
    private String encoding;
    private String referer = "http://www.baidu.com";
    private Cookie[] cookies;
    private String strCookie;
	private int RetryNum;
	private int timeoutMs; // each FetchWebData instance can have its own timeout in milliseconds
	
	private boolean isVerboseUrl = true; // whether each url passed here is shown
	public void setVerboseUrl(boolean value) { this.isVerboseUrl = value; }
	
	private HashMap<Integer, Boolean> httpRetryModeMap = new HashMap<Integer, Boolean>();
	public void setRetryMode(int code, boolean shouldRetry) { httpRetryModeMap.put(code, shouldRetry); }
	{ setRetryMode(404, false); }
	
	private HashSet<Integer> acceptedHttpStatuses = new HashSet<Integer>(); // http status codes in this set are considered ok, and the entity content is returned by getGzipContentAPI
	public void addAcceptedHttpStatus(int code) { acceptedHttpStatuses.add(code); }
	
	// NOTE: Although HttpState.getCookies() currently returns a newly created cookie array, the underlying cookies may still be modified.
	// Consequently, the cookie information should be consumed immediately after issuing a request, usually by using getCookiesTxtStr() instead.
    //public Cookie[] getCookies() { return cookies; } // meant to be passed to aria2c, etc.
    
    public String getCookiesTxtStr() {
    	StringBuilder buf = new StringBuilder();
    	for (Cookie cookie: cookies) {
    		// See http://blog.omnux.com/index.php/2008/03/25/cookiestxt-file-format/; escaping is handled by the application layer.
    		buf.append(cookie.getDomain());  buf.append('\t');
    		buf.append("TRUE\t"); // whether the cookie is usable in subdomains
    		buf.append(cookie.getPath());  buf.append('\t');
    		buf.append(cookie.getSecure() ? "TRUE" : "FALSE");  buf.append('\t');
    		Date expiryDate = cookie.getExpiryDate();
    		buf.append(expiryDate != null ? expiryDate.getTime() / 1000 : 0L);  buf.append('\t');
    		buf.append(cookie.getName());  buf.append('\t');
    		buf.append(cookie.getValue());  buf.append('\n');
    	}
    	return buf.toString();
    }

    // All connections from this manager are not affected by Heritrix's recording facilities, which allows
    // only one open connection (even free ones) per thread.
    // MultiThreadedHttpConnectionManager
    public static class NonRecordingConnectionManager extends MyHttpConnectionManager { 
    	NonRecordingConnectionManager() {
    		HttpConnectionManagerParams params = this.getParams();
    		params.setConnectionTimeout(90000);
    		params.setSoTimeout(90000);
    		params.setMaxConnectionsPerHost(HostConfiguration.ANY_HOST_CONFIGURATION, 100);
    		params.setMaxTotalConnections(1000);
    	}

    	private static class UsedConnectionInfo {
    		String getTimeStr;
    		Thread thread;
    		StackTraceElement[] stackTrace;
    	}
    	
    	private ConcurrentHashMap<HttpConnection, UsedConnectionInfo> connInfos = new ConcurrentHashMap<HttpConnection, UsedConnectionInfo>();
    	private final boolean recordConnInfo = false;
    	
		protected HttpConnection doGetConnection(
				HostConfiguration hostConfiguration, long timeout)
				throws ConnectionPoolTimeoutException {
			long firstTimeout = 1000L; if (timeout != 0L && timeout < firstTimeout) firstTimeout = timeout;
			HttpConnection conn;
			try {
				conn = super.doGetConnection(hostConfiguration, firstTimeout); // not wrapped
			} catch (ConnectionPoolTimeoutException ex) {
				if (timeout == firstTimeout) throw ex;
				else {
					System.err.println("Calling System.gc() while waiting for connection.");
					System.gc(); // in case a connection is leaked somewhere; this would be defeated if recordConnInfo is true.
					conn = super.doGetConnection(hostConfiguration, timeout);
				}
			}
			UsedConnectionInfo connInfo = new UsedConnectionInfo();
			connInfo.getTimeStr = new Date(System.currentTimeMillis()).toString();
			connInfo.thread = Thread.currentThread(); connInfo.stackTrace = connInfo.thread.getStackTrace();
			if (recordConnInfo) connInfos.put(conn, connInfo);
			//System.err.println("NonRecordingConnectionManager: getConnection: " + conn.toString());
			//Thread.dumpStack();
			return conn;
		}

		@Override
		protected void doReleaseConnection(HttpConnection conn) { // conn is also not wrapped
			super.doReleaseConnection(conn);
			//System.err.println("NonRecordingConnectionManager: releaseConnection: " + conn.toString());
			if (recordConnInfo) {
				UsedConnectionInfo connInfo = connInfos.remove(conn);
				if (connInfo == null)
					System.err.println("NonRecordingConnectionManager: releasing unknown connection");
			}
		}
    	
    }    
    
    private static NonRecordingConnectionManager connMan = new NonRecordingConnectionManager();
    
    private boolean isNoCache = true;
    public void setNoCache(boolean isNoCache) { this.isNoCache = isNoCache; }
    
    /**
	 * @return the strCookie
	 */
	public String getStrCookie() {
		return strCookie;
	}

	/**
	 * @param strCookie the strCookie to set
	 */
	public void setStrCookie(String strCookie) {
		this.strCookie = strCookie;
	}

	/**
	 * @return the encoding
	 */
	public String getEncoding() {
		return encoding;
	}

	/**
	 * @param encoding the encoding to set
	 */
	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}	
	

	/**
	 * @return the userAgent
	 */
	public String getUserAgent() {
		return userAgent;
	}

	/**
	 * @param userAgent the userAgent to set
	 */
	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	/**
	 * @return the referer
	 */
	public String getReferer() {
		return referer;
	}

	/**
	 * @param referer the referer to set
	 */
	public void setReferer(String referer) {
		this.referer = referer;
	}

	public FetchWebData() { this(3, 90000); }
	public FetchWebData(int retryNum, int timeoutMs)
    {
		this.RetryNum = retryNum;
		this.timeoutMs = timeoutMs;
		this.client = new HttpClient(connMan);

		// FIXME: how to set the connection timeout for a single connection, without affecting the entire connection manager?
		//this.client.getParams().setConnectionManagerTimeout(timeoutMs); // should be the timeout passed to the connection manager; only appears to wait for a free slot in the connection pool, not for the target host
        //this.client.getParams().setContentCharset(this.getEncoding());
        //this.client.getParams().setHttpElementCharset(this.getEncoding());
        
		// These are just defaults, and are now set in the constructor of the connectionmanager for thread safety
//      this.client.getHttpConnectionManager().getParams().setConnectionTimeout(timeoutMs);   
//    	this.client.getHttpConnectionManager().getParams().setSoTimeout(timeoutMs);  
        //set cookie policy
        this.client.getParams().setCookiePolicy(CookiePolicy.BROWSER_COMPATIBILITY);   
        //set single cookie
        this.client.getParams().setParameter("http.protocol.single-cookie-header",true);
    }
	
	public void ignoreCookies() {
		this.client.getParams().setCookiePolicy(CookiePolicy.IGNORE_COOKIES);
	}
	
	// Should be called when the proxy might be needed for the site; only actually used if isProxyEnabled is true.
	public void enableProxy() {
		if (!ConfigUtil.isProxyEnabled()) return;
		HostConfiguration hostConf = this.client.getHostConfiguration();
		hostConf.setProxy(ConfigUtil.proxyHost, ConfigUtil.proxyPort);
	}
    
    //set GetMethod
    public void setGetMethod(String url,String referer) 
    { 
    	if (this.get != null) this.get.releaseConnection();
        this.get = new GetMethod(url);
        this.get.getParams().setSoTimeout(this.timeoutMs);
        this.get.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, 
        		new DefaultHttpMethodRetryHandler(10,false));
        
        //set encoding
        if(this.getEncoding()!=null && !this.getEncoding().equals("")){
        	this.get.getParams().setContentCharset(this.getEncoding());
        }
        
//        System.out.println("User-Agent: " + userAgent);
        this.get.setRequestHeader("User-Agent", this.getUserAgent()); 
        this.get.setRequestHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"); 
        if(referer!=null&& !referer.equals("")){
        	this.get.setRequestHeader("Referer", referer);
        }         
        //this.get.setRequestHeader("Accept-Charset", "GB2312,utf-8;q=0.7,*;q=0.7"); 
        this.get.setRequestHeader("Accept-Language", "zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3"); 
        this.get.setRequestHeader("Accept-Encoding", "gzip"); // what is sdch?  We are currently unable to handle deflate properly 
        if (isNoCache) {
        	this.get.setRequestHeader("Cache-Control", "no-cache"); 
            this.get.setRequestHeader("Pragma","no-cache");
            this.get.setRequestHeader("Cache-Control", "max-age=0"); 
        }

        this.get.setRequestHeader("Connection", "keep-alive"); 
        if(this.getStrCookie()!=null&& !this.getStrCookie().equals("")){
        	 this.get.setRequestHeader("Cookie", this.getStrCookie());   
        }
    } 
    
    @SuppressWarnings("deprecation")
	public void setPostMethod(String url,String referer, NameValuePair[] pairs,int flag,InputStream is,String body) 
    {
       this.method = new PostMethod(url);
       
       this.method.getParams().setSoTimeout(this.timeoutMs);
       if(this.getEncoding()!=null && !this.getEncoding().equals("")){
    	   this.method.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,this.getEncoding());     	   
       }
       
       if(flag==2){
    	   //Content-Type: application/binary
    	   this.method.setRequestBody(is);
    	   this.method.setRequestHeader("Content-Type", "application/binary");     	   
       }
       
       if(flag==3){
    	   this.method.setRequestBody(body);//Content-Type: APPLICATION/OCTET-STREAM;charset=UTF-8
    	   this.method.setRequestHeader("Content-Type", "APPLICATION/OCTET-STREAM;charset=UTF-8");     	 
       }
       
       if(flag==1){
    	   this.method.setRequestBody(pairs);
       }
       
       this.method.setRequestHeader("User-Agent", userAgent); 
   	   this.method.setRequestHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");

        
       this.method.setRequestHeader("Accept-Encoding", "gzip"); 
       if(referer!=null && !"".equals(referer)){
    	   this.method.setRequestHeader("Referer", referer);
       }
      // String cookieStr = "rtime=0; ltime="+System.currentTimeMillis()+"; cnzz_eid=16218498-1335353134-; CNZZDATA1444=cnzz_eid=4835648-1337258643-&ntime=1339054608&cnzz_a=13&retime=1339054753943&sin=none&ltime=1339054753943&rtime=7; mainurl=www.2kan8.com; validate_c=JSESSIONID=2D80510B751F5901374475D07F1D7AF2";
       if(this.getStrCookie()!=null&& !this.getStrCookie().equals("")){
    	   this.method.setRequestHeader("Cookie", this.getStrCookie());
       }
    }
    
    
    //get content
    public String get(String URL,String referer){
    	//set parameter
    	setGetMethod(URL,referer);    	
    	String strRs = null;
    	int status=0;    	
    	int RetryNum = 5;
    	InputStream ins = null, rawIns = null;
    	for(int k=1;k<=RetryNum;k++){
	    	try {
	            status = client.executeMethod(this.get);
	            if(status == HttpStatus.SC_OK){
	            	//strRs = this.get.getResponseBodyAsString();
	            	
	            	
	            	Header hr = get.getResponseHeader("Content-Encoding");  
	            	//System.out.println("hr="+hr);
	            	rawIns = get.getResponseBodyAsStream();
	            	byte[] headerBuf = new byte[1];
	            	rawIns.read(headerBuf);
	            	ins = rawIns;
	            	//ins = new GZIPInputStream(rawIns); 
	            	//System.out.println("charset=="+method.getResponseCharSet());
	            	
					BufferedReader br = new BufferedReader(new InputStreamReader(ins,this.getEncoding()));  
			        StringBuilder resBuffer = new StringBuilder();  
			        String resTemp = "";  
			        while((resTemp = br.readLine()) != null){  
			            resBuffer.append(resTemp);  
			        } 
			        
			        strRs = resBuffer.toString(); 
	            	
	            }
		     }catch (Exception e){
		    	 e.printStackTrace();
		     }finally {	    
		    	 if (this.get != null) this.get.releaseConnection();
		     }
		     
		     if(strRs!=null && !strRs.equals("")) break; 
    	}//end-for
	     
	    return strRs;	     
    }
    
    public int getStatus(String URL,String referer){
    	//set parameter
    	setGetMethod(URL,referer);   
    	
    	int status=0;
    	
    	try {
            status = client.executeMethod(this.get);
	    }catch (MalformedURLException e) {
	    	System.out.println("Url format!!");		    	
	    } catch (HttpException e) {
	    	 System.out.println("HttpException");
	    } catch (IOException e) {	
	    	 System.out.println("IOException");
	    } catch (Exception e){
	    	 e.printStackTrace();
	    } finally {
	    	if (this.get != null) this.get.releaseConnection();
	    }
	     
	    return status;
    }    
    
    //Get Gzip Content
    public String getGzipPostContent2(String URL,String referer,NameValuePair[] pairs,int flag,InputStream is,String body)
    {
    	//set parameter
    	this.setPostMethod(URL, referer, pairs,flag,is,body);   	
    	String strRs = null;
    	int status = 0;    	
    	InputStream ins = null;
    	
    	try {
            status = client.executeMethod(this.method);	 
            if(status == HttpStatus.SC_OK){
            	Header hr = method.getResponseHeader("Content-Encoding");            	
            	if(hr!=null){
					if(hr.getValue()!=null){
						ins = new GZIPInputStream(method.getResponseBodyAsStream());
					}
				}else{
					ins = method.getResponseBodyAsStream();
				}
            	
            	//byte[] bst = InputStreamUtil.InputStreamTOByte(ins);
            	//System.out.println(bst.length);
            	/*Object obj = this.bytesToObject(bst);
            	System.out.println("Object =="+obj.toString());*/
            	
				BufferedReader br = new BufferedReader(new InputStreamReader(ins,"utf-8"));  
		        StringBuilder resBuffer = new StringBuilder();  
		        String resTemp = "";  
		        while((resTemp = br.readLine()) != null){  
		            resBuffer.append(resTemp);  
		        } 
		        
		        strRs = resBuffer.toString(); 
            }
	    }catch (MalformedURLException e) {
	    	System.out.println("Url format!!");		    	
	    } catch (HttpException e) {
	    	System.out.println("HttpException");		    	
	    } catch (IOException e) {	
	    	System.out.println("IOException");		    	
	    } catch (Exception e){
	    	 e.printStackTrace();
	    } finally {
	    	try {
	  		  if(ins!=null) ins.close();
	  		  //set cookies
	  		  cookies = client.getState().getCookies();
	          //client.getState().addCookies(cookies); // should be useless anyway...
	          if (this.get != null) this.get.releaseConnection();
	  		} catch (IOException e) {
	  			e.printStackTrace();
	  		}
    	}		    
    	
	    return strRs;	     
    }
    
    public byte[] getGzipPostContent3(String URL,String referer,NameValuePair[] pairs,int flag,InputStream is,String body)  {
    	//set parameter
    	this.setPostMethod(URL, referer, pairs,flag,is,body);   	
    	String strRs = null;
    	int status = 0;    	
    	InputStream ins = null;
    	byte[] b = new byte[20480];
    	
    	try {
            status = client.executeMethod(this.method);	 
            Header[] hs = method.getResponseHeaders();
            for(Header h :hs){
            	System.out.println(h.getName()+"--->"+h.getValue());
            }
            if(status == HttpStatus.SC_OK){
            	Header hr = method.getResponseHeader("Content-Encoding");            	
            	if(hr!=null){
					if(hr.getValue()!=null){
						ins = new GZIPInputStream(method.getResponseBodyAsStream());
					}
				}else{
					b = method.getResponseBody();
				}              	
				
            }
	    }catch (MalformedURLException e) {
	    	System.out.println("Url format!!");		    	
	    } catch (HttpException e) {
	    	System.out.println("HttpException");		    	
	    } catch (IOException e) {	
	    	System.out.println("IOException");		    	
	    } catch (Exception e){
	    	 e.printStackTrace();
	    } finally {
	          if (this.method != null) this.method.releaseConnection();
    	}		    
    	
	    return b;	     
    }
    
    public String getKXTPostContent(String url,String referer,String postContent){
    	//set parameter
    	this.setPostMethod(url, referer, null,3,null,postContent);   	
    	String strRs = null;
    	int status = 0;    	
    	InputStream ins = null, rawIns = null;
    	
    	try {
            status = client.executeMethod(this.method);	 
            if(status == HttpStatus.SC_OK || status == 302){            	
            	Header hr = method.getResponseHeader("Content-Encoding");  
            	//System.out.println("hr="+hr);
            	rawIns = method.getResponseBodyAsStream();
            	int val = rawIns.read();
            	if (val == 0) ins = rawIns; // not compressed; used e.g. when there is no result
            	else if (val == 1) ins = new GZIPInputStream(rawIns); 
            	else throw new RuntimeException("Unexpected KXT type byte: " + val);
            	//System.out.println("charset=="+method.getResponseCharSet());
            	
				BufferedReader br = new BufferedReader(new InputStreamReader(ins,this.getEncoding()));  
		        StringBuilder resBuffer = new StringBuilder();  
		        String resTemp = "";  
		        while((resTemp = br.readLine()) != null){  
		            resBuffer.append(resTemp);  
		        } 
		        
		        strRs = resBuffer.toString(); 
            }
	    }catch (MalformedURLException e) {
	    	System.out.println("Url format!!");		    	
	    } catch (HttpException e) {
	    	System.out.println("HttpException");		    	
	    } catch (IOException e) {	
	    	System.out.println("IOException");		    	
	    } catch (Exception e){
	    	 e.printStackTrace();
	    } finally {
	    	try {
	  		  if(ins!=null) ins.close(); // this should also close rawins
	  		  else rawIns.close();
	  		  //set cookies (?)
	  		  cookies = client.getState().getCookies();
	          //client.getState().addCookies(cookies);
	          if (this.get != null) this.get.releaseConnection();
	  		} catch (IOException e) {
	  			e.printStackTrace();
	  		}
    	}		    
    	
	    return strRs;	   
    }
    
    //Get Gzip Content
    public String getGzipPostContent(String URL,String referer,NameValuePair[] pairs)
    {
    	//set parameter
    	this.setPostMethod(URL, referer, pairs,1,null,null);   	
    	String strRs = null;
    	int status = 0;    	
    	InputStream ins = null;
    	
    	try {
            status = client.executeMethod(this.method);	 
            if(status == HttpStatus.SC_OK || status == 302){
            	
            	Header hr = method.getResponseHeader("Content-Encoding");            	
            	if(hr!=null){
					if(hr.getValue()!=null){
						ins = new GZIPInputStream(method.getResponseBodyAsStream());
					}
				}else{
					ins = method.getResponseBodyAsStream();
				}
				BufferedReader br = new BufferedReader(new InputStreamReader(ins,this.getEncoding()));  
		        StringBuilder resBuffer = new StringBuilder();  
		        String resTemp = "";  
		        while((resTemp = br.readLine()) != null){  
		            resBuffer.append(resTemp);  
		        } 
		        
		        strRs = resBuffer.toString(); 
            }
	    }catch (MalformedURLException e) {
	    	System.out.println("Url format!!");		    	
	    } catch (HttpException e) {
	    	System.out.println("HttpException");		    	
	    } catch (IOException e) {	
	    	System.out.println("IOException");		    	
	    } catch (Exception e){
	    	 e.printStackTrace();
	    } finally {
	    	try {
	  		  if(ins!=null) ins.close();
	  		  //set cookies (?)
	  		  cookies = client.getState().getCookies();
	          //client.getState().addCookies(cookies);
	          if (this.get != null) this.get.releaseConnection();
	  		} catch (IOException e) {
	  			e.printStackTrace();
	  		}
    	}		    
    	
	    return strRs;	     
    }
    
    public byte[] getGZipFile(String url,String referer){
    	//set parameter
    	setGetMethod(url,referer);    	
    	int status=0;    	
    	 byte[] data = null;
    	try {
            status = client.executeMethod(this.get);
            System.out.println(status);
            if(status == HttpStatus.SC_OK){
            	data = get.getResponseBody();				
            }
	    } catch (MalformedURLException e) {
	    	System.out.println("Url format!!");		    	
	    } catch (HttpException e) {
	    	System.out.println("HttpException");		    	
	    } catch (IOException e) {	
	    	System.out.println("IOException");		    	
	    } catch(Exception e){
	    	 e.printStackTrace();
	    } finally {	    	
	    	if (this.get != null) this.get.releaseConnection();
    	}
	    
	    return data;
    }
    
    public boolean isVerboseHeaders = false;
    
    // if needContent is false, we only check that the content is available, but don't actually fetch it.  Returns an empty string upon success.
    private static final Pattern charsetPat = Pattern.compile("charset=\"?(?<name>[-_A-Za-z0-9]+)\"?");
    public int lastHttpStatus;
    public String lastRedirPath;
    public String lastResponseStr = null;
    public String getGzipContentAPI(String URL,String referer, boolean needContent, boolean allowRedirect){
    	lastHttpStatus = 0;  lastRedirPath = null;
    	String strRs = null;
    	int status=0;    	
    	InputStream ins = null;
    	
    	try {
    		//set parameter
        	setGetMethod(URL,referer); 
    		this.get.setFollowRedirects(allowRedirect); // actually we won't get 302's in allowRedirect mode
    		if (isVerboseHeaders) {
	    		System.out.println("REQUEST HEADERS: " + URL);
	    		for (Header header: this.get.getRequestHeaders()) System.out.print(header); // each header row ends with \r\n
    		}
            status = client.executeMethod(this.get);
            lastHttpStatus = status;
    		if (isVerboseHeaders) { // sometimes meaningful even upon error
	    		System.out.println("RESPONSE HEADERS: " + URL + ": " + this.get.getStatusLine());
	    		for (Header header: this.get.getResponseHeaders()) System.out.print(header); // each header row ends with \r\n
    		}
            if(status == HttpStatus.SC_OK || (allowRedirect && status == 302) || acceptedHttpStatuses.contains(status)) {
            	String httpCharsetName = get.getResponseCharSet();
//            	for (Header header: this.get.getResponseHeaders()) System.out.print(header);
            	lastRedirPath = get.getPath(); // this should be the path after following redirects
            	if (isVerboseUrl) {
//            		System.out.println("URI: " + get.getURI());
            	}
//            	System.out.println("PATH: " + get.getPath());
            	//String encode = get.getResponseCharSet();
				
            	InputStream rawIns = get.getResponseBodyAsStream();
            	if (rawIns != null) { // we have a response body
                	Header hr = get.getResponseHeader("Content-Encoding"); 
					if(hr!=null){
						String encName = hr.getValue();
						if (encName != null) {
							if (encName.equals("deflate")) ins = new InflaterInputStream(rawIns); // is this correct?
							else if (encName.equals("gzip")) ins = new GZIPInputStream(rawIns);
							else if (encName.equals("utf-8")) {} // xiami's file servers return this
							else System.err.println("WARNING: unknown Content-Encoding: " + encName);
						}
					}
					if (ins == null) ins = rawIns;
					if (!needContent) {
						int result = ins.read(); // reads one byte
	//					System.out.println("first byte: " + result);
						get.abort(); return (result == -1) ? null : "";
					}
					// Fetch the entire response body
					ByteArrayBuffer buf = new ByteArrayBuffer(16384);
					try { // EOFException can occur when fetching badly compressed pages, e.g. http://www.hunantv.com/v/2/53080/f/678703.html
						byte[] inBuf = new byte[16384];
						while (true) {
							int curLen = ins.read(inBuf);
							if (curLen == -1) break; // EOF
							buf.append(inBuf, 0, curLen);
						}
					} catch (EOFException ex) { System.err.println(URL + ": exception after reading " + buf.length() + " bytes: " + ex.toString()); }
					byte[] data = buf.toByteArray();
					String curEncodingName = this.encoding;
					// Look for charset names in html content
					if (this.encoding != null) strRs = new String(data, this.encoding);
					else { // guess from html content
						String rawStr = new String(data, CommonUtil.iso8859Charset);
						Charset charset = null;
						Matcher m;
						if ((m = charsetPat.matcher(rawStr)).find()) {
							String name = m.group("name").toLowerCase();
							if (name.startsWith("gb")) charset = CommonUtil.gbkCharset;
							else if (name.equals("utf-8") || name.equals("utf8")) charset = CommonUtil.utf8Charset;
						}
						if (charset == null && httpCharsetName != null) charset = CommonUtil.getCharsetWithDefault(httpCharsetName, null); // check the HTML charset
						if (charset == null) { System.err.println(URL + ": Unable to guess the character set; defaulting to utf-8"); charset = CommonUtil.utf8Charset; }
						strRs = new String(data, charset);
					}
            	}
            } else System.out.println("FetchWebData: " + URL + ": " + status);
	    }catch (MalformedURLException e) {
	    	System.out.println(URL + ": " + e.toString());		    	
	    } catch (HttpException e) {
	    	System.out.println(URL + ": " + e.toString());		    	
	    } catch (IOException e) {	
	    	System.out.println(URL + ": " + e.toString());		    	
	    } catch(Exception e){
	    	System.out.println(URL + ": " + e.toString());
	    	e.printStackTrace();
	    } finally {	    	
	    	try {
	  		  if(ins!=null) try { ins.close(); } catch (IOException ex) {} // in case of an abortion, the stream may have been closed already
	  		  //set cookies
	  		  cookies = client.getState().getCookies();
	         // client.getState().addCookies(cookies);
	          if (this.get != null) this.get.releaseConnection();
	  		} catch(Exception e){
		    	System.out.println("UnknownException");
	  			e.printStackTrace();
		    } 
    	}
	    lastResponseStr = strRs;
	    return strRs;	   
    }
    
    private boolean getShouldRetry(int code) {
		Boolean shouldRetry_ = httpRetryModeMap.get(code);
		return (shouldRetry_ != null) ? shouldRetry_.booleanValue() : true;
    }
    
    //get gzip content
    public String getGzipContent(String URL,String referer)
    {
    	String strRs = null;
    	for(int k=1;k<=RetryNum;k++){
    		strRs = this.getGzipContentAPI(URL, referer, true, true);
    		if(strRs!=null && !strRs.equals("")) break;
    		if (!getShouldRetry(lastHttpStatus)) break; // the error is likely permanent
    		try { Thread.sleep(1000L); } catch (InterruptedException ex) { throw new RuntimeException(ex); }
    	}

	    return strRs;	     
    }

    // returns true if the content can be fetched properly
    public boolean checkGetContent(String URL, String referer, boolean allowRedirect) {
    	for (int k = 1; k <= RetryNum; ++k) {
    		if (getGzipContentAPI(URL, referer, false, allowRedirect) != null) return true;
    		if (!getShouldRetry(lastHttpStatus)) break; // the error is likely permanent
    		try { Thread.sleep(1000L); } catch (InterruptedException ex) { throw new RuntimeException(ex); }
    	}
    	return false;
    }
    
    //get page encoding
    public String getPageEncoding(String url){
    	String encoding = "gbk";
    	String content = this.getGzipContent(url, "");
    	if(content==null || content.equals("")) return encoding;
    	//System.out.println("Acontent=="+content);
    	//<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    	String regX="(?is)<meta[^>]*?charset=[\"\']?([\\w-]+)[^>]*?/>";
    	Matcher m = Pattern.compile(regX).matcher(content);
    	if(m.find()){
    		encoding = m.group(1);
    		System.out.println("EC="+encoding);
    	}
    	
	    if(encoding==null || encoding.equals("")) encoding="GBK";
	     
	    return encoding;
    }
    
    //Get Location; returns null if this is not a redirect or if an error has occurred
    public String getLocation(String url){
    	this.lastHttpStatus = 0;
    	String location = null;    
    	//set parameter
    	setGetMethod(url,getReferer());
    	int statusCode = 0;    	
    	this.get.setFollowRedirects(false);
    	Header locationHeader = null;	
    	
    	try {
    		statusCode =  client.executeMethod(this.get);
    		this.lastHttpStatus = statusCode;
//    		System.out.println("statusCode=="+statusCode);
    		//System.out.println("HttpStatus.SC_MOVED_PERMANENTLY=="+HttpStatus.SC_MOVED_PERMANENTLY);
    		//Location 301 or 302
			if (statusCode == HttpStatus.SC_MOVED_PERMANENTLY || statusCode == HttpStatus.SC_MOVED_TEMPORARILY){			
				//Get Location from header
			    locationHeader = get.getResponseHeader("Location");
			} else if (statusCode >= 400) return null;
			
			//System.out.println("statusCode=="+statusCode);	
			//System.out.println("locationHeader=="+locationHeader);
			if(locationHeader!=null && !locationHeader.equals("")){
				location = locationHeader.getValue();
			}
	     } catch (HttpException e) {
	    	 System.out.println("HttpException");
	     } catch (IOException e) {	
	    	 System.out.println("IOException");
	     } catch(Exception e){
	    	 e.printStackTrace();
	     } finally {
			 if (this.get != null) this.get.releaseConnection();
	    }	
      
	    return location;	  
    }  
    
    public static Object bytesToObject(byte[] bytes){
        
        Object result = null;
        ByteArrayInputStream byteInputStream = null;
        ObjectInputStream objectInputStream = null;
       
//        Hessian2Input objectInputStream2 = null;
       
        try{
            byteInputStream = new ByteArrayInputStream(bytes);
            objectInputStream = new ObjectInputStream(byteInputStream);
           
            result = objectInputStream.readObject();
           
//            objectInputStream2.startMessage();
//            result = objectInputStream2.readObject();
//            objectInputStream2.completeMessage();
           
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            if(null != objectInputStream){
                try{
                    objectInputStream.close();
                    byteInputStream.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
       
        return result;
    }
    
    
}
