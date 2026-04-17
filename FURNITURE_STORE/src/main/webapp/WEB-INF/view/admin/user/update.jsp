<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Furniture Store - Cửa hàng nội thất" />
    <meta name="author" content="Furniture Store" />
    <title>Cập nhật người dùng - Furniture Store</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link href="/css/custom.css" rel="stylesheet" />
    <link href="/css/admin.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />

    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4"><i class="fas fa-user-edit me-2" style="color: #81c408;"></i>Cập nhật người dùng</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Trang chủ</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/user">Người dùng</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Cập nhật</li>
                        </ol>
                    </nav>
                </div>
                <div class="container-fluid px-4">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-md-10 col-12">
                            <div class="card">
                                <div class="card-header" style="background: #ffc107; color: #212529;">
                                    <h5 class="mb-0"><i class="fas fa-user me-2"></i>Chỉnh sửa thông tin người dùng #${newUser.id}</h5>
                                </div>
                                <div class="card-body">
                                    <form:form method="post" action="/admin/user/update" modelAttribute="newUser">
                                        <div class="mb-3" style="display: none">
                                            <form:input type="text" class="form-control" path="id" />
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label"><i class="fas fa-envelope me-1" style="color: #81c408;"></i>Email:</label>
                                            <form:input type="email" class="form-control" path="email" disabled="true" />
                                            <small class="form-text text-muted">Email không thể thay đổi</small>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label"><i class="fas fa-phone me-1" style="color: #81c408;"></i>Số điện thoại:</label>
                                            <form:input type="text" class="form-control" path="phone" placeholder="Nhập số điện thoại" />
                                        </div>
                                        
                                        <div class="mb-3">
                                            <label class="form-label"><i class="fas fa-id-card me-1" style="color: #81c408;"></i>Họ và tên:</label>
                                            <form:input type="text" class="form-control" path="fullName" placeholder="Nhập họ và tên" />
                                        </div>
                                        
                                        <div class="mb-3">
                                            <label class="form-label"><i class="fas fa-map-marker-alt me-1" style="color: #81c408;"></i>Địa chỉ:</label>
                                            <form:input type="text" class="form-control" path="address" placeholder="Nhập địa chỉ" />
                                        </div>
                                        
                                        <hr />
                                        <div class="d-flex gap-2">
                                            <button type="submit" class="btn btn-warning">
                                                <i class="fas fa-save me-1"></i>Cập nhật
                                            </button>
                                            <a href="/admin/user" class="btn btn-secondary">
                                                <i class="fas fa-arrow-left me-1"></i>Quay lại
                                            </a>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
    <script src="/js/admin.js"></script>
</body>

</html>