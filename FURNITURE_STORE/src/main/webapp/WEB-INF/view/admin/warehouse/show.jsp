<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Furniture Store" />
    <meta name="author" content="Furniture Store" />
    <title>Quản lý kho hàng - Furniture Store</title>
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
                    <h1 class="mt-4"><i class="fas fa-warehouse me-2" style="color: #81c408;"></i>Quản lý kho hàng</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Trang chủ</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Kho hàng</li>
                        </ol>
                    </nav>
                </div>
                <div class="container-fluid px-4">
                    <div class="row">
                        <div class="col-12">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h3><i class="fas fa-list me-2"></i>Danh sách kho hàng</h3>
                                <a href="/admin/warehouse/create" class="btn btn-primary">
                                    <i class="fas fa-plus-circle me-2"></i>Thêm kho hàng
                                </a>
                            </div>
                            
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th style="width: 60px;">ID</th>
                                        <th>Tên sản phẩm</th>
                                        <th style="width: 150px;">Vị trí</th>
                                        <th style="width: 100px;">Số lượng</th>
                                        <th style="width: 150px;">Cập nhật</th>
                                        <th style="width: 200px;">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="warehouse" items="${warehouses}">
                                        <tr>
                                            <th class="text-center">${warehouse.id}</th>
                                            <td>
                                                <i class="fas fa-couch me-2" style="color: #81c408;"></i>
                                                <strong>${warehouse.product.name}</strong>
                                            </td>
                                            <td>
                                                <i class="fas fa-map-marker-alt me-1" style="color: #81c408;"></i>
                                                ${warehouse.location}
                                            </td>
                                            <td class="text-center">
                                                <span class="badge" style="background: #81c408;">
                                                    ${warehouse.quantity}
                                                </span>
                                            </td>
                                            <td>
                                                <small class="text-muted">
                                                    <i class="fas fa-clock me-1"></i>
                                                    ${warehouse.lastUpdated}
                                                </small>
                                            </td>
                                            <td>
                                                <div class="btn-group-action">
                                                    <a href="/admin/warehouse/${warehouse.id}" class="btn btn-success btn-sm">
                                                        <i class="fas fa-eye"></i> Xem
                                                    </a>
                                                    <a href="/admin/warehouse/update/${warehouse.id}" class="btn btn-warning btn-sm">
                                                        <i class="fas fa-pen"></i> Sửa
                                                    </a>
                                                    <a href="/admin/warehouse/delete/${warehouse.id}" class="btn btn-danger btn-sm">
                                                        <i class="fas fa-trash"></i> Xóa
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item">
                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                            href="/admin/warehouse?page=${currentPage-1}" aria-label="Previous">
                                            <i class="fas fa-chevron-left"></i>
                                        </a>
                                    </li>
                                    <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                                        <li class="page-item">
                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                href="/admin/warehouse?page=${loop.index+1}">
                                                ${loop.index + 1}
                                            </a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                            href="/admin/warehouse?page=${currentPage+1}" aria-label="Next">
                                            <i class="fas fa-chevron-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
</body>

</html>
