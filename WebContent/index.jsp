<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="javax.servlet.http.*" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>511中文网</title>
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
    
    <!-- Modernizr JS -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->  
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
								<!-- 搜索 -->
								<form action="index.do" id="searchbox" method="post" >
									<input name="pageNo" value="1" type="hidden">
									<input name="key" type="text" placeholder="Search" value="${key }"/>
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
								<li class="checkout m-0"><a href="#">checkout <i class="fa fa-angle-right"></i></a></li>
							</ul>							
						</div>
						<div class="setting-menu display-inline">
							<div class="icon-nav current"></div>
							<ul class="content-nav toogle-content">
								<li class="currencies-block-top">
									<div class="current"><b>欢迎使用511中文网</b></div>
									<ul>
										<li><a href="#">${username }

										</a></li>
										<li><a href="/Read/login.jsp">注销

										</a></li>
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
                <li><a href="#">图书</a></li>
			</ol>			
		</div>
	</div>
	<!-- breadcrumb end -->
	<!-- shop-area start -->
	<div class="shop-area">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-4">
					<div class="column">
						<h2 class="title-block">511中文网</h2>
						
						
						<div class="sidebar-widget">     <!--作品分类  -->
							<h3 class="sidebar-title">作品分类</h3>
							<ul class="sidebar-menu">
								<c:forEach var="type" items="${typeList }">
								<li>
									<form action="index.do" method="post">
										<input name="pageNo" value="1" type="hidden">
										<input name="key" type="hidden" placeholder="Search" value="${type.type }"/>
										<input type="submit"  value="${type.type }"/>
										<!-- <a href="index.do?key=${type.type }&pageNo=${1 }">${type.type}<span>(1)</span></a> -->
									</form>
								</li>
								</c:forEach>
							</ul>
						</div>
						
						<div class="sidebar-widget">
							<h3 class="sidebar-title">排行榜</h3>
							<ul class="sidebar-menu">
								<li><a href="#">  无限恐怖  <span>zhtty</span></a></li>
								<li><a href="#"> 将夜 <span>猫腻</span></a></li>
								<li><a href="#"> 重生之贼行天下  <span>发飙的蜗牛</span></a></li>
							</ul>
						</div>

					</div>
				</div>
				<div class="col-md-9 col-sm-8">
					<h2 class="page-heading mt-40">
						<span class="cat-name">编辑推荐</span>
						<span class="heading-counter">There are ${pageData.size() } books.</span>
					</h2>
					<div class="shop-page-bar">
						<div>	
							<!-- Tab panes -->
							<div class="tab-content">
								<table role="tabpanel" class="tab-pane active" id="home">
								<tbody>
								<% int i = -1; %>
								<c:forEach var="book" items="${pageData }">
								<div class="row mb-50">
								<% i++; %>
										<div class="col-xs-5 col-sm-5 col-md-4">
											<div class="product-wrapper">
												<div class="product-img">
													<a href="details.do?bookId=${book.id }"><img src="${book.coverPath }" alt="" /></a>
													<span class="new-label">New</span>
												</div>
											</div>											
										</div>
										<div class="col-xs-7 col-sm-7 col-md-8">
											<div class="product-content product-list">
												<div class="pro-title">
													<h3><a href="#" style="font-size: 20px;">${book.name } - ${book.type.type }</a></h3>
												</div>												
												<div class="price-reviews">
													<div class="price-box">
														<span class="price product-price">${book.author }</span>
													</div>
													<div class="pro-rating">
														<a href="#"><i class="fa fa-star-o"></i></a>
														<a href="#"><i class="fa fa-star-o"></i></a>
														<a href="#"><i class="fa fa-star-o"></i></a>
														<a href="#"><i class="fa fa-star-o"></i></a>
														<a href="#"><i class="fa fa-star-o"></i></a>
													</div>
													<p>已更新至：第${book.chapterNumber }章<br/></p>
													
												</div>
												<div class="product-action">
													<a class="cart" href="details.do?bookId=${book.id }"><span>Reading the book</span></a>
													<a href=""><i class="pe-7s-like"></i></a>
													<a href=""><i class="pe-7s-folder"></i></a>
													<a href="#" data-toggle="modal" data-target="#"><i class="pe-7s-look"></i></a>
												</div>
											</div>									
										</div>
									</div>
								</c:forEach>
								</tbody>
								</table>
								
								<div class="content-sortpagibar">
									<div class="product-count display-inline">Showing 1 - 12 of 13 items</div>
									<ul class="shop-pagi display-inline">
										<c:if test="${totalPage>0 }">
											<c:if test="${currentPage==1 }">
												<li class="disabled"><a href="#">首页</a></li>
												<li class="disabled"><a href="#">&laquo;</a></li>
											</c:if>
											<c:if test="${currentPage>1 }">
												<li><a href="javascript:goPage(1)">首页</a></li>
												<li><a href="javascript:goPage(${currentPage-1 })">&laquo;</a></li>
											</c:if>
											<li><a href="javascript:goPage(${currentPage} )">${currentPage}</a></li>
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
									<div class="selector-field f-right">
										<form action="#">
											<button class="compare">Compare (1)</button>
										</form>
									</div>												
								</div>							
							</div>
						</div>				
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- service-area end -->
	<!-- footer start -->
	<footer class="black-bg">

		<!-- footer-bootom-area start -->
		<div class="footer-bootom-area ptb-15">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="copyright">
							<p>Copyright &copy; 2017.511中文网  All rights reserved.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer-bootom-area end -->
	</footer>
	<!-- footer end -->
	<!-- Modal -->
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
                        <h3><a href="#">Phasellus Vel Hendrerit</a></h3>
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
	</div>
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
    <script>
		//跳转到指定页面
		var goPage = function(no) {
			var form = document.querySelector("#searchbox");
			form.pageNo.value = String(no);
			form.submit();
		}
	</script>
</body>

</html>
