<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet"
	href="./font/fontawesome-free-5.15.4-web/css/all.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400&display=swap"
	rel="stylesheet">
<title>Home</title>
<jsp:useBean class="dao.CategoryDao" id="category"></jsp:useBean>
<jsp:useBean class="dao.ProductDao" id="product"></jsp:useBean>
</head>

<body>
	<div class="app">
		<!-- start header -->
		<%@include file="header.jsp"%>
		<!-- end header -->

		<!-- login -->
		<%@include file="loginRegis.jsp"%>

		<!-- start content -->
		<div class="container ">
			<div class="banner">
				<div class="grid">
					<div class="banner-wrapper">
						<div class="category-index">
							<a href="#" class="category-heading"> <i
								class="fa-solid fa-bars"></i> Danh mục sản phẩm
							</a>
						</div>

						<ul class="banner__action">
							<li class="banner__action-item banner__action-item-separate">
								<i class="banner__action-icon fa-solid fa-phone"></i> Hotline :
								012345
								<div
									class="banner__action-item-desciption banner__action-item-desciption-separate">
									<p class="desciption">Tổng đài hỗ trợ 24/7 gọi lúc nào cũng
										bắt máy luôn</p>
								</div>
							</li>
							<li class="banner__action-item"><a href=""
								class="banner__action-item-link"> <i
									class="banner__action-icon fa-solid fa-circle-question"></i> Hỗ
									trợ
							</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="content">
				<div class="grid">
					<div class="category-list_poster">
						<ul class="category-list-index">
							<c:forEach items="${category.getListCategories()}" var="cate">
								<li class="category-list__item"><a
									href="listProductByCate?idCate=${cate.getId()}&nameCate=${cate.getName()}"
									class="category-list__item-link">${cate.getName() }</a></li>
							</c:forEach>
						</ul>
						<div class="poster">
							<img src="./image/banner-sach-moi.jpg">
						</div>
					</div>


					<!-- new books -->
					<div class="new_book">
						<div class="new_book-title">
							<i class="fa fa-star"></i>
							<h3>Sách mới</h3>
						</div>
						<div class="list-book">
							<div class="grid__row">
								<c:forEach items="${product.getListNewProducts()}" var="newBook">
									<div class="grid__column-3">
										<div class="book-wrapper">
											<a href="detail?id=${ newBook.getId()}" class="book-link">
												<div class="book">
													<div class="book-img">
														<img src="${newBook.getImage() }">
													</div>
													<div class="book-info">
														<h3 class="name">${newBook.getName() }</h3>
														<p class="author">Tác giả : ${newBook.getAuthor() }</p>
														<p class="price format-money">Giá : ${newBook.getPrice()}</p>
													</div>
												</div>
											</a>
											<div class="add-cart-wrapper">
												<button class="${sessionScope.user!=null?'y-user':'n-user' }" data-index="${newBook.getId()}">Thêm vào giỏ hàng</button>
											</div>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
					</div>

					<!-- good book -->
					<div class="new_book">
						<div class="new_book-title">
							<i class="fa fa-trophy"></i>
							<h3>Sách hay nên đọc</h3>
						</div>
						<div class="list-book">
							<div class="grid__row">
								<c:forEach items="${product.getListClassifyProducts(1)}"
									var="newBook">
									<div class="grid__column-3">
										<div class="book-wrapper">
											<a href="detail?id=${ newBook.getId()}" class="book-link">
												<div class="book">
													<div class="book-img">
														<img src="${newBook.getImage() }">
													</div>
													<div class="book-info">
														<h3 class="name">${newBook.getName() }</h3>
														<p class="author">Tác giả : ${newBook.getAuthor() }</p>
														<p class="price format-money">Giá : ${newBook.getPrice()}</p>
													</div>
												</div>
											</a>
											<div class="add-cart-wrapper">
												<button class="${sessionScope.user!=null?'y-user':'n-user' }"data-index="${newBook.getId()}">Thêm vào giỏ hàng</button>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

					<!-- upcoming book -->
					<div class="new_book">
						<div class="new_book-title">
							<i class="fa-solid fa-calendar"></i>
							<h3>Sách sắp phát hành</h3>
						</div>
						<div class="list-book">
							<div class="grid__row">
								<c:forEach items="${product.getListClassifyProducts(2)}"
									var="newBook">
									<div class="grid__column-3">
										<div class="book-wrapper">
											<a href="detail?id=${ newBook.getId()}" class="book-link">
												<div class="book">
													<div class="book-img">
														<img src="${newBook.getImage() }">
													</div>
													<div class="book-info">
														<h3 class="name">${newBook.getName() }</h3>
														<p class="author">Tác giả : ${newBook.getAuthor() }</p>
														<p class="price format-money">Giá : ${newBook.getPrice()}</p>
													</div>
												</div>
											</a>
											<div class="add-cart-wrapper">
												<button class="${sessionScope.user!=null?'y-user':'n-user' }" data-index="${newBook.getId()}">Thêm vào giỏ hàng</button>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end content -->

		<!-- start footer -->
		<footer> </footer>
		<!-- end footer -->
		<script src="https://kit.fontawesome.com/5d4c5a9375.js "></script>
		<script src="./js/main.js"></script>
	</div>
</body>

</html>