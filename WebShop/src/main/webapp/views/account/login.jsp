<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<head>
<meta charset="utf-8">
<title>Login</title>
<style>
.divider {
	display: flex;
	align-items: center;
	text-align: center;
	margin: 1rem 0;
}

.divider::before, .divider::after {
	content: '';
	flex: 1;
	border-bottom: 1px solid #ddd;
}

.divider::before {
	margin-right: .25em;
}

.divider::after {
	margin-left: .25em;
}

.divider span {
	font-weight: 700;
	/* Đậm hơn */
	color: #999;
	/* Màu chữ nhạt */
}
</style>
</head>
<body>

	<div class="container card w-25 mt-5 shadow">
		<div class="text-center mt-5">
			<div class="mb-3 h1">
				<i class="bi bi-apple"></i>
			</div>
			<h3 class="fw-bold">
				Sign in to <a href="/" class="text-decoration-none text-dark">
					ElectroEdge </a>
			</h3>
			<span class="fw-semibold">New Here? <a href="/signup"
				class="text-decoration-none">Create an Account</a></span>
		</div>
		<form action="/login" method="post" class="p-4">
			<div class="mt-3">
				<label class="fw-bold mb-1">Username</label> <input name="username"
					class="w-100 border bg-light-subtle fw-semibold px-3 py-2 text-dark-emphasis form-control">
				<c:if test="${not empty error_signin_username}">
					<div class="form-text text-danger">${error_signin_username}</div>
				</c:if>
			</div>
			<div class="mt-3">
				<div class="d-flex justify-content-between">
					<label class="fw-bold mb-1">Password</label> <a href="/account/forgotpassword"
						class="text-decoration-none fw-bold text-primary">Forgot
						Password? </a>
				</div>
				<input name="password"
					class="w-100 border bg-light-subtle fw-semibold px-3 py-2 text-dark-emphasis form-control"
					type="password">
				<c:if test="${not empty error_signin_password}">
					<div class="form-text text-danger">${error_signin_password}</div>
				</c:if>
			</div>
			<div class="d-flex justify-content-end mt-2 mb-4 fw-semibold">
				<input type="checkbox" name="remember" value="true" class="mx-2 ">
				<label class="">Remember me</label>
			</div>
			<!-- <div class="">
			  <input type="file" class="form-control w-100">
      			</div>  -->
			<div class="d-flex justify-content-center ">
				<button class="btn btn-primary w-100 fw-semibold">Continue</button>
			</div>
			<div class="text-center my-3 divider">
				<span class="fw-semibold text-dark-emphasis">OR</span>
			</div>
			<div>
				<button class="btn btn-secondary w-100 fw-semibold text-white">
					<i class="bi bi-google mx-2 tex"></i>Continue with Google
				</button>
				<button class="btn btn-secondary w-100 fw-semibold my-3 text-white">
					<i class="bi bi-apple mx-2"></i>Continue with Facebook
				</button>
				<button class="btn btn-secondary w-100 fw-semibold text-white">
					<i class="bi bi-facebook mx-2"></i>Continue with Apple
				</button>
			</div>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>