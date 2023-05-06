<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <title>用户管理</title>
    
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/css/taobao.css" rel="stylesheet" />
    <!-- 引入分页标签样式 -->
     <link href="${pageContext.request.contextPath}/resources/css/pager.css" rel="stylesheet" />

	<style type="text/css">
		.panel-heading .btn
		{
			margin-top: -5px;
		}
		.panel-body
		{
			padding: 0;
		}
	</style>
</head>

<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TNMFZ6N"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
<!-- 横幅导航条开始 -->
	<jsp:include page="/WEB-INF/jsp/common/nva_back.jsp"></jsp:include>
<!-- 横幅导航条结束 -->
 <font color="red">${message}</font>
<!--  主体内容开始 -->
<div class="container">
<!--  横幅下方的主体开始 -->
	<div class="container">
	 <div class="alert alert-info" role="alert">
                <div>
                    <form action="<c:url value="/user_manager/userList.action"/>" method="post">
                        <table class="table-condensed">
                            <tbody>
                            <tr>
                           
                                <td>
                               
                                <div class="input-group">
                                    <input type="text" name="name" required="required" value="${name}"
                                           class="form-control" placeholder="请输入姓名或账号" />
                                    <div class="input-group-btn">
                                        <button class="btn" type="submit">
                                            <span class="glyphicon glyphicon-search"></span>
                                        </button>
                                    </div>
                                </div>
                                </td>
                            
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
            
	<div class="panel panel-default">
	    <div class="panel-heading">
	    	<span>用户列表</span>

	    </div>
	    <div class="panel-body">
		    <table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					    <th>登录名</th>
						<th>密码</th>
						<th>姓名</th>
						<th>性别</th>
						<th>邮箱</th>
						<th>电话</th>
						<th>角色</th>
						<th>用户当前状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users }" var="u">
						<tr> 
						    <td>${u.loginName}</td>
						    <td>${u.password}</td>
							<td>${u.name}</td>
							<td>
							  	<c:if test="${u.sex == 1}">
								    男
								</c:if>
								<c:if test="${u.sex == 21}">
								    女
								</c:if>
							   
							</td>
							<td>${u.email}</td>
							<td>${u.phone}</td>
							<td>
							  <c:choose>
							     <c:when test="${u.role == 2}">
							                        管理员
							     </c:when>
							     <c:otherwise>
							          会员     
							     </c:otherwise>
							  </c:choose>
							   
							
							</td>
							<td>
							  <c:choose>
							     <c:when test="${u.disabled == 0}">
							                        冻结中
							     </c:when>
							     <c:otherwise>
							                     正在使用  
							     </c:otherwise>
							  </c:choose>
							   
							
							</td>
							<td>
							  <c:choose>
							     <c:when test="${u.disabled eq '1'}">
                                     <span  class="label label-info"><a href="${pageContext.request.contextPath}/user_manager/activeServlet.action?id=${u.id}&disabled=0" style="color: white;">冻结</a></span>    
                                   
							     </c:when>
							     <c:otherwise>
                                    <span  class="label label-warning"><a href="${pageContext.request.contextPath}/user_manager/activeServlet.action?id=${u.id}&disabled=1" style="color: white;">激活</a></span>    
    
							     </c:otherwise>
							    </c:choose>
							  </td>  
						</tr>
					</c:forEach>
				</tbody>
			</table>

		 </div>
	</div>
    <hr>

    <footer>
    </footer>
</div>
<!--  主体内容结束 -->
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath }/resources/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/taobao.js"></script>

</body>
</html>