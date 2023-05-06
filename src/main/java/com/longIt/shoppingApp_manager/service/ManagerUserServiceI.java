/**
 * 
 */
package com.longIt.shoppingApp_manager.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.longIt.shoppingApp.bean.Article;
import com.longIt.shoppingApp.bean.User;


public interface ManagerUserServiceI {

	/**
	 * @param loginName
	 * @param password
	 * @return
	 * 根据账号以及密码获取用户信息
	 */
	User getUserByNameAndPass(User user);

	/**
	 * @param user
	 *  //用户信息注册   
	 */
	void saveUser(User user,HttpServletRequest request) throws Exception;

	/**
	 * @param activeCode
	 * //用户信息激活  
	 */
	void activeUser(String activeCode);

	/**
	 * @param loginName
	 * @return
	 * 根据账号获取用户信息
	 */
	String getUserByLoginName(String loginName);

	 //获取所有用户信息
		List<User> userList(String name);


		//用户信息激活或者冻结  
		void activeServlet(User user);

		void LoginDate(User user);
		
		void LoginIP(User user, String IPadd);

		void LogoutDate(User user);


}
