<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 通过动态标签引入公共jsp页面 -->
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>


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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>商品详情</title>


<script type="text/javascript">

   // 为 ’-‘ 半丁事件，用户点击后，将购买的数量减一，但是必须保证购买的数量为大于等于1的正整数 
   function minuFun(){
	   
	   //获取输入框对应的dom对象
	   var  obj = document.getElementById("number");
	   //获取输入款中的值
	   var num = parseInt(obj.value);
	   
	   if(num>1){
		   //重新给输入框中的value赋值
		   obj.value = num - 1; 
	   }
	   
   }
   
   
   // 为 ’+‘ 半丁事件，用户点击后，将购买的数量减一，但是必须保证购买的数量为大于等于1的正整数 
   function addFun(){
	   
	   //获取输入框对应的dom对象
	   var  obj = document.getElementById("number");
	   //获取输入款中的值
	   var num = parseInt(obj.value);//parseInt:将字符窜转成整数
	   
	   //获取库存数
	   var kucun = parseInt("${article.storage}")
	   //重新给输入框中的value赋值
		obj.value = (num + 1) > kucun ?  kucun : num + 1; 
	   
	   
   }

    //为购买的数量对应的输入框  绑定失去焦点事件
    function validNum(obj){
    	//用户输入的数字 必须为 大于等于1的正整数，并且不能大于库存
    	
    	//1、判断用户输入的是否是数字   isNaN: is Not a Number
    	if(isNaN(obj.value)||obj.value < 1){
    		//用户输入的不是数字或者小于1的数字 都不合法,则 使用默认购买数量
    		obj.value = 1;
    	}else if(obj.value > parseInt("${article.storage}")){
    		obj.value = 1;
    		alert("购买数量已超过库存数，请核实");
    	}else{
    		//防止用户用户输入小数    假设用户输入3 == 》3  用户输入  3.5 == 》4   对用户输入的值 进行向上取整
    		obj.value = Math.ceil(obj.value);
    		
    		
    	}
    	
    }
</script>

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

		<div class="row row-offcanvas row-offcanvas-right">

			<!-- 内容主体开始 -->
			<div class="col-xs-12 col-sm-12">
				<div class="col-xs-12 col-sm-6">
					<img alt="商品的图片" style="width:300px;height:300px" src="${pageContext.request.contextPath}/image/article/${article.image}">
				</div>
				<div class="col-xs-12 col-sm-6">
					<p>${article.description}</p>
					<p>${article.title}</p>
					<p>${article.supplier}</p>
					<p>
						<span class="price">${article.price}</span>
						<font color="red"><fmt:formatNumber value="${article.discountPrice}" pattern="0.00"></fmt:formatNumber></font>
					</p>
					<p>
						库存量：<span id="storage">${article.storage}</span>
					</p>
					<p>
					<form method="get" action="${pageContext.request.contextPath}/shopCar/addToCar.do">
						<input type="hidden" name="id" value="${article.id}" /> <span
							style="font-weight: bold; font-size: 18px; cursor: pointer; margin-left: 10px; margin-right: 10px;"
							onclick="minuFun()">-</span>
						<input id="number" name="number" value="1" onblur="validNum(this)" style="width: 50px;" />
						<span
							style="font-weight: bold; font-size: 18px; cursor: pointer; margin-left: 10px; margin-right: 10px;"
							onclick="addFun()">+</span>
						<button>
							<span class="glyphicon glyphicon-shopping-cart"
								style="color: red;"></span>加入购物车
						</button>
					</form>
					</p>
				</div>
				<div class="col-xs-12">
					<fieldset>
						<legend>介绍</legend>
                        ${article.description}
						
					</fieldset>
				</div>
			</div>
			<!--/.col-xs-12.col-sm-9-->
			<!-- 内容主体结束 -->
		</div>
		<!--/row-->
		<hr>
		<footer>
		</footer>

	</div>
	<!--/.container-->
	<!--  横幅下方的主体结束 -->

</body>
</html>