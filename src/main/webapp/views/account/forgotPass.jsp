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
			<div class="text-center mt-5 ">
				<div class="mb-3 h1">
					<i class="bi bi-apple"></i>

					<h1 class="fw-bold">
						<a href="/" class="text-decoration-none text-dark">
							ElectroEdge </a>
					</h1>
				</div>
			</div>

			<div class="container card shadow pb-2 border-0"
				style="min-height: 20rem;">
				<div class="text-center mt-5">
					<h5 class="text-dark mb-1 fw-bold">Forgot Password ?</h5>
					<div class="text-body-tertiary h6 fw-semibold">Enter your
						username.</div>
				</div>
				<form action="/account/forgotpassword" method="post" class="p-4" novalidate="novalidate" id="kt_password_reset_form">
					<div class="px-4">
						<label class="fw-bold mb-3 h6">Username</label> 
						<input name="username" autocomplete="off" value="${username}" type="text"
							class="w-100 border-2 rounded-3 fw-semibold px-4 py-2 text-dark-emphasis form-control">
						<c:if test="${not empty error_forgot_username}">
							<div class="form-text text-danger">${error_forgot_username}</div>
						</c:if>
						<c:if test="${not empty success_forgot_username}">
							<div class="form-text text-success">${success_forgot_username}</div>
						</c:if>
					</div>
					<div class="mt-5">
						<div class="d-flex justify-content-evenly">
							<button class="btn btn-primary py-2 px-4 fw-bold" type="submit" id="kt_password_reset_submit">Find</button>
							<a href="/login"
								class="btn bg-body-secondary py-2 px-4 fw-bold d-flex align-items-center">Cancel</a>
						</div>
					</div>
				</form>
			</div>
		</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>