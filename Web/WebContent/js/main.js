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

	function handleCheck(){
		
		// check form register
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;	
		
		btnRes.onclick = function() {
			if(!userNameRegis.value.trim()){
				userNameRegis.focus();
				errUserNameRegis.classList.remove('hide');
				return;
			}
			errUserNameRegis.classList.add('hide');		
			
			if(!fullNameRes.value.trim()){
				errFullNameRes.classList.remove('hide');
				fullNameRes.focus();
				return;
			}
			errFullNameRes.classList.add('hide');
			
			if(!emailRes.value.trim()){
				errEmailRes.classList.remove('hide');
				emailRes.focus();
				return;
			}
			
			errEmailRes.classList.add('hide');
			
			if(!filter.test(emailRes.value.trim())){
				errEmailRes2.classList.remove('hide');
				return;
			}
			
			errEmailRes2.classList.add('hide');
			
			if(!passRes.value.trim()){
				errPassRes.classList.remove('hide');
				passRes.focus();
				return;
			}
			
			errPassRes.classList.add('hide');
			
			if(rePassRes.value.trim()!==passRes.value.trim()){
				errRePassRes.classList.remove('hide');
				return;
			}
			
			errRePassRes.classList.add('hide');
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
						if(Number(data) === 0){
							console.log('ok')
							errUserNameRegis2.classList.remove('hide');
						}
						else{
							errUserNameRegis2.classList.add('hide');
							alert('Đăng ký tài khoản thành công')
							userNameRegis.value='';
							fullNameRes.value='';
							emailRes.value=''; 
							passRes.value='';
							rePassRes.value='';
//							loginWrapper.classList.remove('hide')
							addHide(loginTitle, registerTitle, loginForm, registerForm);	
						}
					},
				})
		}

//		login
		function checkUser() {
			$.ajax({
				url : '/Web/loginControl',
				type : 'POST',
				data : {
					userName : userNameLogin.value,
					pass : passLogin.value,
				},

				success : function(data) {
					ch = Number(data)
					if (ch === 0) {			
						errLogin.classList.remove("hide")
					} else{					
						errLogin.classList.add("hide")
						window.location.reload();
					}
				},
			})
		}
		btnLogin.onclick = function() {
			if(!userNameLogin.value.trim()) {
				userNameLogin.focus();
				errUserNameLogin.classList.remove('hide');
				return;
			}
			errUserNameLogin.classList.add('hide');
			
			if(!passLogin.value.trim()) {
				passLogin.focus();
				errPassLogin.classList.remove('hide');
				return;
			}
			errPassLogin.classList.add('hide');
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

