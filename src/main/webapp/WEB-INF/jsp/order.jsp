<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 通过动态标签引入公共jsp页面 -->
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>


<!-- 引入格式化标签 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 

<!DOCTYPE html>
<html lang="zh_CN">
  <head>
  <!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-TNMFZ6N');</script>
<!-- End Google Tag Manager -->

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-YJDC79H5YK"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-YJDC79H5YK');
</script>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品详情</title>
    <!-- Bootstrap core CSS -->
    <link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
     <link rel="stylesheet" href="resources/bootstrap/style.css" />
    <link href="resources/css/taobao.css" rel="stylesheet" />
   <script src="resources/jquery/jquery.js"></script>
     
  </head>
  
  <body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TNMFZ6N"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
	

  
 <!-- 横幅导航条开始 -->
   <jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	
	<!--  横幅下方的主体开始 -->
    <div class="container">
				<div class="table-responsive">
				<table class="table table-hover table-bordered table-striped">
				
				<!-- 遍历订单 -->
				<c:forEach items="${orders}" var="order">
				
				     <thead>
						<tr style="background-color: #eeccff">
							<th style="width: 15%">订单号</th>
							<th style="width: 40%">下单时间</th>
							<th style="width: 10%">发货时间</th>
							<th style="width: 8%">发货状态</th>
							<th style="width: 15%">订单总金额</th>
							<th style="width: 15%">支付状态</th>
						</tr>
					</thead>
					
					<tbody>
					    <tr>
								<td>
									 ${order.orderCode}
								</td>
								<td>
								   <fmt:formatDate value="${order.createDate}" pattern="yyyy年MM月dd日 HH:mm:ss"/> 
								</td>
								<td>
									<fmt:formatDate value="${order.sendDate}" pattern="yyyy年MM月dd日 HH:mm:ss"/> 
								</td>
								<td>
								   <c:choose>
								      <c:when test="${order.status eq '0'}">未发货</c:when>
								      <c:otherwise>已发货</c:otherwise>
								   </c:choose>
								</td>
								<td>
									${order.amount}
								</td>
								<td>
								   <c:choose>
								      <c:when test="${order.payStatus eq '0'}">未支付</c:when>
								      <c:otherwise>已支付</c:otherwise>
								   </c:choose>
								</td>
							</tr>
					
					</tbody>
					
					
					<!-- 获取订单中的详情信息   order.items:List<OrderItem>    item:OrderItem -->
					<c:forEach items="${order.items}" var="item">
					      <thead>
						<tr>
							<th style="width: 15%">图片</th>
							<th style="width: 40%" colspan="2">名称</th>
							<th style="width: 10%">价格</th>
							<th style="width: 8%">数量</th>
							<th style="width: 15%">操作</th>
						</tr>
					</thead>
					<tbody>
					
						
					 
							<tr>
								<td>
									<img alt="商品图片" style="width:200px;height:200px" src="${pageContext.request.contextPath}/image/article/${item.article.image}">
								</td>
								<td colspan="2">
                                    ${item.article.title}
								</td>
								<td>
									<span class="price">${item.article.price}</span>	
								</td>
								<td>
								     ${item.orderNum}
								</td>
								<td>
									<!-- <a href="shop/delete.do?id=1"
										onclick="return confirm('确定要把\n  苹果（APPLE）iPhone 5 16G版 3G手机（白色）WCDMA/GSM 全新设计，更薄、更轻、更快、更好的iPhone，以及卓越音效的EarPods耳机  \n从购物车中删除吗？')">删除</a>
									<a>收藏</a> -->
								</td>
							</tr>
						
					</tbody> 
					</c:forEach>
				   
				</c:forEach>

				</table>
			</div>
				 


      <footer>

      </footer>

    </div><!--/.container-->
    <!--  横幅下方的主体结束 -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
   
    <script src="resources/bootstrap/js/bootstrap.js"></script>

    <script src="resources/js/taobao.js"></script>
  </body>
</html>