<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>

<body>

	<!-- header begin -->
	<header class="sticky-top">
		<!-- begin header -->
		<div class="bg-info bg-dark">
			<div
				class="container d-flex justify-content-between align-items-center p-1 text-white">
				<div class="">
					<span class="ibar-title "><i
						class="bi bi-telephone-fill mx-2"></i>Hotline:</span> <span
						class="me-2 text-info"> 0123456789</span>| <span
						class="ibar-title"><i class="bi bi-facebook mx-2"></i>
						Facebook: </span> <a class="me-2 text-decoration-none text-info">ElectroEdge</a>|
					<span class="ibar-title"><i
						class="bi bi-envelope-at-fill mx-2"></i> Email: </span> <span
						class="me-2 text-info">electroEdge@gmail.com</span>
				</div>
				<div>
					<span class="ibar-title mx-2 ">Tham gia EdgeClub</span> | <span
						class="ibar-title mx-2 ">Trung tâm CSKH</span> |
					<c:if test="${not empty user}">
						<a class="ibar-title mx-2 text-white text-decoration-none"
							href="/profile">Profile</a> |
					</c:if>
					<c:if test="${user.admin}">
						<a class="ibar-title mx-2 text-white text-decoration-none"
							href="/admin/index">Admin</a>
					</c:if>
					<c:if test="${empty user}">
						<a class="ibar-title mx-2 text-white text-decoration-none"
							href="/login">Đăng nhập</a>
					</c:if>
				</div>
			</div>
		</div>
		<!-- end begin header -->

		<!-- navbar -->
		<nav
			class="navbar shadow bg-dark-subtle text-white p-3 mb-0 navbar-expand-lg bg-body-tertiary">
			<div class="container" style="min-height: 5vh;">
				<div class="d-flex align-items-center">
					<a class="navbar-brand mb-0 h1 fs-4 " href="/"><i
						class="bi bi-apple mx-2"></i>ElectroEdge</a>
				</div>
				<div>
					<a href="product" class="text-decoration-none text-dark fs-6 mx-3">Mac</a>
					<a href="product" class="text-decoration-none text-dark fs-6 mx-3">iPad</a>
					<a href="product" class="text-decoration-none text-dark fs-6 mx-3">iPhone</a>
					<a href="product" class="text-decoration-none text-dark fs-6 mx-3">Watch</a>
				</div>

				<div id="tag-cart" class="">
					<a class="btn btn-outline-dark" href="/cart"> <i
						class="bi bi-cart3"></i> Cart <span
						class="badge bg-dark text-white ms-1 rounded-pill"
						id="cartQuantity">${cart.totalQuantity}</span> | <span
						id="cartQuantity"> <fmt:formatNumber type="number" value="" />
							${cart.formattedTotalPrice}
					</span>
					</a>
				</div>
			</div>
		</nav>
		<!-- end nav -->
	</header>
	<!-- end header -->

	<!-- begin article -->

	<article class="container">

		<div class="mt-4">
			<div class="border border-1 row d-flex align-items-center mt-4">
				<img src="/image/user/${user.photo}" alt="Card image" width=""
					class="p-3 mx-3 col-3 flex-shrink-0">
				<div class="col-8 flex-grow-1">
					<h3 class="fw-bold">${user.username}</h3>
					<div>
						<i class="bi bi-box-arrow-right text-danger"></i><a href="/logout"
							class="mx-1 text-decoration-none fw-semibold text-danger">Đăng
							xuất</a>
					</div>
				</div>
				<div>
					<c:if test="${not empty success_changePassword}">
						<div class="alert alert-success" role="alert">${success_changePassword}</div>
					</c:if>
					<c:if test="${not empty error_changePassword}">
						<div class="alert alert-success" role="alert">${error_changePassword}</div>
					</c:if>
					<c:if test="${not empty error_changePassword1}">
						<div class="alert alert-success" role="alert">${error_changePassword1}</div>
					</c:if>
				</div>
			</div>

			<div class="border border-1 row d-flex align-items-center mt-4">
				<div class="border-bottom py-3 px-4 bg-dark-subtle">
					<i class="bi bi-file-person h3 text-success"></i> <span
						class="h3 mx-2 text-dark fw-bolder">Profile Detail</span>
				</div>
				<div class="row mt-4">
					<div class="col-1"></div>
					<div class="col-4">
						<span>Full Name</span>
					</div>
					<div class="col-5">
						<span>${user.fullname}</span>
					</div>
					<div class="col-1"></div>
				</div>

				<div class="row mt-4">
					<div class="col-1"></div>
					<div class="col-4">
						<span>Contact Email</span>
					</div>
					<div class="col-5">
						<span>${user.email}</span>
					</div>
					<div class="col-1"></div>
				</div>

				<div class="row my-4">
					<div class="col-1"></div>
					<div class="col-4">
						<span>Change Password</span>
					</div>
					<div class="col-5">
						<a data-bs-toggle="modal" data-bs-target="#myModal"><i
							class="bi bi-box-arrow-in-down-left"></i></a>
					</div>
					<div class="col-1"></div>
				</div>
			</div>
		</div>

	</article>

	<!-- end article -->

	<!-- begin footer -->

	<footer class="mt-5 p-4 bg-black text-white text-center">
		<div class="container">
			<div class="text-start mt-5 mb-5">
				<h6>cảm ơn quý khách đã lựa chọn</h6>
			</div>
			<hr>
			<div class="row text-start">
				<div class="col-sm-3">
					<div class="d-flex align-items-center mx-4 my-2">
						<a class="navbar-brand mb-0 h1 fs-4 fw-bold " href="/"><i
							class="bi bi-apple mx-2"></i>ElectroEdge</a>
					</div>
					<div class="mt-3 px-4 mb-5">
						<span class="h6 fw-lighter">The customer is at the heart of
							our unique business model, which includes design.</span>
					</div>
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-2 my-2">
					<h6 class="fw-semibold">SHOPPING</h6>
					<div class="mt-4">
						<h6 class="fw-ligh text-secondary mb-3">Technical Store</h6>
						<h6 class="fw-ligh text-secondary mb-3">Trending product</h6>
						<h6 class="fw-ligh text-secondary mb-3">Accessories</h6>
						<h6 class="fw-ligh text-secondary mb-3">Sale</h6>
					</div>
				</div>
				<div class="col-sm-2 my-2">
					<h6 class="fw-semibold">SHOPPING</h6>
					<div class="mt-4">
						<h6 class="fw-ligh text-secondary mb-3">Contact Us</h6>
						<h6 class="fw-ligh text-secondary mb-3">Payment Methods</h6>
						<h6 class="fw-ligh text-secondary mb-3">Delivary</h6>
						<h6 class="fw-ligh text-secondary mb-3">Return & Exchanges</h6>
					</div>
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-3 my-2">
					<h6>NEWLETTER</h6>
					<div class="mt-3 mb-3">
						<span class="h6 fw-lighter">Be the first to know about new
							arrivals, look books, sales & promos!</span>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Your Email">
						<button class="btn btn-light">
							<i class="bi bi-envelope-at"></i>
						</button>
					</div>
				</div>
			</div>
			<hr>
			<h6>Co - Fouder: Tình PT</h6>
		</div>
	</footer>
	<!-- change pass -->
	<div class="modal" id="myModal">
		<div class=" rounded-3 modal-dialog">
			<div class="modal-content">
				<form action="/account/change-password" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Change Password</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="p-3 modal-body">
						<div class="fw-semibold">
							<label for="" class="form-label">Password</label> <input
								type="password" name="oldPass" class="form-control"
								required="required" />
							<c:if test="${not empty error_changePassword1}">
								<span class="text-danger">${error_changePassword1}</span>
							</c:if>
						</div>
						<div class="mt-3 fw-semibold">
							<label for="" class="form-label">New Password</label> <input
								name="newPass" type="password" class="form-control"
								required="required" />
							<c:if test="${not empty error_changePassword}">
								<span class="text-danger">${error_changePassword}</span>
							</c:if>
						</div>
						<div class="mt-3 fw-semibold mb-3">
							<label for="" class="form-label">Confirm Password</label> <input
								name="confirm-newPass" type="password" class="form-control"
								required="required" />
						</div>
						<button class="btn btn-primary w-25 fw-semibold" type="submit">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end change pass -->
</body>
</html>