/**
 * 
 */
package com.longIt.shoppingApp_manager.util.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.longIt.shoppingApp.bean.User;
import com.longIt.shoppingApp_manager.util.Constant;

/**
 * *登录拦截器，如果没有登录则直接访问登录页面
 */
public class ManagerLoginInterceptor extends HandlerInterceptorAdapter {

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.handler.HandlerInterceptorAdapter#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//从session中获取用户信息
		User user = (User)request.getSession().getAttribute(Constant.SESSION_USER);
		
		if(user == null ) {
			request.setAttribute("tip", "您尚未登录，请登录后再进行相关操作!");
			//跳转至登录页面
			request.getRequestDispatcher("/WEB-INF/jsp/user/login.jsp").forward(request, response);
		    return false;
		}else {
			return true;
		}
	}

}