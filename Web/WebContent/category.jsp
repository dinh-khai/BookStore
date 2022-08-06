<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet"
	href="./font/fontawesome-free-5.15.4-web/css/all.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./css/category.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<jsp:useBean class="dao.CategoryDao" id="category"></jsp:useBean>
<title>${nameCate}</title>
</head>
<body>
	<div class="app">
		<!-- header -->
		<%@include file="header.jsp"%>>

		<!-- login -->
		<%@include file="loginRegis.jsp"%>

		<!-- content -->
		<div class="category-container">
			<div class="banner">
				<div class="grid">
					<div class="banner-wrapper">
						<div class="category">
							<div class="category-heading">
								<i class="fa-solid fa-bars"></i> Danh mục sản phẩm <i
									class="fa-solid fa-angle-down"></i>
							</div>
							<ul class="category-list hide">
								<c:forEach items="${category.getListCategories()}" var="cate">
									<li class="category-list__item"><a
										href="listProductByCate?idCate=${cate.getId()}&nameCate=${cate.getName()}"
										class="category-list__item-link">${cate.getName()}</a></li>
								</c:forEach>
							</ul>
						</div>
						<ul class="banner__action">
							<li class="banner__action-item banner__action-item-separate">
								<i class="banner__action-icon fa-solid fa-phone"></i> Hotline :
								012345
								<div
									class="banner__action-item-desciption banner__action-item-desciption-separate">
									<p class="desciption">Tổng đài hỗ trợ 24/7 gọi lúc nào cũng
										bắt cmn máy luôn</p>
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
			<!-- content -->
			<div class="category-content">
				<div class="grid">
					<div class="breadcrumb">
						<a href="index.jsp">Trang chủ</a> <i
							class="fa-solid fa-chevron-right"></i> <span
							data-index="${idCate}">${nameCate }</span>
					</div>
					<div class="category-poster">
						<img src="./image/banner-sach-ktkn.jpg">
						<div class="category-banner"></div>
					</div>
					<div class="books-sort">
						<p class="books-sort-title">Sắp xếp :</p>
						<div class="sort">
							<div class="choose-sort">
								<span class="name-sort">Mới nhất</span> <span class="icon-sort"><i
									class="fa-solid fa-angle-down"></i></span>
							</div>
							<ul class="sort__list hide">
								<li class="sort__list-item active">Mới nhất</li>
								<li class="sort__list-item">Giá cao-thấp</li>
								<li class="sort__list-item">Giá thấp-cao</li>
							</ul>
						</div>
					</div>
					<div class="list-book">
						<div id="content" class="grid__row">
							<!-- book -->
							<c:forEach items="${list}" var="product">
								<div class="grid__column-3">
									<div class="book-wrapper">
										<a href="detail?id=${newBook.getId() }" class="book-link">
											<div class="book">
												<div class="book-img">
													<img
														src="${product.getImage() }">
												</div>
												<div class="book-info">
													<h3 class="name">${product.getName()}</h3>
													<p class="author">Tác giả :${product.getAuthor()}</p>
													<p class="price format-money">Giá : ${product.getPrice() }</p>
												</div>
											</div>
										</a>
										<div class="add-cart-wrapper">
											<button class="${sessiScope.user!=null?'y-user':'n-user' }">Thêm
												vào giỏ hàng</button>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<c:if test="${page>1 }">
						<div class="page-bar">
							<span class="icon-page prev"> <i
								class="fa-solid fa-angle-left"></i></span>
							<ul class="page">
								<c:forEach begin="1" end="${page }" var="p">
									<li class="page-item ${p==1?'active':'' }" data-index="${p}">${p}</li>
								</c:forEach>
							</ul>
							<span class="icon-page next"> <i
								class="fa-solid fa-angle-right"></i></span>
						</div>
					</c:if>
					<c:if test="${page==1||page<1}">
						<div></div>
					</c:if>
				</div>
			</div>
		</div>
		<!-- footer -->
		<footer> </footer>
	</div>
	<script src="https://kit.fontawesome.com/5d4c5a9375.js "></script>
	<script src="./js/cate.js"></script>
	<script src="./js/main.js"></script>
	<script>
		var pageItems = document.querySelectorAll(".page-item");
		var cateName = document.querySelector(".breadcrumb span")
		var idCate = cateName.getAttribute("data-index")
		var content = document.getElementById('content')
		var prev = document.querySelector(".prev")
		var next = document.querySelector(".next")
		var nameSort = document.querySelector(".name-sort")

		function check(dataIndex, preNum, nextNum) {
			if (dataIndex === preNum) {
				prev.classList.add("hide")
			} else {
				prev.classList.remove("hide")
			}

			if (dataIndex === nextNum) {
				next.classList.add("hide")
			} else {
				next.classList.remove("hide")
			}
		}
		pageItems.forEach(function(pageItem, index) {
			if (index === 0) {
				prev.classList.add("hide")
			}
			pageItem.onclick = function() {
				var pageActive = document.querySelector(".page-item.active")
				pageActive.classList.remove("active")
				this.classList.add("active")
				check(index, 0, pageItems.length - 1)
				content.innerHTML = "";
				$.ajax({
					url : '/Web/loadProductAjax',
					type : 'GET',
					data : {
						page : index + 1,
						idCate : idCate,
						nameSort : nameSort.innerText
					},

					success : function(data) {
						content.innerHTML += data;
					},
				})
			}
		})

		prev.onclick = function() {
			var pageActive = document.querySelector(".page-item.active")
			var dataIndex = Number(pageActive.getAttribute("data-index"))
			check(dataIndex, 2, pageItems.length)
			pageItems.forEach(function(pageItem, index) {
				var numPageItem = Number(pageItem.getAttribute("data-index"))
				if (numPageItem === dataIndex) {
					pageActive.classList.remove("active")
					pageItems[index - 1].classList.add("active")
				}
			})
			content.innerHTML = "";
			$.ajax({
				url : '/Web/loadProductAjax',
				type : 'GET',
				data : {
					page : dataIndex - 1,
					idCate : idCate,
					nameSort : nameSort.innerText
				},

				success : function(data) {
					content.innerHTML += data;
				},
			})
		}

		next.onclick = function() {
			var pageActive = document.querySelector(".page-item.active")
			var dataIndex = Number(pageActive.getAttribute("data-index"))
			check(dataIndex, 0, pageItems.length - 1)
			pageItems.forEach(function(pageItem, index) {
				var numPageItem = Number(pageItem.getAttribute("data-index"))
				if (numPageItem == dataIndex) {
					pageActive.classList.remove("active")
					pageItems[index + 1].classList.add("active")

				}
			})
			content.innerHTML = "";
			$.ajax({
				url : '/Web/loadProductAjax',
				type : 'GET',
				data : {
					page : dataIndex + 1,
					idCate : idCate,
					nameSort : nameSort.innerText
				},

				success : function(data) {
					content.innerHTML += data;
				},
			})
		}
		
		cons

		var choose = document.querySelector(".choose-sort")
		var sortList = document.querySelector(".sort__list")
		var sort = document.querySelector(".sort")
		var sortItems = document.querySelectorAll('.sort__list-item')
		choose.onclick = function() {
			var hideSort = document.querySelector(".sort__list.hide")
			if (hideSort != null) {
				hideSort.classList.remove("hide")
				sort.style.borderBottomRightRadius = '0'
				sort.style.borderBottomLeftRadius = '0'
			} else {
				sortList.classList.add("hide")
				sort.style.borderBottomRightRadius = '5px'
				sort.style.borderBottomLeftRadius = '5px'
			}
		}

		sortItems.forEach(function(sortItem, index) {
			sortItem.onclick = function() {
				var pageActive = document.querySelector(".page-item.active")
				pageActive.classList.remove("active")
				pageItems[0].classList.add("active")
				if(pageItems>1){
					next.classList.remove("hide")
				}
				prev.classList.add("hide")
				var sortActive = document
						.querySelector(".sort__list-item.active")
				sortActive.classList.remove("active")
				this.classList.add("active")
				nameSort.innerText = sortItem.innerText
				var name = sortItem.innerText
				sortList.classList.add("hide")
				sort.style.borderBottomRightRadius = '5px'
				sort.style.borderBottomLeftRadius = '5px'
				
				content.innerHTML = "";
				$.ajax({
					url : '/Web/sort',
					type : 'GET',
					data : {
						page : 1,
						idCate : idCate,
						sortName : name
					},

					success : function(data) {
						content.innerHTML += data;
					},
				})
			}
		})
	</script>
</body>
</html>