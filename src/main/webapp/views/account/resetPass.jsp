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
<title>Forgot Password</title>
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

.widthForm {
	width: 28%;
}
</style>
</head>

<body>


	<div class="container widthForm  align-items-center">
		<form class="form w-100" novalidate="novalidate"
			id="kt_new_password_form"
			action="/account/reset-password/${username}" method="post">
			<div class="text-center mt-5 ">
				<div class="mb-3 h1">
					<i class="bi bi-apple"></i>

					<h1 class="fw-bold">
						<a href="/" class="text-decoration-none text-dark">
							ElectroEdge </a>
					</h1>
				</div>
			</div>

			<div class="container card border-0 shadow pb-2">
				<div class="text-center mt-5">
					<h5 class="text-dark mb-1 fw-bold">Setup New Password</h5>
					<div class="text-body-tertiary h6 fw-semibold">
						Already have reset your password ? <a href="/login"
							class="text-decoration-none">Sign in here</a>
					</div>
				</div>
				<div class="px-4 mt-4">
					<div class="px-4 mt-2">
						<label class="fw-bold mb-3 h6">Password</label> <input
							name="password" type="password"
							class="w-100 border-2 rounded-3  fw-semibold px-4 py-2 text-dark-emphasis form-control">
						<c:if test="${not empty error_resetPassword_password}">
							<div class="form-text text-danger">${error_resetPassword_password}</div>
						</c:if>
					</div>
					<div class="px-4 mt-5">
						<label class="fw-bold mb-3 h6">Confirm Password</label> <input
							name="confirm" type="password"
							class="w-100 border-2 rounded-3  fw-semibold px-4 py-2 text-dark-emphasis form-control">
						<c:if test="${not empty error_resetPassword_confirm}">
							<div class="form-text text-danger">${error_resetPassword_confirm}</div>
						</c:if>
						<c:if test="${not empty success_resetPassword}">
							<div class="form-text text-success">${success_resetPassword}</div>
						</c:if>
					</div>
				</div>
				<div class="mt-5 mb-4">
					<div class="d-flex justify-content-center">
						<button class="btn btn-primary py-2 px-4 fw-bold">Save</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>