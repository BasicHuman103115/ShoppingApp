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
<title>注册页面</title>


     <script type="text/javascript">
     
    	
		   
     
    	$(function(){
    		  var sex = "${session_user.sex}";
  		 	if(sex == 1){
  		 		$("#sex1").attr("checked",'checked'); 
  		 	}else{
  		 		$("#sex2").attr("checked",'checked');
  		 	}
  		 	
    		 // 给登录按钮绑定点击事件
            $("#btn_submit").click(function(){
  
            	//获取真实姓名
            	var name = $("#name").val();
            	//联系电话
            	var phone = $("#phone").val();
            	//邮箱
            	var email = $("#email").val();
            	//地址
            	var address = $("#address").val();	
        
            	//获取确认密码
            	var okPass = $("#okPassword").val();

                // 定义一个变量存储校验信息
                var msg  = "" ;
              if(!$.trim(name)){
                	msg = "请输入姓名";
                }else if(name == "${session_user.loginName}"){
                	msg = "登录名和姓名不能一样！";
                }else if(okPass!= null && okPass != "" && !/^\w{6,}$/.test(okPass)){
                    msg = "请输入6位以上合法的密码";
                }else if(!$.trim(phone)){
                	msg = "请输入手机号码";
                }else if(!/^1[3-578]\d{9}$/.test(phone)){
                	msg = "手机号码格式不正确！";
                }else if(!$.trim(email)){
                	msg = "请输入邮箱";
                }else if(!/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/.test(email)){
                	msg = "邮箱格式不正确！";
                }else if(!$.trim(address)){
                	msg = "请输入地址";
                }

                if(msg!=""){
                    // 触发弹出框
                  alert(msg);
                }else{
                	 // 提交表单
                    $(".form-horizontal").submit();
                }
               
            });
    	})
     
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
		<div class="row info-content">
			<form id="registerForm" class="form-horizontal" method="post"
				action="${pageContext.request.contextPath}/user/userUpdate.do" style="margin-top: 20px;">
				<input type="hidden" value="${session_user.id}" name="id"/>
				<input type="hidden" value="${session_user.loginName}" name="loginName"/>
				<div class="form-group">
					<label class="col-sm-2 control-label">登录名称</label>
					<div class="col-sm-3">
						<input type="text" id="loginName"  name="loginName" value="${session_user.login_name}"
							class="form-control" placeholder="登录名称" disabled="disabled">
					</div>
					<%-- <label class="col-sm-2 control-label">登录名称${session_user}--</label>
					<div class="col-sm-3">
						${session_user.loginName}
					</div> --%>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">真实姓名</label>
					<div class="col-sm-3">
						<input type="text" id="name"  name="name" value="${session_user.name}"
							class="form-control" placeholder="请输入您的真实姓名" disabled="disabled">
					</div>

				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">登录密码</label>
					<div class="col-sm-3">
						<input type="password"  
							class="form-control" value="${session_user.password}" disabled="disabled">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">修改登录密码</label>
					<div class="col-sm-3">
						<input type="password" id="okPassword" name="password"
							class="form-control" placeholder="输入新密码,为空则不修改密码！">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">性别</label>
					<div class="col-sm-3">
						<label>男:</label><input id="sex1" name="sex" value="1" type="radio"> <label>女:</label><input
							id="sex2" name="sex" value="2" type="radio">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">联系电话</label>
					<div class="col-sm-3">
						<input type="text" id="phone"  name="phone" value="${session_user.phone}"
							class="form-control" placeholder="请输入您的电话">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">地址</label>
					<div class="col-sm-8">
						<textarea id="address" name="address" rows="4" cols="30"
							class="form-control" placeholder="请输入您的地址信息">${session_user.address}</textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">电子邮箱:</label>
					<div class="col-sm-3">
						<input type="text" id="email" name="email" value="${session_user.email}"
							class="form-control" placeholder="请输入您的邮箱">
					</div>
					<div class="col-sm-3">
						<span style="color: red;">${message}</span>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-3">
						<button type="button" id="btn_submit" class="btn btn-success">
							<span class="glyphicon glyphicon-user">更新个人信息</span>
						</button>
						<button type="reset" class="btn btn-info">
							<span class="glyphicon glyphicon-edit">重置</span>
						</button>
					</div>
				</div>
			</form>
		</div>
		<footer>
			
		</footer>

	</div>
	<!--  横幅下方的主体结束 -->
</body>
</html>

 