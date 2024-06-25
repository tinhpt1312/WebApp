<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Control</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	display: flex;
	height: 100vh;
	overflow: hidden;
}

.sidebar {
	width: 250px;
	background-color: #343a40;
	color: white;
	flex-shrink: 0;
}

.sidebar .nav-link {
	color: white;
}

.content {
	flex-grow: 1;
	padding: 20px;
	overflow-y: auto;
}

.col-width-1 {
	width: 44%;
}

.col-width-2 {
	width: 11%;
}
</style>
</head>

<body>

	<div class="sidebar d-flex flex-column p-3">
		<div class="p-3 mb-2">
			<a href="/" class="text-decoration-none h3"><i
				class="bi bi-apple"></i>ElectroEdge</a>
		</div>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item mb-3 "><a href="/admin/index"
				class="nav-link fw-semibold">Home</a></li>
			<li class="nav-item mb-3"><span
				class="nav-link fw-semibold h5 mb-0">Manager</span>
				<div class=" flex-column nav-pills nav">
					<a href="/admin/product"
						class="text-decoration-none py-sm-2 px-sm-3 fw-lighter  text-white fw-light ">
						<i class="bi bi-laptop mx-1"></i>Product
					</a> <a href="/admin/order"
						class="text-decoration-none py-sm-2 px-sm-3  fw-lighter text-white fw-light">
						<i class="bi bi-basket3 mx-1"></i>Order
					</a> <a href="/admin/user"
						class="text-decoration-none py-sm-2 px-sm-3 fw-lighter  text-white fw-light ">
						<i class="bi bi-person mx-1 "></i>User
					</a>
				</div></li>
			<li class="nav-item mb-3"><span
				class="nav-link fw-semibold h5 mb-0">Add</span>
				<div class=" flex-column nav-pills nav">
					<a href="/admin/product/add"
						class="text-decoration-none py-sm-2 px-sm-3 fw-lighter text-white fw-light">
						<i class="bi bi-laptop mx-1"></i>Product
					</a> <a href="/admin/user/add"
						class="text-decoration-none py-sm-2 px-sm-3 fw-lighter text-white fw-light nav-link active">
						<i class="bi bi-person mx-1"></i>User
					</a>
				</div></li>
			<li class="nav-item mb-3"><span
				class="nav-link fw-semibold h5 mb-0">Report</span>
				<div class=" flex-column nav-pills nav">
					<a href="#"
						class="text-decoration-none py-sm-2 px-sm-3 fw-lighter  text-white fw-light"><i
						class="bi bi-bar-chart-line mx-1"></i>Chart</a> <a href="/report/inventory"
						class="text-decoration-none py-sm-2 px-sm-3  fw-lighter text-white fw-light">
						<i class="bi bi-gear mx-1"></i>Inventory
					</a>
				</div></li>
			<li class="nav-item mb-3"><a href="#"
				class="nav-link fw-semibold h5 mb-0">Export</a></li>
		</ul>
	</div>
	<div class="content">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<div class="flex-column nav-pills nav mx-3">
					<span class="text-decoration-none fw-bold text-black">Add</span> <a
						href="/admin/user" class="text-decoration-none text-danger">User</a>
				</div>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item"><a
							class="nav-link fw-semibold text-danger" href="#">${user.fullname}</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/logout">Logout</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>

		<div class="container">
			<div class="mt-5 bg-light pb-5">
				<div class="px-3 pt-5 mx-5 ">
					<h3 class="text-center">Add User</h3>
				</div>
				<div class="px-3 mt-5">
					<div class="px-5 pb-5 mt-5">
						<form:form action="/admin/user/add" method="post"
							modelAttribute="account" enctype="multipart/form-data">
							<c:if test="${not empty success_acc}">
								<div class="alert alert-success" role="alert">${success_acc}</div>
							</c:if>
							<div class="mb-3">
								<label for="username" class="form-label">Username <span
									class="form-text text-danger">*</span>
								</label>
								<form:input path="username" type="text" class="form-control" />
								<c:if test="${not empty error_acc}">
									<div class="text-danger">${error_acc}</div>
								</c:if>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email <span
									class="form-text text-danger">*</span>
								</label>
								<form:input path="email"
									class="w-100 border bg-light-subtle fw-semibold px-3 py-2 text-dark-emphasis form-control"
									type="type" />
								<form:errors path="email" class="form-text text-danger" />
							</div>
							<div class="mb-3">
								<label for="fullname" class="form-label">Full name</label>
								<form:input path="fullname" type="text" class="form-control"
									id="fullname" />
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password <span
									class="form-text text-danger">*</span>
								</label>
								<form:input path="password" type="password" class="form-control"
									id="password" />
							</div>
							<div class="d-flex mb-3 mt-5">
								<label class="form-label me-3">Activated: </label>
								<div class="me-3 mt-1">
									<form:checkbox id="activated" value="true" path="activated" />
								</div>
							</div>
							<div class="d-flex mb-3">
								<label class="form-label me-3">Admin: </label>
								<div class="me-3 mt-1">
									<form:checkbox id="admin" value="true" path="admin" />
								</div>
							</div>
							<div class="mb-3">
								<label class="form-label">Photo</label> 
								<input id="photoFile" name="image" type="file" class="form-control" />
							</div>
							<button type="submit" class="btn btn-primary float-end">Save</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>



		<script
			src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>