<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Furniture Store - Cửa hàng nội thất" />
    <meta name="author" content="Furniture Store" />
    <title>${product.name} - Furniture Store</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link href="/css/custom.css" rel="stylesheet" />
    <link href="/css/admin.css" rel="stylesheet" />
    <link href="/css/admin-product-media.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />

    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4"><i class="fas fa-eye me-2" style="color: #81c408;"></i>Chi tiết sản phẩm</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Trang chủ</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/product">Sản phẩm</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Chi tiết</li>
                        </ol>
                    </nav>
                </div>
                <div class="container-fluid px-4">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header" style="background: #81c408; color: white;">
                                    <h5 class="mb-0"><i class="fas fa-couch me-2"></i>Thông tin sản phẩm #${id}</h5>
                                </div>
                                <div class="card-body">
                                    <c:set var="mediaCount" value="${fn:length(product.medias)}" />
                                    <h6 class="mb-3"><i class="fas fa-images me-1" style="color: #81c408;"></i>Thư viện hình ảnh</h6>
                                    <div class="detail-media-grid mb-4">
                                        <c:forEach var="media" items="${product.medias}" varStatus="mediaStatus">
                                            <c:if test="${mediaStatus.index < 5}">
                                                <c:url value="/images/product/${product.id}/${media.fileName}" var="mediaUrl" />
                                                <div class="detail-media-card">
                                                    <div class="media-thumb">
                                                        <c:choose>
                                                            <c:when test="${media.mediaType == 'VIDEO'}">
                                                                <video src="${mediaUrl}" controls playsinline preload="metadata"></video>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="${mediaUrl}" alt="${media.fileName}"
                                                                    onerror="this.onerror=null; this.src='/images/product/${media.fileName}';" />
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div class="media-info">
                                                        <span class="media-label">${media.fileName}</span>
                                                        <span class="media-type">${media.mediaType == 'VIDEO' ? 'Video' : 'Hình ảnh'}</span>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${mediaCount < 5}">
                                            <c:forEach begin="1" end="${5 - mediaCount}" varStatus="fillStatus">
                                                <div class="detail-media-card detail-media-card--empty">
                                                    <div class="media-thumb">
                                                        <i class="fas fa-photo-video"></i>
                                                    </div>
                                                    <div class="media-info">
                                                        <span class="media-label">Chưa có</span>
                                                        <span class="media-type">Vị trí ${mediaCount + fillStatus.index}</span>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    
                                    <h6 class="mb-3"><i class="fas fa-info-circle me-1" style="color: #81c408;"></i>Thông tin chi tiết</h6>
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <tbody>
                                                <tr>
                                                    <th style="width: 200px; background: #f8f9fa;">Mã sản phẩm</th>
                                                    <td>${product.id}</td>
                                                </tr>
                                                <tr>
                                                    <th style="background: #f8f9fa;">Tên sản phẩm</th>
                                                    <td><strong>${product.name}</strong></td>
                                                </tr>
                                                <tr>
                                                    <th style="background: #f8f9fa;">Giá</th>
                                                    <td><span style="color: #dc3545; font-weight: 600;"><fmt:formatNumber type="number" value="${product.price}" /> đ</span></td>
                                                </tr>
                                                <tr>
                                                    <th style="background: #f8f9fa;">Số lượng</th>
                                                    <td>${product.quantity}</td>
                                                </tr>
                                                <tr>
                                                    <th style="background: #f8f9fa;">Thương hiệu</th>
                                                    <td>${product.factory}</td>
                                                </tr>
                                                <tr>
                                                    <th style="background: #f8f9fa;">Loại sản phẩm</th>
                                                    <td>${product.target}</td>
                                                </tr>
                                                <tr>
                                                    <th style="background: #f8f9fa;">Mô tả ngắn</th>
                                                    <td>${product.shortDesc}</td>
                                                </tr>
                                                <tr>
                                                    <th style="background: #f8f9fa;">Mô tả chi tiết</th>
                                                    <td>${product.detailDesc}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="d-flex gap-2">
                                        <a href="/admin/product/update/${product.id}" class="btn btn-warning">
                                            <i class="fas fa-edit me-1"></i>Chỉnh sửa
                                        </a>
                                        <a href="/admin/product" class="btn btn-secondary">
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