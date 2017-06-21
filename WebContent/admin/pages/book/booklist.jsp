<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<head>
<meta charset="UTF-8">
<title></title>
<!--    引入外部CSS  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/admin/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/admin/css/list.css" />

<!--    引入外部JS  -->
<script src="<%=request.getContextPath()%>/admin/js/list.js"></script>
</head>
<body>
	<header>
		<ul class="nav nav-tabs">
			<li class="active"><a
				href="<%=request.getContextPath()%>/admin/pages/room/roomlist.jsp">书籍管理</a></li>
		</ul>
	</header>
	<section>
		<article>
			<form method="post" action="/Read/qryBook.do"
				class="form-group form-inline form-align">
				<input name="pageNo" value="1" type="hidden"> <input
					id="key" name="key" placeholder="编号/书名/作者/类型"
					class="form-control input-size input-sm " value="${key }" autofocus />
				<input type="submit" value="查 询" class="btn btn-warning btn-search">
			</form>
		</article>
		<form id="form2" name="form2" method="post" action="">
			<!--    table   详细信息    -->
			<table class="date table table-bordered ">
				<thead>
					<tr>
						<th>序号</th>
						<th>操作</th>
						<th style="width: 40px">编号</th>
						<th>名称</th>
						<th>类型</th>
						<th>作者</th>
						<th>章节数</th>
						<th>上传时间</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ebook" items="${pageData}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td><a href="/Read/editBook.do?ebookId=${ebook.id }">编辑/删除</a></td>
							<td>${ebook.id}</td>
							<td>${ebook.name}</td>
							<td>${ebook.type.type }</td>
							<td>${ebook.author}</td>
							<td>${ebook.chapterNumber}</td>
							<td>${ebook.upLoadTime}</td>
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
			var form = document.querySelector("#qryRoomForm");
			form.pageNo.value = String(no);
			form.submit();
		}
	</script>
</body>
</html>