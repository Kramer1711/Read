<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 320px; margin: 120px auto 0px auto; line-height: 24px; color: #ffd5bc; overflow: hidden">
		<form action="${pageContext.request.contextPath}/load.do"
			enctype="multipart/form-data" method="post">
			<input type="file"	name="file1" style="border: 1px dotted #ccc">
			<input type="submit" value="提交">
		</form>
	</div>
</body>
</html>