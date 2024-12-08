<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
/* Toàn bộ nền và chữ */
body {
    background-color: #121212; /* Nền chính tối */
    color: #e0e0e0; /* Màu chữ sáng */
    font-family: 'Arial', sans-serif; /* Font chữ phổ biến */
    line-height: 1.5; /* Dễ đọc */
    margin: 0;
    padding: 0;
}

/* Thẻ chính */
main {
    padding: 20px;
}

/* Tiêu đề */
h1, h2, h3, h4, h5, h6 {
    color: #ffffff; /* Tiêu đề màu trắng */
    margin-bottom: 20px;
    font-weight: bold;
}

h1 {
    font-size: 2rem;
    text-align: left;
    border-bottom: 1px solid #333;
    padding-bottom: 10px;
}

h5, h6 {
    font-size: 1.2rem;
}

/* Liên kết */
a {
    color: #64b5f6; /* Màu xanh dương sáng */
    text-decoration: none;
    transition: color 0.3s ease-in-out;
}

a:hover {
    color: #42a5f5; /* Xanh dương khi hover */
}

/* Thẻ card */
.card {
    background-color: #1e1e1e; /* Màu nền card */
    border: 1px solid #2c2c2c; /* Viền nhẹ tối */
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Hiệu ứng bóng */
    margin-bottom: 24px;
    padding: 20px;
    color: #d6d6d6; /* Màu chữ trong card */
    transition: transform 0.3s ease-in-out;
}

.card:hover {
    transform: scale(1.02); /* Phóng to nhẹ khi hover */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
}

/* Tiêu đề trong card */
.card-body h6 {
    font-size: 1rem;
    color: #ffffff; /* Màu chữ tiêu đề trong card */
}

.card-body p {
    font-size: 0.9rem;
    margin-bottom: 0;
}

/* Phần trạng thái */
.text-success {
    color: #4caf50 !important; /* Màu xanh thành công */
}

.text-danger {
    color: #e57373 !important; /* Màu đỏ */
}

.text-warning {
    color: #ffb74d !important; /* Màu cam */
}

.text-secondary {
    color: #9e9e9e !important; /* Màu xám phụ */
}

/* Button */
button {
    background-color: #424242; /* Màu nền nút tối */
    color: #e0e0e0; /* Chữ màu sáng */
    border: 1px solid #616161; /* Viền nút */
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
}

button:hover {
    background-color: #616161; /* Nền sáng hơn khi hover */
    color: #ffffff; /* Chữ trắng */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
}

/* Dòng trạng thái */
.track-line {
    background-color: #4caf50; /* Đường màu xanh */
    height: 2px;
    border-radius: 1px;
    margin: 10px 0;
}

.off-track-line {
    background-color: #757575; /* Đường xám nhạt */
    height: 2px;
    border-radius: 1px;
    margin: 10px 0;
}

/* Chấm trạng thái */
.dot, .big-dot {
    background-color: #4caf50; /* Chấm xanh */
    border-radius: 50%;
}

.off-dot, .off-big-dot {
    background-color: #616161; /* Chấm xám */
    border-radius: 50%;
}

/* Các item sản phẩm */
.product-item {
    display: flex;
    align-items: flex-start;
    margin: 15px 0;
    padding: 10px;
    background-color: #212121;
    border-radius: 8px;
    transition: background-color 0.3s ease-in-out;
}

.product-item:hover {
    background-color: #333333; /* Làm sáng nhẹ khi hover */
}

/* Thông tin sản phẩm */
.product-info {
    flex-grow: 2;
    margin-left: 20px;
    color: #d6d6d6;
}

.product-image img {
    max-width: 100%;
    border-radius: 8px;
}

/* Tổng giá tiền */
.price-info {
    text-align: right;
    font-size: 1.2rem;
    font-weight: bold;
    color: #ffb74d;
}

