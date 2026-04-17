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
    <title>${user.fullName} - Furniture Store</title>
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
                    <h1 class="mt-4"><i class="fas fa-user me-2" style="color: #81c408;"></i>Chi tiết người dùng</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Trang chủ</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/user">Người dùng</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Chi tiết</li>
                        </ol>
                    </nav>
                </div>
                <div class="container-fluid px-4">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-md-10 col-12">
                            <div class="card">
                                <div class="card-header" style="background: #81c408; color: white;">
                                    <h5 class="mb-0"><i class="fas fa-id-card me-2"></i>Thông tin người dùng #${id}</h5>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-4 text-center mb-4">
                                            <img src="/images/avatar/${empty user.avatar || user.avatar == '' ? 'default-avatar.jpg' : user.avatar}" 
                                                alt="Ảnh đại diện" class="img-fluid rounded-circle" 
                                                style="width: 200px; height: 200px; object-fit: cover; border: 4px solid #81c408;"
                                                onerror="this.onerror=null; this.src='/images/avatar/default-avatar.jpg';" />
                                        </div>
                                        <div class="col-md-8">
                                            <table class="table table-bordered">
                                                <tbody>
                                                    <tr>
                                                        <th style="width: 150px; background: #f8f9fa;"><i class="fas fa-hashtag me-1" style="color: #81c408;"></i>Mã người dùng</th>
                                                        <td>${id}</td>
                                                    </tr>
                                                    <tr>
                                                        <th style="background: #f8f9fa;"><i class="fas fa-envelope me-1" style="color: #81c408;"></i>Email</th>
                                                        <td>${user.email}</td>
                                                    </tr>
                                                    <tr>
                                                        <th style="background: #f8f9fa;"><i class="fas fa-id-card me-1" style="color: #81c408;"></i>Họ và tên</th>
                                                        <td><strong>${user.fullName}</strong></td>
                                                    </tr>
                                                    <tr>
                                                        <th style="background: #f8f9fa;"><i class="fas fa-phone me-1" style="color: #81c408;"></i>Số điện thoại</th>
                                                        <td>${user.phone}</td>
                                                    </tr>
                                                    <tr>
                                                        <th style="background: #f8f9fa;"><i class="fas fa-map-marker-alt me-1" style="color: #81c408;"></i>Địa chỉ</th>
                                                        <td>${user.address}</td>
                                                    </tr>
                                                    <tr>
                                                        <th style="background: #f8f9fa;"><i class="fas fa-user-tag me-1" style="color: #81c408;"></i>Vai trò</th>
                                                        <td>
                                                            <span class="badge" style="background: #81c408;">
                                                                ${user.role.name == 'ADMIN' ? 'Quản trị viên' : 'Người dùng'}
                                                            </span>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="d-flex gap-2">
                                        <a href="/admin/user/update/${user.id}" class="btn btn-warning">
                                            <i class="fas fa-edit me-1"></i>Chỉnh sửa
                                        </a>
                                        <a href="/admin/user" class="btn btn-secondary">
                                            <i class="fas fa-arrow-left me-1"></i>Quay lại
                                        </a>
                                    </div>
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