<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>

<!-- 引入bootstrap 样式文件 -->
<link href="${path }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<H1>SSM-CRUD</H1>
			</div>
		</div>
		<!-- 新增，删除按钮-->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-success">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>

		</div>
		<!-- 表格  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>email</th>
						<th>gender</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<th>${emp.empId }</th>
							<th>${emp.empName }</th>
							<th>${emp.email }</th>
							<th>${emp.gender=="M"?"男":"女" }</th>
							<th>${emp.department.deptName }</th>
							<th>
								<button class="btn btn-info btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									编辑
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									删除
								</button>
							</th>
						</tr>
					</c:forEach>
				</table>

			</div>
		</div>
		<!-- 显示分页信息-->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6">当前第${pageInfo.pageNum }页
				,共有${pageInfo.pages }页 ,总计${pageInfo.total }条记录</div>
			<!-- 分页条信息 -->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="${path }/emps?pn=1">首页</a></li>
						<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="${path }/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						</c:if>
						<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
							<c:if test="${page_Num==pageInfo.pageNum }">
								<li class="active"><a href="#">${page_Num }</a></li>
							</c:if>
							<c:if test="${page_Num!=pageInfo.pageNum }">
								<li><a href="${path }/emps?pn=${page_Num}">${page_Num }</a></li>
							</c:if>

						</c:forEach>
						<c:if test="${pageInfo.hasNextPage }">
						<li><a href="${path }/emps?pn=${pageInfo.pageNum+1}" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
						</c:if>
						<li><a href="${path }/emps?pn=${pageInfo.pages}">末页</a></li>
					</ul>
				</nav>
			</div>

		</div>
	</div>

	<!-- 引入jquery 文件  -->
	<script type="text/javascript"
		src="${path }/static/js/jquery-1.12.4.min.js"></script>
	<!-- 引入bootstrap js文件 -->
	<script src="${path }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>