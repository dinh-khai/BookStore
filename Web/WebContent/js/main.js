var nav = document.querySelector('.header__navbar');
window.onscroll = function() {
	if (scrollY > 100) {
		nav.classList.add('nav')
	} else {
		nav.classList.remove('nav')
	}
}

var login = document.querySelector('.login-item')
var register = document.querySelector('.register-item')
var loginWrapper = document.querySelector('.login-wrapper');
var loginTitle = document.querySelector('.login-title')
var registerTitle = document.querySelector('.register-title')

var loginForm = document.querySelector('.login-form')
var registerForm = document.querySelector('.register-form')

var userNameRegis = document.querySelector('.register-username')
var fullNameRes = document.querySelector('.register-fullname')
var emailRes = document.querySelector('.register-email')
var passRes = document.querySelector('.register-pass')
var rePassRes = document.querySelector('.register-repass')

var userNameLogin = document.querySelector(".login-username")
var passLogin = document.querySelector(".login-pass")

var errUserNameRegis = document.querySelector('.err-username')
var errUserNameRegis2 = document.querySelector('.err-username2')
var errFullNameRes = document.querySelector('.err-fullname')
var errEmailRes = document.querySelector('.err-email')
var errEmailRes2 = document.querySelector('.err-email2')
var errPassRes = document.querySelector('.err-pass')
var errRePassRes = document.querySelector('.err-repass')
var errUserNameLogin = document.querySelector('.err-loginu')
var errPassLogin = document.querySelector('.err-loginp')
var errLogin = document.querySelector('.err-login')

var btnRes = document.querySelector('.btn-register button')
console.log(btnRes)
var btnLogin = document.querySelector('.btn-login button')

var close = document.querySelector('.close');

