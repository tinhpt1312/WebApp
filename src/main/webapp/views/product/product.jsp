<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="css/style.css">
<title>Product</title>
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
						id="cartQuantity">${cart.totalQuantity}</span> | <span id="cartQuantity"> <fmt:formatNumber
								type="number" value="" /> ${cart.formattedTotalPrice}
					</span>
					</a>
				</div>
			</div>
		</nav>
		<!-- end nav -->
	</header>
	<!-- end header -->

	<!-- article begin -->
	<article>
		<!-- background -->
		<div
			class="bg-fullscreen1 d-flex align-items-center justify-content-center text-white">
			<div class="custom-div1 text-center top-1">
				<h1 class="fs-1">iPad Pro</h1>
				<span class="fs-4">Mỏng không tưởng. Mạnh không ngờ</span><br>
				<span class="text-info">Theo dõi để biết khi có hàng</span>
				<div class="mt-3">
					<button class="btn btn-primary text-white rounded-full">Tìm
						hiểu thêm</button>
					<button class="btn btn-outline-primary text-white rounded-full">Xem
						giá</button>
				</div>
			</div>
		</div>

		<div
			class="bg-fullscreen2 d-flex align-items-center justify-content-center text-dark ">
			<div class="custom-div1 text-center top-1">
				<img src="image/index/ipadair.png" alt=""><br> <span
					class="fs-4">Hai kích cỡ. Chip nhanh hơn. Đa zi năng</span><br>
				<span class="text-primary">Theo dõi để biết khi có hàng</span>
				<div class="mt-3">
					<button class="btn btn-primary text-white rounded-full">Tìm
						hiểu thêm</button>
					<button class="btn btn-outline-primary rounded-full">Xem
						giá</button>
				</div>
			</div>
		</div>


		<!-- end background -->

		<div class="container ">
			<div class="row">
				<div class="col-9 mt-5">
					<h1 class=" ">
						<i class="bi bi-apple mx-2"></i>Product Item
					</h1>
				</div>
				<div class="col-3 mt-5">
					<form id="sortForm" action="/product" method="GET">
						<select id="sortDirection" class="form-select" name="direction"
							onchange="document.getElementById('sortForm').submit()">
							<option value="">Sắp xếp theo</option>
							<option value="asc" ${direction eq 'asc' ? 'selected' : ''}>Giá
								tăng dần</option>
							<option value="desc" ${direction eq 'desc' ? 'selected' : ''}>Giá
								giảm dần</option>
						</select> <input type="hidden" name="p" value="0"> <input
							type="hidden" name="category" value="${categoryId}">
					</form>
				</div>
			</div>
			<hr class="border-bottom border-2 border-black">
		</div>
		<div class="container">
			<div class=" mt-5 row ">
				<div class="col-9">
					<div class="row row-cols-1 row-cols-md-3 g-4">
						<c:forEach var="item" items="${page.content}">
							<div class="col-sm-4 mb-2">
								<div class="card p-0 shadow rounded-3 h-100">
									<img src="/image/product/${item.image}" class="rounded-3 p-4">
									<div class="card-body mx-2">
										<a
											href="${pageContext.request.contextPath}/product/${item.id}"
											class="text-decoration-none text-dark"><h6>${item.name}</h6></a>
										<h6 class="text-danger ">${item.priceFormatted}</h6>
										<div class="d-flex justify-content-between">
											<div>
												<i class="bi bi-star"></i> <i class="bi bi-star"></i> <i
													class="bi bi-star"></i> <i class="bi bi-star"></i> <i
													class="bi bi-star"></i>
											</div>
											<span>Số lượng: ${item.quantity}</span>
										</div>
									</div>
									<a href="/cart/add/${item.id}"
										 class="btn btn-outline-secondary">Add cart</a>
								</div>
							</div>
						</c:forEach>
					</div>
					<div
						class="text-center my-3 d-flex align-items-center justify-content-center">
						<h4 class="border-black border-bottom w-auto">${page.number + 1}</h4>
					</div>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<c:if test="${page.number == 0}">
								<li class="page-item disabled"><a class="page-link"><i
										class="bi bi-chevron-double-left"></i></a></li>
								<li class="page-item disabled"><a class="page-link"><i
										class="bi bi-chevron-left"></i></a></li>
							</c:if>
							<c:if test="${page.number != 0}">
								<li class="page-item"><a
									href="/product?direction=${direction}&p=0&category=${categoryId}"
									class="page-link"><i class="bi bi-chevron-double-left"></i></a></li>
								<li class="page-item"><a
									href="/product?direction=${direction}&p=${page.number-1}&category=${categoryId}"
									class="page-link"><i class="bi bi-chevron-left"></i></a></li>
							</c:if>
							<c:if test="${page.number == page.totalPages-1}">
								<li class="page-item disabled"><a class="page-link"><i
										class="bi bi-chevron-right"></i></a></li>
								<li class="page-item disabled"><a class="page-link"><i
										class="bi bi-chevron-double-right"></i></a></li>
							</c:if>
							<c:if test="${page.number != page.totalPages-1}">
								<li class="page-item"><a
									href="/product?direction=${direction}&p=${page.number+1}&category=${categoryId}"
									class="page-link"><i class="bi bi-chevron-right"></i></a></li>
								<li class="page-item"><a
									href="/product?direction=${direction}&p=${page.totalPages-1}&category=${categoryId}"
									class="page-link"><i class="bi bi-chevron-double-right"></i></a>
								</li>
							</c:if>
						</ul>
					</nav>

				</div>
				<div class="col-3">
					<div class="card">
						<div class="card-footer">
							<span class="text-dark fs-5"><i class="bi bi-list mx-2"></i>Category</span>
						</div>
						<div class="list-group ">
							<c:forEach var="item" items="${caItems}">
								<a
									href="${pageContext.request.contextPath}/product?category=${item.id}"
									class="list-group-item text-primary">${item.name}</a>
							</c:forEach>
						</div>
					</div>
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
</body>

</html>