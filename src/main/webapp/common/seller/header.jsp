<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<nav class="sb-topnav navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <!-- Navbar Brand -->
    <a class="navbar-brand ps-3 fw-bold text-white" href="#" style="font-size: 1.25rem;">
        <i class="fas fa-home"></i> Trang Chủ Bán Hàng
    </a>
    <!-- Sidebar Toggle -->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0 text-white" id="sidebarToggle">
        <i class="fas fa-bars"></i>
    </button>
    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <input class="form-control form-control-sm bg-dark text-white border-0" type="text" placeholder="Tìm kiếm..." aria-label="Search" style="border-radius: 20px;">
    </form>
    <!-- Navbar -->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle d-flex align-items-center" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas fa-user fa-fw me-2"></i>
                <span class="text-white">Tài khoản</span>
            </a>
            <ul class="dropdown-menu dropdown-menu-end shadow bg-dark">
                <li>
                    <a class="dropdown-item text-white d-flex align-items-center" href="${pageContext.request.contextPath}/logout">
                        <i class="fa-solid fa-right-from-bracket me-2"></i> Đăng xuất
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</nav>


