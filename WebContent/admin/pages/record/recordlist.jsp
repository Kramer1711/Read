<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>日志</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css" />
</head>
<body>
	<header>
		<ul class="nav nav-tabs">
			<li class="active"><a href="javascript:void(0)"><b>操作日志</b></a></li>
		</ul>
	</header>
	<section>
		<article>
			<form id="form1" name="form1" method="post"
				action="<%=request.getContextPath()%>/record/qry.do"
				class="form-inline form-group form-align">
				<input type="hidden" name="pageNo" value="1" /> 
				<input type="input"	id="key" name="key" placeholder="请输入所查询日志创建时间或操作人"
					class="form-control input-sm input-size" value="${key }"/> 
				<input type="submit" value="查 询" class="btn btn-warning" />
			</form>
		</article>
		<form id="form2" name="form2" method="post" action="">
			<table class="table table-bordered table-hover ">
				<thead>
					<tr>
						<th>序 号</th>
						<th>操作</th>
						<th>创建时间</th>
						<th>操作人</th>
						<th>操作内容</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="g" items="${pageData}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td><a
								href="<%=request.getContextPath() %>/record/det.do?id=${g.id}">查看</a>
							</td>
							<td>${g.operateTime}</td>
							<td>${g.admin.username}</td>
							<td>${g.operate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<ul class="pagination nav-align">
					<c:if test="${totalPage>0 }">
						<c:if test="${currentPage==1 }">
							<li class="disabled"><a href="#">首页</a></li>
							<li class="disabled"><a href="#">&laquo;</a></li>
						</c:if>
						<c:if test="${currentPage>1 }">
							<li><a href="javascript:goPage(1)">首页</a></li>
							<li><a href="javascript:goPage(${currentPage-1 })">&laquo;</a></li>
						</c:if>
						<li><a href="javascript:goPage(${currentPage} )">第${currentPage}页</a></li>
						<c:if test="${currentPage==totalPage }">
							<li class="disabled"><a href="#">&raquo;</a></li>
							<li class="disabled"><a href="#">末页</a></li>
						</c:if>
						<c:if test="${currentPage<totalPage}">
							<li><a href="javascript:goPage(${currentPage+1})">&raquo;</a></li>
							<li><a href="javascript:goPage(${totalPage})">末页</a></li>
						</c:if>
					</c:if>
				</ul>
			</nav>
		</form>
	</section>
	<script>
		//跳转到指定页面
		var goPage = function(no) {
			var form = document.querySelector("#form1");
			form.pageNo.value = String(no);
			form.submit();
		}
	</script>
</body>
</html>