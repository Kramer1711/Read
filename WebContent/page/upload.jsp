<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传</title>

<link rel="stylesheet" type="text/css" href="css/public.css">
<style type="text/css">
.message {
	width: 320px;
	margin: 120px auto 0px auto;
	line-height: 24px;
	color: #ffd5bc;
	overflow: hidden
}

.message .input {
	width: 219px;
	height: 28px;
	line-height: 28px;
	border: none;
	background: #333333;
	padding-left: 20px;
	color: #ffffff;
	font-family: Microsoft YaHei;
}

.message .liulan {
	width: 64px;
	height: 28px;
	border: 1px solid #ffb660;
	background: #fe9e19;
	color: #ffffff;
	cursor: pointer;
}

.message .files {
	position: absolute;
	left: -1000px;
	top: 52px;
	heigth: 26px;
	cursor: pointer;
	filter: Alpha(opacity = 0);
	-moz-opacity: 0;
	opacity: 0;
}
</style>
</head>

<body>

	<div class="message">
		<form method="post" action="load.do" enctype="multipart/form-data">
			<input type="text" id="txt" name="txt" class="input" value="文件域"
				disabled="disabled" /> 
			<input type="button"
				onMouseMove="f.style.pixelLeft=event.x-60;f.style.pixelTop=this.offsetTop;"
				value="上传图片" size="30" onClick="f.click()" class="liulan"> 
			<input
				type="file" id="f" onChange="txt.value=this.value" name="f"
				style="height: 26px;" class="files" size="1" hidefocus>
		</form>
	</div>
	<div
		style="text-align: center; margin: 50px 0; font: normal 14px/24px 'MicroSoft YaHei';">
	</div>
</body>
</html>
