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
<link rel="stylesheet" href="./css/admin.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<jsp:useBean class="dao.CategoryDao" id="category"></jsp:useBean>
<jsp:useBean class="dao.ProductDao" id="product"></jsp:useBean>
<title>Admin</title>
</head>
<body>
	<div class="app">
		<!-- header -->
		<c:if test="${sessionScope.user.isAdmin()==true }">
		<%@include file="header.jsp"%>>

		<!-- login -->
		<%@include file="loginRegis.jsp" %>

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
			  <div class="admin-wrapper">
                <div class="grid">
                    <div class="admin">
                        <div class="admin-title">
                            <span>Quản lý sản phẩm</span>
                        </div>
                        <div class="admin-action">
                            <div class="admin_info-product">
                                <table class="list-products">
                                    <tr class="info-name">
                                        <th>ID</th>
                                        <th>Tên</th>
                                        <th>Giá</th>
                                        <th>Số lượng</th>
                                        <th>Sửa/Xóa</th>
                                    </tr>
                                    <c:forEach items="${product.getListProducts()}" var="p">
                                    <tr>
                                        <td>${p.getId() }</td>
                                        <td>${p.getName() }</td>
                                        <td>${p.getPrice() }</td>
                                        <td>${p.getAmount() }</td>
                                        <td>
                                            <a class="action-item" href="infoEdit?id=${p.getId() }">Sửa</a>
                                            <a class="action-item" href="deleteProduct?id=${p.getId()}">Xóa</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <div class="add-product">
                                <button class="btn-add">Thêm sản phẩm</button>
                                <form class="add-form " action="addProduct" method="post" enctype="multipart/form-data">
                                    <div class="add-name">
                                        <label>Nhập tên sản phẩm</label>
                                        <input type="text" class="" name="name">
                                    </div>
                                    <div class="add-name">
                                        <label>Tiêu đề sản phẩm</label>
                                        <input type="text" class="" name="title">
                                    </div>
                                    <div class="add-name">
                                        <label>Mô tả sản phẩm</label>
                                        <textarea name="description"></textarea>
                                    </div>
                                    <div class="add-name">
                                        <label>Thêm ảnh</label>
                                        <input type="file" name="photo">
                                    </div>
                                    <div class="add-name">
                                        <label>Giá bán</label>
                                        <input type="text" class="num" name="price">
                                        <p class="err hide err-num">Giá nhập không hợp lệ</p>
                                    </div>
                                    <div class="add-name">
                                        <label>Giá bìa</label>
                                        <input type="text" class="num" name="publishedPrice">
                                        <p class="err hide err-num">Giá nhập không hợp lệ</p>
                                    </div>
                                     <div class="add-name">
                                        <label>Số lượng</label>
                                        <input type="text" class="num" name="amount">
                                        <p class="err hide err-num">Số lượng không hợp lệ</p>
                                    </div>
                                    <div class="add-name">
                                        <label>Nhà xuất bản</label>
                                        <input type="text" class="" name="published">
                                    </div>
                                    <div class="add-name">
                                        <label>Tác giả</label>
                                        <input type="text" class="" name="author">
                                    </div>
                                    <div class="add-name">
                                        <label>Thể loại</label>
                                        <select class="" name="nameCate">
                                        <c:forEach items="${category.getListCategories()}" var="cate">
                                            <option >${cate.getName() }</option>
                                            </c:forEach>
                                            
                                        </select>
                                    </div>
                                    <div class="add-name">
                                        <label>Phân loại sản phẩm</label>
                                        <select class="" name="nameClassify">
                                            <option >Không thuộc phân loại nào </option>
                                            <c:forEach items="${category.getListClassify()}" var="c">
                                            <option >${c.getName() }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <button type="submit" class="add">Thêm</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <!-- footer --> 
        <footer>

        </footer>
        </c:if>
        <c:if test="${sessionScope.user.isAdmin()==false||sessionScope.user==null }">
        <a href="index.jsp">Quay lại trang chủ</a>
        	<h1>Vui long đăng nhập bằng tài khoản admin</h1>
        </c:if>
 </div>
 
</body>
<script src="https://kit.fontawesome.com/5d4c5a9375.js "></script>
<script src="./js/cate.js"></script>
<script src="./js/main.js"></script>
<script>
/* var nums=document.querySelectorAll(".num")
var errs=document.querySelectorAll(".err-num")
var btn=document.querySelector(".add")
var errHide=document.querySelectorAll(".err.hide")
function check(num,err){
	var n=Number(num)
	if(Number.isInteger(n)==true){
		if(n>0||n==0){
			err.classList.add("hide")
			return true;
		}
		else{
			err.classList.remove("hide")
			return false;
		}
	}
	else{
		err.classList.remove("hide")
		return false;
	}
}
btn.onclick=function(){
nums.forEach(function(num,index){
	check(num,errs[index])
})
if(errHide.length==3){
	btn.type="submit"
}
} */
</script>
</html>