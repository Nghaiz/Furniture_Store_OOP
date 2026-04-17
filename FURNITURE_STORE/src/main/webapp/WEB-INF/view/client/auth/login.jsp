<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Login to Furniture Store" />
                    <meta name="author" content="" />
                    <title>Đăng nhập - FURNITURE STORE</title>
                    <link rel="preload" as="image" href="/images/background/background_image_for_login.jpg">
                    <style>
                        @import url('https://fonts.googleapis.com/css2?family=Momo+Trust+Sans:wght@200..800&display=swap');
                        
                        *, *::before, *::after {
                            font-family: "Momo Trust Sans", sans-serif !important;
                            font-optical-sizing: auto;
                        }
                    </style>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="stylesheet" href="../css/auth-common.css">
                    <link rel="stylesheet" href="../css/login.css">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
                    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
                    <style>
                        :root {
                            --form-height: 620px;
                        }

                        .form-box.otp-verify {
                            position: relative;
                            width: 100%;
                        }

                        .otp-email {
                            font-weight: 600;
                        }

                        .btn-secondary {
                            margin-top: 10px;
                            background: transparent;
                            border: 1px solid #ccc;
                            color: #333;
                            padding: 10px 20px;
                            border-radius: 4px;
                            cursor: pointer;
                            font-size: 0.9rem;
                        }

                        .btn-secondary:hover {
                            background: #f0f0f0;
                        }
                    </style>
                    <script>
                        const pendingVerify = '${param.pendingVerify != null ? param.pendingVerify : ""}' === 'true';
                        const pendingEmail = '${param.email != null ? fn:escapeXml(param.email) : ""}';
                        const verifySuccess = '${param.verifySuccess != null ? param.verifySuccess : ""}' === 'true';
                    </script>
                </head>

                <body>

                    <div class="wrapper ${param.register != null ? 'active' : ''}">
                        <!-- Login -->
                        <div class="form-box login">
                            <h2>Đăng nhập</h2>
                            <form method="post" action="/login">
                                <div class="input-box">
                                    <span class="icon"><ion-icon name="mail"></ion-icon></span>
                                    <input type="email" name="username" required placeholder=" " />
                                    <label>Email</label>
                                </div>
                                <div class="input-box">
                                    <span class="icon toggle-password" style="cursor: pointer;" title="Hiển thị/Ẩn mật khẩu">
                                        <ion-icon name="lock-closed"></ion-icon>
                                    </span>
                                    <input type="password" id="password-field" name="password" required placeholder=" " />
                                    <label>Mật khẩu</label>
                                </div>

                                <c:if test="${param.error != null}">
                                    <div class="error-message">Email hoặc mật khẩu không chính xác.</div>
                                </c:if>

                                <c:if test="${param.logout != null}">
                                    <div class="success-message">Đăng xuất thành công</div>
                                </c:if>

                                <c:if test="${param.resetSuccess != null}">
                                    <div class="success-message">Đổi mật khẩu thành công! Bạn có thể đăng nhập ngay.
                                    </div>
                                </c:if>

                                <c:if test="${param.registerSuccess != null}">
                                    <div class="success-message">Đăng ký thành công! Bạn có thể đăng nhập ngay.</div>
                                </c:if>

                                <c:if test="${param.error1 != null}">
                                    <div class="error-message">${fn:escapeXml(param.error1)}</div>
                                </c:if>

                                <c:if test="${param.verifySuccess != null}">
                                    <div class="success-message">Xác minh email thành công! Bạn có thể đăng nhập.
                                    </div>
                                </c:if>

                                <div class="remember">
                                    <label><input type="checkbox" name="remember-me">Nhớ tài khoản</label>
                                    <a href="${pageContext.request.contextPath}/forgot-password" class="small-link">Quên
                                        mật khẩu?</a>
                                </div>

                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                <button type="submit" class="btn-form">
                                    <span>Đăng nhập</span>
                                </button>

                                <div class="login-register">
                                    <p>Chưa có tài khoản? <a href="/register">Đăng ký</a></p>
                                </div>
                            </form>
                            <div class="oauth-divider">HOẶC</div>

                            <a href="/oauth2/authorization/google" class="google-login-btn">
                                <svg class="google-icon" viewBox="0 0 24 24" width="20" height="20">
                                    <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                                    <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                                    <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                                    <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                                </svg>
                                Đăng nhập với Google
                            </a>
                        </div>

                        <!-- OTP Verify -->
                        <div class="form-box otp-verify" style="display: none;">
                            <h2>Xác minh email</h2>
                            <p style="text-align: center; color: #555; margin-bottom: 20px;">
                                Chúng tôi đã gửi mã OTP đến email
                                <span id="otp-email" class="otp-email"></span>. Vui lòng nhập mã để hoàn tất đăng ký.
                            </p>
                            <form id="otp-form">
                                <div class="input-box">
                                    <span class="icon"><ion-icon name="key"></ion-icon></span>
                                    <input type="text" id="otp-code" name="otp" required placeholder=" " maxlength="6"
                                        pattern="[0-9]{6}" />
                                    <label>Mã OTP</label>
                                </div>

                                <div id="otp-error" class="error-message" style="display:none;"></div>
                                <div id="otp-success" class="success-message" style="display:none;"></div>

                                <input type="hidden" id="otp-email-hidden" name="email" value="" />
                                <input type="hidden" id="csrf-token" value="${_csrf.token}" />
                                <input type="hidden" id="csrf-header-name" value="${_csrf.headerName}" />

                                <button type="submit" class="btn-form">
                                    <span>Xác minh</span>
                                </button>

                                <button type="button" id="btn-back-login" class="btn-secondary">
                                    Quay lại đăng nhập
                                </button>
                            </form>
                        </div>

                        <!-- Register -->
                        <div class="form-box register">
                            <h2>Đăng ký</h2>
                            <p style="text-align: center; color: #555; margin-bottom: 20px;">
                                Đã có tài khoản? <a href="/login" style="color: var(--accent-color);">Đăng nhập tại
                                    đây</a>
                            </p>
                        </div>
                    </div>

                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            const loginBox = document.querySelector('.form-box.login');
                            const otpBox = document.querySelector('.form-box.otp-verify');
                            const otpEmailSpan = document.getElementById('otp-email');
                            const otpEmailHidden = document.getElementById('otp-email-hidden');
                            const otpForm = document.getElementById('otp-form');
                            const otpError = document.getElementById('otp-error');
                            const otpSuccess = document.getElementById('otp-success');
                            const btnBackLogin = document.getElementById('btn-back-login');

                            if (pendingVerify && pendingEmail && otpBox && loginBox) {
                                loginBox.style.display = 'none';
                                otpBox.style.display = 'block';
                                otpEmailSpan.textContent = pendingEmail;
                                otpEmailHidden.value = pendingEmail;
                            }

                            if (verifySuccess && loginBox) {
                                loginBox.style.display = 'block';
                            }

                            if (otpForm) {
                                otpForm.addEventListener('submit', function (e) {
                                    e.preventDefault();
                                    otpError.style.display = 'none';
                                    otpSuccess.style.display = 'none';

                                    const email = otpEmailHidden.value;
                                    const otp = document.getElementById('otp-code').value.trim();

                                    if (!otp || otp.length !== 6) {
                                        otpError.textContent = 'Vui lòng nhập đủ 6 chữ số OTP.';
                                        otpError.style.display = 'block';
                                        return;
                                    }

                                    const csrfHeaderName = document.getElementById('csrf-header-name').value;
                                    const csrfToken = document.getElementById('csrf-token').value;

                                    fetch('/api/verify-otp', {
                                        method: 'POST',
                                        headers: {
                                            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
                                            [csrfHeaderName]: csrfToken
                                        },
                                        body: 'email=' + encodeURIComponent(email) + '&otp=' + encodeURIComponent(otp)
                                    })
                                        .then(res => res.json().then(data => ({
                                            ok: res.ok,
                                            status: res.status,
                                            body: data
                                        })))
                                        .then(result => {
                                            if (!result.ok) {
                                                otpError.textContent = result.body && result.body.message
                                                    ? result.body.message
                                                    : 'Mã OTP không hợp lệ hoặc đã hết hạn.';
                                                otpError.style.display = 'block';
                                            } else {
                                                otpSuccess.textContent = 'Xác minh thành công! Đang chuyển đến trang đăng nhập...';
                                                otpSuccess.style.display = 'block';
                                                setTimeout(function () {
                                                    window.location.href = '/login?verifySuccess=true';
                                                }, 1200);
                                            }
                                        })
                                        .catch(() => {
                                            otpError.textContent = 'Đã xảy ra lỗi. Vui lòng thử lại.';
                                            otpError.style.display = 'block';
                                        });
                                });
                            }

                            if (btnBackLogin) {
                                btnBackLogin.addEventListener('click', function () {
                                    window.location.href = '/login';
                                });
                            }

                            // Toggle password visibility
                            const togglePassword = document.querySelector('.toggle-password');
                            const passwordField = document.getElementById('password-field');
                            
                            if (togglePassword && passwordField) {
                                togglePassword.addEventListener('click', function() {
                                    const icon = this.querySelector('ion-icon');
                                    if (passwordField.type === 'password') {
                                        passwordField.type = 'text';
                                        icon.setAttribute('name', 'lock-open');
                                    } else {
                                        passwordField.type = 'password';
                                        icon.setAttribute('name', 'lock-closed');
                                    }
                                });
                            }
                        });
                    </script>
                </body>

                </html>
