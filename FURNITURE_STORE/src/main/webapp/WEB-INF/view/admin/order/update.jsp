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
    <title>Cập nhật đơn hàng - Furniture Store</title>
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
                    <h1 class="mt-4"><i class="fas fa-edit me-2" style="color: #81c408;"></i>Cập nhật đơn hàng</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Trang chủ</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/order">Đơn hàng</a>
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
                                    <h5 class="mb-0"><i class="fas fa-shopping-bag me-2"></i>Cập nhật đơn hàng #${newOrder.id}</h5>
                                </div>
                                <div class="card-body">
                                    <form:form method="post" action="/admin/order/update" class="row" modelAttribute="newOrder">
                                        <div class="mb-3" style="display: none;">
                                            <form:input type="text" class="form-control" path="id" />
                                        </div>

                                        <div class="mb-3 col-12">
                                            <div class="alert alert-info">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <strong><i class="fas fa-hashtag me-1"></i>Mã đơn hàng:</strong> ${newOrder.id}
                                                    </div>
                                                    <div class="col-md-6">
                                                        <strong><i class="fas fa-money-bill me-1"></i>Tổng tiền:</strong> 
                                                        <span style="color: #81c408; font-weight: bold;">
                                                            <fmt:formatNumber type="number" value="${newOrder.totalPrice}" /> đ
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label"><i class="fas fa-user me-1" style="color: #81c408;"></i>Khách hàng:</label>
                                            <form:input type="text" class="form-control" disabled="true" path="user.fullName" />
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label"><i class="fas fa-truck me-1" style="color: #81c408;"></i>Trạng thái:</label>
                                            <form:select class="form-select" path="status">
                                                <form:option value="PENDING">Chờ xử lý</form:option>
                                                <form:option value="SHIPPING">Đang giao</form:option>
                                                <form:option value="COMPLETE">Hoàn thành</form:option>
                                                <form:option value="CANCEL">Đã hủy</form:option>
                                            </form:select>
                                        </div>

                                        <div class="col-12">
                                            <hr />
                                            <div class="d-flex gap-2">
                                                <button type="submit" class="btn btn-warning">
                                                    <i class="fas fa-save me-1"></i>Cập nhật
                                                </button>
                                                <a href="/admin/order" class="btn btn-secondary">
                                                    <i class="fas fa-arrow-left me-1"></i>Quay lại
                                                </a>
                                            </div>
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