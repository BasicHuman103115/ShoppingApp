/**
 * 
 */
package com.longIt.shoppingApp_manager.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.longIt.shoppingApp.bean.Article;
import com.longIt.shoppingApp.bean.Order;
import com.longIt.shoppingApp_manager.mapper.ManagerOrderMapper;
import com.longIt.shoppingApp_manager.service.ManagerOrderServiceI;
import com.longIt.shoppingApp_manager.util.pager.PageModel;


@Service(value="morderService")
@Transactional
public class ManagerOrderServicempl implements ManagerOrderServiceI {

    @Autowired
	private ManagerOrderMapper orderMapper;

    /* (non-Javadoc)
	 * //订单分页查询
	 */
	@Override
	public List<Order> getAll(PageModel pageModel) {
		// TODO Auto-generated method stub
		//获取订单总记录数
		int totalNum = orderMapper.getToalNum();
		pageModel.setTotalNum(totalNum);
		
		//订单分页查询
		List<Order> orders = orderMapper.getAllOrders(pageModel);
		return orders;
	}

	/* (non-Javadoc)
	 * //确认发送订单   
	 */
	@Override
	public void checkOrder(Order order) {
		// TODO Auto-generated method stub
		if(order.getStatus().equals("0")) {
			//取消发货
			order.setSendDate(null);
		}else {
			//发货
			order.setSendDate(new Date());
		}
		
		orderMapper.checkOrder(order);
		
	}
	

}
