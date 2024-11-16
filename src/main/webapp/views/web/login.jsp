<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Style -->
<link rel="icon" type="image/png" href="https://phuongnamvina.com/img_data/images/lam-logo-ban-hang-online-dep.jpg">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/templates/web/css/login.css"/>">


<title>Đăng nhập</title>
</head>

<body>
	<div class="wrapper">
		<form action="/AZShopFurni/login" method="post">
			<h1>Đăng nhập</h1>
					<h4>${mess}</h4>
					<div class="input-box">
						<input type="text" placeholder="Tên đăng nhập" value="${username}"
							name="username" required> <i class='bx bxs-user'></i>
					</div>
					<div class="input-box">
						<input type="password" placeholder="Mật khẩu" id = "password" name="password"
							required> <i class='bx bxs-lock-alt'></i>
						 <span class="eye-icon" onclick="togglePassword()">👁️</span>
					</div>
					<div class="remember-forgot">
						<label><input type="checkbox" name="remember" value="on">Nhớ
							mật khẩu</label> <a href="${pageContext.request.contextPath}/forgetpass">Quên
							mật khẩu</a>
					</div>
					<button type="submit" class="btn">Login</button>
					<div class="register-link">
						<p>
							Bạn chưa có tài khoản? <a
								href="${pageContext.request.contextPath}/signup">Đăng ký</a>
						</p>
					</div>
		</form>
	</div>

	<script>
        function togglePassword() {
            var passwordField = document.getElementById("password");
            var eyeIcon = document.querySelector(".eye-icon");
            if (passwordField.type === "password") {
                passwordField.type = "text";
                eyeIcon.textContent = "🙈";
            } else {
                passwordField.type = "password";
                eyeIcon.textContent = "👁️";
            }
        }
    </script>
</body> 
</html>