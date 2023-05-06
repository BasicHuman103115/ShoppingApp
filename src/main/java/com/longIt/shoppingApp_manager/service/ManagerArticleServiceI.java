/**
 * 
 */
package com.longIt.shoppingApp_manager.service;

import java.util.List;

import com.longIt.shoppingApp.bean.Article;
import com.longIt.shoppingApp_manager.util.pager.PageModel;


public interface ManagerArticleServiceI {

	/**
	 * @param title 
	 * @param typeCode 
	 * @param pageModel 
	 * @return
	 * 根据商品类型以及商品的标题获取商品信息
	 */
	List<Article> getAllArticles(String typeCode, String title, PageModel pageModel);

	/**
	 * @param id
	 * @return
	 * 根据商品id获取商品信息
	 */
	Article getArticleById(Integer id);

	/**
	 * @param id
	 * 商品信息下架	
	 */
	void removeArticleById(Integer id);

	/**
	 * @param article
	 *  //保存商品信息
	 */
	void saveArticle(Article article);

	/**
	 * @param article
	 * 更新商品信息
	 */
	void updateArticle(Article article);

	//加载二级类型
	String ajaxLoadSeTypes(String code);

}
