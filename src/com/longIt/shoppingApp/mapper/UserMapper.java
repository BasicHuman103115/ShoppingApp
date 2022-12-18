package com.longIt.shoppingApp.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.longIt.shoppingApp.bean.User;

/**
 * UserMapper 数据访问类
 */
public interface UserMapper {

	/**
	 * @param user
	 * @return
	 * //根据用户输入的账号以及密码获取用户的信息
	 */
	@Select("select * from ec_user where login_name = #{loginName} and password = #{password}")
	User findUserByNameAndPass(User user);

	/**
	 * @param loginName
	 * @return
	 */
	@Select("select * from ec_user where login_name = #{loginName}")
	User validLoginName(String loginName);

	/**
	 * @param user
	 */
	@Insert("insert into ec_user(login_name,password,name,sex,email,phone,address,create_date,active) values(#{loginName},#{password},#{name},#{sex},#{email},#{phone},#{address},#{createDate},#{active})")
	void saveUser(User user);

	/**
	 * @param activeCode
	 * 用户信息激活
	 */
	@Update("update ec_user set disabled = 1 ,active = '' where active = #{activeCode}")
	void active(String activeCode);

	/**
	 * @param activeCode
	 * @return
	 */
	@Select("select * from ec_user where active = #{activeCode}")
	User getUserByActive(String activeCode);

	@Update("update  ec_user set name=#{name},password=#{password},sex=#{sex},email=#{email},phone=#{phone},address=#{address} where id = #{id}")
	void userUpdate(User user);


}