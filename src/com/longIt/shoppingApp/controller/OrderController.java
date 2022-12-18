/**
 * 
 */
package com.longIt.shoppingApp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longIt.shoppingApp.bean.Order;
import com.longIt.shoppingApp.service.OrderServiceI;
import com.longIt.shoppingApp.weixin.utils.DataJoinUtils;


@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderServiceI orderServiceI;
	
	//跳转至确认订单信息页面
	 @RequestMapping(value="/checkOrder.do")
     public  String checkOrder(String orderInfo,HttpSession session) {
  	   
		  try {
			  //将订单相关信息保存至session中
			  session.setAttribute("orderInfo", orderInfo);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		  
		//跳转至确认订单信息页面
  	    return "checkOrderInfo";
    }
	
	
	
	 //提交订单
	@RequestMapping(value="/orderSubmit.do")
    public  String orderSubmit(HttpSession session,Model model) {
  	   
		  try {
			  
			  String orderInfo = (String)session.getAttribute("orderInfo");
			  System.out.println("orderInfo:"+orderInfo);
			  //将订单信息保存至数据库
			  Order order = orderServiceI.orderSubmit(orderInfo);
			  model.addAttribute("order", order);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		  
		  //展示支付页面
		  return "pay";
  	 
    }
	  
	  //查询当前用户所有的订单信息
	  @RequestMapping(value="/showOrder.do")
    public  String showOrder(Model model) {
  	   
		  try {
			  
			  //根据当前用户的id查询，该用户所有的订单信息
			  List<Order> orders = orderServiceI.getOrdersByUserId();
			  model.addAttribute("orders", orders);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		  
		  //跳转至订单列表页面
		  return "order";
  	 
    }
	  
	
	  //异步校验订单是否支付成功
	  @ResponseBody
	  @RequestMapping(value="/queryPayStatus",produces= {"application/text;charset=utf-8"})
	  public String queryStatus(String orderNo) {
		  String tip = "";
		  
		  try {
			  
			  int num = 0;
			  DataJoinUtils dataJoinUtils = new DataJoinUtils();
			  
			  while(true) {
				//查询订单的支付状态
				Map<String,String> map = dataJoinUtils.wxOrderQuery(orderNo);
				 
				if(map == null) {
					tip = "支付发生错误";
					break;
				}
				
				if(map.get("trade_state").equals("SUCCESS")) {
					tip = "ok";
					//支付成功，应该修改数据库中订单状态，改成已支付
					orderServiceI.updateOrderPayOrderNo(orderNo);
					break;
				}
				
				 Thread.sleep(3000);
				
				 num++;
				 
				 if(num >= 1000) {
					 tip = "支付超时";
					 break;
				 }
			  }

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		  
		  return tip;
	  }
	  
	  
	  //跳转至支付成功页面
	  @RequestMapping("/paySuccess")
	  public String paySuccess(double amount,Model model) {
		 model.addAttribute("amount", amount);
		 return "paysuccess";
	  }
	  
	  
	  //跳转至支付失败页面
	  @RequestMapping("/payfail")
	  public String payfail(double amount,Model model) {
		 model.addAttribute("amount", amount);
		 return "payfail";
	  }
}
