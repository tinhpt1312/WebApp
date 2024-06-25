<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<meta charset="UTF-8">
<title>Invoice</title>

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

.invoice-container {
	max-width: 800px;
	margin: auto;
	padding: 20px;
	border: 1px solid #eee;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
	font-size: 16px;
	line-height: 24px;
	font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
	color: #555;
}

.invoice-header, .invoice-footer {
	text-align: center;
}

.invoice-details, .invoice-items {
	margin: 20px 0;
}

.invoice-items th, .invoice-items td {
	border-bottom: 1px solid #eee;
	padding: 8px;
	text-align: center;
}

.total {
	font-weight: bold;
}
</style>
</head>
<body>
	<!--  
	<div class="invoice-container">
		<div class="invoice-header">
			<h1>Invoice</h1>
			<p>Order ID: ${order.id}</p>
			<p>
				Date:
				<fmt:formatDate value="${order.createDate}" pattern="dd-MM-yyyy" />
			</p>
		</div>
		<div class="invoice-details">
			<p>
				<strong>Address:</strong> ${order.address}
			</p>
			<p>
				<strong>Total Amount:</strong> ${order.totalFormatted}
			</p>
			<p>
				<strong>Paid:</strong> ${order.trangThai ? "Yes" : "No"}
			</p>
		</div>
		<div class="invoice-items">
			<table width="100%">
				<thead>
					<tr>
						<th>Product Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="orderDetail" items="${orderDetails}">
						<tr>
							<td>${orderDetail.product.name}</td>
							<td>${orderDetail.priceFormatted}</td>
							<td>${orderDetail.quantity}</td>
							<td>${orderDetail.totalFormatted1}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3" class="total">Grand Total</td>
						<td class="total">${order.totalFormatted}</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div class="invoice-footer">
			<p>Thank you for your purchase!</p>
		</div>
	</div>
	<div class="container d-flex justify-content-around mt-3">
		<a href="/invoice/pdf/${order.id}" class="btn btn-primary fw-bold">Download
			PDF</a> <a href="/admin/order" class="btn btn-secondary fw-bold">Back</a>
	</div> -->

	<div class="sidebar d-flex flex-column p-3">
		<div class="p-3 mb-2">
			<a href="#" class="text-decoration-none h3"><i
				class="bi bi-apple"></i>ElectroEdge</a>
		</div>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item mb-3 "><a href="/admin/index"
				class="nav-link fw-semibold">Home</a></li>
			<!-- <li class="nav-item"><a href="#" class="nav-link active"> <i
        class="bi bi-house"></i> Home -->
			</a>
			</li>
			<li class="nav-item mb-3"><span
				class="nav-link fw-semibold h5 mb-0">Manager</span>
				<div class=" flex-column nav-pills nav">
					<a href="/admin/product"
						class="text-decoration-none py-sm-2 px-sm-3 fw-lighter  text-white fw-light "><i
						class="bi bi-laptop mx-1"></i>Product</a> <a href="/admin/order"
						class="nav-link active text-decoration-none py-sm-2 px-sm-3  fw-lighter text-white fw-light">
						<i class="bi bi-basket3 mx-1"></i>Order
					</a> <a href="#"
						class="text-decoration-none py-sm-2 px-sm-3 fw-lighter  text-white fw-light">
						<i class="bi bi-person mx-1"></i>User
					</a>
				</div></li>
			<li class="nav-item mb-3"><span
				class="nav-link fw-semibold h5 mb-0">Add</span>
				<div class=" flex-column nav-pills nav">
					<a href="#"
						class="text-decoration-none py-sm-2 px-sm-3 fw-lighter  text-white fw-light"><i
						class="bi bi-laptop mx-1"></i>Product</a> <a href="#"
						class="text-decoration-none py-sm-2 px-sm-3 fw-lighter  text-white fw-light">
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
					<span class="text-decoration-none fw-bold text-black">Order</span>
					<span class="text-decoration-none text-danger">Export Invoice</span>
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

		<div class="container pt-5">
			<div class="invoice-container mt-5">
				<div class="invoice-header">
					<h1>Invoice</h1>
					<p>Order ID: ${order.id}</p>
					<p>
						Date:
						<fmt:formatDate value="${order.createDate}" pattern="dd-MM-yyyy" />
					</p>
				</div>
				<div class="invoice-details">
					<p>
						<strong>Address:</strong> ${order.address}
					</p>
					<p>
						<strong>Total Amount:</strong> ${order.totalFormatted}
					</p>
					<p>
						<strong>Paid:</strong> ${order.trangThai ? "Yes" : "No"}
					</p>
				</div>
				<div class="invoice-items">
					<table width="100%">
						<thead>
							<tr>
								<th>Product Name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="orderDetail" items="${orderDetails}">
								<tr>
									<td>${orderDetail.product.name}</td>
									<td>${orderDetail.priceFormatted}</td>
									<td>${orderDetail.quantity}</td>
									<td>${orderDetail.totalFormatted1}</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="3" class="total">Grand Total</td>
								<td class="total">${order.totalFormatted}</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div class="invoice-footer">
					<p>Thank you for your purchase!</p>
				</div>
			</div>
			<div class="container d-flex justify-content-around mt-3">
				<a href="/invoice/pdf/${order.id}" class="btn btn-primary fw-bold">Download
					PDF</a> <a href="/admin/order" class="btn btn-secondary fw-bold">Back</a>
			</div>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>