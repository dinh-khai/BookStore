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
</head>
<body>
	<header id="header">
		<div class="header__introduce">
			<div class="grid">
				<div class="header__introduce-wrapper">
					<ul class="header__introduce-element">
						<li
							class="header__introduce-element-items header__introduce-element-items-separate">
							<i
							class="header-introduce_element-items-icon fa-solid fa-truck-fast"></i>
							Miễn phí giao hàng
						</li>
						<li class="header__introduce-element-items"><i
							class="header-introduce_element-items-icon fa-solid fa-book"></i>
							Kho sách khổng lồ</li>
					</ul>
				</div>
			</div>
		</div>
		<nav class="header__navbar">
			<div class="grid">
				<div class="header__navbar-wrapper">
					<div class="header__navbar-logo">
					<a href="index.jsp">
						<img src=" ./image/logo.png " alt="logo shop "
							class="header__navbar-logo-img ">
							</a>
					</div>
					<form class="header__navbar-search" action="search" method="get">

						<input type="text" name="name" id=""
							class="header__navbar-search-input"
							placeholder="Nhập từ khóa tìm kiếm">
						<button type="submit" class="btn-search">
							<i
								class="header__navbar-search-icon fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
					<!-- cart -->
					<div class="header__navbar-cart_user">
						<div class="header__navbar-cart">
							<a href="cart.jsp" class="header__navbar-cart-link"> <i
								class="header__navbar-cart-icon fa-solid fa-cart-shopping">
							</i>
							</a> 
							<c:if test="${sessionScope.user!=null }">
							<span class="header__navbar-cart-notice">${sessionScope.cart!=null?sessionScope.cart.getList().size():0 }</span>
							</c:if>
							<c:if test="${sessionScope.user==null }">
							<span class="header__navbar-cart-notice">0</span>
							</c:if>
						</div>
						<!-- user -->
						<ul class="header__introduce-element">
							<c:if test="${sessionScope.user==null }"> 
								<li
									class="header__introduce-element-items login-item header__introduce-element-items-separate">
									 Đăng nhập 
								</li>
								<li class="header__introduce-element-items register-item"> Đăng ký</li>
							 </c:if> 

							<!-- interface after user successfully login -->
							 <c:if test="${sessionScope.user!=null}">
								<li class="header__introduce-element-items-user "><i
									class="fa-solid fa-circle-user"></i> ${sessionScope.user.getFullName() }
									<ul class="header__introduce-element-items--list ">
										<li class="header__introduce-element-items--list-manipulation"><a
											href="logoutControl"
											class="header__introduce-element-items--list-manipulation-link">
												Đăng xuất</a></li>
											
											<c:if test="${sessionScope.user.isAdmin()==true }">	
										<li class="header__introduce-element-items--list-manipulation"><a
											href="admin.jsp"
											class="header__introduce-element-items--list-manipulation-link">
												Admin</a></li>
												</c:if>
												<c:if test="${sessionScope.user.isAdmin()==false }">
												<li class="header__introduce-element-items--list-manipulation"><a
											href="#"
											class="header__introduce-element-items--list-manipulation-link">
												Đổi mật khẩu</a></li>
												</c:if>
									</ul></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<script src="https://kit.fontawesome.com/5d4c5a9375.js "></script>
	<script src="./js/cate.js"></script>
	<script src="./js/main.js"></script>
</body>
</html>