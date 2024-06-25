<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Manager</title>
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
			</a>
			</li>
			<li class="nav-item mb-3"><span
				class="nav-link fw-semibold h5 mb-0">Manager</span>
				<div class=" flex-column nav-pills nav">
					<a href="/admin/product"
						class="text-decoration-none py-sm-2 px-sm-3 fw-lighter  text-white fw-light nav-link active"><i
						class="bi bi-laptop mx-1"></i>Product</a> <a href="/admin/order"
						class="text-decoration-none py-sm-2 px-sm-3  fw-lighter text-white fw-light">
						<i class="bi bi-basket3 mx-1"></i>Order
					</a> <a href="/admin/user"
						class="text-decoration-none py-sm-2 px-sm-3 fw-lighter  text-white fw-light">
						<i class="bi bi-person mx-1"></i>User
					</a>
				</div></li>
			<li class="nav-item mb-3"><span
				class="nav-link fw-semibold h5 mb-0">Add</span>
				<div class=" flex-column nav-pills nav">
					<a href="/admin/product/add"
						class="text-decoration-none py-sm-2 px-sm-3 fw-lighter  text-white fw-light"><i
						class="bi bi-laptop mx-1"></i>Product</a> <a href="/admin/user/add"
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
					<span class="text-decoration-none fw-bold text-black">Manager</span>
					<span class="text-decoration-none text-danger">Admin -
						Product</span>
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
				<form action="/admin/product" method="post">
					<div class="px-3 pt-5 mx-5 row">
						<c:if test="${not empty deleteSuccess}">
							<div class="alert alert-success" role="alert">${deleteSuccess}</div>
						</c:if>
						<div class="input-group col">
							<span class="input-group-text bg-white border-0 py-3 px-4"><i
								class="bi bi-search"></i></span> <input type="text"
								class="border-0 py-3 px-4 form-control-sm"
								placeholder="Search product" value="${keywords}" name="keywords">
							<button class="btn btn-danger mx-3 fw-semibold">Search</button>
						</div>

					</div>
					<div class="px-3 mt-5">
						<table class="table table-light">
							<thead>
								<tr class="fw-bold">
									<th class=" col-width-1 text-body-tertiary">Product</th>
									<th class=" text-center col-width-2 text-body-tertiary">Quantity</th>
									<th class=" text-center col-width-2 text-body-tertiary">Create
										Date</th>
									<th class=" text-center col-width-2 text-body-tertiary">Category</th>
									<th class="text-center  col-width-2 text-body-tertiary">Actions</th>
								</tr>
							</thead>
							<tbody class="fw-semibold">
								<c:forEach var="prod" items="${products}">
									<tr>

										<td class="d-flex align-items-center">
											<div class="w-25">
												<img class="w-100" src="/image/product/${prod.image}" alt="">
											</div>
											<div class="w-75 mx-4">
												<h6 class="fw-medium">${prod.name}</h6>
												<h6 class="fw-semibold text-danger">${prod.priceFormatted}</h6>
											</div>
										</td>
										<td class="text-center">
											<div class="mt-3">
												<span>${prod.quantity}</span>
											</div>
										</td>
										<td class="text-center">
											<div class="mt-3">
												<span>${prod.createDate}</span>
											</div>
										</td>
										<td class="text-center">
											<div class="mt-3">
												<span><c:choose>
														<c:when test="${prod.category.id == 'ca01'}">
                            Macbook
                        </c:when>
														<c:when test="${prod.category.id == 'ca04'}">
                            Apple Watch
                        </c:when>
														<c:otherwise>
                            ${prod.category.name}
                        </c:otherwise>
													</c:choose></span>
											</div>

										</td>
										<td class="text-center ">
											<div class="mt-3">
												<a href="product/${prod.id}"
													class="text-info bg-danger p-2 "><i
													class="bi bi-box-arrow-in-down-left"></i></a> <a
													href="product/delete/${prod.id}"
													class="bg-black text-light p-2"><i class="bi bi-trash"></i></a>
											</div>

										</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
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