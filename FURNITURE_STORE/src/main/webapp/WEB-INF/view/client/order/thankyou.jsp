<!-- thankyou.jsp version giữ nguyên cấu trúc gốc, chỉ thêm class để dễ style -->
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Đơn hàng - FURNITURE STORE</title>

                
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
                    <link href="/client/css/thankyou-new.css" rel="stylesheet" />

                    <link rel="icon" type="image/png" href="/client/img/logo.png" />
                </head>

                <body class="thankyou-page">
                 
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>

                    <jsp:include page="../layout/header-tailwind.jsp" />

                    <c:set var="resolvedOrderId" value="${not empty param.orderId ? param.orderId : orderId}" />

         
                    <canvas id="confetti-canvas"></canvas>

                 
                    <div class="thankyou-container container">
                 
                        <div class="thankyou-box text-center">
                            <div class="thankyou-icon">
                                <div class="success-checkmark">
                                    <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                                        <circle class="checkmark-circle" cx="26" cy="26" r="25" fill="none" />
                                        <path class="checkmark-check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                                    </svg>
                                </div>
                            </div>
                            <h1 class="thankyou-title">🎉 Đặt hàng thành công!</h1>
                            <p class="thankyou-subtitle">Cảm ơn bạn đã tin tưởng Furniture Store</p>
                            <p class="thankyou-message">
                                Đơn hàng của bạn đã được tiếp nhận và đang trong quá trình xử lý.
                                Chúng tôi sẽ gửi thông báo qua email và SMS ngay khi đơn hàng được bàn giao cho đơn vị
                                vận chuyển.
                            </p>
                            <c:if test="${not empty resolvedOrderId}">
                                <div class="order-info-box">
                                    <div class="order-info-item">
                                        <i class="fas fa-receipt"></i>
                                        <div>
                                            <span class="order-label">Mã đơn hàng</span>
                                            <strong class="order-value">#${resolvedOrderId}</strong>
                                        </div>
                                    </div>
                                    <div class="order-info-item">
                                        <i class="fas fa-calendar-check"></i>
                                        <div>
                                            <span class="order-label">Ngày đặt</span>
                                            <strong class="order-value" id="currentDate"></strong>
                                        </div>
                                    </div>
                                    <div class="order-info-item">
                                        <i class="fas fa-truck"></i>
                                        <div>
                                            <span class="order-label">Dự kiến giao</span>
                                            <strong class="order-value" id="deliveryDate"></strong>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <div class="thankyou-actions">
                                <a href="/products" class="btn btn-primary rounded-pill px-5 py-3 continue-btn">
                                    <i class="fas fa-shopping-bag me-2"></i>Tiếp tục mua sắm
                                </a>
                                <a href="/order-history"
                                    class="btn btn-outline-primary rounded-pill px-5 py-3 thankyou-secondary-btn">
                                    <i class="fas fa-clipboard-list me-2"></i>Xem đơn hàng
                                </a>
                            </div>
                        </div>

                     
                        <div class="order-timeline-section">
                            <h2 class="timeline-title">
                                <i class="fas fa-tasks me-2"></i>Quy trình xử lý đơn hàng
                            </h2>
                            <div class="timeline">
                                <div class="timeline-item active">
                                    <div class="timeline-icon">
                                        <i class="fas fa-check-circle"></i>
                                    </div>
                                    <div class="timeline-content">
                                        <h4>Đã đặt hàng</h4>
                                        <p>Đơn hàng đã được tiếp nhận vào hệ thống</p>
                                        <span class="timeline-time">Hoàn tất</span>
                                    </div>
                                </div>
                                <div class="timeline-item processing">
                                    <div class="timeline-icon">
                                        <i class="fas fa-box"></i>
                                    </div>
                                    <div class="timeline-content">
                                        <h4>Chuẩn bị hàng</h4>
                                        <p>Kiểm tra và đóng gói sản phẩm cẩn thận</p>
                                        <span class="timeline-time">Đang xử lý</span>
                                    </div>
                                </div>
                                <div class="timeline-item">
                                    <div class="timeline-icon">
                                        <i class="fas fa-shipping-fast"></i>
                                    </div>
                                    <div class="timeline-content">
                                        <h4>Vận chuyển</h4>
                                        <p>Đơn hàng được giao cho đơn vị vận chuyển</p>
                                        <span class="timeline-time">2-3 ngày</span>
                                    </div>
                                </div>
                                <div class="timeline-item">
                                    <div class="timeline-icon">
                                        <i class="fas fa-home"></i>
                                    </div>
                                    <div class="timeline-content">
                                        <h4>Giao hàng</h4>
                                        <p>Sản phẩm được giao đến tận tay bạn</p>
                                        <span class="timeline-time">3-5 ngày</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                   
                        <div class="benefits-section">
                            <h2 class="benefits-title">
                                <i class="fas fa-award me-2"></i>Cam kết của chúng tôi
                            </h2>
                            <div class="benefits-grid">
                                <div class="benefit-card">
                                    <div class="benefit-icon">
                                        <i class="fas fa-shield-alt"></i>
                                    </div>
                                    <h3>Bảo hành chính hãng</h3>
                                    <p>Tất cả sản phẩm được bảo hành đầy đủ từ 12-36 tháng</p>
                                </div>
                                <div class="benefit-card">
                                    <div class="benefit-icon">
                                        <i class="fas fa-exchange-alt"></i>
                                    </div>
                                    <h3>Đổi trả miễn phí</h3>
                                    <p>Hỗ trợ đổi trả trong vòng 7 ngày nếu sản phẩm lỗi</p>
                                </div>
                                <div class="benefit-card">
                                    <div class="benefit-icon">
                                        <i class="fas fa-truck"></i>
                                    </div>
                                    <h3>Giao hàng nhanh</h3>
                                    <p>Miễn phí vận chuyển cho đơn hàng trên 5 triệu</p>
                                </div>
                                <div class="benefit-card">
                                    <div class="benefit-icon">
                                        <i class="fas fa-headset"></i>
                                    </div>
                                    <h3>Hỗ trợ 24/7</h3>
                                    <p>Đội ngũ tư vấn sẵn sàng giải đáp mọi thắc mắc</p>
                                </div>
                            </div>
                        </div>
                    </div>

                
                    <section class="faq-section container">
                        <h2 class="faq-title">
                            <i class="fas fa-lightbulb me-2"></i>Câu hỏi thường gặp
                        </h2>
                        <div class="faq-grid">
                            <div class="faq-item">
                                <div class="faq-question">
                                    <i class="fas fa-clock"></i>
                                    <strong>Khi nào tôi nhận được hàng?</strong>
                                </div>
                                <p class="faq-answer">Đơn hàng sẽ được giao trong vòng 3-5 ngày làm việc tùy theo khu
                                    vực. Bạn sẽ nhận được thông tin chi tiết qua SMS và email.</p>
                            </div>
                            <div class="faq-item">
                                <div class="faq-question">
                                    <i class="fas fa-credit-card"></i>
                                    <strong>Làm sao để theo dõi đơn hàng?</strong>
                                </div>
                                <p class="faq-answer">Bạn có thể theo dõi đơn hàng tại mục "Lịch sử đơn hàng" hoặc click
                                    vào link trong email xác nhận đơn hàng.</p>
                            </div>
                            <div class="faq-item">
                                <div class="faq-question">
                                    <i class="fas fa-redo"></i>
                                    <strong>Chính sách đổi trả như thế nào?</strong>
                                </div>
                                <p class="faq-answer">Chúng tôi hỗ trợ đổi trả trong 7 ngày nếu sản phẩm bị lỗi hoặc
                                    không đúng mô tả. Vui lòng giữ nguyên tem mác và hóa đơn.</p>
                            </div>
                            <div class="faq-item">
                                <div class="faq-question">
                                    <i class="fas fa-phone"></i>
                                    <strong>Tôi có thể hủy đơn hàng không?</strong>
                                </div>
                                <p class="faq-answer">Bạn có thể hủy đơn hàng trong vòng 2 giờ sau khi đặt. Sau thời
                                    gian này, vui lòng liên hệ hotline để được hỗ trợ.</p>
                            </div>
                        </div>
                    </section>
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

                    <script>
                      
                        document.addEventListener('DOMContentLoaded', function () {
                            const currentDateEl = document.getElementById('currentDate');
                            const deliveryDateEl = document.getElementById('deliveryDate');

                            if (currentDateEl) {
                                const today = new Date();
                                const options = { day: '2-digit', month: '2-digit', year: 'numeric' };
                                currentDateEl.textContent = today.toLocaleDateString('vi-VN', options);
                            }

                            if (deliveryDateEl) {
                                const deliveryDate = new Date();
                                deliveryDate.setDate(deliveryDate.getDate() + 4); 
                                const options = { day: '2-digit', month: '2-digit', year: 'numeric' };
                                deliveryDateEl.textContent = deliveryDate.toLocaleDateString('vi-VN', options);
                            }

                           
                            createConfetti();

                        
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

                    
                        function createConfetti() {
                            const canvas = document.getElementById('confetti-canvas');
                            if (!canvas) return;

                            const ctx = canvas.getContext('2d');
                            canvas.width = window.innerWidth;
                            canvas.height = window.innerHeight;

                            const confetti = [];
                            const confettiCount = 150;
                            const colors = ['#ff6b6b', '#4ecdc4', '#45b7d1', '#f9ca24', '#6c5ce7', '#a29bfe'];

                            for (let i = 0; i < confettiCount; i++) {
                                confetti.push({
                                    x: Math.random() * canvas.width,
                                    y: Math.random() * canvas.height - canvas.height,
                                    r: Math.random() * 6 + 4,
                                    d: Math.random() * confettiCount,
                                    color: colors[Math.floor(Math.random() * colors.length)],
                                    tilt: Math.floor(Math.random() * 10) - 10,
                                    tiltAngleIncremental: Math.random() * 0.07 + 0.05,
                                    tiltAngle: 0
                                });
                            }

                            let animationFrame;
                            function draw() {
                                ctx.clearRect(0, 0, canvas.width, canvas.height);

                                confetti.forEach((c, i) => {
                                    ctx.beginPath();
                                    ctx.lineWidth = c.r / 2;
                                    ctx.strokeStyle = c.color;
                                    ctx.moveTo(c.x + c.tilt + c.r, c.y);
                                    ctx.lineTo(c.x + c.tilt, c.y + c.tilt + c.r);
                                    ctx.stroke();

                                    c.tiltAngle += c.tiltAngleIncremental;
                                    c.y += (Math.cos(c.d) + 3 + c.r / 2) / 2;
                                    c.x += Math.sin(c.d);
                                    c.tilt = Math.sin(c.tiltAngle - i / 3) * 15;

                                    if (c.y > canvas.height) {
                                        confetti[i] = {
                                            x: Math.random() * canvas.width,
                                            y: -10,
                                            r: c.r,
                                            d: c.d,
                                            color: c.color,
                                            tilt: c.tilt,
                                            tiltAngleIncremental: c.tiltAngleIncremental,
                                            tiltAngle: c.tiltAngle
                                        };
                                    }
                                });

                                animationFrame = requestAnimationFrame(draw);
                            }

                            draw();

                        
                            setTimeout(() => {
                                cancelAnimationFrame(animationFrame);
                                ctx.clearRect(0, 0, canvas.width, canvas.height);
                            }, 5000);

                            // Resize handler
                            window.addEventListener('resize', function () {
                                canvas.width = window.innerWidth;
                                canvas.height = window.innerHeight;
                            });
                        }
                    </script>
                </body>

                </html>