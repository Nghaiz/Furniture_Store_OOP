<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

                    <!DOCTYPE html>
                    <html lang="vi">

                    <head>
                        <meta charset="utf-8">
                        <meta name="_csrf" content="${_csrf.token}" />
                        <meta name="_csrf_header" content="${_csrf.headerName}" />
                        <link rel="icon" type="image/png" href="/images/logo/logo_icon.png" />
                        <title>Thanh toán - Furniture Store</title>
                        <meta content="width=device-width, initial-scale=1.0" name="viewport">

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
                        <link href="/client/css/checkout-alert.css" rel="stylesheet">
                    </head>

                    <body>
                        <jsp:include page="../layout/header-tailwind.jsp" />

                     
                        <div class="container-fluid py-3 checkout-wrapper">
                            <div class="container py-3 checkout-section">
                                <div class="checkout-page-header">
                                    <p class="checkout-page-eyebrow"><i class="fas fa-credit-card me-2"></i>Thanh toán
                                    </p>
                                    <h1 class="mb-2 checkout-page-title">Xác nhận đơn hàng</h1>
                                    <p class="checkout-page-subtitle"><i class="fas fa-info-circle me-1"></i>Vui lòng
                                        kiểm tra kỹ thông tin trước khi đặt hàng</p>
                                </div>
                                <c:choose>
                                    <c:when test="${not empty error}">
                                        <c:set var="checkoutError" value="${error}" />
                                    </c:when>
                                    <c:when test="${not empty param.error}">
                                        <c:set var="checkoutError" value="${param.error}" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="checkoutError" value="" />
                                    </c:otherwise>
                                </c:choose>

                                <c:set var="checkoutErrorDetails" value="${errorDetails}" />
                                <c:set var="hasErrorDetails" value="false" />
                                <c:if test="${not empty checkoutErrorDetails}">
                                    <c:set var="errorDetailsSize" value="${fn:length(checkoutErrorDetails)}" />
                                    <c:if test="${errorDetailsSize gt 0}">
                                        <c:set var="hasErrorDetails" value="true" />
                                    </c:if>
                                </c:if>

                               
                                <c:if test="${empty totalPrice}">
                                    <c:set var="totalPrice" value="0" />
                                </c:if>

                               
                                <c:if test="${hasErrorDetails}">
                                    <div class="alert alert-dismissible fade show mb-4 checkout-alert checkout-alert--error"
                                        role="alert">
                                        <div class="checkout-alert__header">
                                            <div class="checkout-alert__icon-wrapper">
                                                <i class="fas fa-exclamation-circle checkout-alert__icon"></i>
                                            </div>
                                            <div class="checkout-alert__content">
                                                <h5 class="checkout-alert__title">Không thể đặt hàng</h5>
                                                <p class="checkout-alert__message">Một số sản phẩm trong giỏ hàng không đủ số lượng tồn kho</p>
                                            </div>
                                            <button type="button" class="checkout-alert__close" data-bs-dismiss="alert" aria-label="Close">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                        
                                        <div class="checkout-error-details">
                                            <div class="checkout-error-details__list">
                                                <c:forEach var="errorDetail" items="${checkoutErrorDetails}" varStatus="status">
                                                    <div class="checkout-error-item">
                                                        <div class="checkout-error-item__header">
                                                            <div class="checkout-error-item__number">${status.index + 1}</div>
                                                            <div class="checkout-error-item__info">
                                                                <h6 class="checkout-error-item__name">
                                                                    <c:out value="${errorDetail.productName}" />
                                                                </h6>
                                                                <p class="checkout-error-item__message">
                                                                    <i class="fas fa-info-circle me-1"></i>
                                                                    <c:out value="${errorDetail.message}" />
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="checkout-error-item__quantities">
                                                            <div class="quantity-box quantity-box--warning">
                                                                <div class="quantity-box__label">Yêu cầu</div>
                                                                <div class="quantity-box__value">${errorDetail.requestedQuantity}</div>
                                                            </div>
                                                            <div class="quantity-box__separator">
                                                                <i class="fas fa-arrow-right"></i>
                                                            </div>
                                                            <div class="quantity-box quantity-box--danger">
                                                                <div class="quantity-box__label">Còn lại</div>
                                                                <div class="quantity-box__value">${errorDetail.availableQuantity}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="checkout-error-details__footer">
                                                <i class="fas fa-lightbulb me-2"></i>
                                                <span>Vui lòng điều chỉnh số lượng hoặc xóa sản phẩm trong giỏ hàng để tiếp tục</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                
                                <c:if test="${not hasErrorDetails and not empty checkoutError}">
                                    <div class="alert alert-danger alert-dismissible fade show mb-4 checkout-alert"
                                        role="alert">
                                        <div class="d-flex align-items-center mb-3">
                                            <strong class="me-2"><i class="fas fa-exclamation-triangle me-2"></i>Thông
                                                báo:</strong>
                                            <button type="button" class="btn-close ms-auto" data-bs-dismiss="alert"
                                                aria-label="Close"></button>
                                        </div>
                                        <p class="mb-0">
                                            <c:out value="${checkoutError}" />
                                        </p>
                                    </div>
                                </c:if>
                                <form action="/order/place-order" method="post" id="checkoutForm">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <input type="hidden" name="totalPrice" value="${totalPrice}"
                                        data-cart-total-field />

                                    <div class="row g-4">
                                        
                                        <div class="col-12">
                                            <div class="checkout-card checkout-summary-card">
                                                <div class="checkout-card__head">
                                                    <span class="checkout-card__icon checkout-card__icon--accent">
                                                        <i class="fas fa-shopping-basket"></i>
                                                    </span>
                                                    <div>
                                                        <p class="checkout-card__eyebrow">Đơn hàng của bạn</p>
                                                        <h3 class="checkout-card__title">Sản phẩm trong giỏ hàng</h3>
                                                    </div>
                                                </div>
                                               
                                                <div class="checkout-summary-table-wrapper">
                                                    <c:choose>
                                                        <c:when test="${not empty cartDetails}">
                                                            <table class="table checkout-summary-table">
                                                                <colgroup>
                                                                    <col style="width: 85px;">
                                                                    <col style="width: auto;">
                                                                    <col style="width: 130px;">
                                                                    <col style="width: 150px;">
                                                                    <col style="width: 160px;">
                                                                </colgroup>
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">Ảnh</th>
                                                                        <th scope="col">Tên sản phẩm</th>
                                                                        <th scope="col">Đơn giá</th>
                                                                        <th scope="col" class="text-center">Số lượng</th>
                                                                        <th scope="col" class="text-end">Thành tiền</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                                                        <tr data-cart-detail-row="${cartDetail.id}">
                                                                            <td>
                                                                                <a href="/product/${cartDetail.product.id}" class="product-image-link">
                                                                                    <img src="/images/product/${cartDetail.product.image}"
                                                                                        alt="${cartDetail.product.name}">
                                                                                </a>
                                                                            </td>
                                                                            <td>
                                                                                <a href="/product/${cartDetail.product.id}" class="product-name-link">
                                                                                    <span class="product-name">${cartDetail.product.name}</span>
                                                                                </a>
                                                                            </td>
                                                                            <td>
                                                                                <span class="product-price"
                                                                                    data-checkout-unit-price="true"
                                                                                    data-cart-detail-id="${cartDetail.id}"
                                                                                    data-cart-detail-price="${cartDetail.price}">
                                                                                    <span class="price-amount"><fmt:formatNumber type="number" value="${cartDetail.price}" /></span><span class="price-currency">đ</span>
                                                                                </span>
                                                                            </td>
                                                                            <td class="text-center">
                                                                                <span class="checkout-quantity-display"
                                                                                    data-checkout-quantity="true"
                                                                                    data-cart-detail-id="${cartDetail.id}">
                                                                                    ${cartDetail.quantity}
                                                                                </span>
                                                                            </td>
                                                                            <td class="text-end">
                                                                                <span class="line-total"
                                                                                    data-line-total="${cartDetail.id}">
                                                                                    <span class="price-amount"><fmt:formatNumber type="number" value="${cartDetail.price * cartDetail.quantity}" /></span><span class="price-currency">đ</span>
                                                                                </span>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                                <tfoot>
                                                                    <tr class="checkout-summary-total">
                                                                        <td colspan="3"></td>
                                                                        <td class="text-center">
                                                                            <span class="total-label">Tổng cộng</span>
                                                                        </td>
                                                                        <td class="text-end">
                                                                            <span class="total-value"
                                                                                id="totalPrice"
                                                                                data-cart-total-price="true">
                                                                                <span class="price-amount"><fmt:formatNumber type="number" value="${totalPrice}" /></span><span class="price-currency">đ</span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                </tfoot>
                                                            </table>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="alert alert-warning mb-0" role="alert">
                                                                <i class="fas fa-exclamation-triangle me-2"></i>
                                                                Giỏ hàng của bạn đang trống. Vui lòng quay lại giỏ hàng
                                                                để thêm sản phẩm.
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>

                                      
                                        <div class="col-md-12 col-lg-7">
                                            <div class="checkout-card checkout-form-card">
                                                <div class="checkout-card__head">
                                                    <span class="checkout-card__icon">
                                                        <i class="fas fa-address-card"></i>
                                                    </span>
                                                    <div>
                                                        <p class="checkout-card__eyebrow">Thông tin nhận hàng</p>
                                                        <h3 class="checkout-card__title">Chi tiết người nhận</h3>
                                                    </div>
                                                </div>
                                                <div class="row g-3">
                                                    <div class="col-12 col-md-6">
                                                        <div class="form-item w-100">
                                                            <label class="form-label my-2"><i
                                                                    class="fas fa-user me-2"></i>Họ và
                                                                tên<sup>*</sup></label>
                                                            <input type="text" class="form-control" id="receiverName" name="receiverName"
                                                                placeholder="Nhập họ và tên người nhận" required
                                                                minlength="2" maxlength="100">
                                                            <div class="invalid-feedback">
                                                                <i class="fas fa-exclamation-circle me-1"></i>
                                                                <span>Vui lòng nhập họ và tên (ít nhất 2 ký tự)</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-md-6">
                                                        <div class="form-item w-100">
                                                            <label class="form-label my-2"><i
                                                                    class="fas fa-phone me-2"></i>Số điện
                                                                thoại<sup>*</sup></label>
                                                            <input type="tel" class="form-control" id="receiverPhone" name="receiverPhone"
                                                                placeholder="Nhập số điện thoại" required
                                                                pattern="^(0|\+84)[0-9]{9,10}$" maxlength="12">
                                                            <div class="invalid-feedback">
                                                                <i class="fas fa-exclamation-circle me-1"></i>
                                                                <span>Vui lòng nhập số điện thoại hợp lệ (VD: 0912345678)</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-item">
                                                    <label class="form-label my-2"><i
                                                            class="fas fa-map-marker-alt me-2"></i>Địa
                                                        chỉ<sup>*</sup></label>
                                                    <input type="text" class="form-control" id="receiverAddress" name="receiverAddress"
                                                        placeholder="Nhập địa chỉ nhận hàng" required
                                                        minlength="10" maxlength="255">
                                                    <div class="invalid-feedback">
                                                        <i class="fas fa-exclamation-circle me-1"></i>
                                                        <span>Vui lòng nhập địa chỉ đầy đủ (ít nhất 10 ký tự)</span>
                                                    </div>
                                                </div>
                                                <div class="form-item">
                                                    <label class="form-label my-2"><i
                                                            class="fas fa-sticky-note me-2"></i>Ghi chú</label>
                                                    <textarea class="form-control" name="note" rows="2"
                                                        placeholder="Ví dụ: Giao sau 18h, gọi trước khi đến..."></textarea>
                                                </div>
                                            </div>
                                        </div>

                               
                                        <div class="col-md-12 col-lg-5">
                                            <div class="checkout-card checkout-payment-card">
                                                <div class="checkout-card__head">
                                                    <span class="checkout-card__icon checkout-card__icon--accent">
                                                        <i class="fas fa-credit-card"></i>
                                                    </span>
                                                    <div>
                                                        <p class="checkout-card__eyebrow">Hoàn tất đơn hàng</p>
                                                        <h3 class="checkout-card__title">Phương thức thanh toán</h3>
                                                    </div>
                                                </div>

                                                <div class="checkout-payment">
                                                    <div class="payment-option">
                                                        <input type="radio" class="payment-option__input"
                                                            id="paymentCOD" name="paymentMethod" value="COD" checked>
                                                        <label class="payment-option__label" for="paymentCOD">
                                                            <span class="payment-option__icon">
                                                                <i class="fas fa-truck-moving"></i>
                                                            </span>
                                                            <span class="payment-option__content">
                                                                <strong>Thanh toán khi nhận hàng (COD)</strong>
                                                                <small>Kiểm tra sản phẩm trước khi thanh toán.</small>
                                                            </span>
                                                        </label>
                                                    </div>

                                                    <div class="payment-option">
                                                        <input type="radio" class="payment-option__input"
                                                            id="paymentVNPay" name="paymentMethod" value="VNPAY">
                                                        <label class="payment-option__label" for="paymentVNPay">
                                                            <span
                                                                class="payment-option__icon payment-option__icon--accent">
                                                                <img src="/client/img/vnpay-logo.png" alt="VNPay"
                                                                    class="payment-option__logo">
                                                            </span>
                                                            <span class="payment-option__content">
                                                                <strong>Thanh toán qua VNPay</strong>
                                                                <small>Giao dịch bảo mật, xác nhận tức thì.</small>
                                                            </span>
                                                        </label>
                                                    </div>

                                                    <c:choose>
                                                        <c:when test="${empty cartDetails}">
                                                            <button type="submit"
                                                                class="btn checkout-submit-btn w-100 text-uppercase mt-3"
                                                                disabled>
                                                                <i class="fas fa-lock me-2"></i>Đặt hàng
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="submit"
                                                                class="btn checkout-submit-btn w-100 text-uppercase mt-3">
                                                                <i class="fas fa-check-circle me-2"></i>Đặt hàng
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                      

                        <jsp:include page="../layout/footer-tailwind.jsp" />

                     
                        <a href="#"
                            class="back-to-top tw-fixed tw-bottom-8 tw-right-8 tw-w-14 tw-h-14 tw-bg-gradient-to-r tw-from-primary-600 tw-to-primary-700 tw-text-white tw-rounded-full tw-flex tw-items-center tw-justify-center tw-shadow-lg hover:tw-shadow-2xl hover:tw--translate-y-1 tw-transition-all tw-z-40 tw-opacity-0 tw-invisible">
                            <i class="fas fa-arrow-up"></i>
                        </a>

                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                        <script src="/client/js/main.js"></script>
                        <script src="/client/js/effects.js"></script>
                        <script src="/client/js/cart.js"></script>

                     
                        <c:if test="${hasErrorDetails}">
                            <script type="application/json" id="errorDetailsData">
                            [
                                <c:forEach var="errorDetail" items="${checkoutErrorDetails}" varStatus="status">
                                {
                                    "productId": ${errorDetail.productId},
                                    "productName": "<c:out value="${errorDetail.productName}" escapeXml="true" />",
                                    "requestedQuantity": ${errorDetail.requestedQuantity},
                                    "availableQuantity": ${errorDetail.availableQuantity},
                                    "message": "<c:out value="${errorDetail.message}" escapeXml="true" />"
                                }<c:if test="${!status.last}">,</c:if>
                                </c:forEach>
                            ]
                        </script>
                            <input type="hidden" id="errorMessageData" value="<c:out value=" ${checkoutError}"
                                escapeXml="true" />" />
                        </c:if>

                        <script src="/client/js/checkout.js"></script>
                    </body>

                    </html>