function render() {
	function addHide(param1, param2, parentParam1, parentParam2) {
		param1.classList.remove("hide")
		param1.classList.add("active-user")
		parentParam1.classList.remove("hide")
		param2.classList.remove("active-user")
		parentParam2.classList.add("hide")
	}
	
	
	function clickHide() {

		if (login != null) {
			login.onclick = function() {
				loginWrapper.classList.remove('hide')
				addHide(loginTitle, registerTitle, loginForm, registerForm);
			}
		}

		if (register != null) {
			register.onclick = function() {
				loginWrapper.classList.remove('hide')
				addHide(registerTitle, loginTitle, registerForm, loginForm);
			}
		}
		
		if(close!=null){
		close.onclick = function() {
			loginWrapper.classList.add('hide')
		}
		}
		
		if(loginTitle!=null){
		loginTitle.onclick = function() {
			addHide(loginTitle, registerTitle, loginForm, registerForm);
		}
		}
		
		if(registerTitle!=null){
		registerTitle.onclick = function() {
			addHide(registerTitle, loginTitle, registerForm, loginForm);
		}
		}
	}

	// check form register
	function handleCheck() {
		var errs = document.querySelectorAll('.err.hide')
		var errsLog = document.querySelectorAll(".err-log.hide")
		var textErrUserName = 'Vui lòng nhập tên đăng nhập'
		var textErrFullName = 'Vui  lòng nhập họ và tên'
		var textErrEmail = 'Vui  lòng nhập email'
		var textErrEmail2 = 'Hay nhap dia chi email hop le : Example@gmail.com'
		var textErrPass = 'Vui lòng nhập mật khẩu'
		var textErrRepass = 'Mật khẩu không trùng khớp'
		function checkEmpty(param) {
			if (param.value.trim() !== "") {
				return true;
			} else {
				return false
			}
		}

		function checkSamePass(pass, rePass) {
			if (pass === rePass) {
				return true;
			} else {
				return false;
			}
		}

		function checkRegis(param, errParam, textErr) {
			if (param.value.trim() == "") {
				errParam.innerText = textErr
				errParam.classList.remove("hide")
			} else {
				errParam.classList.add("hide")
			}
		}

		function checkEmail(email, err, textErr) {
			var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if (!filter.test(email.value.trim())) {
				err.innerText = textErr;
				err.classList.remove("hide")
				email.focus;
				return false;
			} else {
				err.classList.add("hide")
			}
		}

		function checkUserName(username, errParam) {
			$.ajax({
				url : '/Web/checkUserControl',
				type : 'POST',
				data : {
					userName : username
				},

				success : function(data) {
					var d = Number(data)
					if (d === 0) {
						errParam.innerText = "Tên đăng nhập bị trùng"
						errParam.classList.remove("hide")
						return false;
					} else if (d === 1) {
						errParam.classList.add("hide")
						return true;
					}
				},
			})
		}

		userNameRegis.onblur = function() {
			checkRegis(userNameRegis, errUserNameRegis, textErrUserName)
			checkUserName(userNameRegis.value, errUserNameRegis2)
		}

		fullNameRes.onblur = function() {
			checkRegis(fullNameRes, errFullNameRes, textErrFullName)
		}

		emailRes.onblur = function() {
			checkRegis(emailRes, errEmailRes, textErrEmail2)
			checkEmail(emailRes, errEmailRes, textErrEmail2)
		}

		passRes.onblur = function() {
			checkRegis(passRes, errPassRes, textErrPass)
		}

		rePassRes.onblur = function() {
			checkRegis(rePassRes, errRePassRes, textErrRepass)
			if (checkSamePass(passRes.value, rePassRes.value) === false) {
				errRePassRes.classList.remove("hide")
				errRePassRes.innerText = textErrRepass
			} else {
				errRePassRes.classList.add("hide")
			}
		}

		btnRes.onclick = function() {
			console.log("khaidz")
			checkUserName(userNameRegis.value, errUserNameRegis2)
			if (checkEmpty(userNameRegis) && checkEmpty(fullNameRes)
					&& checkEmpty(emailRes) && checkEmpty(passRes)
					&& checkEmpty(rePassRes)
					&& checkSamePass(passRes.value, rePassRes.value)
					) {
				$.ajax({
					url : '/Web/registerControl',
					type : 'POST',
					data : {
						userName : userNameRegis.value,
						fullName : fullNameRes.value,
						email : emailRes.value,
						password : passRes.value,
						isAdmin : false,
					},

					success : function(data) {
						addHide(loginTitle, registerTitle, loginForm,
								registerForm);
						alert("Đăng ký tài khoản thành công")
					},
				})
			} else {
				checkRegis(userNameRegis, errUserNameRegis, textErrUserName);
				checkUserName(userNameRegis.value, errUserNameRegis2);
				checkRegis(fullNameRes, errFullNameRes, textErrFullName);
				checkRegis(emailRes, errEmailRes, textErrEmail2);
				checkEmail(emailRes, errEmailRes, textErrEmail2);
				checkRegis(passRes, errPassRes, textErrPass);
				checkRegis(rePassRes, errRePassRes, textErrRepass);

			}
		}
		

		// check login
		function checkLogin(param, errParam) {
			if (param.value.trim() == "") {
				errParam.classList.remove("hide")
			} else {
				errParam.classList.add("hide")
			}
		}
		userNameLogin.onblur = function() {
			checkLogin(userNameLogin, errUserNameLogin)
		}
		passLogin.onblur = function() {
			checkLogin(passLogin, errPassLogin)
		}
		
		

		var check = false
		function checkUser() {
			$.ajax({
				url : '/Web/checkLogin',
				type : 'POST',
				data : {
					userName : userNameLogin.value,
					password : passLogin.value,
				},

				success : function(data) {
					ch = Number(data)
					if (ch === 0) {
						check = false
						errLogin.classList.remove("hide")
						alert("thong tin tai khoan hoac mat khau khong chinh xac")
					} else if(ch==1){
						check = true
						errLogin.classList.add("hide")
						btnLogin.type="submit"
					}
				},
			})
		}
		btnLogin.onclick = function() {
			checkLogin(userNameLogin, errUserNameLogin)
			checkLogin(passLogin, errPassLogin)
			checkUser()
		}

	}

	clickHide()
	handleCheck()
}

render()

// click add cart
var yUsers = document.querySelectorAll(".y-user")
var nUsers = document.querySelectorAll(".n-user")
if (yUsers != null) {
	yUsers.forEach(function(yUser, index) {
		yUser.onclick = function() {
			var id = yUser.getAttribute("data-index")
			console.log(id)
			$.ajax({
				url : '/Web/addCart',
				type : 'GET',
				data : {
					id : id,
				},

				success : function(data) {
					alert("Thêm thành công sản phẩm vào giỏ hàng")
				},
			})
		}
	})

}

if (nUsers != null) {
	nUsers.forEach(function(nUser, index) {
		nUser.onclick = function() {
			alert("Đăng nhập để mua hàng nhé <3")
		}
	})
}

/*var formatM=document.querySelectorAll(".format-money")
console.log(formatM)
function format(n, currency) {
	  return currency + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
	}

formatM.forEach(function(f,index){
	format(Number(f.innerText), "đ")
})*/
