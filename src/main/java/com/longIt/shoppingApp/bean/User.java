package com.longIt.shoppingApp.bean;

import java.util.Date;

/**
 * User 数据传输类
 * @version 1.0
 */
public class User implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private int id;
	private String loginName;
	private String login_name;
	private String password;
	private String name;
	private int sex;
	private String email;
	private String phone;
	private String address;
	private int role;
	private java.util.Date createDate;
	private String disabled;
	private String active;
	private java.util.Date loginTime;
	private java.util.Date logoutTime;
	private String loginIP;

	/** setter and getter method */
	public void setId(int id){
		this.id = id;
	}
	public int getId(){
		return this.id;
	}
	public void setLoginName(String loginName){
		this.loginName = loginName;
	}
	public String getLoginName(){
		return this.loginName;
	}
	public void setPassword(String password){
		this.password = password;
	}
	public String getPassword(){
		return this.password;
	}
	public void setName(String name){
		this.name = name;
	}
	public String getName(){
		return this.name;
	}
	public void setSex(int sex){
		this.sex = sex;
	}
	public int getSex(){
		return this.sex;
	}
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	public void setPhone(String phone){
		this.phone = phone;
	}
	public String getPhone(){
		return this.phone;
	}
	public void setAddress(String address){
		this.address = address;
	}
	public String getAddress(){
		return this.address;
	}
	public void setRole(int role){
		this.role = role;
	}
	public int getRole(){
		return this.role;
	}
	public void setCreateDate(java.util.Date createDate){
		this.createDate = createDate;
	}
	public java.util.Date getCreateDate(){
		return this.createDate;
	}
	public void setDisabled(String disabled){
		this.disabled = disabled;
	}
	public String getDisabled(){
		return this.disabled;
	}
	public void setActive(String active){
		this.active = active;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
	public String getActive(){
		return this.active;
	}
	
	public Date getLogin_time() {
		return loginTime;
	}
	public void setLogin_time(java.util.Date loginTime) {
		this.loginTime = loginTime;
	}
	
	public Date getLogout_time() {
		return logoutTime;
	}
	public void setLogout_time(java.util.Date logoutTime) {
		this.logoutTime = logoutTime;
	}
	public void setLoginIP(String loginIP) {
		this.loginIP = loginIP;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", loginName=" + loginName + ", login_name=" + login_name + ", password=" + password
				+ ", name=" + name + ", sex=" + sex + ", email=" + email + ", phone=" + phone + ", address=" + address
				+ ", role=" + role + ", createDate=" + createDate + ", disabled=" + disabled + ", active=" + active
				+ ", loginTime=" + loginTime + ", logoutTime=" + logoutTime + ", loginIP=" + loginIP + "]";
	}
	

	
}