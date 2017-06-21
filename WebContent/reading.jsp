<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>${chapter.chapter }</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon
    ============================================ -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

<!-- All css files are included here. -->
<!-- Bootstrap framework main css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- This core.css file contents all plugings css file. -->
<link rel="stylesheet" href="css/core.css">
<!-- Theme shortcodes/elements style -->
<link rel="stylesheet" href="css/shortcode/shortcodes.css">
<!-- Theme main style -->
<link rel="stylesheet" href="style.css">
<!-- Responsive css -->
<link rel="stylesheet" href="css/responsive.css">
<!-- User style -->
<link rel="stylesheet" href="css/custom.css">

<style type="text/css">
body {
	
}

#title {
	text-align: center;
	font-size: 28px;
	margin: 250px auto 100px auto;
	width: 400px;
	height: 100px;
}

#content {
	font-size:16px;
	margin: 0 150px 0 150px;
	border: 1px #FF2FFF;
	background: white;
}
#div{}
</style>

<!-- Modernizr JS -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>

</head>


<body>
	<header class="header-pos blg">
		<div class="header-area header-middle">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-2 col-sm-3 col-xs-12">
						<div class="logo">
							<a href="index.do"><img height="50px" style="margin-left: 20px;" src="img/logo/logo-black.png" alt="" /></a>
						</div>
					</div>
					<div class="col-md-10 col-sm-9 col-xs-12 text-right xs-center">
						<div class="main-menu display-inline hidden-sm hidden-xs">
							<nav>
								<ul>
									<li><a href="index.do">Home</a></li>
								</ul>
							</nav>
						</div>
						<div class="search-block-top display-inline">
							<div class="icon-search"></div>
							<div class="toogle-content">
								<form action="#" id="searchbox">
									<input type="text" placeholder="Search" />
									<button class="button-search"></button>
								</form>
							</div>
						</div>
						<div class="shopping-cart ml-20 display-inline">
							<a href="#"><b>reading records</b>(${records.size() })</a>
							<ul>
								<c:forEach var="record" items="${records }">
								<li>
									<div class="cart-img">
										<a href="#"><img height="100px" src="${record.book.coverPath }" alt="" /></a>
									</div>
									<div class="cart-content">
										<h3><a href="#"> ${record.book.name }</a> </h3>
										<span><b>${record.chapter.chapter }</b></span>
										<!-- <span class="cart-price">£ 16.84</span> -->
									</div>
									<div class="cart-del">
										<i class="fa fa-times-circle"></i>
									</div>
								</li>
								</c:forEach>
								<li class="checkout m-0"><a href="#">checkout <i
										class="fa fa-angle-right"></i></a></li>
							</ul>
						</div>
						<div class="setting-menu display-inline">
							<div class="icon-nav current"></div>
							<ul class="content-nav toogle-content">
								<li class="currencies-block-top">
									<div class="current">
										<b>Currency : USD</b>
									</div>
									<ul>
										<li><a href="#">Dollar (USD)</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mobile-menu-area visible-sm visible-xs">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="mobile-menu">
							<nav id="mobile-menu-active">
								<ul>
									<li><a href="#">Home</a></li>
									<li><a href="shop.html">Sofa</a></li>
									<li><a href="#">Elements</a></li>
									<li><a href="shop.html">Lighting</a></li>
									<li><a href="#">Pages</a></li>
									<li><a href="#">What's New</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div id="chapter">
		<div id="title">${chapter.chapter }</div>
		<div id="content">${chapter.content }</div>
		<div>
			<table style="margin: 0px auto; font-size: 20px;">
				<tr>
					<td style="text-align: left; ">
						<a href="/Read/preChapter.do?currentChapterId=${chapter.id }">上一章</a><br>
					</td>
					<td style="text-align: center; width: 120px; height: 100px;">
						<a href="/Read/details.do?bookId=${chapter.book.id }">目录</a>
					</td>
					<td style="text-align: right;">
						<a href="/Read/nextChapter.do?currentChapterId=${chapter.id }">下一章</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>