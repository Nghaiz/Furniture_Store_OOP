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
    <title>Thêm kho hàng - Furniture Store</title>
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
                    <h1 class="mt-4"><i class="fas fa-plus-circle me-2" style="color: #81c408;"></i>Thêm kho hàng</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Trang chủ</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/warehouse">Kho hàng</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Thêm mới</li>
                        </ol>
                    </nav>
                </div>
                <div class="container-fluid px-4">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-md-10 col-12">
                            <div class="card">
                                <div class="card-header" style="background: #81c408; color: white;">
                                    <h5 class="mb-0"><i class="fas fa-warehouse me-2"></i>Thông tin kho hàng mới</h5>
                                </div>
                                <div class="card-body">
                                    <c:if test="${not empty error}">
                                        <div class="alert alert-danger" role="alert">
                                            <i class="fas fa-exclamation-triangle me-1"></i>${error}
                                        </div>
                                    </c:if>
                                    <form:form method="post" action="/admin/warehouse/create" modelAttribute="newWarehouse" class="row">
                                        
                                        <div class="mb-3 col-12">
                                            <label class="form-label"><i class="fas fa-couch me-1" style="color: #81c408;"></i>Sản phẩm:</label>
                                            <select class="form-select" name="productId" required>
                                                <option value="">-- Chọn sản phẩm --</option>
                                                <c:forEach var="product" items="${products}">
                                                    <option value="${product.id}">${product.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label"><i class="fas fa-boxes me-1" style="color: #81c408;"></i>Số lượng:</label>
                                            <form:input type="number" class="form-control" path="quantity" min="0" required="true" placeholder="Nhập số lượng" />
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label"><i class="fas fa-map-marker-alt me-1" style="color: #81c408;"></i>Vị trí:</label>
                                            <form:input type="text" class="form-control" path="location" placeholder="Nhập vị trí kho" />
                                        </div>

                                        <div class="col-12">
                                            <hr />
                                            <div class="d-flex gap-2">
                                                <button type="submit" class="btn btn-primary">
                                                    <i class="fas fa-save me-1"></i>Thêm kho hàng
                                                </button>
                                                <a href="/admin/warehouse" class="btn btn-secondary">
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
