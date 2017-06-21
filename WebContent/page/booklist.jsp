<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>书单</title>
</head>
<body>
	<section> 
	<article>
		<form id="qryBook" name="qryBook" method="post">
			<input name="pageNo" value="1" type="hidden"> 
			<input id="key"	name="key" placeholder="书名" value="${key }" autofocus />
			<input type="submit" value="查 询">
		</form>
	</article>
	<form id="form2" name="form2" method="post" action="">
		<table>
			<thead>
				<tr>
					<th>书名</th>
					<th>作者</th>
					<th>类型</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="g" items="${pageData}" varStatus="vs">
					<tr>
						<td>${g.name}</td>
						<td>${g.author}</td>
						<td>${g.type}</td>
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
			var form = document.querySelector("#qryBook");
			form.pageNo.value = String(no);
			form.submit();
		}
	</script>
</body>
</html>