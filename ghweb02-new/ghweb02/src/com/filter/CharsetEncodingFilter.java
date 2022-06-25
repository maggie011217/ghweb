package com.filter;

import java.io.IOException;
 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
 
/**
 * @Discription 字符编码过滤器
 * @author ***
 * @company ***
 * @date 2017-11-18
 **/
public class CharsetEncodingFilter implements Filter {  
	
	private static String encoding; // 定义变量接收初始化的值
 
	public void destroy() {
		
	}
 
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 设置字符编码链锁
		System.out.println("CharsetEncodingFilter--->>>begin");  
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		System.out.println("CharsetEncodingFilter--->>>doing");  
		chain.doFilter(request, response);
		System.out.println("CharsetEncodingFilter--->>>end");
	}
	// 初始化
	public void init(FilterConfig config) throws ServletException {
		// 接收web.xml配置文件中的初始参数
		encoding = config.getInitParameter("CharsetEncoding");
		System.out.println("CharsetEncodingFilter.init()-->> endcoding=" + encoding);
		
	}
 
}