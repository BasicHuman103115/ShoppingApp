/**
 * 
 */
package com.longIt.shoppingApp_manager.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.longIt.shoppingApp.bean.Article;
import com.longIt.shoppingApp.bean.Order;
import com.longIt.shoppingApp.bean.User;
import com.longIt.shoppingApp_manager.util.pager.PageModel;


public interface ManagerOrderServiceI {

	/**
	 * @param pageModel
	 * @return
	 * //订单分页查询
	 */
	List<Order> getAll(PageModel pageModel);

	/**
	 * @param order
	 * //确认发送订单   
	 */
	void checkOrder(Order order);

	

}
