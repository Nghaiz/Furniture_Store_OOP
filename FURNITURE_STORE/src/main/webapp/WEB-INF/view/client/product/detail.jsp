<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <link rel="icon" type="image/png" href="/images/logo/logo_icon.png" />
                    <title>${product.name} - FURNITURE STORE</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
                    <meta content="" name="keywords" />
                    <meta content="" name="description" />

                    <link rel="preconnect" href="https://fonts.googleapis.com" />
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet" />

                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet" />

                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet" />

                    <link href="/client/css/style.css" rel="stylesheet" />
                    <link href="/client/css/override.css" rel="stylesheet" />
                    <link href="/client/css/effects.css" rel="stylesheet" />
                    <link href="/client/css/order.css" rel="stylesheet" />
                    <link href="/client/css/product_detail_new.css" rel="stylesheet" />
                    <meta name="_csrf" content="${_csrf.token}" />
                    <meta name="_csrf_header" content="${_csrf.headerName}" />
                </head>

                <body>
                  
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                 
                    <jsp:include page="../layout/header-tailwind.jsp" />

                
                    <div class="product-detail-hero pt-4">
                        <div class="container">
                            <nav aria-label="breadcrumb" class="product-breadcrumb fade-up">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i> Trang chủ</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/products">Sản phẩm</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">${product.name}</li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                  
                    <div class="container-fluid py-4">
                        <div class="container">
                            <div class="row g-4">
                            
                                <div class="col-lg-5 col-xl-5">
                                    <div class="product-gallery-wrapper fade-up">
                                        <div class="product-media-gallery" data-autoplay="true" data-interval="3000">
                                            <button class="gallery-nav gallery-nav--prev" type="button"
                                                aria-label="Xem trước">
                                                <i class="fa fa-chevron-left"></i>
                                            </button>

                                            <div class="product-media-viewer">
                                                <img src="/images/product/${product.image}"
                                                    class="product-media-viewer__image" alt="${product.name}" />
                                                <video class="product-media-viewer__video" muted playsinline loop
                                                    controls></video>
                                            </div>

                                            <button class="gallery-nav gallery-nav--next" type="button"
                                                aria-label="Xem tiếp">
                                                <i class="fa fa-chevron-right"></i>
                                            </button>

                                            <div class="product-media-thumbs">
                                                <c:choose>
                                                    <c:when test="${not empty product.medias}">
                                                        <c:forEach var="media" items="${product.medias}"
                                                            varStatus="status">
                                                            <button class="media-thumb ${status.first ? 'active' : ''}"
                                                                type="button" data-media-type="${media.mediaType}"
                                                                data-media-src="/images/product/${media.fileName}"
                                                                aria-label="${media.mediaType.name() == 'VIDEO' ? 'Video' : 'Ảnh'}">
                                                                <c:choose>
                                                                    <c:when test="${media.mediaType.name() == 'VIDEO'}">
                                                                        <span class="media-thumb__video-icon">
                                                                            <i class="fa fa-play"></i>
                                                                        </span>
                                                                        <small>Video</small>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img src="/images/product/${media.fileName}"
                                                                            alt="${product.name}" />
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </button>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="media-thumb active" type="button"
                                                            data-media-type="image"
                                                            data-media-src="/images/product/${product.image}"
                                                            aria-label="Ảnh chính">
                                                            <img src="/images/product/${product.image}"
                                                                alt="${product.name}" />
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                          
                                <div class="col-lg-7 col-xl-7">
                                    <div class="product-info-wrapper fade-up">
                                      
                                        <div class="product-header">
                                            <h1 class="product-title">${product.name}</h1>
                                            <div class="product-meta">
                                                <span class="product-brand">
                                                    <i class="fas fa-store"></i> ${product.factory}
                                                </span>
                                                <span class="product-sku">
                                                    <i class="fas fa-barcode"></i> SKU: #${product.id}
                                                </span>
                                            </div>
                                        </div>

                                    
                                        <div class="product-rating">
                                            <div class="rating-stars">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <span class="rating-score">4.8</span>
                                            </div>
                                            <div class="rating-info">
                                                <span><i class="far fa-comment-dots"></i> 1,234 đánh giá</span>
                                                <span class="divider">|</span>
                                                <span><i class="fas fa-shopping-cart"></i> Đã bán
                                                    ${product.sold}+</span>
                                            </div>
                                        </div>

                                     
                                        <div class="product-price-section">
                                            <div class="price-main">
                                                <span class="price-current">
                                                    <fmt:formatNumber type="number" value="${product.price}" /> đ
                                                </span>
                                            </div>
                                            <div class="price-features">
                                                <span class="feature-tag"><i class="fas fa-truck"></i> Miễn phí vận
                                                    chuyển</span>
                                                <span class="feature-tag"><i class="fas fa-shield-alt"></i> Bảo hành
                                                    chính hãng</span>
                                            </div>
                                        </div>

                                   
                                        <div class="product-short-desc">
                                            <h6><i class="fas fa-info-circle"></i> Mô tả ngắn</h6>
                                            <p>${product.shortDesc}</p>
                                        </div>

                                    
                                        <div class="product-stock-info">
                                            <c:choose>
                                                <c:when test="${product.stockQuantity > 20}">
                                                    <span class="stock-status stock-available">
                                                        <i class="fas fa-check-circle"></i> Còn hàng
                                                        (${product.stockQuantity} sản phẩm)
                                                    </span>
                                                </c:when>
                                                <c:when test="${product.stockQuantity > 0}">
                                                    <span class="stock-status stock-limited">
                                                        <i class="fas fa-exclamation-triangle"></i> Sắp hết (chỉ còn
                                                        ${product.stockQuantity} sản phẩm)
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="stock-status stock-out">
                                                        <i class="fas fa-times-circle"></i> Hết hàng
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                        <c:set var="redirectBase" value="/product/${product.id}" />
                                        <c:if test="${not empty pageContext.request.requestURI}">
                                            <c:set var="redirectBase" value="${pageContext.request.requestURI}" />
                                        </c:if>
                                        <c:if test="${not empty requestScope['javax.servlet.forward.request_uri']}">
                                            <c:set var="redirectBase"
                                                value="${requestScope['javax.servlet.forward.request_uri']}" />
                                        </c:if>
                                        <c:set var="redirectQuery" value="" />
                                        <c:if test="${not empty pageContext.request.queryString}">
                                            <c:set var="redirectQuery" value="${pageContext.request.queryString}" />
                                        </c:if>
                                        <c:if test="${not empty requestScope['javax.servlet.forward.query_string']}">
                                            <c:set var="redirectQuery"
                                                value="${requestScope['javax.servlet.forward.query_string']}" />
                                        </c:if>
                                        <c:set var="resolvedRedirectUrl" value="${redirectBase}" />
                                        <c:if test="${not empty redirectQuery}">
                                            <c:set var="resolvedRedirectUrl" value="${redirectBase}?${redirectQuery}" />
                                        </c:if>

                                    
                                        <form id="product-detail-cart-form" class="product-detail-cart-form"
                                            onsubmit="return false;">
                                            <div class="quantity-selector">
                                                <label class="quantity-label">Số lượng:</label>
                                                <div class="quantity-controls">
                                                    <button type="button" class="btn-quantity btn-minus"
                                                        aria-label="Giảm">
                                                        <i class="fas fa-minus"></i>
                                                    </button>
                                                    <input type="text" class="quantity-input" value="1" min="1"
                                                        max="${product.stockQuantity}" data-cart-detail-index="0"
                                                        inputmode="numeric" autocomplete="off" />
                                                    <button type="button" class="btn-quantity btn-plus"
                                                        aria-label="Tăng">
                                                        <i class="fas fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>

                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <input type="hidden" name="quantity" id="cartDetails0.quantity" value="1" />
                                            <input type="hidden" name="productId" value="${product.id}" />
                                            <input type="hidden" name="maxStock" value="${product.stockQuantity}" />

                                            <div class="action-buttons">
                                                <button type="button" data-product-id="${product.id}"
                                                    class="btn-add-cart btnAddToCartDetail">
                                                    <i class="fas fa-shopping-cart"></i>
                                                    <span>Thêm vào giỏ hàng</span>
                                                </button>
                                                <button type="button" data-product-id="${product.id}"
                                                    class="btn-buy-now">
                                                    <i class="fas fa-bolt"></i>
                                                    <span>Mua ngay</span>
                                                </button>
                                            </div>
                                        </form>

                               
                                        <div class="product-features">
                                            <div class="feature-item">
                                                <i class="fas fa-shield-alt"></i>
                                                <div class="feature-content">
                                                    <strong>Bảo hành 12 tháng</strong>
                                                    <span>Chính hãng 100%</span>
                                                </div>
                                            </div>
                                            <div class="feature-item">
                                                <i class="fas fa-undo-alt"></i>
                                                <div class="feature-content">
                                                    <strong>Đổi trả trong 7 ngày</strong>
                                                    <span>Miễn phí hoàn tiền</span>
                                                </div>
                                            </div>
                                            <div class="feature-item">
                                                <i class="fas fa-shipping-fast"></i>
                                                <div class="feature-content">
                                                    <strong>Giao hàng nhanh</strong>
                                                    <span>Trong 24h nội thành</span>
                                                </div>
                                            </div>
                                            <div class="feature-item">
                                                <i class="fas fa-headset"></i>
                                                <div class="feature-content">
                                                    <strong>Hỗ trợ 24/7</strong>
                                                    <span>Hotline: 0123.456.789</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                           
                            <div class="row mt-5">
                                <div class="col-12">
                                    <div class="product-details-tabs fade-up">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link active" id="description-tab"
                                                    data-bs-toggle="tab" data-bs-target="#description" type="button"
                                                    role="tab">
                                                    <i class="fas fa-align-left"></i>
                                                    <span>Mô tả chi tiết</span>
                                                </button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="specifications-tab" data-bs-toggle="tab"
                                                    data-bs-target="#specifications" type="button" role="tab">
                                                    <i class="fas fa-list-ul"></i>
                                                    <span>Thông tin sản phẩm</span>
                                                </button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="reviews-tab" data-bs-toggle="tab"
                                                    data-bs-target="#reviews" type="button" role="tab">
                                                    <i class="fas fa-star"></i>
                                                    <span>Đánh giá (1,234)</span>
                                                </button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="policy-tab" data-bs-toggle="tab"
                                                    data-bs-target="#policy" type="button" role="tab">
                                                    <i class="fas fa-shield-alt"></i>
                                                    <span>Chính sách</span>
                                                </button>
                                            </li>
                                        </ul>

                                        <div class="tab-content">
                                            <div class="tab-pane fade show active" id="description" role="tabpanel">
                                                <div class="tab-content-inner">
                                                    <h5>Chi tiết sản phẩm</h5>
                                                    <div class="description-content">
                                                        ${product.detailDesc}
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="specifications" role="tabpanel">
                                                <div class="tab-content-inner">
                                                    <h5>Thông tin sản phẩm</h5>
                                                    <table class="specifications-table">
                                                        <tbody>
                                                            <tr>
                                                                <td><i class="fas fa-tag"></i> Mã sản phẩm</td>
                                                                <td><strong>#SP${product.id}</strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td><i class="fas fa-industry"></i> Thương hiệu</td>
                                                                <td><strong>${product.factory}</strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td><i class="fas fa-th-large"></i> Danh mục</td>
                                                                <td><strong>
                                                                        <c:out
                                                                            value="${empty product.target ? 'Nội thất' : product.target}" />
                                                                    </strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td><i class="fas fa-box"></i> Tình trạng</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${product.stockQuantity > 20}">
                                                                            <strong class="text-success">Còn hàng
                                                                                (${product.stockQuantity} sản
                                                                                phẩm)</strong>
                                                                        </c:when>
                                                                        <c:when test="${product.stockQuantity > 0}">
                                                                            <strong class="text-warning">Sắp hết
                                                                                (${product.stockQuantity} sản
                                                                                phẩm)</strong>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <strong class="text-danger">Hết
                                                                                hàng</strong>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td><i class="fas fa-shopping-cart"></i> Đã bán</td>
                                                                <td><strong>${product.sold}+ sản phẩm</strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td><i class="fas fa-shield-alt"></i> Bảo hành</td>
                                                                <td><strong>12 tháng chính hãng</strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td><i class="fas fa-truck"></i> Giao hàng</td>
                                                                <td><strong>Miễn phí nội thành trong 24h</strong></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="reviews" role="tabpanel">
                                                <div class="tab-content-inner">
                                                    <h5>Đánh giá từ khách hàng</h5>
                                                    <div class="reviews-summary">
                                                        <div class="rating-overview">
                                                            <div class="rating-score-big">4.8</div>
                                                            <div class="rating-stars-big">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star-half-alt"></i>
                                                            </div>
                                                            <p>1,234 đánh giá</p>
                                                        </div>
                                                        <div class="rating-bars">
                                                            <div class="rating-bar-item">
                                                                <span>5 <i class="fas fa-star"></i></span>
                                                                <div class="progress">
                                                                    <div class="progress-bar" style="width: 75%"></div>
                                                                </div>
                                                                <span>920</span>
                                                            </div>
                                                            <div class="rating-bar-item">
                                                                <span>4 <i class="fas fa-star"></i></span>
                                                                <div class="progress">
                                                                    <div class="progress-bar" style="width: 15%"></div>
                                                                </div>
                                                                <span>185</span>
                                                            </div>
                                                            <div class="rating-bar-item">
                                                                <span>3 <i class="fas fa-star"></i></span>
                                                                <div class="progress">
                                                                    <div class="progress-bar" style="width: 7%"></div>
                                                                </div>
                                                                <span>86</span>
                                                            </div>
                                                            <div class="rating-bar-item">
                                                                <span>2 <i class="fas fa-star"></i></span>
                                                                <div class="progress">
                                                                    <div class="progress-bar" style="width: 2%"></div>
                                                                </div>
                                                                <span>25</span>
                                                            </div>
                                                            <div class="rating-bar-item">
                                                                <span>1 <i class="fas fa-star"></i></span>
                                                                <div class="progress">
                                                                    <div class="progress-bar" style="width: 1%"></div>
                                                                </div>
                                                                <span>18</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="reviews-note">
                                                        <i class="fas fa-info-circle"></i>
                                                        <p>Tính năng đánh giá sẽ được cập nhật trong phiên bản tiếp theo
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="policy" role="tabpanel">
                                                <div class="tab-content-inner">
                                                    <h5>Chính sách bán hàng</h5>
                                                    <div class="policy-list">
                                                        <div class="policy-item">
                                                            <i class="fas fa-shield-alt"></i>
                                                            <div>
                                                                <h6>Chính sách bảo hành</h6>
                                                                <p>Bảo hành 12 tháng chính hãng. Đổi mới trong 30 ngày
                                                                    nếu có lỗi từ nhà sản xuất.</p>
                                                            </div>
                                                        </div>
                                                        <div class="policy-item">
                                                            <i class="fas fa-sync-alt"></i>
                                                            <div>
                                                                <h6>Chính sách đổi trả</h6>
                                                                <p>Đổi trả miễn phí trong vòng 7 ngày nếu sản phẩm lỗi
                                                                    hoặc không đúng mô tả.</p>
                                                            </div>
                                                        </div>
                                                        <div class="policy-item">
                                                            <i class="fas fa-shipping-fast"></i>
                                                            <div>
                                                                <h6>Chính sách vận chuyển</h6>
                                                                <p>Giao hàng miễn phí nội thành trong 24h. Hỗ trợ giao
                                                                    hàng toàn quốc.</p>
                                                            </div>
                                                        </div>
                                                        <div class="policy-item">
                                                            <i class="fas fa-credit-card"></i>
                                                            <div>
                                                                <h6>Phương thức thanh toán</h6>
                                                                <p>Thanh toán khi nhận hàng (COD), chuyển khoản ngân
                                                                    hàng, ví điện tử.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                      
                            <div class="row mt-5">
                                <div class="col-12">
                                    <div class="recommended-products fade-up">
                                        <div class="recommended-products__header">
                                            <div class="header-left">
                                                <h3><i class="fas fa-th-large"></i> Sản phẩm liên quan</h3>
                                                <p>Khám phá thêm các sản phẩm tương tự</p>
                                            </div>
                                            <a href="/products" class="btn-view-all">
                                                Xem tất cả <i class="fas fa-arrow-right"></i>
                                            </a>
                                        </div>
                                        <c:choose>
                                            <c:when test="${not empty recommendations}">
                                                <div class="recommended-grid">
                                                    <c:forEach var="item" items="${recommendations}">
                                                        <a class="recommended-card" href="/product/${item.id}"
                                                            aria-label="${item.name}">
                                                            <div class="recommended-card__media">
                                                                <img src="/images/product/${item.image}"
                                                                    alt="${item.name}" />
                                                                <span class="recommended-card__tag">Gợi ý</span>
                                                                <span class="recommended-card__rating">
                                                                    <i class="fa fa-star"></i>
                                                                    4.9
                                                                </span>
                                                            </div>
                                                            <div class="recommended-card__body">
                                                                <p class="recommended-card__name">${item.name}</p>
                                                                <p class="recommended-card__factory">
                                                                    ${item.factory}
                                                                </p>
                                                                <p class="recommended-card__price">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${item.price}" />
                                                                    đ
                                                                </p>
                                                                <div class="recommended-card__meta">
                                                                    <span>Đã bán ${item.sold}+ </span>
                                                                    <span class="dot"></span>
                                                                    <span>
                                                                        <c:out
                                                                            value="${empty item.target ? 'Sản phẩm hot' : item.target}" />
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </c:forEach>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="recommended-empty">
                                                    <i class="fa fa-store"></i>
                                                    <p>Shop đang chuẩn bị thêm gợi ý cho sản phẩm này.</p>
                                                    <span>Quay lại sau để xem thêm nhé!</span>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                  
                    <div class="image-zoom-modal" id="imageZoomModal">
                        <div class="image-zoom-overlay"></div>
                        <button class="image-zoom-close" aria-label="Đóng">
                            <i class="fas fa-times"></i>
                        </button>
                        <div class="image-zoom-content">
                            <img src="" alt="Product Image" id="zoomedImage" />
                        </div>
                    </div>

                 
                    <div class="cart-modal" id="cartModal">
                        <div class="cart-modal-overlay"></div>
                        <div class="cart-modal-content">
                            <div class="cart-modal-header">
                                <h3><i class="fas fa-shopping-cart"></i> Giỏ hàng của bạn</h3>
                                <button class="cart-modal-close" aria-label="Đóng">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                            <div class="cart-modal-body" id="cartModalBody">
                                <div class="cart-loading">
                                    <div class="spinner-border text-primary" role="status">
                                        <span class="visually-hidden">Đang tải...</span>
                                    </div>
                                </div>
                            </div>
                            <div class="cart-modal-footer">
                                <div class="cart-total">
                                    <span>Tổng cộng:</span>
                                    <strong id="cartTotalPrice">0 đ</strong>
                                </div>
                                <div class="cart-modal-actions">
                                    <button type="button" class="btn-continue-shopping">
                                        <i class="fas fa-shopping-bag"></i>
                                        Tiếp tục mua hàng
                                    </button>
                                    <button type="button" class="btn-checkout">
                                        <i class="fas fa-check-circle"></i>
                                        Hoàn tất đơn hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <jsp:include page="../layout/footer-tailwind.jsp" />

                
                    <a href="#"
                        class="back-to-top tw-fixed tw-bottom-8 tw-right-8 tw-w-14 tw-h-14 tw-bg-gradient-to-r tw-from-primary-600 tw-to-primary-700 tw-text-white tw-rounded-full tw-flex tw-items-center tw-justify-center tw-shadow-lg hover:tw-shadow-2xl hover:tw--translate-y-1 tw-transition-all tw-z-40 tw-opacity-0 tw-invisible">
                        <i class="fas fa-arrow-up"></i>
                    </a>

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <script src="/client/js/main.js"></script>
                    <script src="/client/js/effects.js"></script>
                    <script src="/client/js/cart_common.js"></script>
                    <script src="/client/js/cart_fly.js"></script>
                    <script src="/client/js/product_detail.js"></script>

                    <script>
                      
                        const backToTopBtn = document.querySelector('.back-to-top');
                        window.addEventListener('scroll', () => {
                            if (window.scrollY > 300) {
                                backToTopBtn.classList.remove('tw-opacity-0', 'tw-invisible');
                                backToTopBtn.classList.add('tw-opacity-100', 'tw-visible');
                            } else {
                                backToTopBtn.classList.add('tw-opacity-0', 'tw-invisible');
                                backToTopBtn.classList.remove('tw-opacity-100', 'tw-visible');
                            }
                        });

                        backToTopBtn.addEventListener('click', (e) => {
                            e.preventDefault();
                            window.scrollTo({ top: 0, behavior: 'smooth' });
                        });
                    </script>
                </body>

                </html>