<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <fmt:setLocale value="vi_VN" />

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Giỏ Hàng - FURNITURE STORE</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
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
                    <meta name="_csrf" content="${_csrf.token}" />
                    <meta name="_csrf_header" content="${_csrf.headerName}" />
                </head>

                <body>
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <jsp:include page="../layout/header-tailwind.jsp" />
                    <div class="container-fluid py-3 cart-page-wrapper">
                        <div class="container py-3 cart-page">
                            <div class="cart-hero">
                                <div>
                                    <p class="cart-hero__eyebrow"><i class="fas fa-shopping-cart me-2"></i>Giỏ hàng của
                                        bạn</p>
                                    <h1 class="cart-hero__title">Chi tiết giỏ hàng</h1>
                                    <p class="cart-hero__subtitle">
                                        <i class="fas fa-info-circle me-1"></i>Kiểm tra lại sản phẩm và số lượng trước
                                        khi tiến hành thanh toán.
                                    </p>
                                </div>
                                <nav aria-label="breadcrumb" class="cart-hero__breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item">
                                            <a href="/">
                                                <i class="fas fa-home me-1"></i>Trang chủ
                                            </a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">
                                            Chi tiết giỏ hàng
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="table-responsive cart-table-card">
                                <table class="table align-middle">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="cart-select-column">
                                                <input type="checkbox" class="form-check-input" id="cartSelectAll"
                                                    data-cart-select-all aria-label="Chọn tất cả" />
                                            </th>
                                            <th scope="col">Sản phẩm</th>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Giá cả</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Thành tiền</th>
                                            <th scope="col">Xử lý</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${empty cartDetails}">
                                            <tr>
                                                <td colspan="7">
                                                    Không có sản phẩm trong giỏ hàng
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
                                            <tr class="cart-row" data-cart-row-id="${cartDetail.id}">
                                                <td class="cart-select-cell">
                                                    <input type="checkbox" class="form-check-input" data-cart-select
                                                        data-cart-detail-id="${cartDetail.id}" value="${cartDetail.id}"
                                                        aria-label="Chọn sản phẩm" />
                                                </td>
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <img src="/images/product/${cartDetail.product.image}"
                                                            class="img-fluid me-5 rounded-circle"
                                                            style="width: 80px; height: 80px;" alt="">
                                                    </div>
                                                </th>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <a href="/product/${cartDetail.product.id}" target="_blank">
                                                            ${cartDetail.product.name}
                                                        </a>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <fmt:formatNumber type="number" value="${cartDetail.price}" />đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                                        <div class="input-group-btn">
                                                            <button
                                                                class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                        </div>
                                                        <input type="text"
                                                            class="form-control form-control-sm text-center border-0"
                                                            value="${cartDetail.quantity}"
                                                            data-cart-detail-id="${cartDetail.id}"
                                                            data-cart-detail-price="${cartDetail.price}"
                                                            data-cart-detail-index="${status.index}"
                                                            data-stock="${cartDetail.product.stockQuantity}" />
                                                        <!-- data-cart-detail-id hay data-cart-detail-price là HTML Attribute , mình đang tự sinh ra 2 thuộc tính
                                                            để mình định danh cái đó và phục vụ cho việc thao tác trong JS
                                                              -->
                                                        <div class="input-group-btn">
                                                            <button
                                                                class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                <i class="fa fa-plus"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4 cart-price-accent"
                                                        data-cart-detail-id="${cartDetail.id}">
                                                        <fmt:formatNumber type="number"
                                                            value="${cartDetail.price * cartDetail.quantity}" /> đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <!-- Ta dùng spring security , nên bắt buộc trong form phải chèn thêm 1 thẻ input của csrf token cho form như dưới -->

                                                    <!-- Đây là nút xử lý để xóa sản phẩm khỏi giỏ hàng -->
                                                    <button
                                                        class="btn btn-md rounded-circle bg-light border mt-4 delete-product-btn"
                                                        data-cart-detail-id="${cartDetail.id}">
                                                        <i class="fa fa-trash text-danger"></i>
                                                    </button>
                                                    
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <c:if test="${not empty cartDetails}">
                                <div class="mt-4 row g-4 justify-content-start">
                                    <div class="col-12 col-md-8">
                                        <div class="cart-summary-card bg-light rounded">
                                            <div class="p-4">
                                                <h1 class="display-6 mb-3 order-summary-heading"
                                                    style="font-size: 1.5rem;">
                                                    <i class="fas fa-file-invoice-dollar me-2"></i>Thông Tin Đơn Hàng
                                                </h1>
                                                <div class="d-flex justify-content-between mb-3 cart-summary-row">
                                                    <h5 class="mb-0 me-4" style="font-size: 1rem;"><i
                                                            class="fas fa-calculator me-2"></i>Tạm tính:</h5>
                                                    <p class="mb-0 cart-price-text"
                                                        data-cart-total-price="${totalPrice}">
                                                        <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                    </p>
                                                </div>
                                            </div>
                                            <div
                                                class="py-3 mb-3 border-top border-bottom d-flex justify-content-between cart-total-row">
                                                <h5 class="mb-0 ps-4 me-4" style="font-size: 1rem;"><i
                                                        class="fas fa-money-bill-wave me-2"></i>Thành tiền</h5>
                                                <p class="mb-0 pe-4 cart-total-accent"
                                                    data-cart-total-price="${totalPrice}">
                                                    <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                </p>
                                            </div>
                                            <form:form action="/order/checkout" method="post" modelAttribute="cart"
                                                id="cartSelectionForm">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <input type="hidden" name="selectedCartDetailIds"
                                                    id="selectedCartDetailIdsField" />
                                                <div style="display: none;">
                                                    <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                        varStatus="status">
                                                        <div class="mb-3">
                                                            <div class="form-group">
                                                                <label>Id:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${cartDetail.id}"
                                                                    path="cartDetails[${status.index}].id" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Quantity:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${cartDetail.quantity}"
                                                                    path="cartDetails[${status.index}].quantity" />
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <div class="d-flex gap-3 flex-wrap px-4 pb-4">
                                                    <a href="/products" class="btn cart-continue-btn">
                                                        <i class="fas fa-arrow-left me-2"></i>Tiếp tục mua hàng
                                                    </a>
                                                    <button type="submit" class="btn cart-checkout-btn">
                                                        <i class="fas fa-check-circle me-2"></i>Xác nhận thanh toán
                                                    </button>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <jsp:include page="../layout/footer-tailwind.jsp" />

                    <!-- Back to Top Button -->
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
                    <script src="/client/js/cart.js"></script>
                    <script src="/client/js/cart_fly.js"></script>

                    <script>
                        
                        $(document).ready(function () {
                            $('.delete-product-btn').on('click', function (e) {
                                e.preventDefault();
                                e.stopPropagation();

                                const cartDetailId = $(this).data('cart-detail-id');
                                const $row = $(this).closest('tr');
                                const csrfToken = $('meta[name="_csrf"]').attr('content');
                                const csrfHeader = $('meta[name="_csrf_header"]').attr('content');

                                console.log('Delete button clicked, cartDetailId:', cartDetailId);

                                $.ajax({
                                    url: '/delete-cart-product/' + cartDetailId,
                                    type: 'POST',
                                    beforeSend: function (xhr) {
                                        xhr.setRequestHeader(csrfHeader, csrfToken);
                                    },
                                    success: function (response) {
                                        
                                        $row.fadeOut(400, function () {
                                            $(this).remove();

                                            
                                            if ($('.cart-row').length === 0) {
                                                location.reload();
                                            } else {
                                                
                                                updateCartTotal();
                                            }
                                        });

                                        
                                        if (typeof window.showCustomToast === 'function') {
                                            window.showCustomToast('Thành công', 'Đã xóa sản phẩm khỏi giỏ hàng', 'success');
                                        }
                                    },
                                    error: function (xhr, status, error) {
                                        console.error('Error deleting product:', error);
                                        if (typeof window.showCustomToast === 'function') {
                                            window.showCustomToast('Lỗi', 'Không thể xóa sản phẩm. Vui lòng thử lại!', 'error');
                                        }
                                    }
                                });
                            });

                            
                            function updateCartTotal() {
                                let total = 0;
                                $('.cart-price-accent').each(function () {
                                    const priceText = $(this).text().replace(/[^\d]/g, '');
                                    total += parseInt(priceText) || 0;
                                });

                                
                                $('[data-cart-total-price]').each(function () {
                                    $(this).attr('data-cart-total-price', total);
                                    $(this).html(total.toLocaleString('vi-VN') + ' đ');
                                });
                            }

                            
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
                        });
                    </script>

                </body>

                </html>