<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>511中文网管理平台</title>
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/admin/css/reset.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/admin/css/main.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/admin/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/admin/js/menu.js"></script>
<style>
.top {
	height: 88px;
	background-color: #32323a;
}

.toplogo {
	height: 88px;
	float: left;
	width: auto;
	padding-right: 9px;
}

.nav {
	float: left;
}

.nav li {
	float: left;
	width: 95px;
	height: 88px;
	line-height: 88px;
	text-align: center;
}

.nav li a {
	display: block;
	width: 95px;
	height: 88px;
	-moz-transition: none;
	transition: background-color 0.3s linear;
	-moz-transition: background-color 0.3s linear;
	-webkit-transition: background-color 0.3s linear;
	-o-transition: background-color 0.3s linear;
}

.nav li a:hover {
	display: block;
	background: #000;
	color: #fff;
	background: #777777;
}

.nav li a {
	display: block;
	color: white;
}

.nav a h2 {
	font-size: 16px;
	/*color:#d6e8f1;*/
}

.nav a:hover h2 {
	/*color:#fff;*/
	
}

.topright {
	float: right;
	height: 88px;
}

.topright ul {
	padding-top: 15px;
	float: right;
	padding-right: 12px;
}

.topright ul li {
	float: left;
	height: 16px;
	padding-left: 5px;
	padding-right: 5px;
	background: url(<%=request.getContextPath()%>/images/line.gif)
		no-repeat right;
}

.topright ul li:last-child {
	background: none;
}

.topright ul li a {
	font-size: 15px;
	line-height: normal;
	color: #e9f2f7;
}

.topright ul li a:hover {
	color: #fff;
}

.topright ul li span {
	float: left;
	padding-right: 3px;
}

.message {
	height: 30px;
	background: url(<%=request.getContextPath()%>/images/ub1.png) repeat-x;
	clear: both;
	margin-top: 8px;
	float: right;
	margin-right: 12px;
	border-radius: 30px;
	white-space: nowrap;
	position: relative;
}

.message span {
	display: inline-block;
	padding-right: 10px;
	background: url(<%=request.getContextPath()%>/images/user.png)
		no-repeat 15px 10px;
	line-height: 30px;
	font-size: 14px;
	color: #b8ceda;
	padding-left: 20px;
	padding-left: 35px;
}

.message b {
	display: inline-block;
	width: 20px;
	height: 18px;
	background: url(<%=request.getContextPath()%>/images/msg.png);
	text-align: center;
	font-weight: normal;
	/*color:#fff;*/
	font-size: 14px;
	margin-right: 13px;
	margin-top: 7px;
	line-height: 18px;
}

.message i {
	display: inline-block;
	margin-right: 5px;
	font-style: normal;
	line-height: 30px;
	font-size: 14px;
	color: #b8ceda;
}

.center {
	position: absolute;
	width: 100%;
	height: 548px;
	/*padding: 5px;*/
}

.left_menu {
	float: left;
	width: 20%;
	background: #32323a;
	height: 100%;
	position: absolute;
	bottom: 0;
	overflow: auto;
}

.left_menu ul li {
	width: 300px;
	display: inline;
}

.left_menu ul li .list-item a {
	width: 230px;
	padding-left: 110px;
	text-decoration: none;
	font-size: 14px;
	color: #f5f5f5;
	line-height: 30px;
	display: block;
}

.left_menu ul li a.noline {
	border-bottom: none;
}

.left_menu ul li a:hover {
	color: #fff;
}

.left_menu ul li a.selected:hover {
	color: #fff;
}

.left_menu ul li h4 {
	cursor: pointer;
	padding-left: 60px;
	text-decoration: none;
	font-size: 16px;
	color: #f5f5f5;
	display: block;
	line-height: 48px;
	font-weight: normal;
}

.left_menu ul li.noline {
	border-bottom: none;
}

.left_menu ul li.selected h4 {
	background-position: 270px -45px;
	background-color: #777777;
}

