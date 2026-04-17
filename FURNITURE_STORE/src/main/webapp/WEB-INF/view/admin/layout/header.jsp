<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background: #212529;">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="/admin" style="font-weight: 700; font-size: 1.2rem;">
        <i class="fas fa-couch me-2" style="color: #81c408;"></i>
        Furniture Store
    </a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!" style="color: #81c408;">
        <i class="fas fa-bars"></i>
    </button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <span style="color: rgba(255,255,255,0.9);">
            <i class="fas fa-user-circle me-2" style="color: #81c408;"></i>
            Xin chào, <strong><%=request.getUserPrincipal().getName().toString()%></strong>
        </span>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                data-bs-toggle="dropdown" aria-expanded="false" style="color: rgba(255,255,255,0.9);">
                <i class="fas fa-user-cog fa-fw" style="color: #81c408;"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li>
                    <a class="dropdown-item" href="/">
                        <i class="fas fa-home me-2" style="color: #81c408;"></i> Trang chủ
                    </a>
                </li>
                <li>
                    <hr class="dropdown-divider" />
                </li>
                <li>
                    <form action="/logout" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button class="dropdown-item" style="color: #dc3545;">
                            <i class="fas fa-sign-out-alt me-2"></i> Đăng xuất
                        </button>
                    </form>
                </li>
            </ul>
        </li>
    </ul>
</nav>