package com.longIt.shoppingApp_manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.longIt.shoppingApp.bean.User;

/**
 * UserMapper 数据访问类
 * @version 1.0
 */
public interface ManagerUserMapper {

	/**
	 * @param user
	 * @return
	 */
	@Select("select * from ec_user where login_name = #{loginName} and password = #{password}")
	User getUserByNameAndPass(User user);

	/**
	 * @param user
	 */
	@Insert("insert into ec_user(login_name,password,name,sex,email,phone,address,create_date,active,login_time)  values(#{loginName},#{password},#{name},#{sex},#{email},#{phone},#{address},#{createDate},#{active},#{loginDate})")
	void saveUser(User user);

	/**
	 * @param activeCode
	 * //用户信息激活  
	 */
	@Update("update ec_user set disabled = '1' where active = #{activeCode}")
	void activeUser(String activeCode);

	/**
	 * @param loginName
	 * @return
	 * 根据账号获取用户信息
	 */
	@Select("select * from ec_user where login_name = #{loginName}")
	User getUserByLoginName(String loginName);


	//获取所有用户信息
	List<User> userList(String name);

	//用户信息激活或者冻结  
	@Update("update ec_user set disabled = #{disabled} where  id = #{id}")
	void activeServlet(User user);
	
	/**
	 * @param user
	 * @return
	 */
	@Update("update ec_user set LOGIN_TIME = #{loginTime} where login_name = #{loginName}")
	void LoginDate(User user);
	
	@Update("update ec_user set LOGIN_IP = #{loginIP} where login_name = #{loginName}")
	void LoginIP(User user);
	
	@Update("update ec_user set LOGOUT_TIME = #{logoutTime} where login_name = #{loginName}")
	void LogoutDate(User user);
}