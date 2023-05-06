/**
 * 
 */
package com.longIt.shoppingApp_manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.longIt.shoppingApp.bean.Article;
import com.longIt.shoppingApp.bean.ArticleType;
import com.longIt.shoppingApp_manager.mapper.ManagerArticleMapper;
import com.longIt.shoppingApp_manager.mapper.ManagerArticleTypeMapper;
import com.longIt.shoppingApp_manager.service.ManagerArticleTypeServiceI;
import com.longIt.shoppingApp_manager.util.pager.PageModel;


@Service(value="marticleTypeService")
@Transactional
public class ManagerArticleTypeServicempl implements ManagerArticleTypeServiceI {
	
	@Autowired
	private ManagerArticleTypeMapper articleTypeMapper;

	@Autowired
	private ManagerArticleMapper articleMapper;
	/* (non-Javadoc)
	 *  //获取所有的一级商品类型
	 */
	@Override
	public List<ArticleType> findAllFirstArticleType() {
		// TODO Auto-generated method stub
		return articleTypeMapper.findAllFirstArticleType();
	}

	/* (non-Javadoc)
                         根据商品类型以及商品的标题获取商品信息
	 */
	@Override
	public List<ArticleType> getAllArticleTypes(PageModel pageModel) {
		// TODO Auto-generated method stub
		int totalNum = articleTypeMapper.findTotalNum();
		pageModel.setTotalNum(totalNum);
		
		List<ArticleType> types = articleTypeMapper.getAllArticleTypes(pageModel);
		return types;
	}

	/* (non-Javadoc)
	 * //加载修改商品类型页面  
	 */
	@Override
	public ArticleType getArticleTypeByCode(String code) {
		// TODO Auto-generated method stub
		return articleTypeMapper.getArticleTypeByCode(code);
	}

	/* (non-Javadoc)
	 * 进行更新商品类型操作
	 */
	@Override
	public void updateArticleType(ArticleType type) {
		// TODO Auto-generated method stub
		articleTypeMapper.updateArticleType(type);
	}

	/* (non-Javadoc)
	 *  进行添加商品类型操作
	 */
	@Override
	public void saveArticleType(ArticleType type, String parentCode) {
		// TODO Auto-generated method stub
		StringBuffer code = new StringBuffer();
		
		if(parentCode != null && !parentCode.equals("")) {
			String maxCode = articleTypeMapper.findMaxSeCode(parentCode+"%");
			
			if(maxCode == null ||maxCode.equals("")) {
				//00010001
				code.append(parentCode).append("0001");
			}else {
				//maxCode:00010009   ==  >00010010
				code.append(parentCode);
				Integer code2 = Integer.valueOf(maxCode.substring(4)) + 1;
				
				for(int i=0;i<4 - String.valueOf(code2).length() ; i++) {
					code.append("0");
				}
				code.append(code2);

			}
			
		}else {
			//获取最大的一级物品类型code
			String maxFirstCode = articleTypeMapper.findMaxFiCode();
			
			
			Integer code2 = Integer.valueOf(maxFirstCode) + 1;
			
			for(int i=0;i<4 - String.valueOf(code2).length() ; i++) {
				code.append("0");
			}
			code.append(code2);
			
		}
		
		//指定当前商品类型的code
		type.setCode(code.toString());
		articleTypeMapper.saveArticleType(type); 		
		
		
	}

	/* (non-Javadoc)
	 * @see com.longIt.shoppingApp.service.ArticleTypeServiceI#deleteType(java.lang.String)
	 * 删除商品类型
	 */
	@Override
	public String deleteType(String code) {
		// TODO Auto-generated method stub
		//根据code获取是否存在下级商品类型信息
		List<ArticleType> types = articleTypeMapper.getArticleType(code+"%",code.length()+4);
		//判断商品类型下是否有商品关联到该商品类型
		List<Article> articles = articleMapper.getArticleByType(code);
 		if(types.size() > 0 || articles.size() > 0) {
			
			return "删除失败，该商品类型下存在下级商品类型,或存在关联的商品信息！";
		}else {
			articleTypeMapper.deleteTypes(code);
			return "删除成功！";
		}
	}

    
}
