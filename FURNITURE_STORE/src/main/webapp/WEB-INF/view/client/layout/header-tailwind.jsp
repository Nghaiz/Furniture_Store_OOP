<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

          
                <script src="https://cdn.tailwindcss.com"></script>
                <script>
                    tailwind.config = {
                        prefix: 'tw-',
                        important: true,
                        corePlugins: {
                            preflight: false
                        },
                        theme: {
                            extend: {
                                colors: {
                                    primary: {
                                        400: '#80c61a',
                                        500: '#80c61a',
                                        600: '#80c61a',
                                        700: '#7dbe18',
                                        DEFAULT: '#80c61a'
                                    },
                                    accent: {
                                        300: '#f99427',
                                        400: '#f99427',
                                        500: '#f99427',
                                        600: '#f99427',
                                        DEFAULT: '#f99427'
                                    }
                                }
                            }
                        }
                    }
                </script>

         
                <link rel="stylesheet" href="/client/css/header_cart.css" />
                <header class="tw-fixed tw-top-0 tw-w-full tw-z-50 tw-bg-white tw-shadow-md">
                    <div class="tw-max-w-7xl tw-mx-auto tw-px-4">
                        <nav class="tw-flex tw-items-center tw-justify-between tw-h-20">
                      
                            <a href="/" class="tw-flex tw-items-center tw-gap-3 tw-group tw-no-underline">
                                <div
                                    class="tw-w-12 tw-h-12 tw-bg-gradient-to-br tw-from-primary-600 tw-to-primary-700 tw-rounded-lg tw-flex tw-items-center tw-justify-center tw-text-white tw-font-bold tw-text-lg group-hover:tw-shadow-lg tw-transition-all">
                                    FS
                                </div>
                                <div>
                                    <p class="tw-font-bold tw-text-slate-900 tw-leading-tight tw-m-0">Furniture Store
                                    </p>
                                    <p
                                        class="tw-text-xs tw-text-primary-600 tw-uppercase tw-tracking-widest tw-font-semibold tw-m-0">
                                        Living Inspiration</p>
                                </div>
                            </a>

                        
                            <div class="tw-hidden md:tw-flex tw-items-center tw-gap-8 tw-ml-auto tw-mr-8">
                                <a href="/"
                                    class="tw-font-semibold tw-text-slate-700 hover:tw-text-primary-600 tw-transition-colors tw-no-underline">Trang
                                    Chủ</a>
                                <a href="/products"
                                    class="tw-font-semibold tw-text-slate-700 hover:tw-text-primary-600 tw-transition-colors tw-no-underline">Sản
                                    phẩm</a>
                            </div>

                       
                            <div class="tw-flex tw-items-center tw-gap-4">
                                <c:if test="${not empty pageContext.request.userPrincipal}">
                                
                                    <div class="tw-relative tw-group" data-mini-cart data-fetch-url="/api/cart/preview">
                                        <button type="button"
                                            class="tw-relative tw-p-2 tw-text-slate-700 hover:tw-text-primary-600 tw-transition-colors tw-bg-transparent tw-border-0"
                                            data-mini-cart-trigger aria-haspopup="true" aria-expanded="false"
                                            aria-label="Giỏ hàng">
                                            <i class="fas fa-shopping-bag tw-text-xl"></i>
                                            <span
                                                class="tw-absolute tw-top-0 tw-right-0 tw-w-5 tw-h-5 tw-bg-accent-500 tw-text-white tw-text-xs tw-rounded-full tw-flex tw-items-center tw-justify-center tw-font-bold"
                                                data-mini-cart-count>0</span>
                                        </button>
                               
                                        <div class="tw-absolute tw-top-10 tw-right-0 tw-w-80 tw-bg-white tw-rounded-lg tw-shadow-2xl tw-hidden group-hover:tw-block tw-z-50"
                                            data-mini-cart-panel>
                                            <div class="tw-border-b tw-p-4">
                                                <span class="tw-font-bold tw-text-slate-900">Sản phẩm mới thêm</span>
                                                <span class="tw-float-right tw-text-primary-600 tw-font-bold"
                                                    data-mini-cart-total></span>
                                            </div>
                                            <div class="tw-p-4 tw-max-h-96 tw-overflow-y-auto" data-mini-cart-body>
                                                <p class="tw-text-center tw-text-gray-500">Chưa có sản phẩm trong giỏ
                                                    hàng</p>
                                            </div>
                                            <div class="tw-border-t tw-p-4">
                                                <a href="/cart"
                                                    class="tw-w-full tw-block tw-text-center tw-px-4 tw-py-2 tw-bg-gradient-to-r tw-from-primary-600 tw-to-primary-700 tw-text-white tw-rounded-lg tw-font-semibold hover:tw-shadow-lg tw-transition-all tw-no-underline">
                                                    Xem giỏ hàng
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                   
                                    <div class="tw-relative tw-group" data-user-menu>
                                        <button type="button"
                                            class="tw-p-2 tw-text-slate-700 hover:tw-text-primary-600 tw-transition-colors tw-bg-transparent tw-border-0"
                                            data-user-trigger aria-label="Tài khoản">
                                            <i class="fas fa-user tw-text-xl"></i>
                                        </button>
                                        <div class="tw-absolute tw-right-0 tw-top-10 tw-w-56 tw-bg-white tw-rounded-lg tw-shadow-2xl tw-hidden group-hover:tw-block tw-p-4 tw-z-50"
                                            data-user-panel>
                                            <div class="tw-text-center tw-mb-4">
                                                <img src="/images/avatar/${empty sessionScope.avatar || sessionScope.avatar == '' ? 'default-avatar.jpg' : sessionScope.avatar}"
                                                    alt="avatar người dùng"
                                                    class="tw-w-16 tw-h-16 tw-rounded-full tw-mx-auto tw-mb-2 tw-object-cover"
                                                    onerror="this.onerror=null; this.src='/images/avatar/default-avatar.jpg';" />
                                                <p class="tw-font-bold tw-text-slate-900 tw-m-0">
                                                    <c:out value="${sessionScope.fullName1}" />
                                                </p>
                                            </div>
                                            <div class="tw-space-y-2">
                                                <% if (session.getAttribute("role") !=null &&
                                                    session.getAttribute("role").equals("ADMIN")) { %>
                                                    <a href="/admin"
                                                        class="tw-block tw-px-4 tw-py-2 tw-text-slate-700 hover:tw-bg-gray-100 tw-rounded tw-transition-colors tw-text-sm tw-no-underline">
                                                        Trang quản trị
                                                    </a>
                                                    <% } %>
                                                        <a href="/view-profile"
                                                            class="tw-block tw-px-4 tw-py-2 tw-text-slate-700 hover:tw-bg-gray-100 tw-rounded tw-transition-colors tw-text-sm tw-no-underline">
                                                            Cập nhật thông tin cá nhân
                                                        </a>
                                                        <a href="/order-history"
                                                            class="tw-block tw-px-4 tw-py-2 tw-text-slate-700 hover:tw-bg-gray-100 tw-rounded tw-transition-colors tw-text-sm tw-no-underline">
                                                            Lịch sử mua hàng
                                                        </a>
                                                        <a href="/change-password"
                                                            class="tw-block tw-px-4 tw-py-2 tw-text-slate-700 hover:tw-bg-gray-100 tw-rounded tw-transition-colors tw-text-sm tw-no-underline">
                                                            Đổi mật khẩu
                                                        </a>
                                                        <hr class="tw-my-2">
                                                        <form method="post" action="/logout">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <button type="submit"
                                                                class="tw-w-full tw-text-left tw-px-4 tw-py-2 tw-text-red-600 hover:tw-bg-red-50 tw-rounded tw-transition-colors tw-text-sm tw-font-semibold tw-bg-transparent tw-border-0 tw-cursor-pointer">
                                                                Đăng xuất
                                                            </button>
                                                        </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${empty pageContext.request.userPrincipal}">
                                    <a href="/login"
                                        class="tw-px-6 tw-py-2 tw-bg-gradient-to-r tw-from-primary-600 tw-to-primary-700 tw-text-white tw-rounded-lg tw-font-semibold hover:tw-shadow-lg tw-transition-all tw-no-underline">
                                        Đăng nhập
                                    </a>
                                </c:if>

                        
                                <button type="button"
                                    class="md:tw-hidden tw-p-2 tw-text-slate-700 tw-bg-transparent tw-border-0"
                                    id="mobile-menu-toggle">
                                    <i class="fas fa-bars tw-text-xl"></i>
                                </button>
                            </div>
                        </nav>
                    </div>
                </header>

                <script defer src="/client/js/header_cart.js"></script>


                <div class="tw-h-20"></div>