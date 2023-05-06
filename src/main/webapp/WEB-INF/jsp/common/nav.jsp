<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 引入c标签 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 给项目取简称 -->
 <c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
    <!-- 横幅导航条开始 -->
	<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">显示导航条</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${ctx}/article/index">拍卖网</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${ctx}/article/index">首页</a></li>
					<li><a href="${ctx}/shopCar/showShopCar.do">购物车</a></li>
					<li><a href="${ctx}/order/showOrder.do">我的订单</a></li>
					<li><a href="${ctx}/user/showUpdateUser.do">个人信息设置</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${not empty session_user}">
						  	<li><a href="#"> <span style='color: red;'></span>
							</a></li>
							<li><a href="#">欢迎[<font color="red">${session_user.name}</font>]访问!</a></li>
							<li><a href="${ctx}/user/logout">退出</a></li>
							<li><a href="${ctx}/register">免费注册</a></li>
							<c:if test="${session_user.role==2 || session_user.role==3}">
							<li><a href="${ctx}/article_manager/getAll.action">后台管理</a></li>
							</c:if>
						</c:when>
						<c:otherwise>
							<li><a href="#"> <span style='color: red;'></span>
							</a></li>
							<li><a href="${ctx}/login">登录</a></li>
							<li><a href="${ctx}/register">免费注册</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>