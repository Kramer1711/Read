<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>日志详情</title>
<!--引入css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/edit.css" />
<style>
#container {
	position: fixed;
	top: 0px;
	right: 0px;
	bottom: 0px;
	left: 0px;
	background-color: rgba(186, 186, 186, 0.4);
}

#container #login {
	position: relative;
	width: 500px;
	height: 100%;
	margin: 0px auto;
	background-color: rgba(186, 186, 186, 0.4);
	border-radius: 10px;
}

#container #login form dl {
	padding: 20px 0px; /* 上下  左右 */
}

#container #login form dl dt {
	text-align: center;
	font-size: 18px;
	line-height: 40px;
	letter-spacing: 3px;
}

#container #login form dl dd {
	margin: 20px 0px;
	text-align: center;
}

#container #login form dl dd input {
	border-radius: 5px;
	border: solid 1px lightgray;
}
</style>
</head>
<body>
	<div id="container">
		<div>
			<section>
				<form id="form1" name="form1">
					<dl>
						<dt>详情</dt>
					</dl>
					<table class="table ">
						<tr>
							<th>日志编号</th>
							<th>${record.id }</th>
						</tr>
						<tr>
							<th>创建时间</th>
							<th>${record.operateTime }</th>
						</tr>
						<tr>
							<th>操作人</th>
							<th>${record.admin.username }</th>
						</tr>
						<tr>
							<th>日志内容</th>
							<th>${record.operate }</th>
						</tr>
					</table>
					<p class="btn-container">
						<input type="button" value="返 回" class="btn btn-primary btn-sm"
							onclick="back()" />
					</p>
				</form>
			</section>
		</div>
	</div>
	<script type="text/javascript">
	function back(){
		window.location.href="<%=request.getContextPath()%>/record/qry.do";
	}
	</script>
</body>
</html>