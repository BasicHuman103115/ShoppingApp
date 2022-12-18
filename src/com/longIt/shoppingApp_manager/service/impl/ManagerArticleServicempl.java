package com.longIt.shoppingApp_manager.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.longIt.shoppingApp.bean.Article;
import com.longIt.shoppingApp.bean.ArticleType;
import com.longIt.shoppingApp_manager.mapper.ManagerArticleMapper;
import com.longIt.shoppingApp_manager.service.ManagerArticleServiceI;
import com.longIt.shoppingApp_manager.util.pager.PageModel;


@Service(value="marticleService")
@Transactional
public class ManagerArticleServicempl implements ManagerArticleServiceI {

    @Autowired
	private ManagerArticleMapper articleMapper;

    /* (non-Javadoc)
	 * 根据商品类型以及商品的标题获取商品信息
	 */
	@Override
	public List<Article> getAllArticles(String typeCode,String title,PageModel pageModel) {
		// TODO Auto-generated method stub
		
		//进行分页查询之前获取总记录数
		int totalNum = articleMapper.getTotalNum(typeCode,title);
		pageModel.setTotalNum(totalNum);
		
		return articleMapper.getAllArticles(typeCode,title,pageModel);
	}

	/* (non-Javadoc)
	 * 根据商品id获取商品信息
	 */
	@Override
	public Article getArticleById(Integer id) {
		// TODO Auto-generated method stub
		return articleMapper.getArticleById(id);
	}

	/* (non-Javadoc)
	 * @see com.longIt.shoppingApp.service.ArticleServiceI#removeArticleById(java.lang.Integer)
	 * 商品信息下架	
	 */
	@Override
	public void removeArticleById(Integer id) {
		// TODO Auto-generated method stub
		articleMapper.removeArticleById(id);
	}

	/* (non-Javadoc)
	 *  //保存商品信息
	 */
	@Override
	public void saveArticle(Article article) {
		// TODO Auto-generated method stub
		article.setCreateDate(new Date());
        article.setPutawayDate(new Date());
		articleMapper.saveArtice(article);
	}

	/* (non-Javadoc)
	 * @see com.longIt.shoppingApp.service.ArticleServiceI#updateArticle(com.longIt.shoppingApp.bean.Article)
	 * 更新商品信息
	 */
	@Override
	public void updateArticle(Article article) {
		// TODO Auto-generated method stub
		articleMapper.updateArticle(article);
	}
	
	 //加载二级商品类型 
		@Override
		public String ajaxLoadSeTypes(String code) {
			// TODO Auto-generated method stub
			List<ArticleType> types = articleMapper.ajaxLoadSeTypes(code+"%");
			Gson gson = new Gson();
			String jsonstr = gson.toJson(types);
			return jsonstr;
		}

}
