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
    <title>Xóa sản phẩm - Furniture Store</title>
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
                    <h1 class="mt-4"><i class="fas fa-trash-alt me-2" style="color: #dc3545;"></i>Xóa sản phẩm</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Trang chủ</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/product">Sản phẩm</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Xóa</li>
                        </ol>
                    </nav>
                </div>

                <div class="container-fluid px-4">
                    <div class="row justify-content-center">
                        <div class="col-lg-6 col-md-8 col-12">
                            <div class="card border-danger">
                                <div class="card-header bg-danger text-white">
                                    <h5 class="mb-0"><i class="fas fa-exclamation-triangle me-2"></i>Xác nhận xóa sản phẩm #${id}</h5>
                                </div>
                                <div class="card-body">
                                    <div class="alert alert-danger">
                                        <i class="fas fa-warning me-2"></i>Bạn có chắc chắn muốn xóa sản phẩm này không? Hành động này không thể hoàn tác.
                                    </div>
                                    <form:form method="post" action="/admin/product/delete/{id}" modelAttribute="newProduct">
                                        <div class="mb-3" style="display: none">
                                            <form:input value="${id}" type="text" class="form-control" path="id" />
                                        </div>
                                        <div class="d-flex gap-2">
                                            <button type="submit" class="btn btn-danger">
                                                <i class="fas fa-trash me-1"></i>Xác nhận xóa
                                            </button>
                                            <a href="/admin/product" class="btn btn-secondary">
                                                <i class="fas fa-arrow-left me-1"></i>Hủy bỏ
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