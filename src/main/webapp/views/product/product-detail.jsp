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
<title>Document</title>
<style>
.small-input {
	width: 70px; /* Adjust the width as needed */
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
			class="navbar shadow bg-dark-subtle text-white p-3 mb-0 navbar-expand-lg bg-body-tertiary">
			<div class="container" style="min-height: 5vh;">
				<div class="d-flex align-items-center">
					<a class="navbar-brand mb-0 h1 fs-4 " href="/"><i
						class="bi bi-apple mx-2"></i>ElectroEdge</a>
				</div>
				<div>
					<a href="/product" class="text-decoration-none text-dark fs-6 mx-3">Mac</a>
					<a href="/product" class="text-decoration-none text-dark fs-6 mx-3">iPad</a>
					<a href="/product" class="text-decoration-none text-dark fs-6 mx-3">iPhone</a>
					<a href="/product" class="text-decoration-none text-dark fs-6 mx-3">Watch</a>
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

	<!-- begin article -->

	<article class="">

		<div class="">

			<div class=" d-flex align-items-center justify-content-center"
				style="height: 50rem;">
				<img src="/image/product/${product.image}" alt="Card image" width=""
					class="p-3 mx-3">
			</div>
			<div class="mt-4 bg-body-tertiary p-5">
				<div class="text-center my-3">
					<h4 class="fw-bold">${product.name}</h4>

				</div>
				<div class="text-center text-warning my-3">
					<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
						class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
						class="bi bi-star-fill"></i>
				</div>
				<h3 class="fw-semibold text-danger text-center mb-4">${product.priceFormatted}</h3>
				<div class="row justify-content-center">
					<input type="number" name="quantity"
						class="px-2 my-2 py-2 small-input form-control" min="1" value="1">
					<button onclick="addToCart(${product.id})" class="btn btn-dark fw-semibold col-2 mx-3">ADD TO
						CART</button>
				</div>
				<div class="text-center mt-4">
					<span class="mx-3 h6"><i class="bi bi-suit-heart-fill mx-2"></i>ADD
						TO WISHLIST</span> <span class="mx-3 h6"><i
						class="bi bi-arrow-left-right mx-2"></i>ADD TO COMPARE</span>
				</div>
				<div class="d-flex justify-content-center mt-4">
					<a href="/product" class="btn btn-success fw-semibold">Go to Product</a>
				</div>
				<hr class="mt-4 container">

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
                        <a class="navbar-brand mb-0 h1 fs-4 fw-bold " href="/"><i class="bi bi-apple mx-2"></i>ElectroEdge</a>
                    </div>
                    <div class="mt-3 px-4 mb-5">
                        <span class="h6 fw-lighter">The customer is at the heart of our unique business model, which includes design.</span>
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
                        <span class="h6 fw-lighter">Be the first to know about new arrivals, look books, sales & promos!</span>
                    </div>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Your Email">
                        <button class="btn btn-light"><i class="bi bi-envelope-at"></i></button>
                    </div>
                </div>
            </div>
            <hr>
            <h6>Co - Fouder: Tình PT</h6>
        </div>
    </footer>
</body>
<script>
    function addToCart(productId) {
        // Thực hiện các hành động cần thiết ở đây, ví dụ gửi yêu cầu Ajax
        
        // Sau khi thực hiện xong, chuyển hướng đến trang /cart/add/${productId}
        window.location.href = '/cart/add/' + productId;
    }
</script>
</html>