<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
    body {
        background-color: #121212;
        color: #e0e0e0;
    }

    .card {
        background-color: #1c1c1c;
        border-color: #333;
        color: #e0e0e0;
    }

    .card-body {
        background-color: #212121;
        color: #e0e0e0;
    }

    .card-header {
        background-color: #333;
        color: #e0e0e0;
    }

    .text-success {
        color: #00c853;
    }

    .text-warning {
        color: #ff9800;
    }

    .text-danger {
        color: #f44336;
    }

    .text-info {
        color: #03a9f4;
    }

    .btn-info {
        background-color: #03a9f4;
        border-color: #0288d1;
    }

    .btn-info:hover {
        background-color: #0288d1;
        border-color: #0277bd;
    }

    .text-secondary {
        color: #9e9e9e;
    }

    .order-details-container {
        margin-bottom: 0;
        color: #e0e0e0;
    }

    .track-line, .off-track-line {
        background-color: #616161;
    }

    .dot, .off-dot, .big-dot, .off-big-dot {
        background-color: #00c853;
    }

    .off-dot, .off-big-dot {
        background-color: #9e9e9e;
    }

    .product-info, .price-info {
        color: #e0e0e0;
    }

    .product-item {
        margin-top: 20px;
    }

    .product-info {
        flex-grow: 2;
    }

    .price-info {
        flex-grow: 10;
        justify-content: flex-start;
        text-align: center;
        align-items: center;
    }

    .text-truncate {
        color: #e0e0e0;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    a {
        text-decoration: none !important;
        color: #03a9f4;
    }

    a:hover {
        text-decoration: underline;
    }
</style>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4 text-white">Đơn hàng đã hoàn thành</h1>
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
                                        <h6 class="mx-0">Khách hàng: ${i.customer.lastName} ${i.customer.firstName}</h6>
                                        <p class="mb-0">Trạng thái đơn hàng:  
                                            <strong>
                                                <c:choose>
                                                    <c:when test="${i.status == 0}">
                                                        <span class="text-warning">Chưa xác nhận</span>
                                                    </c:when>
                                                    <c:when test="${i.status == 1}">
                                                        <span class="text-success">Đã xác nhận</span>
                                                    </c:when>
                                                    <c:when test="${i.status == 2}">
                                                        <span class="text-info">Đang chuẩn bị</span>
                                                    </c:when>
                                                    <c:when test="${i.status == 3}">
                                                        <span class="text-danger">Đang được giao</span>
                                                    </c:when>
                                                    <c:when test="${i.status == 4}">
                                                        <span class="text-success">Đã giao thành công</span>
                                                    </c:when>
                                                    <c:when test="${i.status == 5}">
                                                        <span class="text-danger">Bị hủy</span>
                                                    </c:when>
                                                </c:choose>
                                            </strong>
                                        </p>
                                    </div>
                                    <h5 class="text-warning px-0 w-25 d-flex justify-content-end">
                                        <c:if test="${i.payment.status == 0}">
                                            <fmt:formatNumber type="currency" value="${i.totalMoney}"
                                                currencyCode="VND" pattern="#,##0 đ" var="formattedPrice" />
                                            ${formattedPrice}
                                        </c:if>
                                        <c:if test="${i.payment.status != 0}">
                                            <div class="text-success">Đã thanh toán</div>
                                        </c:if>
                                    </h5>
                                </div>
                            </div>
                            <hr>
                            <div class="col-md-12 order-details-container">
                                <c:forEach var="j" items="${i.details}">
                                    <c:if test="${j != null}">
                                        <div class="row mb-1">
                                            <div class="w-75 text-truncate font-size-16">
                                                ${j.product.productName} ${j.product.description} 
                                                Màu sắc: ${j.item.color}
                                            </div>
                                            <div class="w-25 d-flex justify-content-end">
                                                x${j.quantity}
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <i class="text-secondary col-md-6 d-flex align-items-end">${i.orderDate}</i>
                            <div class="col-md-3 ms-auto">
                                <a href="sellerOrderDetail?orderID=${i.orderID}" class="btn btn-info">
                                    Chi tiết
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</main>
