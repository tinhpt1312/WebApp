<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
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
			<h3 class="fw-bold">Create an Account</h3>
			<span class="fw-semibold">Already have an account? <a
				href="/login" class="text-decoration-none">Sign in here</a></span>
		</div>
		<form:form action="/signup/create" method="post" class="p-4"
			modelAttribute="acc">
			<c:if test="${not empty success_acc}">
				<div class="alert alert-success" role="alert">${success_acc}</div>
			</c:if>
			<div class="">
				<button class="btn btn-secondary w-100 fw-semibold text-white">
					<i class="bi bi-google mx-2 tex"></i>Continue with Google
				</button>
			</div>
			<div class="divider ">
				<span class="fw-semibold">OR</span>
			</div>
			<div class="">
				<label class="fw-semibold mb-2">Username</label>
				<form:input path="username" type="text"
					class="w-100 border bg-light-subtle fw-semibold px-3 py-2 text-dark-emphasis form-control" />
				<form:errors path="username" class="form-text text-danger" />
				<c:if test="${not empty error_acc}">
					<div class="form-text text-danger">${error_acc}</div>
				</c:if>
			</div>
			<div class="mt-4">
				<label class="fw-semibold mb-2">Email</label>
				<form:input path="email"
					class="w-100 border bg-light-subtle fw-semibold px-3 py-2 text-dark-emphasis form-control"
					type="type" />
				<form:errors path="email" class="form-text text-danger" />
			</div>
			<div class="mt-4">
				<label class="fw-semibold mb-2">Fullname</label>
				<form:input path="fullname"
					class="w-100 border bg-light-subtle fw-semibold px-3 py-2 text-dark-emphasis form-control"
					type="text" />
			</div>
			<div class="mt-4">
				<label class="fw-semibold mb-2">Password</label>
				<form:input path="password"
					class="w-100 border bg-light-subtle fw-semibold px-3 py-2 text-dark-emphasis form-control"
					type="password" />
				<form:errors path="password" class="form-text text-danger" />
			</div>
			<div class="mt-4">
				<label class="fw-semibold mb-2">Confirm password</label> <input
					class="w-100 border bg-light-subtle fw-semibold px-3 py-2 text-dark-emphasis form-control"
					type="password">
			</div>
			<div class="d-flex justify-content-center mt-5">
				<button formaction="/signup/create"
					class="btn btn-primary w-25 fw-semibold">Sign up</button>
			</div>
		</form:form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>