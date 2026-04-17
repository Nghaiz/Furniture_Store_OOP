<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8">
                <title>Thanh toán thất bại - Furniture Store</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">

                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">
                <link href="/client/css/style.css" rel="stylesheet">
                <link href="/client/css/override.css" rel="stylesheet">
                <link href="/client/css/effects.css" rel="stylesheet">
                <link href="/client/css/order.css" rel="stylesheet">

                <style>
                    .failed-page {
                        background: linear-gradient(180deg, #fef2f2 0%, #fff5f5 100%);
                        min-height: 100vh;
                    }

                    .failed-container {
                        padding-top: 100px;
                        padding-bottom: 60px;
                    }

                    .failed-box {
                        background: linear-gradient(135deg, #ffffff 0%, #fffafa 100%);
                        border-radius: 24px;
                        padding: 40px 35px;
                        box-shadow: 0 12px 45px rgba(220, 53, 69, 0.08);
                        max-width: 800px;
                        margin: 0 auto;
                        border: 1px solid rgba(220, 53, 69, 0.1);
                        animation: zoomIn 0.6s ease;
                    }

                    @keyframes zoomIn {
                        from {
                            opacity: 0;
                            transform: scale(0.95);
                        }

                        to {
                            opacity: 1;
                            transform: scale(1);
                        }
                    }

                   
                    .error-checkmark {
                        width: 100px;
                        height: 100px;
                        margin: 0 auto 20px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                    }

                    .error-icon-svg {
                        width: 100px;
                        height: 100px;
                        border-radius: 50%;
                        display: block;
                        stroke-width: 3;
                        stroke: #dc3545;
                        stroke-miterlimit: 10;
                        box-shadow: inset 0px 0px 0px rgba(220, 53, 69, 0.1);
                        animation: errorFill 0.4s ease-in-out 0.4s forwards,
                            errorShake 0.5s ease-in-out 0.9s;
                    }

                    @keyframes errorFill {
                        100% {
                            box-shadow: inset 0px 0px 0px 50px rgba(220, 53, 69, 0.06),
                                0 0 30px rgba(220, 53, 69, 0.2);
                        }
                    }

                    @keyframes errorShake {

                        0%,
                        100% {
                            transform: translateX(0);
                        }

                        20%,
                        60% {
                            transform: translateX(-5px);
                        }

                        40%,
                        80% {
                            transform: translateX(5px);
                        }
                    }

                    .error-circle {
                        stroke-dasharray: 166;
                        stroke-dashoffset: 166;
                        stroke-width: 3;
                        stroke-miterlimit: 10;
                        stroke: #dc3545;
                        fill: none;
                        animation: errorStroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards;
                    }

                    .error-x-line {
                        stroke-dasharray: 30;
                        stroke-dashoffset: 30;
                        stroke-width: 4;
                        stroke-linecap: round;
                        animation: errorStroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) forwards;
                    }

                    .error-x-line:nth-child(2) {
                        animation-delay: 0.5s;
                    }

                    .error-x-line:nth-child(3) {
                        animation-delay: 0.7s;
                    }

                    @keyframes errorStroke {
                        100% {
                            stroke-dashoffset: 0;
                        }
                    }

                    .failed-title {
                        font-size: clamp(1.5rem, 4vw, 2rem);
                        color: #dc3545;
                        font-weight: 800;
                        margin-bottom: 8px;
                    }

                    .failed-subtitle {
                        font-size: 1rem;
                        color: #64748b;
                        margin-bottom: 24px;
                    }

                 
                    .error-details-section {
                        background: #fff;
                        border-radius: 16px;
                        padding: 20px;
                        margin-bottom: 24px;
                        border: 1px solid #fee2e2;
                    }

                    .error-details-header {
                        display: flex;
                        align-items: center;
                        gap: 10px;
                        margin-bottom: 16px;
                        padding-bottom: 12px;
                        border-bottom: 1px solid #fecaca;
                    }

                    .error-details-header i {
                        color: #dc3545;
                        font-size: 1.2rem;
                    }

                    .error-details-header span {
                        font-weight: 600;
                        color: #991b1b;
                    }

                    .error-table {
                        width: 100%;
                        border-collapse: collapse;
                        font-size: 0.9rem;
                    }

                    .error-table th {
                        background: linear-gradient(135deg, #fef2f2, #fecaca);
                        color: #991b1b;
                        padding: 12px 10px;
                        text-align: left;
                        font-weight: 600;
                        font-size: 0.8rem;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }

                    .error-table th:first-child {
                        border-radius: 8px 0 0 8px;
                    }

                    .error-table th:last-child {
                        border-radius: 0 8px 8px 0;
                    }

                    .error-table td {
                        padding: 12px 10px;
                        border-bottom: 1px solid #fee2e2;
                        color: #374151;
                    }

                    .error-table tr:last-child td {
                        border-bottom: none;
                    }

                    .error-table tr:hover td {
                        background: #fef2f2;
                    }

                    .qty-badge {
                        display: inline-block;
                        padding: 4px 10px;
                        border-radius: 20px;
                        font-size: 0.8rem;
                        font-weight: 600;
                    }

                    .qty-badge--warning {
                        background: #fef3c7;
                        color: #92400e;
                    }

                    .qty-badge--danger {
                        background: #fee2e2;
                        color: #991b1b;
                    }

                  
                    .error-alert {
                        background: linear-gradient(135deg, #fef2f2, #fee2e2);
                        border: 1px solid #fecaca;
                        border-radius: 12px;
                        padding: 16px 20px;
                        margin-bottom: 24px;
                        display: flex;
                        align-items: center;
                        gap: 12px;
                    }

                    .error-alert i {
                        color: #dc3545;
                        font-size: 1.3rem;
                    }

                    .error-alert p {
                        margin: 0;
                        color: #991b1b;
                        font-size: 0.95rem;
                    }

                  
                    .failed-actions {
                        display: flex;
                        justify-content: center;
                        gap: 16px;
                        flex-wrap: wrap;
                    }

                    .failed-btn {
                        display: inline-flex;
                        align-items: center;
                        gap: 8px;
                        padding: 14px 28px;
                        border-radius: 50px;
                        font-weight: 600;
                        font-size: 0.95rem;
                        text-decoration: none;
                        transition: all 0.3s ease;
                    }

                    .failed-btn--primary {
                        background: linear-gradient(135deg, #dc3545, #c82333);
                        color: #fff;
                        box-shadow: 0 4px 15px rgba(220, 53, 69, 0.3);
                    }

                    .failed-btn--primary:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 8px 25px rgba(220, 53, 69, 0.4);
                        color: #fff;
                    }

                    .failed-btn--secondary {
                        background: #fff;
                        color: #64748b;
                        border: 2px solid #e2e8f0;
                    }

                    .failed-btn--secondary:hover {
                        border-color: #80c600;
                        color: #80c600;
                        transform: translateY(-2px);
                    }

             
                    .help-section {
                        margin-top: 32px;
                        padding-top: 24px;
                        border-top: 1px solid #fee2e2;
                    }

                    .help-title {
                        font-size: 1rem;
                        font-weight: 600;
                        color: #374151;
                        margin-bottom: 16px;
                        text-align: center;
                    }

                    .help-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
                        gap: 12px;
                    }

                    .help-item {
                        display: flex;
                        align-items: center;
                        gap: 10px;
                        padding: 12px 16px;
                        background: #f8fafc;
                        border-radius: 10px;
                        transition: all 0.3s ease;
                    }

                    .help-item:hover {
                        background: #f0fdf4;
                    }

                    .help-item i {
                        width: 36px;
                        height: 36px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        background: linear-gradient(135deg, rgba(128, 198, 0, 0.1), rgba(128, 198, 0, 0.05));
                        border-radius: 8px;
                        color: #80c600;
                        font-size: 1rem;
                    }

                    .help-item-content span {
                        display: block;
                        font-size: 0.75rem;
                        color: #94a3b8;
                    }

                    .help-item-content strong {
                        display: block;
                        font-size: 0.9rem;
                        color: #0f172a;
                    }

                    @media (max-width: 576px) {
                        .failed-box {
                            padding: 30px 20px;
                        }

                        .failed-actions {
                            flex-direction: column;
                        }

                        .failed-btn {
                            width: 100%;
                            justify-content: center;
                        }

                        .error-table {
                            font-size: 0.8rem;
                        }

                        .error-table th,
                        .error-table td {
                            padding: 10px 8px;
                        }
                    }
                </style>
            </head>

            <body class="failed-page">
                <jsp:include page="../layout/header-tailwind.jsp" />

                <div class="failed-container container">
                    <div class="failed-box text-center">
              
                        <div class="error-checkmark">
                            <svg class="error-icon-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                                <circle class="error-circle" cx="26" cy="26" r="25" fill="none" />
                                <path class="error-x-line" fill="none" d="M16 16 36 36" />
                                <path class="error-x-line" fill="none" d="M36 16 16 36" />
                            </svg>
                        </div>

                        <h1 class="failed-title">Thanh toán thất bại!</h1>
                        <p class="failed-subtitle">Rất tiếc, đã có lỗi xảy ra trong quá trình xử lý đơn hàng của bạn</p>

                     
                        <div id="errorContainer">
                          
                        </div>

                        
                        <div class="failed-actions">
                            <a href="/cart" class="failed-btn failed-btn--primary">
                                <i class="fas fa-shopping-cart"></i>Quay lại giỏ hàng
                            </a>
                            <a href="/products" class="failed-btn failed-btn--secondary">
                                <i class="fas fa-store"></i>Tiếp tục mua sắm
                            </a>
                        </div>

                   
                        <div class="help-section">
                            <h3 class="help-title">Bạn cần hỗ trợ?</h3>
                            <div class="help-grid">
                                <div class="help-item">
                                    <i class="fas fa-phone-alt"></i>
                                    <div class="help-item-content">
                                        <span>Hotline</span>
                                        <strong>1900 1234</strong>
                                    </div>
                                </div>
                                <div class="help-item">
                                    <i class="fas fa-envelope"></i>
                                    <div class="help-item-content">
                                        <span>Email</span>
                                        <strong>support@furniture.vn</strong>
                                    </div>
                                </div>
                                <div class="help-item">
                                    <i class="fas fa-comments"></i>
                                    <div class="help-item-content">
                                        <span>Live Chat</span>
                                        <strong>24/7 hỗ trợ</strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="../layout/footer-tailwind.jsp" />

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/js/main.js"></script>
                <script src="/client/js/effects.js"></script>

             
                <c:choose>
                    <c:when test="${not empty errorDetails}">
                        <script type="application/json" id="errorData">
                {
                    "error": "<c:out value="${error}" escapeXml="false" />",
                    "errorDetails": [
                        <c:forEach var="errorDetail" items="${errorDetails}" varStatus="status">
                        {
                            "productId": ${errorDetail.productId},
                            "productName": "<c:out value="${errorDetail.productName}" escapeXml="false" />",
                            "requestedQuantity": ${errorDetail.requestedQuantity},
                            "availableQuantity": ${errorDetail.availableQuantity},
                            "message": "<c:out value="${errorDetail.message}" escapeXml="false" />"
                        }<c:if test="${!status.last}">,</c:if>
                        </c:forEach>
                    ]
                }
            </script>
                    </c:when>
                    <c:otherwise>
                        <script type="application/json" id="errorData">
                {
                    "error": "<c:out value="${error}" escapeXml="false" />",
                    "errorDetails": []
                }
            </script>
                    </c:otherwise>
                </c:choose>

                <script>
                    (function () {
                        function escapeHtml(text) {
                            if (!text) return '';
                            const map = { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#039;' };
                            return String(text).replace(/[&<>"']/g, m => map[m]);
                        }

                        const errorDataScript = document.getElementById('errorData');
                        const errorContainer = document.getElementById('errorContainer');

                        if (!errorDataScript) {
                            errorContainer.innerHTML = `
                    <div class="error-alert">
                        <i class="fas fa-exclamation-triangle"></i>
                        <p>Đã có lỗi xảy ra trong quá trình thanh toán. Vui lòng thử lại sau.</p>
                    </div>`;
                            return;
                        }

                        try {
                            const errorData = JSON.parse(errorDataScript.textContent);
                            let html = '';

                            if (errorData.errorDetails && Array.isArray(errorData.errorDetails) && errorData.errorDetails.length > 0) {
                                html += '<div class="error-details-section text-start">';
                                html += '<div class="error-details-header">';
                                html += '<i class="fas fa-exclamation-triangle"></i>';
                                html += '<span>Một số sản phẩm không đủ số lượng trong kho</span>';
                                html += '</div>';

                                html += '<div class="table-responsive">';
                                html += '<table class="error-table">';
                                html += '<thead>';
                                html += '<tr>';
                                html += '<th style="width: 5%;">STT</th>';
                                html += '<th style="width: 40%;">Sản phẩm</th>';
                                html += '<th style="width: 18%;" class="text-center">Yêu cầu</th>';
                                html += '<th style="width: 17%;" class="text-center">Còn lại</th>';
                                html += '<th style="width: 20%;" class="text-center">Ghi chú</th>';
                                html += '</tr>';
                                html += '</thead>';
                                html += '<tbody>';

                                errorData.errorDetails.forEach((item, index) => {
                                    html += '<tr>';
                                    html += `<td class="text-center">${index + 1}</td>`;
                                    html += `<td><strong>${escapeHtml(item.productName || 'N/A')}</strong></td>`;
                                    html += `<td class="text-center"><span class="qty-badge qty-badge--warning">${item.requestedQuantity || 0}</span></td>`;
                                    html += `<td class="text-center"><span class="qty-badge qty-badge--danger">${item.availableQuantity || 0}</span></td>`;
                                    html += `<td class="text-center"><small>${escapeHtml(item.message || 'Không đủ hàng')}</small></td>`;
                                    html += '</tr>';
                                });

                                html += '</tbody>';
                                html += '</table>';
                                html += '</div>';
                                html += '</div>';
                            } else if (errorData.error && String(errorData.error).trim() !== '') {
                                html += `<div class="error-alert">
                        <i class="fas fa-exclamation-triangle"></i>
                        <p>${escapeHtml(errorData.error)}</p>
                    </div>`;
                            } else {
                                html += `<div class="error-alert">
                        <i class="fas fa-exclamation-triangle"></i>
                        <p>Đã có lỗi xảy ra trong quá trình thanh toán. Vui lòng thử lại sau.</p>
                    </div>`;
                            }

                            errorContainer.innerHTML = html;

                        } catch (e) {
                            console.error('Error parsing error data:', e);
                            errorContainer.innerHTML = `
                    <div class="error-alert">
                        <i class="fas fa-exclamation-triangle"></i>
                        <p>Đã có lỗi xảy ra trong quá trình thanh toán. Vui lòng thử lại sau.</p>
                    </div>`;
                        }
                    })();
                </script>
            </body>

            </html>