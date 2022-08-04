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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Login</title>

</head>
<body>
	<div class="login-wrapper hide">
		<div class="login">
			<div class="login-header">
				<div class="login_register-title">
					<h1 class="login-title active-user">Đăng nhập</h1>
					<h1 class="register-title">Đăng ký</h1>
				</div>
				<i class="close fa-solid fa-xmark"></i>
			</div>

			<!-- login -->
			<form class="login-form" method="post" action="loginControl">
				<input type="text" class="login-input login-username" value="${user}" name="userName" placeholder="Tên đăng nhập">
				<p class="err err-log hide err-loginu">Vui lòng nhập tên đăng nhập</p>
				<br>
				<br> <input type="password" class="login-input login-pass" value="${pass}" name="pass"
					placeholder="Mật khẩu">
					<p class="err err-log hide err-loginp" >Vui lòng nhập mật khẩu</p><br>
					<p class="err err-log hide err-login">Thông tin tài khoản hoặc mật khẩu không chính xác</p>
				<div class="miss_forget-pass">
					<div class="miss-pass">
						<input type="checkbox" id="miss" name="remember"> <label for="miss">Nhớ
							mật khẩu</label>
					</div>
					<a href="#" class="forget-pass">Quên mật khẩu</a>
				</div>
				<div class="btn-login">
					<button type="button">Đăng nhập</button>
				</div>
			</form>

			<!-- register -->
			<form class="register-form hide">
				<input type="text" class="register-input register-username"
					placeholder="Tên đăng nhập">
				<p class="err hide  err-username "></p>
				<p class="err hide  err-username2 "></p>
				<br> <br> <input type="text"
					class="register-input register-fullname" placeholder="Họ tên">
				<p class="err hide err-fullname "></p>
				<br> <br> <input type="text"
					class="register-input register-email" placeholder="email">
				<p class="err hide err-email "></p>
				<p class="err hide err-email2"></p>
				<br> <br> <input type="password"
					class="register-input register-pass" placeholder="Mật khẩu">
				<p class="err hide err-pass "></p>
				<br> <br> <input type="password"
					class="register-input register-repass"
					placeholder="Nhập lại mật khẩu">
				<p class="err hide err-repass "></p>
				<br> <br>

				<div class="btn-register">
					<button type="button">Đăng ký</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="https://kit.fontawesome.com/5d4c5a9375.js "></script>
<script src="./js/main.js"></script>
</html>