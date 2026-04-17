<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="utf-8">
                    <title>Lịch sử mua hàng - FURNITURE STORE</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
                    <link href="/client/css/style.css" rel="stylesheet">
                    <link href="/client/css/override.css" rel="stylesheet">
                    <link href="/client/css/effects.css" rel="stylesheet">
                    <link href="/client/css/order.css" rel="stylesheet">
                </head>

                <body>
                    
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>

                    <jsp:include page="../layout/header-tailwind.jsp" />

                    <c:set var="orderCount" value="${fn:length(orders)}" />
                    <c:set var="pendingOrders" value="0" />
                    <c:set var="grandTotal" value="0" />
                    <c:forEach var="orderStat" items="${orders}">
                        <c:set var="grandTotal" value="${grandTotal + orderStat.totalPrice}" />
                        <c:if test="${orderStat.status == 'PENDING'}">
                            <c:set var="pendingOrders" value="${pendingOrders + 1}" />
                        </c:if>
                    </c:forEach>

                    <div class="container-fluid py-3 order-history-wrapper">
                        <div class="container py-3">
                            <section class="order-history__hero cart-hero">
                                <div class="order-history__hero-text">
                                    <p class="cart-hero__eyebrow"><i class="fas fa-history me-2"></i>Lịch sử đơn hàng
                                    </p>
                                    <h1 class="cart-hero__title">Đơn hàng của bạn</h1>
                                    <p class="cart-hero__subtitle">
                                        <i class="fas fa-info-circle me-1"></i>Theo dõi trạng thái và quản lý các đơn
                                        hàng đã đặt.
                                    </p>
                                    <div class="order-history__breadcrumb cart-hero__breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/"><i
                                                        class="fas fa-home me-1"></i>Trang chủ</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Lịch sử mua hàng</li>
                                        </ol>
                                    </div>
                                </div>
                                <div class="order-history__stats">
                                    <div class="order-history__stat">
                                        <span><i class="fas fa-box me-1"></i>Đơn đã đặt</span>
                                        <strong>${orderCount}</strong>
                                    </div>
                                    <div class="order-history__stat">
                                        <span><i class="fas fa-clock me-1"></i>Chờ xử lý</span>
                                        <strong>${pendingOrders}</strong>
                                    </div>
                                    <div class="order-history__stat order-history__stat--highlight">
                                        <span><i class="fas fa-wallet me-1"></i>Tổng chi tiêu</span>
                                        <strong>
                                            <fmt:formatNumber type="number" value="${grandTotal}" />đ
                                        </strong>
                                    </div>
                                </div>
                            </section>

                            <div class="order-history__table-card cart-table-card">
                                <div class="table-responsive order-history__table-wrapper">
                                    <table class="table order-history__table mb-0">
                                        <thead>
                                            <tr>
                                                <th scope="col" style="width: 50px;"></th>
                                                <th scope="col">Thông tin</th>
                                                <th scope="col">Giá</th>
                                                <th scope="col">SL</th>
                                                <th scope="col">Thành tiền</th>
                                                <th scope="col">Trạng thái</th>
                                            </tr>
                                        </thead>

                                        <c:if test="${empty orders}">
                                            <tbody>
                                                <tr>
                                                    <td colspan="6" class="order-history__empty">
                                                        <div class="order-history__empty-card">
                                                            <div class="order-history__empty-icon">
                                                                <i class="bi bi-bag-dash"></i>
                                                            </div>
                                                            <h3>Chưa có đơn hàng nào</h3>
                                                            <p>Tiếp tục mua sắm để chúng tôi có thể ghi dấu những đơn
                                                                hàng đầu tiên của
                                                                bạn nhé!</p>
                                                            <a href="/products"
                                                                class="btn btn-primary rounded-pill px-4">Khám phá sản
                                                                phẩm</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </c:if>

                                        <c:forEach var="order" items="${orders}" varStatus="orderLoop">
                                            <tbody class="order-history__group" data-order-id="${order.id}">
                                                <c:set var="statusVariant" value="default" />
                                                <c:set var="statusText" value="${order.status}" />
                                                <c:set var="statusIcon" value="fa-question-circle" />
                                                <c:choose>
                                                    <c:when test="${order.status == 'PENDING'}">
                                                        <c:set var="statusVariant" value="pending" />
                                                        <c:set var="statusText" value="Chờ xử lý" />
                                                        <c:set var="statusIcon" value="fa-clock" />
                                                    </c:when>
                                                    <c:when test="${order.status == 'SHIPPING'}">
                                                        <c:set var="statusVariant" value="shipping" />
                                                        <c:set var="statusText" value="Đang giao" />
                                                        <c:set var="statusIcon" value="fa-truck" />
                                                    </c:when>
                                                    <c:when test="${order.status == 'COMPLETE'}">
                                                        <c:set var="statusVariant" value="success" />
                                                        <c:set var="statusText" value="Hoàn thành" />
                                                        <c:set var="statusIcon" value="fa-check-circle" />
                                                    </c:when>
                                                    <c:when test="${order.status == 'CANCEL'}">
                                                        <c:set var="statusVariant" value="danger" />
                                                        <c:set var="statusText" value="Đã hủy" />
                                                        <c:set var="statusIcon" value="fa-times-circle" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set var="statusVariant" value="default" />
                                                        <c:set var="statusText" value="${order.status}" />
                                                        <c:set var="statusIcon" value="fa-info-circle" />
                                                    </c:otherwise>
                                                </c:choose>

                                                <tr class="order-history__summary order-history__animate"
                                                    data-order-id="${order.id}">
                                                    <td class="order-history__cell-toggle">
                                                        <button type="button" class="order-history__toggle"
                                                            data-order-id="${order.id}" aria-expanded="true"
                                                            title="Xem chi tiết">
                                                            <i class="bi bi-chevron-down"></i>
                                                        </button>
                                                    </td>
                                                    <td>
                                                        <div class="order-history__summary-content">
                                                            <div class="order-history__summary-label">Đơn hàng ${orderLoop.index + 1}</div>
                                                            <div class="order-history__summary-meta">
                                                                <c:if test="${not empty order.receiverName}">
                                                                    <span><i class="bi bi-person"></i>${order.receiverName}</span>
                                                                </c:if>
                                                                <c:if test="${not empty order.receiverPhone}">
                                                                    <span><i class="bi bi-telephone"></i>${order.receiverPhone}</span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="order-history__cell order-history__cell--muted"></td>
                                                    <td class="order-history__cell order-history__cell--muted"></td>
                                                    <td class="order-history__total">
                                                        <span class="order-history__money order-history__money--accent">
                                                            <fmt:formatNumber type="number"
                                                                value="${order.totalPrice}" />đ
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <span class="order-history__status order-history__status--${statusVariant}">
                                                            <i class="fas ${statusIcon}"></i>
                                                            <span class="order-history__status-text">${statusText}</span>
                                                        </span>
                                                    </td>
                                                </tr>

                                                <c:forEach var="orderDetail" items="${order.orderDetails}">
                                                    <tr class="order-history__item order-history__animate"
                                                        data-parent-order="${order.id}">
                                                        <td>
                                                            <div class="order-history__product-thumb">
                                                                <img src="/images/product/${orderDetail.product.image}"
                                                                    alt="${orderDetail.product.name}">
                                                            </div>
                                                        </td>
                                                        <td class="text-start">
                                                            <div class="order-history__product-name">
                                                                <a href="/product/${orderDetail.product.id}"
                                                                    target="_blank">
                                                                    ${orderDetail.product.name}
                                                                </a>
                                                                <span class="order-history__product-meta">Mã SP:
                                                                    #${orderDetail.product.id}</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <span class="order-history__money">
                                                                <fmt:formatNumber type="number"
                                                                    value="${orderDetail.price}" />
                                                                đ
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <span class="order-history__quantity-badge">
                                                                x${orderDetail.quantity}
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <span
                                                                class="order-history__money order-history__money--accent">
                                                                <fmt:formatNumber type="number"
                                                                    value="${orderDetail.price * orderDetail.quantity}" />
                                                                đ
                                                            </span>
                                                        </td>
                                                        <td class="order-history__cell order-history__cell--muted">
                                                            <span class="order-history__note">Thuộc đơn
                                                                #${order.id}</span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <jsp:include page="../layout/footer-tailwind.jsp" />
                    <!-- Back to Top Button -->
                    <a href="#"
                        class="back-to-top tw-fixed tw-bottom-8 tw-right-8 tw-w-14 tw-h-14 tw-bg-gradient-to-r tw-from-primary-600 tw-to-primary-700 tw-text-white tw-rounded-full tw-flex tw-items-center tw-justify-center tw-shadow-lg hover:tw-shadow-2xl hover:tw--translate-y-1 tw-transition-all tw-z-40 tw-opacity-0 tw-invisible">
                        <i class="fas fa-arrow-up"></i>
                    </a>
                    <script>
                        // Back to top button
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

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
                    <script src="/client/js/main.js"></script>
                    <script src="/client/js/effects.js"></script>
                    <script src="/client/js/cart.js"></script>
                    <script src="/client/js/order-history.js"></script>
                </body>

                </html>