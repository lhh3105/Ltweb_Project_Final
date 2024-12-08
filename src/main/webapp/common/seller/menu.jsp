<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<nav class="sb-sidenav accordion sb-sidenav-dark bg-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
            <!-- Profile Section -->
            <div class="profile text-center py-3">
                <img class="profile-img mb-3 rounded-circle border border-light" src="${sessionScope.user.avatar}" alt="image" style="width: 80px; height: 80px;">
                <h4 class="text-white">${sessionScope.user.lastName} ${sessionScope.user.firstName}</h4>
                <c:if test="${sessionScope.user.type==1}">
                    <small class="text-muted">Seller</small>
                </c:if>
            </div>
            <!-- Menu Links -->
            <a class="nav-link text-white" href="<c:url value='/sellerHome'/>">
                <div class="sb-nav-link-icon"><i class="fa-solid fa-house"></i></div>
                Thống kê
            </a>
            <a class="nav-link text-white" href="sellerConfirmedOrder">
                <div class="sb-nav-link-icon"><i class="fas fa-history"></i></div>
                Lịch sử xác nhận đơn
            </a>
            <div class="sb-sidenav-menu-heading text-muted">Quản lý</div>
            <a class="nav-link text-white" href="sellerInfor">
                <div class="sb-nav-link-icon"><i class="fa-regular fa-user"></i></div>
                Thông tin cá nhân
            </a>
            <a class="nav-link text-white" href="sellerOrders">
                <div class="sb-nav-link-icon"><i class="fas fa-cubes"></i></div>
                Xác nhận đơn hàng
            </a>
            <a class="nav-link text-white" href="sellerUnpreOrder">
                <div class="sb-nav-link-icon"><i class="fa-solid fa-cart-shopping"></i></div>
                Chuẩn bị đơn hàng
            </a>
        </div>
    </div>
    <!-- Footer -->
    <div class="sb-sidenav-footer bg-dark text-white text-center py-3" style="position: fixed; bottom: 0; width: 100%;">
        <div class="small">Logged in as:</div>
        Seller
    </div>
</nav>
