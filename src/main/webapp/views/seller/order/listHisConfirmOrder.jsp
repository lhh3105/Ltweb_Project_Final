<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
/* Nền tổng thể */
body {
	background-color: #2c2f33;
	color: #ffffff;
}

/* Card */
.card {
	margin-bottom: 24px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
	background-color: #23272a;
	border: none;
	border-radius: 8px;
}

.card-header {
	background-color: #2c2f33;
	color: #ffffff;
	border-bottom: 2px solid #40444b;
	font-weight: bold;
}

.table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
	color: #ffffff;
}

.table thead th {
	background-color: #40444b;
	color: #ffffff;
	text-align: left;
	padding: 12px;
}

.table tbody tr {
	transition: background-color 0.3s;
}

.table tbody tr:hover {
	background-color: #36393f;
}

.table tbody td {
	padding: 10px;
	border-top: 1px solid #40444b;
}

/* Badge */
.badge {
	padding: 5px 10px;
	border-radius: 5px;
	font-size: 12px;
}

.badge-success {
	background-color: #4caf50;
	color: #ffffff;
}

.badge-danger {
	background-color: #e74c3c;
	color: #ffffff;
}

.badge-warning {
	background-color: #f1c40f;
	color: #212529;
}

/* Nút hành động */
.btn-sm {
	padding: 5px 10px;
	font-size: 12px;
	border-radius: 5px;
	background-color: #007bff;
	color: #ffffff;
	border: none;
	transition: background-color 0.3s;
}

.btn-sm:hover {
	background-color: #0056b3;
}

.fa-eye {
	font-size: 14px;
	color: #ffffff;
}

.fa-eye:hover {
	color: #f1c40f;
}
</style>
<main>
	<div class="container-fluid px-4">		
		<h2 class="mt-4">Lịch sử đơn hàng</h2>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-box"></i> Đơn hàng
			</div>
			<div class="card-body">
				<table class="table">
					<thead>
						<tr>
							<th>Mã đơn</th>
							<th>Tên khách hàng</th>
							<th>Địa chỉ</th>
							<th>Ngày đặt</th>
							<th>Trạng thái</th>
							<th>Tổng tiền</th>
							<th>Thanh toán</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${listOrder}">
							<tr>
								<td>${i.orderID}</td>
								<td>${i.customer.lastName} ${i.customer.firstName}</td>
								<td>${i.address}</td>
								<td>${i.orderDate}</td>
								<td>
									<c:choose>
										<c:when test="${i.status==1}">
											<span class="badge badge-success">Đã xác nhận</span>
										</c:when>
										<c:when test="${i.status==2}">
											<span class="badge badge-success">Đang gói hàng</span>
										</c:when>
										<c:when test="${i.status==3}">
											<span class="badge badge-success">Đang giao</span>
										</c:when>
										<c:when test="${i.status==4}">
											<span class="badge badge-success">Đã giao</span>
										</c:when>
										<c:when test="${i.status==5}">
											<span class="badge badge-danger">Đã hủy</span>
										</c:when>
										<c:otherwise>
											<span class="badge badge-warning">Chưa xác nhận</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${i.totalMoney}</td>
								<td>
									<c:choose>
										<c:when test="${i.payment.status==1}">
											<i class="fa fa-check-circle text-success"></i>
										</c:when>
										<c:when test="${i.payment.status==0}">
											<i class="fa fa-times-circle text-danger"></i>
										</c:when>
									</c:choose>
								</td>
								<td>
									<a href="<c:url value='/sellerOrderDetail?orderID=${i.orderID}'/>" class="btn btn-sm">
										<i class="fa fa-eye"></i> Xem
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</main>
