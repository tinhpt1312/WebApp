<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="utf-8">
<title>Web Custom Apple</title>
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
					<span class="ibar-title mx-2 ">Tham gia EdgeClub</span> | 
					<span class="ibar-title mx-2 ">Trung tâm CSKH</span> |
					<c:if test="${not empty user}">
						<a class="ibar-title mx-2 text-white text-decoration-none" href="/profile">Profile</a> |
					</c:if>
					<c:if test="${user.admin}">
						<a class="ibar-title mx-2 text-white text-decoration-none" href="/admin/index">Admin</a>
					</c:if>
					<c:if test="${empty user}">
						<a class="ibar-title mx-2 text-white text-decoration-none" href="/login">Đăng nhập</a>
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

	<article class="">
		<!-- background1 -->
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
		<!-- end background1 -->

		<!-- background2 -->
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
		<!-- end background2 -->

		<!-- background3 -->
		<div
			class="bg-fullscreen3 d-flex align-items-center justify-content-center text-white ">
			<div class="custom-div1 text-center top-1">
				<h1 class="fs-1">iPhone 15 Pro</h1>
				<span class="fs-4">Titan. Thật bền chắc. Thật nhẹ. Thật Pro</span>
				<div class="mt-3">
					<button class="btn btn-primary text-white rounded-full">Tìm
						hiểu thêm</button>
					<button class="btn btn-outline-primary rounded-full">Xem
						giá</button>
				</div>
			</div>
		</div>
		<!-- end background3 -->

		<!-- background4 -->
		<div class="container-fluid mt-2 ">
			<div class="row gx-2">
				<div
					class="col-md-6 left-half1 d-flex align-items-center justify-content-center text-white">
					<div class="text-center text-dark custom-div1">
						<h1 class="fs-1">iPhone 15</h1>
						<span class="fs-4">Camera mới. Thiết kế mới. Mới lịm tim</span>
						<div class="mt-3">
							<button class="btn btn-primary text-white rounded-full">Tìm
								hiểu thêm</button>
							<button class="btn btn-outline-primary rounded-full">Mua</button>
						</div>
					</div>
				</div>

				<!-- Cột phải -->
				<div
					class="col-md-6 right-half1 d-flex align-items-center justify-content-center text-white">
					<div class="text-center custom-div1">
						<img src="image/index/logoapw.png" alt=""><br> <span
							class="fs-5">Dây đeo Pride Edition mới.</span><br> <span
							class="fs-5">Hãy để bản sắc của bạn tỏa sáng</span>
						<div class="mt-3">
							<button class="btn btn-primary text-white rounded-full">Mua</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end background4 -->

		<!-- background5 -->
		<div class="container-fluid mt-2 ">
			<div class="row gx-2">
				<!-- Cột trái -->
				<div
					class="col-md-6 left-half2 d-flex align-items-center justify-content-center text-white">
					<div class="text-center text-dark custom-div1">
						<h1 class="fs-1">MacBook Air</h1>
						<span class="fs-4">Cỗ máy M3. Gọn bâng. Cân bằng mọi việc</span>
						<div class="mt-3">
							<button class="btn btn-primary text-white rounded-full">Tìm
								hiểu thêm</button>
							<button class="btn btn-outline-primary rounded-full">Mua</button>
						</div>
					</div>
				</div>

				<!-- Cột phải -->
				<div
					class="col-md-6 right-half2 d-flex align-items-center justify-content-center text-white">
					<div class="text-center text-dark custom-div1">
						<img src="image/index/logoapw2.png" alt=""><br> <span
							class="fs-5">Một đẳng cấp phiêu lưu mới</span>
						<div class="mt-3">
							<button class="btn btn-primary text-white rounded-full">Tìm
								hiểu thêm</button>
							<button class="btn btn-outline-primary rounded-full">Mua</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end background5 -->

		<!-- background6 -->
		<div class="container-fluid mt-2 ">
			<div class="row gx-2">
				<!-- Cột trái -->
				<div
					class="col-md-6 left-half3 d-flex align-items-center justify-content-center text-white">
					<div class="text-center text-dark custom-div1">
						<h1 class="fs-1">MacBook Pro</h1>
						<span class="fs-4">Chấn động. Ấn tượng</span>
						<div class="mt-3">
							<button class="btn btn-primary text-white rounded-full">Tìm
								hiểu thêm</button>
							<button class="btn btn-outline-primary rounded-full">Mua</button>
						</div>
					</div>
				</div>

				<!-- Cột phải -->
				<div
					class="col-md-6 right-half3 d-flex align-items-center justify-content-center text-white">
					<div class="text-center custom-div1">
						<h1 class="fs-1">AirPods Pro</h1>
						<span class="fs-5">Âm thanh thích ứng. Đang phát</span>
						<div class="mt-3">
							<button class="btn btn-primary text-white rounded-full">Tìm
								hiểu thêm</button>
							<button class="btn btn-outline-primary text-white rounded-full">Mua</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end background6 -->


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
</html>