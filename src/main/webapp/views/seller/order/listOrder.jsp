<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
/* Toàn bộ nền và chữ */
body {
    background-color: #121212; /* Nền tối */
    color: #e0e0e0; /* Màu chữ sáng */
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    line-height: 1.5;
}

/* Tiêu đề */
h2 {
    color: #ffffff; /* Màu chữ trắng */
    margin-bottom: 20px;
}

/* Liên kết */
a {
    color: #64b5f6; /* Màu xanh dương nhạt */
    text-decoration: none;
    transition: color 0.3s ease-in-out;
}

a:hover {
    color: #42a5f5; /* Xanh dương khi hover */
}

/* Card */
.card {
    background-color: #1e1e1e; /* Nền card tối */
    border: 1px solid #333333; /* Viền nhẹ tối */
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Hiệu ứng bóng */
    margin-bottom: 24px;
    padding: 20px;
    color: #d6d6d6; /* Màu chữ sáng */
    transition: transform 0.3s ease-in-out;
}

.card:hover {
    transform: scale(1.02); /* Hiệu ứng hover */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.4);
}

/* Tiêu đề trong card */
.card-body h6 {
    font-size: 1rem;
    color: #ffffff;
}

.card-body p {
    font-size: 0.9rem;
    margin-bottom: 0;
}

/* Phần trạng thái */
.text-success {
    color: #4caf50; /* Màu xanh lá */
}

.text-warning {
    color: #ffb74d; /* Màu cam */
}

.text-secondary {
    color: #9e9e9e; /* Màu xám phụ */
}

.text-danger {
    color: #e57373; /* Màu đỏ */
}

/* Các phần tử sản phẩm */
.product-item {
    display: flex;
    margin-top: 15px;
    background-color: #212121; /* Nền sản phẩm */
    border-radius: 8px;
    padding: 15px;
    transition: background-color 0.3s ease-in-out;
}

.product-item:hover {
    background-color: #333333; /* Sáng nhẹ khi hover */
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

/* Giá */
.price-info {
    text-align: center;
    font-size: 1.2rem;
    font-weight: bold;
    color: #ffb74d;
}

/* Chi tiết đơn hàng */
.order-details-container {
    background-color: #1e1e1e; /* Nền tối */
    padding: 10px;
    border-radius: 8px;
    margin-top: 15px;
}

.order-details-container .row {
    margin-bottom: 10px;
}

.order-details-container .w-75 {
    font-size: 1rem;
    color: #ffffff; /* Màu chữ trắng */
}

.order-details-container .w-25 {
    text-align: right;
    font-size: 0.9rem;
    color: #e0e0e0;
}

/* Đường trạng thái */
.track-line {
    height: 2px;
    background-color: #4caf50;
}

.off-track-line {
    height: 2px;
    background-color: #757575;
}

/* Chấm trạng thái */
.dot, .big-dot {
    background-color: #4caf50;
    border-radius: 50%;
}

.off-dot, .off-big-dot {
    background-color: #616161;
    border-radius: 50%;
}
</style>

<main>
	<div class="container-fluid px-4">
		<h2 class="mt-4">${status==0?'Xác nhận đơn hàng':'Chuẩn bị đơn hàng'}</h2>
		<div class="row">
			<c:forEach var="i" items="${listOrder}">			
				<div class="card border mb-4 ms-4" style="width: 47% " >
					<div class="card-body">
						<div class="row">
							<div class="col-md-12 mb-2">
								<div class="row">
									<div class="col-md-12 w-75">
										<h6 class="mx=0"><Strong>Khách hàng: ${i.customer.lastName} ${i.customer.firstName}</Strong></h6>
										<p class="mb-0">Trạng thái đơn hàng:  
										<strong> 
											<c:if test="${i.status == 0}">
												 <i style="color: orange">Chưa xác nhận</i>
											</c:if>
											<c:if test="${i.status == 1}">
												<i style="color: green">Đã xác nhận</i>
											</c:if>
											<c:if test="${i.status == 2}">
												<i style="color: purple;"> Đang chuẩn bị</i>
											</c:if>
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
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
</main>
