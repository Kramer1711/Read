<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>${eBook.name }</title>
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
#message3.table{
	background: white;
}
</style>
<!-- Modernizr JS -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
	<!-- header start -->
	<header class="header-pos blg">
	<div class="header-area header-middle">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2 col-sm-3 col-xs-12">
					<div class="logo" style="margin-left: 20px">
						<a href="index.do"><img height="50px" src="img/logo/logo-black.png" alt="" /></a>
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
								<form action="index.do" id="searchbox" method="post" >
									<input name="pageNo" value="1" type="hidden">
									<input name="key" type="text" placeholder="Search" value="${key }"/>
									<button class="button-search"></button>
								</form>
						</div>
					</div>
					<div class="shopping-cart ml-20 display-inline">
						<a href="cart.html"><b>reading records</b>(${records.size() })</a>
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
									<b>欢迎使用511中文网</b>
								</div>
								<ul>
									<li><a href="#">${username }</a></li>
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
	<!-- header end -->
	<div class="space-custom"></div>
	<!-- breadcrumb start -->
	<div class="breadcrumb-area">
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-home"></i></a></li>
				<li><a href="index.do"> 图书</a></li>
				<li class="active">${eBook.name }</li>
			</ol>
		</div>
	</div>
	<!-- breadcrumb end -->
	<!-- shop-area start -->
	<div class="shop-area">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-5">
					<div class="product-zoom">
						<!-- Tab panes -->
						<div class="tab-content">
							<div class="tab-pane active" id="home">
								<div class="pro-large-img">
									<img src="${eBook.coverPath }" alt="" /> <a class="popup-link"
										href="${eBook.coverPath }">View larger <i
										class="fa fa-search-plus" aria-hidden="true"></i></a>
								</div>
							</div>
							<div class="tab-pane" id="profile">
								<div class="pro-large-img">
									<img src="img/product/2.jpg" alt="" /> <a class="popup-link"
										href="img/product/2.jpg">View larger <i
										class="fa fa-search-plus" aria-hidden="true"></i></a>
								</div>
							</div>
							<div class="tab-pane" id="messages">
								<div class="pro-large-img">
									<img src="img/product/3.jpg" alt="" /> <a class="popup-link"
										href="img/product/3.jpg">View larger <i
										class="fa fa-search-plus" aria-hidden="true"></i></a>
								</div>
							</div>
							<div class="tab-pane" id="settings">
								<div class="pro-large-img">
									<img src="img/product/4.jpg" alt="" /> <a class="popup-link"
										href="img/product/4.jpg">View larger <i
										class="fa fa-search-plus" aria-hidden="true"></i></a>
								</div>
							</div>
							<div class="tab-pane" id="settings2">
								<div class="pro-large-img">
									<img src="img/product/5.jpg" alt="" /> <a class="popup-link"
										href="img/product/5.jpg">View larger <i
										class="fa fa-search-plus" aria-hidden="true"></i></a>
								</div>
							</div>
							<div class="tab-pane" id="settings3">
								<div class="pro-large-img">
									<img src="img/product/6.jpg" alt="" /> <a class="popup-link"
										href="img/product/6.jpg">View larger <i
										class="fa fa-search-plus" aria-hidden="true"></i></a>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-7">
					<div class="product-details">
						<h1 class="pro-d-title">${eBook.name }</h1>
						<div class="pro-ref">
							<p>
								<label>作者： </label> <span> ${eBook.author } </span>
							</p>
							<p>
								<label>类别： </label> <span> ${eBook.type.type } </span>
							</p>
							<p>
								<label>字数： </label> <span> ${eBook.charNumber } </span>
							</p>
							<p>
								<label>章节： </label> <span> ${eBook.chapterNumber }章 </span>
							</p>
							<li style="margin-left: -40px">
								<ol class="wc-proceed-to-checkout"><a href="/Read/readChapter.do?chapterId=${chapters.get(0).id }">开始阅读</a></ol>
								<ol class="buttons-cart"><a href="#">收藏</a></ol>
							</li>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- shop-area end -->
	<!-- pro-info-area start -->
	<div class="pro-info-area ptb-80">
		<div class="container">
			<div class="pro-info-box">
				<!-- Nav tabs -->
				<ul class="pro-info-tab" role="tablist">
					<li class="active"><a href="#home3" data-toggle="tab">简介</a></li>
					<li><a href="#profile3" data-toggle="tab">作品信息</a></li>
					<li><a href="#messages3" data-toggle="tab">目录</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="home3">
						<div class="pro-desc">${eBook.resume }</div>
					</div>
					<div class="tab-pane" id="profile3">
						<div class="pro-desc">
							<table class="table-data-sheet">
								<tbody>
									<tr class="odd">
										<td>作者</td>
										<td>${eBook.author }</td>
									</tr>
									<tr class="even">
										<td>类别</td>
										<td>${eBook.type.type }</td>
									</tr>
									<tr class="odd">
										<td>章节</td>
										<td>${eBook.chapterNumber }章</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane " id="messages3">
						<div class="pro-desc">
							<table class="table-data-sheet" >
								<tbody >
									<% int i = 0; %>
									<c:forEach var="chapter" items="${chapters }" >
									<%
										if (i % 3 != 0) {
									%>

									<%
										} else {
									%>
										</tr>
										<tr class="odd">

									<%
										}
									%>
									<%
										i++;
									%>	
									<td>
											<a href="/Read/readChapter.do?chapterId=${chapter.id }">${chapter.chapter }</a>
										</td>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- pro-info-area end -->
	<!-- best-sell-area start -->
	<!-- <div class="best-sell-area">
		<div class="container">
			<div class="row">
				<div class="section-title text-center mb-50">
					<h2>Accessories</h2>
				</div>
			</div>		
			<div class="row">
				<div class="product-carousel">
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/4.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>									
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/12.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/3.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/5.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/5.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/6.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/7.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>						
			</div>
		</div>
	</div> -->
	<!-- best-sell-area end -->
	<!-- best-sell-area start -->
	<!-- <div class="best-sell-area ptb-60">
		<div class="container">
			<div class="row">
				<div class="section-title text-center mb-50">
					<h2>12 other products in the same category: </h2>
				</div>
			</div>		
			<div class="row">
				<div class="product-carousel">
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/1.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>									
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/2.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/9.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/8.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/7.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/3.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="product-wrapper mb-40 mrg-nn-xs">
							<div class="product-img">
								<a href="#"><img src="img/product/7.jpg" alt="" /></a>
								<span class="new-label">New</span>
								<div class="product-action">
									<a href="#"><i class="pe-7s-cart"></i></a>
									<a href="#"><i class="pe-7s-like"></i></a>
									<a href="#"><i class="pe-7s-folder"></i></a>
									<a href="#" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="pro-title">
									<h3><a href="product-details.html">Cras Neque Metus</a></h3>
								</div>
								<div class="price-reviews">
									<div class="price-box">
										<span class="price product-price">$262.00</span>
										<span class="old-price product-price">$262.00</span>
									</div>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
										<a href="#"><i class="fa fa-star-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>						
			</div>
		</div>
	</div> -->
	<!-- best-sell-area end -->
	<!-- brand-area start -->
	<!-- <div class="brand-area">
		<div class="container">
			<div class="brand-sep ptb-50">
				<div class="row">
					<div class="brand-active">
						<div class="col-lg-12">
							<div class="single-brand">
								<a href="#"><img src="img/brand/1.jpg" alt="" /></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="single-brand">
								<a href="#"><img src="img/brand/2.jpg" alt="" /></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="single-brand">
								<a href="#"><img src="img/brand/3.jpg" alt="" /></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="single-brand">
								<a href="#"><img src="img/brand/4.jpg" alt="" /></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="single-brand">
								<a href="#"><img src="img/brand/5.jpg" alt="" /></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="single-brand">
								<a href="#"><img src="img/brand/1.jpg" alt="" /></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="single-brand">
								<a href="#"><img src="img/brand/2.jpg" alt="" /></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	brand-area end
	service-area start
	<div class="service-area pt-70 pb-40 gray-bg">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="single-service mb-30">
						<div class="service-icon">
							<i class="pe-7s-world"></i>
						</div>
						<div class="service-title">
							<h3>FREE SHIPPING</h3>
							<p>Free shipping on all UK orders</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="single-service mb-30">
						<div class="service-icon">
							<i class="pe-7s-refresh"></i>
						</div>
						<div class="service-title">
							<h3>FREE EXCHANGE</h3>
							<p>30 days return on all items</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="single-service mb-30 sm-mrg">
						<div class="service-icon">
							<i class="pe-7s-headphones"></i>
						</div>
						<div class="service-title">
							<h3>PREMIUM SUPPORT</h3>
							<p>We support online 24 hours a day</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="single-service mb-30 xs-mrg sm-mrg">
						<div class="service-icon">
							<i class="pe-7s-gift"></i>
						</div>
						<div class="service-title">
							<h3>BLACK FRIDAY</h3>
							<p>Shocking discount on every friday</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	service-area end
	footer start
	<footer class="black-bg">
		<div class="footer-top-area ptb-60">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-4">
						<div class="footer-widget">
							<h3 class="footer-title">Contact info</h3>
							<div class="footer-contact">
								<ul>
									<li><em class="fa fa-map-marker"></em>8901 Marmora Road, Glasgow <span>D04 89 GR, New York</span></li>
									<li><em class="fa fa-phone"></em>Telephones: (+1) 866-540-3229 <span>Fax: (+1) 866-540-3229</span></li>
									<li><em class="fa fa-envelope-o"></em>Email: support@posthemes.com</li>
								</ul>
							</div>							
						</div>
					</div>
					<div class="col-md-2 col-sm-4">
						<div class="footer-widget">
							<h3 class="footer-title">My account</h3>
							<ul class="block-content">
								<li><a href="#">My orders</a></li>
								<li><a href="#">My credit slips</a></li>
								<li><a href="#">Sitemap</a></li>
								<li><a href="#">My addresses</a></li>
								<li><a href="#">My personal info</a></li>	
							</ul>							
						</div>					
					</div>
					<div class="col-md-2 col-sm-4">
						<div class="footer-widget">
							<h3 class="footer-title">Information</h3>
							<ul class="block-content">
								<li><a href="#">Contact us</a></li>
								<li><a href="#">Discount</a></li>
								<li><a href="#">Site map</a></li>
								<li><a href="#">About us</a></li>	
								<li><a href="#">Custom service</a></li>									
							</ul>							
						</div>					
					</div>
					<div class="col-md-2 col-sm-4 footer-sm">
						<div class="footer-widget">
							<h3 class="footer-title">OUR SERVICE</h3>
							<ul class="block-content">
								<li><a href="#">My orders</a></li>
								<li><a href="#">My credit slips</a></li>
								<li><a href="#">Sitemap</a></li>
								<li><a href="#">My addresses</a></li>
								<li><a href="#">My personal info</a></li>	
							</ul>							
						</div>					
					</div>
					<div class="col-md-3 col-sm-4 footer-sm">
						<div class="footer-widget">
							<h3 class="footer-title">OPENING TIME</h3>
							<div class="footer-time">
								<p><span class="ft-content"><span class="day">Monday - Friday</span><span class="time">9:00 - 22:00</span></span></p>
								<p><span class="ft-content"><span class="day">Saturday</span><span class="time">10:00 - 24:00</span></span></p>
								<p><span class="ft-content"><span class="day">Sunday</span><span class="time">12:00 - 24:00</span></span></p>
								<p><span class="ft-content"><span class="day">Thursday</span><span class="time">Free Shipping</span></span></p>
								<p><span class="ft-content"><span class="day">Friday</span><span class="time">sale of 30%</span></span></p>
							</div>							
						</div>					
					</div>
				</div>
			</div>
		</div>
		footer-bootom-area start
		<div class="footer-bootom-area ptb-15">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="copyright">
							<p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="payment">
							<img src="img/payment.png" alt="" />
						</div>
					</div>
				</div>
			</div>
		</div>
		footer-bootom-area end
	</footer>
	footer end
	Modal
	<div class="modal fade" id="productModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                </div>
                <div class="modal-body">
                    <div class="modal-img">
                        <a href="shop.html"><img src="img/product/1.jpg" alt="" /></a>
                    </div>
                    <div class="modal-pro-content">
                        <h3><a href="single-product.html">Phasellus Vel Hendrerit</a></h3>
                        <div class="pro-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <span>(2 customer reviews)</span>
                        <div class="price">
                            <span>$70.00</span>
                            <span class="old">$80.11</span>
                        </div>
                        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet.</p>	
                        <form action="#">
                            <input type="number" value="1" />
                            <button>Add to cart</button>
                        </form>
                        <div class="product_meta">
                            <span class="posted_in">Categories: <a rel="tag" href="#">Albums</a>, <a rel="tag" href="#">Music</a></span> <span class="tagged_as">Tags: <a rel="tag" href="#">Albums</a>, <a rel="tag" href="#">Music</a></span> 
                        </div>
                        <div class="social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div> -->
	<!-- Modal end -->



	<!-- jquery latest version -->
	<script src="js/vendor/jquery-1.12.0.min.js"></script>
	<!-- Bootstrap framework js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- ajax-mail js -->
	<script src="js/ajax-mail.js"></script>
	<!-- owl.carousel js -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- owl.carousel js -->
	<script src="js/jquery-ui.min.js"></script>
	<!-- jquery.nivo.slider js -->
	<script src="js/jquery.nivo.slider.pack.js"></script>
	<!-- All js plugins included in this file. -->
	<script src="js/plugins.js"></script>
	<!-- Main js file that contents all jQuery plugins activation. -->
	<script src="js/main.js"></script>
</body>

</html>

</html>