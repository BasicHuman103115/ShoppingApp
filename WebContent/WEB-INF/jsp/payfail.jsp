<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<title>支付页-失败</title>
		<link rel="icon" href="/assets/img/favicon.ico">
		
	
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pages-payfail.css" />
    
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/taobao.css" rel="stylesheet" />
	<script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>
	
</head>

	<body>
		<!--head-->
		
	      <nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">显示导航条</span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${ctx}/article/index">美妆商城</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="${ctx}/article/index">首页</a></li>
						<li><a href="${ctx}/shopCar/showShopCar.do">购物车</a></li>
						<li><a href="${ctx}/order/showOrder.do">我的订单</a></li>
					</ul>
	
					<ul class="nav navbar-nav navbar-right">
						<c:choose>
							<c:when test="${not empty session_user}">
							  	<li><a href="#"> <span style='color: red;'></span>
								</a></li>
								<li><a href="#">欢迎[<font color="red">${session_user.name}</font>]访问!</a></li>
								<li><a href="${ctx}/user/logout">退出</a></li>
								<li><a href="${ctx}/register">免费注册</a></li>
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
	
		<div class="cart py-container">
			<!--logoArea-->
			<div class="logoArea">
				<div class="fl"><img src="${pageContext.request.contextPath}/image/pay/Logo.png" style="width:200px;height:100px"/><span class="title">支付页</span></div>
			</div>
			<!--主内容-->
			<div class="payfail">
				<div class="fail">
					<h3><img src="${pageContext.request.contextPath}/image/pay/fail.png" width="48" height="48">　支付失败，请稍后再试</h3>
					<div class="fail-text">
					<p>失败原因：不能使用金币购买！</p>
					<p>您可以先去　<a href="index.html" target="_blank">欢乐购首页</a>　逛逛</p>
					<p class="button"><a href="" class="sui-btn btn-xlarge btn-danger">重新支付</a></p>
				    </div>
				</div>
				
			</div>
		</div>
		<!-- 底部栏位 -->
		<!--页面底部-->
<div class="clearfix footer">
	<div class="py-container">
		<div class="footlink">
			<div class="Mod-service">
				<ul class="Mod-Service-list">
					<li class="grid-service-item intro  intro1">

						<i class="serivce-item fl"></i>
						<div class="service-text">
							<h4>正品保障</h4>
							<p>正品保障，提供发票</p>
						</div>

					</li>
					<li class="grid-service-item  intro intro2">

						<i class="serivce-item fl"></i>
						<div class="service-text">
							<h4>正品保障</h4>
							<p>正品保障，提供发票</p>
						</div>

					</li>
					<li class="grid-service-item intro  intro3">

						<i class="serivce-item fl"></i>
						<div class="service-text">
							<h4>正品保障</h4>
							<p>正品保障，提供发票</p>
						</div>

					</li>
					<li class="grid-service-item  intro intro4">

						<i class="serivce-item fl"></i>
						<div class="service-text">
							<h4>正品保障</h4>
							<p>正品保障，提供发票</p>
						</div>

					</li>
					<li class="grid-service-item intro intro5">

						<i class="serivce-item fl"></i>
						<div class="service-text">
							<h4>正品保障</h4>
							<p>正品保障，提供发票</p>
						</div>

					</li>
				</ul>
			</div>
			<div class="clearfix Mod-list">
				<div class="yui3-g">
					<div class="yui3-u-1-6">
						<h4>购物指南</h4>
						<ul class="unstyled">
							<li>购物流程</li>
							<li>会员介绍</li>
							<li>生活旅行/团购</li>
							<li>常见问题</li>
							<li>购物指南</li>
						</ul>

					</div>
					<div class="yui3-u-1-6">
						<h4>配送方式</h4>
						<ul class="unstyled">
							<li>上门自提</li>
							<li>211限时达</li>
							<li>配送服务查询</li>
							<li>配送费收取标准</li>
							<li>海外配送</li>
						</ul>
					</div>
					<div class="yui3-u-1-6">
						<h4>支付方式</h4>
						<ul class="unstyled">
							<li>货到付款</li>
							<li>在线支付</li>
							<li>分期付款</li>
							<li>邮局汇款</li>
							<li>公司转账</li>
						</ul>
					</div>
					<div class="yui3-u-1-6">
						<h4>售后服务</h4>
						<ul class="unstyled">
							<li>售后政策</li>
							<li>价格保护</li>
							<li>退款说明</li>
							<li>返修/退换货</li>
							<li>取消订单</li>
						</ul>
					</div>
					<div class="yui3-u-1-6">
						<h4>特色服务</h4>
						<ul class="unstyled">
							<li>夺宝岛</li>
							<li>DIY装机</li>
							<li>延保服务</li>
							<li>欢乐购E卡</li>
							<li>欢乐购通信</li>
						</ul>
					</div>
					<div class="yui3-u-1-6">
						<h4>帮助中心</h4>
						<img src="img/wx_cz.jpg">
					</div>
				</div>
			</div>
			<div class="Mod-copyright">
				<ul class="helpLink">
					<li>关于我们<span class="space"></span></li>
					<li>联系我们<span class="space"></span></li>
					<li>关于我们<span class="space"></span></li>
					<li>商家入驻<span class="space"></span></li>
					<li>营销中心<span class="space"></span></li>
					<li>友情链接<span class="space"></span></li>
					<li>关于我们<span class="space"></span></li>
					<li>营销中心<span class="space"></span></li>
					<li>友情链接<span class="space"></span></li>
					<li>关于我们</li>
				</ul>
				<p>地址：长沙开福区福元西路 邮编：XXXX 电话：XXX-XXX-4000 传真：XXX-82935100</p>
				<p>XICP备XXXXX号京公网安备XXXXXXX</p>
			</div>
		</div>
	</div>
</div>
<!--页面底部END-->
	
</body>

</html>