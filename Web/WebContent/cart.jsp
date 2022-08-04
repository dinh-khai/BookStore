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
<link rel="stylesheet" href="./css/cart.css">
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

		<!--  -->

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


			<div class="cart-wrapper">
				<div class="grid">
				<c:if test="${sessionScope.user!=null }">
					<c:if test="${sessionScope.cart!=null }">
						<div class="cart">
							<div class="cart-title">
								<span>Giỏ hàng của bạn</span> <span>(${sessionScope.cart.getList().size()}
									sản phẩm)</span>
							</div>
							<!--  -->
							<c:forEach items="${sessionScope.cart.getList() }" var="d">
							<div class="cart-content">
									<div class="info-product">
										<div class="product-img">
											<img
												src="${d.getImage()}"
												alt="">
										</div>
										<div class="name_amout-product">
											<div class="name-product">
												<span>${d.getName()}</span>
											</div>
											<div class="amout-product">
												<span class="minus">-</span> 
												<span class="amout" data-index="${d.getProductId()}">${d.getQuantity()}</span> 
												<span
													class="plus">+</span>
											</div>
										</div>
									</div>
									<div class="price_delete-product">
										<div class="price-product">
											<p>${d.getPrice() }₫</p>
											<p>${d.getPublishedPrice() }₫</p>
										</div>
										<div class="delete-product">
											<a class="cart-delete" href="removeProductToCart?id=${d.getProductId() }" >Xóa</a>
										</div>
									</div>
								</div>
								</c:forEach>
								
							<!--  -->
	
							<!--  -->
						</div>
						
					</c:if>
					<c:if test="${sessionScope.cart==null }">
					<div>
						<a href="index.jsp" style="font-size:1.5rem; ">Giỏ hàng trống</a>
					</div>
					</c:if>
					</c:if>
					<c:if test="${sessionScope.user==null }">
					<div>
						<a href="index.jsp" style="font-size:1.5rem; ">Vui lòng đăng nhập để mua hàng</a>
					</div>
					</c:if>
				</div>
			</div>

		</div>
	</div>
</body>
<script src="https://kit.fontawesome.com/5d4c5a9375.js "></script>
<script src="./js/cate.js"></script>
<script src="./js/main.js"></script>
<script>
var minus=document.querySelectorAll(".minus")
var plus=document.querySelectorAll(".plus")
var amount=document.querySelectorAll(".amout")

minus.forEach(function(m,index){
	m.onclick=function(){
		console.log("khaidz")
		var check=Number(amount[index].innerText)
		if(check===0){
			alert("Số lượng không được nhỏ hơn 0")
		}
		else{
			amount[index].innerText=""
			$.ajax({
				url : '/Web/amountControl',
				type : 'GET',
				data : {
					id : amount[index].getAttribute("data-index"),
					action:"Giam",
				},

				success : function(data) {
					amount[index].innerText=data
				},
			})
		}
	}
})

plus.forEach(function(m,index){
	m.onclick=function(){
			amount[index].innerText=""
			$.ajax({
				url : '/Web/amountControl',
				type : 'GET',
				data : {
					id : amount[index].getAttribute("data-index"),
					action:"Tang",
				},

				success : function(data) {
					console.log(data)
					amount[index].innerText=data
				},
			})
		}
})
</script>
</html>