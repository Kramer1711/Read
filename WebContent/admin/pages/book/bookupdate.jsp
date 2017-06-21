<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
<!--    引入外部CSS  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/admin/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/admin/css/edit.css" />
</head>
<body>
	<header>
		<ul class="nav nav-tabs">
			<li class="active"><a
				href="<%=request.getContextPath()%>/qryBook.do">书籍管理</a></li>
		</ul>
	</header>
	<section>
		<form id="form1" name="form1" method="post"
			action="<%=request.getContextPath()%>/updateBook.do?bookId=${eBook.id }">
			<dl>
				<dt>${eBook.name }</dt>
				<dd>
					<strong>${message }</strong>
				</dd>
				<dd>
					<input type="text" id="bookName" name="bookName"
						placeholder="请输入书名！" required autofocus
						class="form-control input-sm" value="${eBook.name }" />
				</dd>
				<dd>
					<input type="text" id="bookAuthor" name="bookAuthor"
						placeholder="请输入作者" required autofocus
						class="form-control input-sm" value="${eBook.author }" />
				</dd>
				<dd>
					<select id="type" name="type" class="form-control input-sm"
						required>
						<option value="${eBook.type.id }">${eBook.type.type }</option>
						<c:forEach var="t" items="${typeList }">
							<option value="${t.id }">${t.type }</option>
						</c:forEach>
					</select>
				</dd>
				<dd>
					<textarea id="bookResume" name="bookResume"
						style="width: 300px; height: 120px; resize: none;">${eBook.resume }</textarea>
				</dd>
				<dd class="btn-container">
					<div class="btn-group" role="group" aria-label="...">
						<input type="submit" value="确 定" class="btn btn-success btn-sm" />
						<input type="reset" value="重 置" class="btn btn-warning btn-sm" />
						<input type="button" value="删 除" class="btn btn-danger btn-sm"
							onclick="deleteRoom(${eBook.id})" /> <input type="button"
							value="返 回" class="btn btn-info btn-sm" onclick="returnQry()" />
					</div>
				</dd>
			</dl>
		</form>
	</section>
	<script type="text/javascript">
function returnQry() {				
	window.location.href="<%=request.getContextPath()%>/qryBook.do";
}
function deleteRoom(id){
	var bookId = String(id);
	window.location.href="<%=request.getContextPath()%>/delBook.do?ebookid="+bookId;
}
</script>
</body>
</html>