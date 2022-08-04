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
<link rel="stylesheet" href="./css/detail.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<jsp:useBean class="dao.CategoryDao" id="category"></jsp:useBean>
<title>${product.getName() }</title>
</head>
<body>
	<div class="app-detail">
		<!-- header -->
		<%@include file="header.jsp"%>>

		<!-- login -->
		<%@include file="loginRegis.jsp" %>
		
		<!-- content -->
		<div class="detail-container">
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
			<!-- content -->
			<div class="detail-content">
				<div class="grid">
					<div class="breadcrumb">
						<a href="index.jsp">Trang chủ</a> <i class="fa-solid fa-chevron-right"></i>
						<a>${product.getName() }</a>
					</div>
					<div class="book-detail">
						<div class="img-detail">
							<img
								src="${product.getImage() }">
						</div>
						<div class="book-info">
							<div class="book-name">
								<h4>${product.getName() }</h4>
							</div>
							<div class="book-author">
								<p>Tác giả : ${product.getAuthor() }</p>
							</div>
							<div class="publisher">
								<p>Nhà xuất bản : ${product.getPublished()}</p>
							</div>
							<div class="book-title">
								<p>${product.getTitle() }</p>
							</div>
							<div class="book-price">
								<div class="real-price">
									<p>${product.getPrice() }₫</p>
								</div>
								<div class="published-price">
									<p>199.999₫</p>
								</div>
							</div>
							<div class="book-status">
								<p>Trạng thái: ${product.getAmount()>0?"Còn hàng":"Hết hàng" }</p>
							</div>
							<div class="books-amout">
								<button class="btn-amout">-</button>
								<input type="text" class="amout-number" value="1">
								<button class="btn-amout">+</button>
							</div>
							<ul class="add-cart_buy-now">
							<c:if test="${sessionScope.user!=null }">
								<li class="add-cart y-user" data-index="${product.getId() }">Thêm vào giỏ hàng</li>
								</c:if>
								<c:if test="${sessionScope.user==null }">
								<li class="add-cart n-user">Thêm vào giỏ hàng</li>
								</c:if>
							</ul>
						</div>
					</div>
					<div class="book-description_comment">
						<div class="choose">
							<div class="item-list">
								<span class="item active-item">Mô tả</span> <span class="item">Bình
									luận(2)</span>
							</div>
						</div>
						<div class="book-description">
							<p>${product.getDescription()}</p>
						</div>
						<div class="list-comments hide">
							<div class="comment">
								<div class="comment-header">
									<h3>Khaidz</h3>
									<span>09:00 20/06/2022</span>
								</div>
								<p>Sách hay vip pro số một , các ae nên mua về mà đọc nhé ,
									đọc hay vl cmn luôn,dit con me chúng mày luôn ấy</p>
							</div>
							<div class="comment">
								<div class="comment-header">
									<h3>Duy buoi</h3>
									<span>09:10 20/06/2022</span>
								</div>
								<p>Sách hay vip pro số một , các ae nên mua về mà đọc nhé ,
									đọc hay vl cmn luôn,dit con me chúng mày luôn ấy</p>
							</div>
						</div>
					</div>
				</div>
				.
			</div>
		</div>
	</div>
</body>
<script src="https://kit.fontawesome.com/5d4c5a9375.js "></script>
<script src="./js/main.js"></script>
<script src="./js/cate.js"></script>
</html>