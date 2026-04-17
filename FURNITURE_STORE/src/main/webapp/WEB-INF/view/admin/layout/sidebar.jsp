<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background: #212529;">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading" style="color: rgba(255,255,255,0.5); font-size: 0.75rem;">
                    Quản lý
                </div>
                
                <a class="nav-link sidebar-link" href="/admin">
                    <div class="sb-nav-link-icon">
                        <i class="fas fa-chart-pie"></i>
                    </div>
                    Trang chủ
                </a>

                <a class="nav-link sidebar-link" href="/admin/user">
                    <div class="sb-nav-link-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    Người dùng
                </a>

                <a class="nav-link sidebar-link" href="/admin/product">
                    <div class="sb-nav-link-icon">
                        <i class="fas fa-couch"></i>
                    </div>
                    Sản phẩm
                </a>

                <a class="nav-link sidebar-link" href="/admin/warehouse">
                    <div class="sb-nav-link-icon">
                        <i class="fas fa-warehouse"></i>
                    </div>
                    Kho hàng
                </a>

                <a class="nav-link sidebar-link" href="/admin/order">
                    <div class="sb-nav-link-icon">
                        <i class="fas fa-shopping-bag"></i>
                    </div>
                    Đơn hàng
                </a>
                
                <div class="sb-sidenav-menu-heading" style="color: rgba(255,255,255,0.5); font-size: 0.75rem; margin-top: 1rem;">
                    Khác
                </div>
                
                <a class="nav-link sidebar-link" href="/">
                    <div class="sb-nav-link-icon">
                        <i class="fas fa-store"></i>
                    </div>
                    Về trang chủ
                </a>
            </div>
        </div>
        <div class="sb-sidenav-footer" style="background: rgba(0,0,0,0.2);">
            <div class="small" style="color: rgba(255,255,255,0.5);">Đăng nhập với:</div>
            <span style="color: #81c408; font-weight: 600;">
                <i class="fas fa-user-shield me-1"></i> Admin
            </span>
        </div>
    </nav>
</div>

<style>
    .sidebar-link {
        padding: 0.7rem 1rem !important;
        color: rgba(255,255,255,0.8) !important;
    }
    
    .sidebar-link:hover {
        background: #81c408 !important;
        color: white !important;
    }
    
    .sidebar-link .sb-nav-link-icon {
        color: #81c408 !important;
        width: 24px;
        text-align: center;
    }
    
    .sidebar-link:hover .sb-nav-link-icon {
        color: white !important;
    }
</style>