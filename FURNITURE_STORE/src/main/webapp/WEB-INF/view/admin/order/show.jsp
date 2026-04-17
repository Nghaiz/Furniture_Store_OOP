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
    <meta name="description" content="Dự án FURNITURE STORE" />
    <meta name="author" content="" />
    <title>Quản lý đơn hàng - FURNITURE STORE</title>
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
                    <h1 class="mt-4"><i class="fas fa-shopping-bag me-2" style="color: #81c408;"></i>Quản lý đơn hàng</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Trang chủ</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Đơn hàng</li>
                        </ol>
                    </nav>
                </div>
                <div class="container-fluid px-4">
                    <div class="row">
                        <div class="col-12">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h3><i class="fas fa-list me-2"></i>Danh sách đơn hàng</h3>
                            </div>
                            
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th style="width: 60px;">ID</th>
                                        <th style="width: 150px;">Tổng tiền</th>
                                        <th>Người mua</th>
                                        <th style="width: 150px;">Trạng thái</th>
                                        <th style="width: 200px;">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <th class="text-center">${order.id}</th>
                                            <td class="text-end">
                                                <span style="color: #dc3545; font-weight: 600;">
                                                    <fmt:formatNumber value="${order.totalPrice}" /> đ
                                                </span>
                                            </td>
                                            <td>
                                                <i class="fas fa-user me-2" style="color: #81c408;"></i>
                                                <strong>${order.receiverName}</strong>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${order.status == 'PENDING'}">
                                                        <span class="badge bg-warning text-dark">
                                                            <i class="fas fa-clock me-1"></i> Chờ xử lý
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${order.status == 'SHIPPING'}">
                                                        <span class="badge bg-info">
                                                            <i class="fas fa-truck me-1"></i> Đang giao
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${order.status == 'COMPLETE'}">
                                                        <span class="badge" style="background: #81c408;">
                                                            <i class="fas fa-check me-1"></i> Hoàn thành
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${order.status == 'CANCEL'}">
                                                        <span class="badge bg-danger">
                                                            <i class="fas fa-times me-1"></i> Đã hủy
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary">
                                                            ${order.status}
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <div class="btn-group-action">
                                                    <a href="/admin/order/${order.id}" class="btn btn-success btn-sm">
                                                        <i class="fas fa-eye"></i> Xem
                                                    </a>
                                                    <a href="/admin/order/update/${order.id}" class="btn btn-warning btn-sm">
                                                        <i class="fas fa-pen"></i> Sửa
                                                    </a>
                                                    <a href="/admin/order/delete/${order.id}" class="btn btn-danger btn-sm">
                                                        <i class="fas fa-trash"></i> Xóa
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <c:if test="${totalPages > 0}">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                href="/admin/order?page=${currentPage - 1}" aria-label="Previous">
                                                <i class="fas fa-chevron-left"></i>
                                            </a>
                                        </li>

                                        <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                                            <li class="page-item">
                                                <a class="${loop.index + 1 eq currentPage ? 'active page-link' : 'page-link'}"
                                                    href="/admin/order?page=${loop.index+1}">
                                                    ${loop.index+1}
                                                </a>
                                            </li>
                                        </c:forEach>

                                        <li class="page-item">
                                            <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                href="/admin/order?page=${currentPage + 1}" aria-label="Next">
                                                <i class="fas fa-chevron-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:if>
                            <c:if test="${totalPages == 0}">
                                <div class="alert alert-info text-center">
                                    <i class="fas fa-info-circle me-2"></i>Chưa có đơn hàng nào trong hệ thống.
                                </div>
                            </c:if>
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