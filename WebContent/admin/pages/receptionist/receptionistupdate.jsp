<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
<!--    引入外部CSS  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/edit.css" />
</head>
<body>
	<header>
		<ul class="nav nav-tabs">
			<li class="active"><a
				href="<%=request.getContextPath()%>/receptionist/qry.do">前台管理</a></li>
		</ul>
	</header>
	<section>
		<form id="form1" name="form1" method="post"
			action="<%=request.getContextPath()%>/receptionist/upd.do">
			<dl>
				<dt>编辑前台人员</dt>
				<dd>
					<strong>${message}</strong>
				</dd>
				<dd>
					<input type="hidden" id="id" name="id" value="${receptionist.id }" />
				</dd>
				<dd>
					姓名：<input type="text" id="name" name="name" placeholder="请输入姓名！"
						required autofocus class="form-control input-sm"
						value="${receptionist.name }" />
				</dd>
				<dd>
					登录帐号：<input type="text" id="username" name="username"
						placeholder="请设置帐号！" required class="form-control input-sm"
						value="${receptionist.account.username }" />
				</dd>
				<dd>
				<dd>
					入职时间： <input type="date" id="workDate" name="inDate"
						placeholder="请输入入职时间！" class="form-control input-sm"
						value="${receptionist.inDate }" />
				</dd>
				<dd class="btn-container">
					<div class="btn-group" role="group" aria-label="...">
						<input type="submit" value="确 定" class="btn btn-success btn-sm" />
						<input type="reset" value="重 置" class="btn btn-warning btn-sm" />
						<input type="button" value="返 回" class="btn btn-primary btn-sm"
							onclick="window.location='<%=request.getContextPath()%>/receptionist/qry.do'" />
						<input type="button" value="重置密码" class="btn btn-danger btn-sm"
							onclick="window.location='<%=request.getContextPath()%>/receptionist/rep.do?id=${receptionist.id }'" />
					</div>
				</dd>
			</dl>
		</form>
	</section>

</body>
</html>