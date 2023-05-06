<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>商品首页</title>
<!-- Bootstrap core CSS -->
<%-- c:url 标签的作用：
    	1.自动在URL的前面加上context path
    	2.如果客户端禁用了Cookie，自动使用URL重写技术，把jsessionid放到url的分号后面
    	/taobao/resources/bootstrap/css/bootstrap.css;jsessionid=xxxxx
     --%>
<link href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/css/taobao.css"
	rel="stylesheet" />

</head>

<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TNMFZ6N"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
	<!-- 横幅导航条开始 -->
	<jsp:include page="/WEB-INF/jsp/common/nva_back.jsp"></jsp:include>

	<!-- 横幅导航条结束 -->

	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">

			<!-- 内容主体开始 -->
			<div class="col-xs-12 col-sm-12">
				<div class="col-xs-12 col-sm-6">
					<img alt="商品的图片" style="width: 300px; height: 300px"
						src="${pageContext.request.contextPath}/image/article/${article.image}">
				</div>
				<div class="col-xs-12 col-sm-6">
					<p>${article.title}</p>
					<p>${article.supplier}</p>
					<p>
						<span class="price">${article.price}</span>
						<c:if test="${article.discount!=null}">
							<span style="color: red">折扣价： (${article.discount})</span>
						</c:if>

					</p>
					<p>
						库存量：<span id="storage">${article.storage}</span>
					</p>
					<p>
					<form method="get"
						action="<c:url value="/article_manager/getAll.action"/>">
						<!-- 商品数量 -->
						<button>
							<span class="glyphicon glyphicon-chevron-left"
								style="color: red;"></span>返回
						</button>
					</form>


				</div>
				<div class="col-xs-12">
					<fieldset>
						<legend>介绍</legend>
						${article.description}
					</fieldset>
				</div>
			</div>
		</div>
		<hr>
		<footer>

		</footer>
	</div>
	<script
		src="${pageContext.request.contextPath }/resources/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/taobao.js"></script>
</body>
</html>