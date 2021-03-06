<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<meta charset="utf-8" />
<meta />
<title>511中文网</title>

<script src="js/jquery-2.2.4.min.js"></script>
<script>
	$(document).ready(function() {
		
		$(".body").slideDown(500);
		
		$("#landing").addClass("border-btn");

		$("#registered").click(function() {
			$("#landing").removeClass("border-btn");
			$("#landing-content").hide(500);
			$(this).addClass("border-btn");
			$("#registered-content").show(500);
			
		})

		$("#landing").click(function() {
			$("#registered").removeClass("border-btn");
			$(this).addClass("border-btn");
			
			$("#landing-content").show(500);
			$("#registered-content").hide(500);
		})
	});
</script>

<style>
	* {
		margin: 0;
		padding: 0;
		font-family: "微软雅黑";
	}
	
	body {
		background: #F7F7F7;
	}
	
	#all {
		position: absolute;
		top: 50%;
		left: 50%;
		margin-left: -185px;
		margin-top: -210px;
		height: 420px;
		width: 340px;
		font-size: 18px;
		-webkit-box-shadow: 0px 0px 10px #A6A6A6;
		background: #fff;
	}
	
	.border-btn {
		border-bottom: 1px solid #ccc;
	}
	
	#landing,
	#registered {
		float: left;
		text-align: center;
		width: 170px;
		padding: 15px 0;
		color: #545454;
	}
	
	#landing-content {
		clear: both;
	}
	
	.inp {
		height: 30px;
		margin: 0 auto;
		margin-bottom: 30px;
		width: 200px;
	}
	
	.inp>input {
		text-align: center;
		height: 30px;
		width: 200px;
		margin: 0 auto;
		transition: all 0.3s ease-in-out;
	}
	
	.login {
		border: 1px solid #A6A6A6;
		color: #a6a6a6;
		height: 30px;
		width: 202px;
		text-align: center;
		font-size: 13.333333px;
		margin-left: 70px;
		line-height: 30px;
		margin-top: 30px;
		transition: all 0.3s ease-in-out;
	}
	
	.login:hover {
		background: #A6A6A6;
		color: #fff;
	}
	
	#bottom {
		margin-top: 30px;
		font-size: 13.333333px;
		color: #a6a6a6;
	}
	
	#registeredtxt {
		float: left;
		margin-left: 80px;
	}
	
	#forgotpassword {
		float: right;
		margin-right: 80px;
	}
	
	#photo {
		border-radius: 80px;
		border: 1px solid #ccc;
		height: 80px;
		width: 80px;
		margin: 0 auto;
		overflow: hidden;
		clear: both;
		margin-top: 30px;
		margin-bottom: 30px;
	}
	
	#photo>img:hover {
		-webkit-transform: rotateZ(360deg);
		-moz-transform: rotateZ(360deg);
		-o-transform: rotateZ(360deg);
		-ms-transform: rotateZ(360deg);
		transform: rotateZ(360deg);
	}
	
	#photo>img {
		height: 80px;
		width: 80px;
		-webkit-background-size: 220px 220px;
		border-radius: 60px;
		-webkit-transition: -webkit-transform 1s linear;
		-moz-transition: -moz-transform 1s linear;
		-o-transition: -o-transform 1s linear;
		-ms-transition: -ms-transform 1s linear;
	}
	
	
	#registered-content {
		margin-top: 40px;
		display: none;
	}
	
	.fix {
		clear: both;
	}
	.form{
		display: none;
	}
</style>

</head>

<body>
<div id="all">
	<div id="landing">登录</div>
	<div id="registered">注册</div>
	<div class="fix"></div>
	<form id="loginForm" action="/Read/login.do">
	<div id="landing-content">
		<div id="photo"><img src="images/bg/31.png" /></div>
		<div class="inp"><input name="username" type="text" class="loginname" value=""/></div>
		<div class="inp"><input name="password" type="password" class="loginpass" value=""/></div>
		<div class="login" onclick="document.getElementById('loginForm').submit()">登录</div>
	</div>
	</form>
	<form id="registerForm" action="/Read/register.do">
	<div id="registered-content">
		<div class="inp"><input name="username" type="text" placeholder="请输入用户名" /></div>
		<div class="inp"><input name="password1" type="password" placeholder="请输入密码" /></div>
		<div class="inp"><input name="password2" type="password" placeholder="请再次输入密码" /></div>
		<div class="inp"><input name="email" type="email" placeholder="电子邮箱" /></div>
		<div class="login" onclick="document.getElementById('registerForm').submit()">立即注册</div>
	</div>
	</form>
</div>

</body>
</html>









        <!--     <form method="post" action="/Read/login.do">
                <dl>
                    <dt><input name="username" type="text" class="loginname" value=""/></dt>
                    <dt><input name="password" type="password" class="loginpass" value=""/></dt>
                    <dt><input name="" type="submit" class="loginbtn"  value="登 陆"/>
                        <label><input name="" type="checkbox" value="" checked="checked">记住密码？</label>
                        <label><a href="#">忘记密码？</a> </label>
                    </dt>
                </dl>
            </form>
             -->