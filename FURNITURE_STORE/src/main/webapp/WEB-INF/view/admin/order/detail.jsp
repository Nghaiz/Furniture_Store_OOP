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
    <title>Chi tiết đơn hàng - Furniture Store</title>
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
                    <h1 class="mt-4"><i class="fas fa-shopping-bag me-2" style="color: #81c408;"></i>Chi tiết đơn hàng</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Trang chủ</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/order">Đơn hàng</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Chi tiết</li>
                        </ol>
                    </nav>
                </div>

                <div class="container-fluid px-4">
                    <div class="row mb-4">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header" style="background: #81c408; color: white;">
                                    <h5 class="mb-0"><i class="fas fa-user me-2"></i>Thông tin người mua - Đơn hàng #${id}</h5>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <table class="table table-borderless">
                                                <tr>
                                                    <th style="width: 180px;"><i class="fas fa-user me-1" style="color: #81c408;"></i>Tên người nhận:</th>
                                                    <td><strong>${order.receiverName}</strong></td>
                                                </tr>
                                                <tr>
                                                    <th><i class="fas fa-phone me-1" style="color: #81c408;"></i>Số điện thoại:</th>
                                                    <td>${order.receiverPhone}</td>
                                                </tr>
                                                <tr>
                                                    <th><i class="fas fa-map-marker-alt me-1" style="color: #81c408;"></i>Địa chỉ:</th>
                                                    <td>${order.receiverAddress}</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="col-md-6">
                                            <table class="table table-borderless">
                                                <tr>
                                                    <th style="width: 180px;"><i class="fas fa-credit-card me-1" style="color: #81c408;"></i>Thanh toán:</th>
                                                    <td>${order.paymentMethod == 'COD' ? 'Thanh toán khi nhận hàng' : order.paymentMethod}</td>
                                                </tr>
                                                <tr>
                                                    <th><i class="fas fa-truck me-1" style="color: #81c408;"></i>Trạng thái:</th>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${order.status == 'Chưa được xử lý'}">
                                                                <span class="badge bg-secondary">Chưa được xử lý</span>
                                                            </c:when>
                                                            <c:when test="${order.status == 'PENDING'}">
                                                                <span class="badge bg-warning text-dark">Chờ xử lý</span>
                                                            </c:when>
                                                            <c:when test="${order.status == 'SHIPPING'}">
                                                                <span class="badge bg-info">Đang giao</span>
                                                            </c:when>
                                                            <c:when test="${order.status == 'COMPLETE'}">
                                                                <span class="badge" style="background: #81c408;">Hoàn thành</span>
                                                            </c:when>
                                                            <c:when test="${order.status == 'CANCEL'}">
                                                                <span class="badge bg-danger">Đã hủy</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge bg-secondary">${order.status}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><i class="fas fa-money-bill me-1" style="color: #81c408;"></i>Tổng tiền:</th>
                                                    <td><strong style="color: #dc3545; font-size: 1.2rem;"><fmt:formatNumber value="${order.totalPrice}" /> đ</strong></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-header" style="background: #f8f9fa;">
                            <h5 class="mb-0"><i class="fas fa-list me-2" style="color: #81c408;"></i>Danh sách sản phẩm</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 100px;">Hình ảnh</th>
                                            <th>Tên sản phẩm</th>
                                            <th style="width: 150px;">Đơn giá</th>
                                            <th style="width: 100px;">Số lượng</th>
                                            <th style="width: 150px;">Thành tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${empty orderDetails}">
                                            <tr>
                                                <td colspan="5" class="text-center text-muted">
                                                    <i class="fas fa-box-open me-2"></i>Không có sản phẩm trong đơn hàng
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="orderDetail" items="${orderDetails}">
                                            <tr>
                                                <td class="text-center">
                                                    <img src="/images/product/${orderDetail.product.image}" 
                                                        class="img-fluid rounded" style="width: 60px; height: 60px; object-fit: cover;" 
                                                        alt="${orderDetail.product.name}">
                                                </td>
                                                <td>
                                                    <a href="/product/${orderDetail.product.id}" target="_blank" style="color: #81c408; text-decoration: none;">
                                                        <strong>${orderDetail.product.name}</strong>
                                                    </a>
                                                </td>
                                                <td class="text-end">
                                                    <fmt:formatNumber type="number" value="${orderDetail.price}" /> đ
                                                </td>
                                                <td class="text-center">
                                                    <span class="badge bg-secondary">${orderDetail.quantity}</span>
                                                </td>
                                                <td class="text-end">
                                                    <strong style="color: #dc3545;">
                                                        <fmt:formatNumber type="number" value="${orderDetail.price * orderDetail.quantity}" /> đ
                                                    </strong>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="d-flex gap-2">
                                <a href="/admin/order/update/${order.id}" class="btn btn-warning">
                                    <i class="fas fa-edit me-1"></i>Cập nhật trạng thái
                                </a>
                                <a href="/admin/order" class="btn btn-secondary">
                                    <i class="fas fa-arrow-left me-1"></i>Quay lại
                                </a>
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