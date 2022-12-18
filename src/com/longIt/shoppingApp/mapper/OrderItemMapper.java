package com.longIt.shoppingApp.mapper;

import org.apache.ibatis.annotations.Insert;

import com.longIt.shoppingApp.bean.OrderItem;

/**
 * OrderItemMapper 数据访问类
 */
public interface OrderItemMapper {

	/**
	 * @param item
	 * 保存订单明细
	 */
	@Insert("insert into ec_order_item(order_id,article_id,order_num) values(#{orderId},#{articleId},#{orderNum}) ")
	void saveItem(OrderItem item);



}