/* Chi tiết đơn hàng */
.order-details-container {
    margin-top: 15px;
    padding: 10px;
    background-color: #1e1e1e;
    border-radius: 8px;
}

.order-details-container .row {
    margin-bottom: 10px;
}

.order-details-container .w-75 {
    font-size: 1rem;
    color: #ffffff; /* Chữ trắng */
}

.order-details-container .w-25 {
    text-align: right;
    font-size: 0.9rem;
    color: #e0e0e0;
}

/* Form ẩn */
input[type="hidden"] {
    background-color: #121212;
    border: none;
}
</style>

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">Lịch sử xác nhận đơn hàng</h1>
		<!-- 		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
			<li class="breadcrumb-item active">Tables</li>
		</ol> -->
		<div class="card mb-4">
			<div class="card-body"></div>
		</div>
		<div class="row">
			<c:forEach var="i" items="${listOrder}">
				<div class="card border mb-4 ms-4" style="width: 47%">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12 mb-2">
								<div class="row">
									<div class="col-md-12 w-75">
										<h6 class="mx=0">Khách hàng: ${i.customer.lastName} ${i.customer.firstName}</h6>
										<p class="mb-0">Trạng thái đơn hàng:  
										<strong> 
										    <c:choose>
										        <c:when test="${i.status == 0}">
										            <div class="text-success" style="color: orange">Chưa xác nhận</div>
										        </c:when>
										        <c:when test="${i.status == 1}">
										            <div class="text-success" style="color: green">Đã xác nhận</div>
										        </c:when>
										        <c:when test="${i.status == 2}">
										            <div class="text-success" style="color: blue">Đang chuẩn bị</div>
										        </c:when>
										        <c:when test="${i.status == 3}">
										            <div class="text-success" style="color: red">Đang được giao</div>
										        </c:when>
										        <c:when test="${i.status == 4}">
										            <h6 class="text-success" style="color: green">Đã giao thành công</h6>
										        </c:when>
										        <c:when test="${i.status == 5}">
										            <div class="text-success text-danger">Bị hủy</div>
										        </c:when>
										    </c:choose>
										</strong> </p>
									</div>
									<h5 class="text-warning px-0 w-25 d-flex justify-content-end">
										
										<c:if test="${i.payment.status == 0}">
											<fmt:formatNumber type="currency" value="${i.totalMoney}"
												currencyCode="VND" pattern="#,##0 đ" var="formattedPrice" />
											${formattedPrice}
										</c:if>
										<c:if test="${i.payment.status != 0}">
											<div class="text-success"> Đã thanh toán</div>
										</c:if>
									</h5>
								</div>

							</div>
							<hr>
							<div class="d-none">
								<input type="hidden" name="orderID" value="${i.orderID}">
								<input type="hidden" name="sellerID" value="${i.sellerID}">
								<input type="hidden" name="shipperID" value="${i.shipperID}">
							</div>
							<div class="col-md-12 order-details-container">
								<c:forEach var="j" items="${i.details}">
									<c:if test="${j != null}">
										<div class="row mb-1">
											<div class="w-75 text-truncate font-size-16">
												${j.product.productName} ${j.product.description} 
												Màu sắc: ${j.item.color}</div>
											<div class="w-25 d-flex justify-content-end">
												x${j.quantity}</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<!-- Actions and Total -->

							<i class="text-secondary col-md-6 d-flex align-items-end">${i.orderDate}</i>
							<div class="col-md-3 ms-auto">
								<div class="ms-auto" style="margin-left: auto">
									<a href="sellerOrderDetail?orderID=${i.orderID}"
										class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-13 m-b-5">
										Chi tiết</a>
									<form class = "pb-0" action="sellerUpdateOrder" method="post"
										enctype="multipart/form-data">
										<input type="hidden" name="orderID" value="${i.orderID}">
										<input type="hidden" name="action" value="confirmOrder">
										<button type="submit"
											class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
											Cập nhật trạng thái</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
</main>
