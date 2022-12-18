<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 引入自定义标签 -->   
<%-- <%@ taglib prefix="fk" uri="/page"%> --%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品类型管理</title>
    <!-- Bootstrap core CSS -->
    <%-- c:url 标签的作用：
    	1.自动在URL的前面加上context path
    	2.如果客户端禁用了Cookie，自动使用URL重写技术，把jsessionid放到url的分号后面
    	/taobao/resources/bootstrap/css/bootstrap.css;jsessionid=xxxxx
     --%>
    <link href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/css/taobao.css" rel="stylesheet" />
    <!-- 引入分页标签样式 -->
    <link href="${pageContext.request.contextPath }/resources/css/pager.css" rel="stylesheet" />

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

<!-- 横幅导航条开始 -->
	<jsp:include page="/WEB-INF/jsp/common/nva_back.jsp"></jsp:include>

<!-- 横幅导航条结束 -->

<!--  主体内容开始 -->
<div class="container">
	<div class="panel panel-default">
	    <div class="panel-heading">
	    	<span>
	    		<c:if test="${not empty articleType }">
	    			修改
	    		</c:if>
	    		<c:if test="${empty articleType }">
	    			新增
	    		</c:if>
	    		商品类型
	    	</span>
	    </div>
	    <div class="panel-body" style="padding-top: 15px;">
		    <form action="<c:url value="/articleType_manager/addOrUpdate.action"/>" method="post"
		    	class="form-horizontal">
		    	<input type="hidden" value="${articleType.code}" name="code"/>
		    	<div class="form-group col-sm-12 col-md-6">
				    <label for="selectParent" class="col-sm-2 control-label">上级类型</label>
				    <div class="col-sm-10">
				        <select class="form-control" name="parentCode" id="selectParent">
				        	<option value="">==请选择==</option>
				        </select>
				    </div>
				</div>
		    	<div class="form-group col-sm-12 col-md-6">
				    <label for="inputName" class="col-sm-2 control-label">名称</label>
				    <div class="col-sm-10">
				        <input class="form-control" name="name" value="${articleType.name}" id="inputName" />
				    </div>
				</div>
		    	<div class="form-group col-sm-12">
				    <label for="inputRemark" class="col-sm-1 control-label">备注</label>
				    <div class="col-sm-11">
				        <textarea class="form-control" name="remark" id="inputRemark">${articleType.remark}</textarea>
				    </div>
				</div>
				<div class="form-group col-sm-12">
					<div class="pull-right">
				    	<button type="submit" class="btn btn-primary">提交</button>
				    </div>
				</div>
		    </form>
	    </div>
	</div>
    <hr>

    <footer>
        <p>&copy; 版权所有，欢迎借鉴</p>
    </footer>
</div>
<!--  主体内容结束 -->

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath }/resources/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/taobao.js"></script>
<script type="text/javascript">
    $(function(){
   
        
        //异步加载一级商品类型
        $.ajax({ 
        	   type: "get",
        	   url: "${pageContext.request.contextPath}/articleType_manager/loadFirstArticleType.action",
        	   dataType:"json",
        	   success: function(data){

        	      $.each(data,function(){
        	    	   $("<option>").val(this.code).html(this.name).appendTo("#selectParent");
        	       }) 
 
        	   },error: function(){
        		   alert("加载异常！");
        	   }
        	});
    })

</script>
</body>
</html>