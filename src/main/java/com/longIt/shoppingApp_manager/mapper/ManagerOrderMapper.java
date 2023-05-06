package com.longIt.shoppingApp_manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.longIt.shoppingApp.bean.Order;
import com.longIt.shoppingApp_manager.util.pager.PageModel;

/**
 * OrderMapper 数据访问类
 * @version 1.0
 */
public interface ManagerOrderMapper {

	/**
	 * @return
	 * //获取订单总记录数
	 */
	@Select("select count(*) from ec_order")
	int getToalNum();

	/**
	 * @param pageModel
	 * @return
	 * //订单分页查询
	 */
	List<Order> getAllOrders(PageModel pageModel);

	/**
	 * @param order
	 * 进行确认发货或者取消发货操作
	 */
	@Update("update ec_order set status = #{status} ,send_date = #{sendDate} where id = #{id}")
	void checkOrder(Order order);



}