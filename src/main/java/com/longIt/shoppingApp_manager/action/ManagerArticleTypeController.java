/**
 * 
 */
package com.longIt.shoppingApp_manager.action;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.longIt.shoppingApp.bean.ArticleType;
import com.longIt.shoppingApp_manager.service.ManagerArticleTypeServiceI;
import com.longIt.shoppingApp_manager.util.pager.PageModel;
import net.sf.json.JSONArray;


@Controller
@RequestMapping("/articleType_manager")
public class ManagerArticleTypeController {
	
	 
	 @Autowired   
	 private ManagerArticleTypeServiceI articleTypeService;
	

	 //获取所有的商品类型信息
	 @RequestMapping("/getAll.action")
	 public String getAll(Model model,PageModel pageModel,String message) throws UnsupportedEncodingException {
		 
		 //根据商品类型以及商品的标题获取商品信息
		 List<ArticleType> articleTypes = articleTypeService.getAllArticleTypes(pageModel);
		 model.addAttribute("list", articleTypes);
		 
		 if(message != null && !message.equals("")) {
			 model.addAttribute("message", URLDecoder.decode(message, "UTF-8"));
		 }
		 

		 return "articleType/list";
		 
	 }
	 
	 
	 //加载修改商品类型页面  
	 @RequestMapping("/showUpdate.action")
	 public String showUpdate(Model model,String code) {
		 
		ArticleType type = articleTypeService.getArticleTypeByCode(code);
		model.addAttribute("articleType", type);

		 return "articleType/view";
		 
	 }
	 
	 
	 //加载添加商品类型页面  
	 @RequestMapping("/showAdd.action")
	 public String showAdd() {
		 
		 return "articleType/view";
		 
	 }
	 
	 
	 //通过异步请求的方式获取所有一级商品类型   
	 @ResponseBody
	 @RequestMapping(value="/loadFirstArticleType.action",produces= {"application/json;charset=utf-8"})
	 public String loadFirstArticleType() {
		 
		 List<ArticleType> types = articleTypeService.findAllFirstArticleType();
          System.out.println("types:"+JSONArray.fromObject(types).toString());
		 return JSONArray.fromObject(types).toString();
		 
	 }
	 
	 
	 //商品类型的添加或者修改操作   
	 @RequestMapping("/addOrUpdate.action")
	 public String addOrUpdate(ArticleType type,String  parentCode) {
		 
		 if(type.getCode() !=null && !type.getCode().equals("")) {
			 //进行更新商品类型操作
			 articleTypeService.updateArticleType(type);
			 
		 }else {
			 //进行添加商品类型操作
			 articleTypeService.saveArticleType(type,parentCode);
		 }

		 return "redirect:/articleType_manager/getAll.action";
		 
	 }
	 
	 //删除商品类型
	 @RequestMapping("/deleteType.action")
	 public String deleteType(@Param("code")String  code) throws UnsupportedEncodingException {
		 
		 String message = articleTypeService.deleteType(code);
		 return "redirect:/articleType_manager/getAll.action?message="+URLEncoder.encode(message, "UTF-8");
		 
	 }
}
