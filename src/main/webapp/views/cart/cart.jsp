<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
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
<title>Cart Shopping</title>
<style>
.small-input {
	width: 70px;
	/* Adjust the width as needed */
}
</style>
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
			class="navbar shadow bg-dark-subtle text-white p-3 mb-0 navbar-expand-lg bg-body-đa">
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

	<article class="">
		<div class="bg-danger-subtle" style="height: 10rem;">
			<div
				class="container d-flex justify-content-start h-100 align-items-center">
				<h3 class=" ">Shopping Cart</h3>
			</div>
		</div>
		<hr class="mt-0 container">
		<div class="container">
			<div class="row">
				<div class="table-responsive col-8">
					<table class="table">
						<thead>
							<tr>
								<th class="fw-semibold">PRODUCT</th>
								<th class="fw-semibold">QUANTITY</th>
								<th class="fw-semibold">TOTAL</th>
								<th class="fw-semibold"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="prod" items="${cart.products}">
								<tr>

									<td class="d-flex align-items-center">
										<div class="w-25">
											<img class="w-100" src="/image/product/${prod.key.image}" alt="">
										</div>
										<div class="w-75 mx-4">
											<h6 class="fw-medium">${prod.key.name}</h6>
											<h6 class="fw-semibold text-danger">${prod.key.priceFormatted}</h6>
										</div>
									</td>
									<td class="text-center">
										<div class="d-flex justify-content-center align-items-center">
											<input type="number" id="quantity_${prod.key.id}"
												class="px-2 py-2 small-input form-control text-center"
												min="1" value="${prod.value}"
												onchange="updateQuantity(${prod.key.id})">
										</div>
									</td>
									<td class="" style="width: 20%;">
										<div>
											<h5 class="fw-bold text-danger" id="total_${prod.key.id}">
												<fmt:formatNumber value="${prod.key.price * prod.value}"
													type="number" pattern="#,##0 đ" />
											</h5>
										</div>
									</td>
									<td><a href="<c:url value='cart/remove/${prod.key.id}' />"><i
											class="bi bi-x-circle-fill text-center text-dark"></i></a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<hr>
					<div class="d-flex justify-content-between">
						<a href="product"
							class="btn text-dark bg-body-secondary border-1 py-3 fw-bolder"
							style="width: 40%;">CONTINUE TO SHOPPING</a> <a href="checkout"
							class="btn btn-dark py-3 fw-semibold" style="width: 15%;">CLEAR
							ALL</a>
					</div>
				</div>
				<div class="col-4 ">
					<div class="mb-3">
						<div class="mt-2">
							<h6 class="fw-semibold">ADDRESS</h6>
						</div>
						<div class="input-group p-2">
							<input type="text" id="address" class="form-control py-3 px-2"
								placeholder="Enter your shipping address">
							<button class="btn btn-dark" type="submit" onclick="placeOrder()">ORDER</button>
						</div>
					</div>
					<div>
						<div class="border bg-danger-subtle">
							<h5 class="text-center my-4">CART TOTAL</h5>
							<div class="row mb-3">
								<div class="col-1"></div>
								<h5 class="col-5">Subtotal</h5>
								<h5 class="col-5 text-end">${cart.formattedTotalPrice}</h5>
								<div class="col-1"></div>

							</div>
							<div class="row mb-3">
								<div class="col-1"></div>
								<h5 class="col-5">Fee</h5>
								<h5 class="col-5 text-end">0 đ</h5>
								<div class="col-1"></div>
							</div>
							<hr>
							<div class="row mb-3">
								<div class="col-1"></div>
								<h5 class="col-5">Total</h5>
								<h5 class="col-5 text-end">${cart.formattedTotalPrice}</h5>
								<div class="col-1"></div>

							</div>
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
	<!-- end footer -->
</body>

<script>
        function updateQuantity(productId) {
            var quantity = document.getElementById("quantity_" + productId).value;
            fetch('/cart/update/' + productId + '/' + quantity, {
                method: 'POST'
            })
            .then(response => response.json())
            .then(data => {
                document.getElementById("total_" + productId).innerText = data.productTotal;
                document.getElementById("cartTotal").innerText = data.cartTotal;
            })
            .catch(error => console.error('Error:', error));
        }
        
        function placeOrder() {
            var address = document.getElementById("address").value;
            fetch('/cart/order', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'address=' + encodeURIComponent(address)
            })
            .then(response => response.text())
            .then(data => {
                alert(data);
                window.location.href = '/';
            })
            .catch(error => console.error('Error:', error));
        }
    </script>
</html>