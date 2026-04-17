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
    <title>Cập nhật sản phẩm - Furniture Store</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link href="/css/custom.css" rel="stylesheet" />
    <link href="/css/admin.css" rel="stylesheet" />
    <link href="/css/admin-product-media.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script>
        $(document).ready(() => {
            const mediaInput = $("#mediaFiles");
            const mediaList = $("#mediaFilesList");
            const mediaMessage = $("#mediaFilesMessage");
            const maxFiles = 5;

            if (!mediaInput.length) {
                return;
            }

            const renderFiles = (files) => {
                mediaList.empty();
                files.slice(0, maxFiles).forEach((file) => {
                    const badge = `<span class="badge bg-secondary me-1 mb-1">${file.name}</span>`;
                    mediaList.append(badge);
                });
                if (files.length > maxFiles) {
                    mediaMessage.text(`Chỉ sử dụng ${maxFiles} file đầu tiên.`);
                } else {
                    mediaMessage.text("");
                }
            };

            mediaInput.on("change", () => {
                const files = Array.from(mediaInput[0].files || []);
                renderFiles(files);
            });
        });
    </script>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />

    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4"><i class="fas fa-edit me-2" style="color: #81c408;"></i>Cập nhật sản phẩm</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Trang chủ</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/product">Sản phẩm</a>
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
                                    <h5 class="mb-0"><i class="fas fa-couch me-2"></i>Chỉnh sửa thông tin sản phẩm #${newProduct.id}</h5>
                                </div>
                                <div class="card-body">
                                    <form:form method="post" action="/admin/product/update/${newProduct.id}"
                                        class="row" enctype="multipart/form-data" modelAttribute="newProduct">
                                        <c:set var="errorName">
                                            <form:errors path="name" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorPrice">
                                            <form:errors path="price" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorDetailDesc">
                                            <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorShortDesc">
                                            <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                        </c:set>

                                        <div class="mb-3" style="display: none">
                                            <form:input type="text" class="form-control" path="id" />
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label"><i class="fas fa-tag me-1" style="color: #81c408;"></i>Tên sản phẩm:</label>
                                            <form:input type="text" class="form-control ${not empty errorName ? 'is-invalid' : ''}" 
                                                path="name" placeholder="Nhập tên sản phẩm" />
                                            ${errorName}
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label"><i class="fas fa-money-bill me-1" style="color: #81c408;"></i>Giá (VNĐ):</label>
                                            <form:input type="number" class="form-control ${not empty errorPrice ? 'is-invalid' : ''}" 
                                                path="price" placeholder="Nhập giá sản phẩm" />
                                            ${errorPrice}
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label"><i class="fas fa-file-alt me-1" style="color: #81c408;"></i>Mô tả ngắn:</label>
                                            <form:input type="text" class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}" 
                                                path="shortDesc" placeholder="Nhập mô tả ngắn" />
                                            ${errorShortDesc}
                                        </div>
                                        <div class="mb-3 col-12">
                                            <label class="form-label"><i class="fas fa-align-left me-1" style="color: #81c408;"></i>Mô tả chi tiết:</label>
                                            <form:textarea class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}" 
                                                path="detailDesc" rows="3" placeholder="Nhập mô tả chi tiết" />
                                            ${errorDetailDesc}
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label"><i class="fas fa-industry me-1" style="color: #81c408;"></i>Thương hiệu:</label>
                                            <form:select class="form-select" path="factory">
                                                <form:option value="Hoàng Anh">Hoàng Anh</form:option>
                                                <form:option value="Hòa Phát">Hòa Phát</form:option>
                                                <form:option value="Baya">Baya</form:option>
                                            </form:select>
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label"><i class="fas fa-th-large me-1" style="color: #81c408;"></i>Loại sản phẩm:</label>
                                            <form:select class="form-select" path="target">
                                                <form:option value="Ghế">Ghế</form:option>
                                                <form:option value="Bàn">Bàn</form:option>
                                                <form:option value="Giường">Giường</form:option>
                                                <form:option value="Tủ">Tủ</form:option>
                                                <form:option value="Kệ">Kệ</form:option>
                                                <form:option value="Khác">Khác</form:option>
                                            </form:select>
                                        </div>
                                        <div class="mb-3 col-12">
                                            <label class="form-label d-block"><i class="fas fa-images me-1" style="color: #81c408;"></i>Hình ảnh/Video (tối đa 5 file):</label>
                                            <div id="mediaManager" class="media-manager">
                                                <div class="media-manager-header">
                                                    <span class="media-manager-title">Thư viện hình ảnh</span>
                                                    <button type="button" id="mediaManagerAdd" class="btn btn-success btn-sm">
                                                        <i class="fas fa-plus me-1"></i>Thêm mới
                                                    </button>
                                                </div>
                                                <div class="media-manager-list"></div>
                                                <div class="media-manager-empty">
                                                    Chưa có file mới. Nhấn "Thêm mới" để thay đổi.
                                                </div>
                                                <div class="media-manager-limit" style="display: none">
                                                    Chỉ hỗ trợ tối đa 5 file.
                                                </div>
                                            </div>
                                            <small class="form-text text-muted">
                                                Định dạng hỗ trợ: JPG, PNG, GIF, MP4, WebM.
                                            </small>
                                        </div>

                                        <c:if test="${not empty newProduct.medias}">
                                            <div class="mb-3 col-12">
                                                <p class="fw-semibold mb-2"><i class="fas fa-photo-video me-1" style="color: #81c408;"></i>Hình/Video hiện có:</p>
                                                <div class="d-flex flex-wrap gap-2">
                                                    <c:forEach var="media" items="${newProduct.medias}">
                                                        <div class="border rounded p-2 text-center" style="width: 90px; height: 90px; overflow: hidden">
                                                            <c:choose>
                                                                <c:when test="${media.mediaType.name() == 'VIDEO'}">
                                                                    <i class="fa fa-play-circle fa-2x text-warning"></i>
                                                                    <small>Video</small>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img class="img-fluid" src="/images/product/${newProduct.id}/${media.fileName}" 
                                                                        alt="${newProduct.name}" 
                                                                        onerror="this.onerror=null; this.src='/images/product/${media.fileName}';"
                                                                        style="min-height: 100%; object-fit: cover" />
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </c:if>
                                        <div class="col-12">
                                            <hr />
                                            <div class="d-flex gap-2">
                                                <button type="submit" class="btn btn-warning">
                                                    <i class="fas fa-save me-1"></i>Cập nhật
                                                </button>
                                                <a href="/admin/product" class="btn btn-secondary">
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
    <script src="/js/admin-product-media.js"></script>
    <script src="/js/admin.js"></script>
</body>

</html>