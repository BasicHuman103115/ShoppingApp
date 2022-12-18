package com.longIt.shoppingApp_manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.longIt.shoppingApp.bean.Article;
import com.longIt.shoppingApp.bean.ArticleType;
import com.longIt.shoppingApp_manager.util.pager.PageModel;

/**
 * ArticleMapper 数据访问类
 * @version 1.0
 */
public interface ManagerArticleMapper {

	/**
	 * @return
	 */
	
	List<Article> getAllArticles(@Param("typeCode")String typeCode,@Param("title")String tite,@Param("pageModel")PageModel pageModel);

	/**
	 * @param id
	 * @return
	 * 根据商品id获取商品信息
	 */
	@Select("select * from  ec_article where id = #{id}")
	Article getArticleById(Integer id);

	/**
	 * @param id
	 */
	@Update("update ec_article set disabled = '1' where id = #{id}")
	void removeArticleById(Integer id);

	/**
	 * @param typeCode
	 * @param title
	 * @return
	 * //进行分页查询之前获取总记录数
	 */
	int getTotalNum(@Param("typeCode")String typeCode,@Param("title")String tite);

	/**
	 * @param article
	 * //保存商品信息
	 */
	void saveArtice(Article article);

	/**
	 * @param article
	 * 更新商品信息
	 */
	void updateArticle(Article article);

	//判断商品类型下是否有商品关联到该商品类型
	@Select("select * from  ec_article where type_code = #{code}")
	List<Article> getArticleByType(String code);

	//加载二级商品类型
	@Select("select * from ec_article_type where code like #{code} and length(code) = 8 ")
	List<ArticleType> ajaxLoadSeTypes(String string);


}