.left_menu li .list-item {
	padding: 5px 0;
	position: relative;
	zoom: 1;
	background: #777777;
	overflow: hidden;
	display: none;
}

.left_menu h4 span {
	display: block;
	float: left;
	width: 20px;
	height: 26px;
	margin-right: 10px;
	padding-right: 10px;
	background-repeat: no-repeat;
	margin-top: 12px;
}

#footer {
	height: 40px;
	line-height: 40px;
	background: #5e5e5e;
	width: 100%;
	position: absolute;
	bottom: 0;
	text-align: center;
}

.pic {
	margin-bottom: 8px;
	margin-left: 12px;
}

.right {
	width: 79.8%;
	float: right;
	height: 100%;
	margin-left: 20%;
	bottom: 0;
	position: absolute;
}

#footer p {
	text-align: center;
	line-height: 40px;
	color: #fbfbfb;
}
</style>
</head>
<body>

	<div class="top">
		<div class="toplogo" style="margin: 10px 3px 0 45px">
			<a href="#" target="_parent"><img
				src="<%=request.getContextPath()%>/admin/images/logo2.png"
				height="75px" title="首页图标"></a>
		</div>
		<ul class="nav" style="margin-left: 50px">
			<li><a href="<%=request.getContextPath()%>/qryBook.do" target="rightFrame"><h2>书籍管理</h2></a></li>
			<li><a href="#" target="rightFrame"><h2>用户管理</h2></a></li>
			<li><a href="#" target="rightFrame"><h2>管理员</h2></a></li>
		</ul>
		<div class="topright">
			<ul>
				<li><span><img
						src="<%=request.getContextPath()%>/admin/images/help.png"
						title="帮助" class="helpimg"></span><a href="#">帮助</a></li>
				<li><a href="#">关于</a></li>
				<li><a href='login.jsp'>注销登陆</a></li>
			</ul>
			<div class="message">
				<span>管理员：XXXX，你好！</span> <i>消息</i> <b>5</b>
			</div>
		</div>
	</div>
	<div class="center">
		<div class="left">
			<div class="left_menu" >
				<ul id="nav_dot" style="margin-top: 30px">
					<li>
						<h4 class="M1">
							<span><img
								src="<%=request.getContextPath()%>/admin/images/kefang.png"
								title="客房" height="20px" class="pic"></span>书籍管理
						</h4>
						<div class="list-item none">
							<a href='<%=request.getContextPath()%>/qryBook.do' target="rightFrame">查询书籍</a> 
							<a href="<%=request.getContextPath() %>/admin/pages/book/upload.jsp"	target="rightFrame">添加书籍</a>
						</div>
					</li>
					<li>
						<h4 class="M4">
							<span><img src="<%=request.getContextPath()%>/admin/images/record.png"
								title="客房" height="20px" class="pic"></span>日志管理
						</h4>
						<div class="list-item none">
							<a href='#' target="rightFrame">操作日志查询</a>
						</div>
					</li>
					<li>
						<h4 class="M7">
							<span><img
								src="<%=request.getContextPath()%>/admin/images/admin.png"
								title="客房" height="20px" class="pic"></span>管理员
						</h4>
						<div class="list-item none">
							<a href='#'
								target="rightFrame">添加管理员</a>
						</div>
						<div class="list-item none">
							<a href='#' target="rightFrame">修改密码</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="right">
			<IFRAME src="<%=request.getContextPath()%>/qryBook.do"
				name="rightFrame" id="rightFrame" frameBorder=0 marginwidth=0
				marginheight=0 style="width: 100%; height: 100%;"
				ALLOWTRANSPARENCY="true"></IFRAME>
		</div>
	</div>
	<div id="footer">
		<p>Copyright ©2017 版权所有 All Rights reserved. 开局二带四
			仅供学习交流，勿用于任何商业用途</p>
	</div>
</body>
<script>
	navList(12);
</script>
</html>