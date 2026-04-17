<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Sản Phẩm - FURNITURE STORE</title>
                    <script src="https://cdn.tailwindcss.com"></script>
                    <script>
                        tailwind.config = {
                            theme: {
                                extend: {
                                    colors: {
                                        primary: {
                                            50: '#f0fdf4',
                                            100: '#dcfce7',
                                            200: '#bbf7d0',
                                            300: '#86efac',
                                            400: '#80c61a',
                                            500: '#80c61a',
                                            600: '#80c61a',
                                            700: '#7dbe18',
                                            DEFAULT: '#80c61a'
                                        },
                                        accent: {
                                            50: '#fff7ed',
                                            100: '#ffedd5',
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
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">
                    <meta name="_csrf" content="${_csrf.token}" />
                    <meta name="_csrf_header" content="${_csrf.headerName}" />
                    <meta name="_csrf_parameter" content="${_csrf.parameterName}" />


                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <link href="/client/css/style.css" rel="stylesheet">
                    <link href="/client/css/override.css" rel="stylesheet">
                    <link href="/client/css/effects.css" rel="stylesheet">
                    <link href="/client/css/order.css" rel="stylesheet">
                    <link href="/client/css/product_detail.css" rel="stylesheet">
                    <link href="/client/css/product-list.css" rel="stylesheet">

                </head>

                <body class="bg-gradient-to-br from-slate-50 to-slate-100">

                    <div id="spinner"
                        class="spinner-show fixed inset-0 w-full h-full bg-white flex items-center justify-center z-50 transition-all duration-800">
                        <div class="relative w-16 h-16">
                            <div
                                class="animate-spin rounded-full h-16 w-16 border-4 border-primary-600 border-t-transparent">
                            </div>
                        </div>
                    </div>

                    <jsp:include page="../layout/header-tailwind.jsp" />

                    <section class="w-full pt-7 pb-12 md:pb-16 lg:pb-20 bg-white">
                        <div class="max-w-7xl mx-auto px-4">
                            <div class="mb-8">
                                <nav class="flex items-center gap-2 text-sm md:text-base">
                                    <a href="/"
                                        class="text-primary-600 hover:text-primary-700 font-medium transition-colors">Trang
                                        chủ</a>
                                    <span class="text-gray-400">/</span>
                                    <span class="text-gray-600">Danh sách sản phẩm</span>
                                </nav>
                            </div>

                            <div class="mb-12">
                                <h1 class="text-4xl md:text-5xl font-bold text-slate-900 mb-2">Danh sách sản phẩm</h1>
                                <p class="text-lg text-gray-600">Khám phá bộ sưu tập nội thất đa dạng của chúng tôi</p>
                            </div>

                            <div class="grid grid-cols-1 lg:grid-cols-4 gap-8">

                                <aside class="lg:col-span-1">
                                    <div class="sticky top-24 space-y-4">
                                        
                                        <div class="bg-white rounded-2xl p-5 shadow-lg border border-slate-200">
                                            <div class="flex items-center justify-between mb-2">
                                                <h2 class="font-bold text-xl text-slate-900 flex items-center gap-2">
                                                    <i class="fas fa-sliders-h text-primary-600"></i>
                                                    Bộ lọc
                                                </h2>
                                                <button id="clearAllFilters" class="clear-filter-btn text-sm text-red-500 hover:text-red-600 font-semibold flex items-center gap-1" title="Xóa tất cả bộ lọc">
                                                    <i class="fas fa-times-circle"></i>
                                                    Xóa tất cả
                                                </button>
                                            </div>
                                            <p class="text-sm text-gray-500">Tìm sản phẩm phù hợp với bạn</p>
                                            
                                            <div id="filterTagsContainer" class="filter-tags-container">
                                            </div>
                                        </div>

                                        <div class="filter-section bg-white rounded-2xl shadow-lg border border-slate-200 p-4">
                                            <div class="flex items-center gap-3 mb-3">
                                                <div class="w-9 h-9 bg-gradient-to-br from-blue-500 to-blue-600 rounded-lg flex items-center justify-center text-white shadow-md">
                                                    <i class="fas fa-industry text-sm"></i>
                                                </div>
                                                <h3 class="font-bold text-slate-900">Hãng sản xuất</h3>
                                                <span class="filter-count ml-auto" data-filter="factory">0</span>
                                            </div>
                                            <div class="space-y-1">
                                                <label class="custom-checkbox">
                                                    <input type="checkbox" class="factory-filter" value="Hoàng Anh">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Hoàng Anh</span>
                                                </label>
                                                <label class="custom-checkbox">
                                                    <input type="checkbox" class="factory-filter" value="Hòa Phát">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Hòa Phát</span>
                                                </label>
                                                <label class="custom-checkbox">
                                                    <input type="checkbox" class="factory-filter" value="Baya">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Baya</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="filter-section bg-white rounded-2xl shadow-lg border border-slate-200 p-4">
                                            <div class="flex items-center gap-3 mb-3">
                                                <div class="w-9 h-9 bg-gradient-to-br from-purple-500 to-purple-600 rounded-lg flex items-center justify-center text-white shadow-md">
                                                    <i class="fas fa-couch text-sm"></i>
                                                </div>
                                                <h3 class="font-bold text-slate-900">Phân loại</h3>
                                                <span class="filter-count ml-auto" data-filter="target">0</span>
                                            </div>
                                            <div class="grid grid-cols-2 gap-1">
                                                <label class="custom-checkbox">
                                                    <input type="checkbox" class="target-filter" value="GHE">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Ghế</span>
                                                </label>
                                                <label class="custom-checkbox">
                                                    <input type="checkbox" class="target-filter" value="BAN">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Bàn</span>
                                                </label>
                                                <label class="custom-checkbox">
                                                    <input type="checkbox" class="target-filter" value="GIUONG">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Giường</span>
                                                </label>
                                                <label class="custom-checkbox">
                                                    <input type="checkbox" class="target-filter" value="TU">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Tủ</span>
                                                </label>
                                                <label class="custom-checkbox">
                                                    <input type="checkbox" class="target-filter" value="KE">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Kệ</span>
                                                </label>
                                                <label class="custom-checkbox">
                                                    <input type="checkbox" class="target-filter" value="KHAC">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Khác</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="filter-section bg-white rounded-2xl shadow-lg border border-slate-200 p-4">
                                            <div class="flex items-center gap-3 mb-3">
                                                <div class="w-9 h-9 bg-gradient-to-br from-green-500 to-emerald-600 rounded-lg flex items-center justify-center text-white shadow-md">
                                                    <i class="fas fa-dollar-sign text-sm"></i>
                                                </div>
                                                <h3 class="font-bold text-slate-900">Mức giá</h3>
                                                <span class="filter-count ml-auto" data-filter="price">0</span>
                                            </div>
                                            <div class="space-y-1">
                                                <label class="custom-checkbox">
                                                    <input type="checkbox" class="price-filter" value="duoi-10-trieu">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Dưới 10 triệu</span>
                                                </label>
                                                <label class="custom-checkbox">
                                                    <input type="checkbox" class="price-filter" value="10-15-trieu">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">10 - 15 triệu</span>
                                                </label>
                                                <label class="custom-checkbox">
                                                    <input type="checkbox" class="price-filter" value="15-20-trieu">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">15 - 20 triệu</span>
                                                </label>
                                                <label class="custom-checkbox">
                                                    <input type="checkbox" class="price-filter" value="tren-20-trieu">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Trên 20 triệu</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="filter-section bg-white rounded-2xl shadow-lg border border-slate-200 p-4">
                                            <div class="flex items-center gap-3 mb-3">
                                                <div class="w-9 h-9 bg-gradient-to-br from-orange-500 to-amber-600 rounded-lg flex items-center justify-center text-white shadow-md">
                                                    <i class="fas fa-sort-amount-down text-sm"></i>
                                                </div>
                                                <h3 class="font-bold text-slate-900">Sắp xếp</h3>
                                            </div>
                                            <div class="space-y-1">
                                                <label class="custom-checkbox">
                                                    <input type="radio" name="sort" class="sort-radio" value="gia-tang-dan">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Giá tăng dần</span>
                                                </label>
                                                <label class="custom-checkbox">
                                                    <input type="radio" name="sort" class="sort-radio" value="gia-giam-dan">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Giá giảm dần</span>
                                                </label>
                                                <label class="custom-checkbox">
                                                    <input type="radio" name="sort" class="sort-radio" value="gia-nothing" checked>
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <span class="label-text">Không sắp xếp</span>
                                                </label>
                                            </div>
                                        </div>

                                        <button id="btnFilter"
                                            class="w-full px-6 py-4 bg-gradient-to-r from-primary-600 to-primary-700 text-white rounded-2xl font-bold hover:shadow-xl hover:shadow-primary-500/30 transition-all transform hover:scale-[1.02] active:scale-[0.98] flex items-center justify-center gap-3">
                                            <i class="fas fa-filter"></i>
                                            <span>Áp dụng bộ lọc</span>
                                            <span id="filterResultCount" class="px-2 py-0.5 bg-white/20 rounded-full text-sm hidden"></span>
                                        </button>
                                    </div>
                                </aside>

                                <div class="lg:col-span-3">

                                    <div class="mb-6">
                                        <div class="relative" id="searchContainer">
                                            <i class="fas fa-search absolute left-5 top-1/2 -translate-y-1/2 text-gray-400 z-10"></i>
                                            <input type="text" id="searchInput" placeholder="Tìm kiếm sản phẩm..." autocomplete="off"
                                                class="w-full pl-14 pr-6 py-4 bg-white border-2 border-slate-200 rounded-2xl focus:outline-none focus:border-primary-600 focus:ring-4 focus:ring-primary-100 transition-all shadow-sm hover:shadow-md">
                                            <div id="searchSuggestions" class="search-suggestions"></div>
                                        </div>
                                    </div>

                                    <div id="filterInfoBar" class="hidden mb-4 p-3 bg-primary-50 border border-primary-200 rounded-xl flex items-center justify-between">
                                        <div class="flex items-center gap-2">
                                            <i class="fas fa-filter text-primary-600"></i>
                                            <span class="text-primary-700 font-medium">Đang lọc: <span id="filterInfoText"></span></span>
                                        </div>
                                        <button id="clearFilterBar" class="text-primary-600 hover:text-primary-700 font-semibold text-sm">
                                            <i class="fas fa-times mr-1"></i>Xóa bộ lọc
                                        </button>
                                    </div>

                                    <div id="productsContainer"
                                        class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                                        <c:if test="${totalPages == 0}">
                                            <div class="col-span-full text-center py-16">
                                                <div class="w-24 h-24 mx-auto mb-6 bg-slate-100 rounded-full flex items-center justify-center">
                                                    <i class="fas fa-inbox text-4xl text-gray-300"></i>
                                                </div>
                                                <h3 class="text-xl font-bold text-gray-700 mb-2">Không tìm thấy sản phẩm</h3>
                                                <p class="text-gray-500">Hãy thử thay đổi bộ lọc hoặc từ khóa tìm kiếm</p>
                                            </div>
                                        </c:if>
                                        <c:forEach var="product" items="${products}">
                                            <div class="group relative bg-white rounded-2xl overflow-hidden shadow-lg hover:shadow-2xl transition-all duration-500 hover:-translate-y-2 border border-slate-100 hover:border-primary-400 flex flex-col product-item" data-product="${product.id}" data-stock="${product.stockQuantity}">
                                                
                                                <div class="absolute top-3 right-3 z-20">
                                                    <c:choose>
                                                        <c:when test="${product.stockQuantity > 0}">
                                                            <span class="px-3 py-1.5 bg-gradient-to-r from-emerald-500 to-green-500 text-white text-xs font-bold rounded-full shadow-lg">
                                                                Sẵn hàng
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="px-3 py-1.5 bg-gradient-to-r from-gray-400 to-gray-500 text-white text-xs font-bold rounded-full shadow-lg">
                                                                Hết hàng
                                                            </span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                
                                                <a href="/product/${product.id}" class="relative overflow-hidden h-52 bg-gradient-to-br from-slate-100 to-slate-50 block cursor-pointer">
                                                    <img src="/images/product/${product.image}" alt="${product.name}"
                                                        class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 ${product.stockQuantity <= 0 ? 'grayscale opacity-70' : ''}">

                                                    <div class="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-center justify-center">
                                                        <span class="px-4 py-2 bg-white/95 backdrop-blur-sm text-primary-600 rounded-full font-semibold text-sm flex items-center gap-2 shadow-lg transform scale-90 group-hover:scale-100 transition-transform duration-300">
                                                            <i class="fas fa-eye"></i> Xem chi tiết
                                                        </span>
                                                    </div>

                                                    <c:if test="${product.stockQuantity <= 0}">
                                                        <div class="absolute inset-0 bg-black/20 flex items-center justify-center">
                                                            <span class="px-4 py-2 bg-gray-800/90 text-white rounded-lg font-semibold text-sm">
                                                                Tạm hết hàng
                                                            </span>
                                                        </div>
                                                    </c:if>
                                                </a>

                                                <div class="p-4 flex flex-col flex-1">
                                                    <a href="/product/${product.id}" class="block group/title">
                                                        <h4 class="font-bold text-slate-800 mb-1 line-clamp-2 text-base leading-tight group-hover/title:text-primary-600 transition-colors">
                                                            ${product.name}
                                                        </h4>
                                                    </a>
                                                    <p class="text-sm text-gray-500 mb-2 line-clamp-2 flex-1 leading-snug">
                                                        ${product.shortDesc}
                                                    </p>

                                                    <div class="flex items-center gap-1 mb-2">
                                                        <div class="flex gap-0.5 text-sm">
                                                            <i class="fas fa-star text-yellow-400"></i>
                                                            <i class="fas fa-star text-yellow-400"></i>
                                                            <i class="fas fa-star text-yellow-400"></i>
                                                            <i class="fas fa-star text-yellow-400"></i>
                                                            <i class="fas fa-star-half-alt text-yellow-400"></i>
                                                        </div>
                                                        <span class="text-xs text-gray-500">(128)</span>
                                                    </div>

                                                    <div class="flex items-center justify-between pt-2 border-t border-slate-100">
                                                        <div>
                                                            <span class="text-lg font-bold text-primary-600">
                                                                <fmt:formatNumber type="number" value="${product.price}" />₫
                                                            </span>
                                                        </div>
                                                        <form method="post" action="/add-product-to-cart/${product.id}" class="add-to-cart-form">
                                                            <input type="hidden" name="productId" value="${product.id}">
                                                            <input type="hidden" name="quantity" value="1">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                                            <c:choose>
                                                                <c:when test="${product.stockQuantity > 0}">
                                                                    <button type="submit" class="w-11 h-11 bg-gradient-to-br from-primary-500 to-primary-600 text-white rounded-xl font-semibold shadow-lg shadow-primary-500/30 hover:shadow-xl hover:shadow-primary-500/40 transition-all transform hover:scale-110 active:scale-95 flex items-center justify-center add-to-cart-btn relative overflow-hidden group/cart" data-product-id="${product.id}" data-no-loading="true">
                                                                        <i class="fas fa-shopping-cart group-hover/cart:scale-110 transition-transform relative z-10"></i>
                                                                        <span class="absolute inset-0 bg-white/20 rounded-xl transform scale-0 group-hover/cart:scale-100 transition-transform duration-300"></span>
                                                                    </button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <button type="button" disabled class="w-11 h-11 bg-gray-300 text-gray-500 rounded-xl font-semibold cursor-not-allowed flex items-center justify-center" title="Sản phẩm đã hết hàng" data-out-of-stock="true">
                                                                        <i class="fas fa-shopping-cart"></i>
                                                                    </button>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </form>
                                                    </div>
                                                </div>

                                                <div class="h-1 bg-gradient-to-r from-primary-400 via-accent-400 to-primary-500 transform scale-x-0 group-hover:scale-x-100 transition-transform duration-500 origin-left"></div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <c:if test="${totalPages > 0}">
                                        <div id="originalPagination" class="mt-12 flex justify-center items-center">
                                            <nav class="inline-flex items-center gap-1 bg-white rounded-2xl shadow-lg p-2 border border-slate-200">
                                                <c:if test="${currentPage > 1}">
                                                    <a href="/products?page=${currentPage - 1}${queryString}"
                                                        class="w-10 h-10 flex items-center justify-center border-2 border-transparent text-primary-600 rounded-xl hover:bg-primary-50 hover:border-primary-200 transition-all font-semibold">
                                                        <i class="fas fa-chevron-left"></i>
                                                    </a>
                                                </c:if>
                                                <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                    <c:if test="${(loop.index + 1) eq currentPage}">
                                                        <button
                                                            class="w-10 h-10 flex items-center justify-center bg-gradient-to-r from-primary-600 to-primary-700 text-white rounded-xl font-bold shadow-md shadow-primary-500/30">
                                                            ${loop.index + 1}
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${(loop.index + 1) ne currentPage}">
                                                        <a href="/products?page=${loop.index + 1}${queryString}"
                                                            class="w-10 h-10 flex items-center justify-center border-2 border-transparent text-slate-700 rounded-xl hover:bg-slate-50 hover:border-slate-200 transition-all font-semibold">
                                                            ${loop.index + 1}
                                                        </a>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${currentPage < totalPages}">
                                                    <a href="/products?page=${currentPage + 1}${queryString}"
                                                        class="w-10 h-10 flex items-center justify-center border-2 border-transparent text-primary-600 rounded-xl hover:bg-primary-50 hover:border-primary-200 transition-all font-semibold">
                                                        <i class="fas fa-chevron-right"></i>
                                                    </a>
                                                </c:if>
                                            </nav>
                                        </div>
                                    </c:if>

                                    <div id="filterPagination" class="mt-12 flex justify-center items-center hidden">
                                        <div class="inline-flex items-center gap-1 bg-white rounded-2xl shadow-lg p-2 border border-slate-200">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <a href="#"
                        class="back-to-top fixed bottom-8 right-8 w-14 h-14 bg-gradient-to-r from-primary-600 to-primary-700 text-white rounded-full flex items-center justify-center shadow-lg hover:shadow-2xl hover:-translate-y-1 transition-all z-40 opacity-0 invisible">
                        <i class="fas fa-arrow-up"></i>
                    </a>

                    <jsp:include page="../layout/footer-tailwind.jsp" />

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="/client/js/cart_common.js"></script>
                    <script src="/client/js/cart_fly.js"></script>
                    <script>

                        window.addEventListener('load', () => {
                            const spinner = document.getElementById('spinner');
                            if (spinner) {
                                spinner.classList.remove('spinner-show');
                                spinner.classList.add('spinner-hide');
                            }
                        });

                        const targetLabels = {
                            'GHE': 'Ghế',
                            'BAN': 'Bàn',
                            'GIUONG': 'Giường',
                            'TU': 'Tủ',
                            'KE': 'Kệ',
                            'KHAC': 'Khác'
                        };
                        
                        const priceLabels = {
                            'duoi-10-trieu': 'Dưới 10 triệu',
                            '10-15-trieu': '10 - 15 triệu',
                            '15-20-trieu': '15 - 20 triệu',
                            'tren-20-trieu': 'Trên 20 triệu'
                        };

                        function updateFilterTags() {
                            const tagsContainer = document.getElementById('filterTagsContainer');
                            if (!tagsContainer) return;
                            
                            tagsContainer.innerHTML = '';
                            let hasAnyTag = false;

                            document.querySelectorAll('.factory-filter:checked').forEach(checkbox => {
                                hasAnyTag = true;
                                const tag = createFilterTag(checkbox.value, checkbox.value, 'factory', checkbox);
                                tagsContainer.appendChild(tag);
                            });

                            document.querySelectorAll('.target-filter:checked').forEach(checkbox => {
                                hasAnyTag = true;
                                const label = targetLabels[checkbox.value] || checkbox.value;
                                const tag = createFilterTag(checkbox.value, label, 'target', checkbox);
                                tagsContainer.appendChild(tag);
                            });

                            document.querySelectorAll('.price-filter:checked').forEach(checkbox => {
                                hasAnyTag = true;
                                const label = priceLabels[checkbox.value] || checkbox.value;
                                const tag = createFilterTag(checkbox.value, label, 'price', checkbox);
                                tagsContainer.appendChild(tag);
                            });

                            if (hasAnyTag) {
                                tagsContainer.classList.add('has-tags');
                            } else {
                                tagsContainer.classList.remove('has-tags');
                            }

                            const clearBtn = document.getElementById('clearAllFilters');
                            if (clearBtn) {
                                clearBtn.classList.toggle('visible', hasAnyTag);
                            }
                        }

                        function createFilterTag(value, label, type, checkboxElement) {
                            const tag = document.createElement('span');
                            tag.className = 'filter-tag ' + type + '-tag';
                            tag.innerHTML = '<span class="tag-label">' + label + '</span><span class="tag-remove" title="Xóa bộ lọc này"><i class="fas fa-times"></i></span>';

                            tag.querySelector('.tag-remove').addEventListener('click', (e) => {
                                e.stopPropagation();
                                checkboxElement.checked = false;
                                updateFilterTags();
                            });
                            
                            return tag;
                        }

                        function updateFilterCounts() {
                            updateFilterTags();
                        }

                        document.querySelectorAll('.factory-filter, .target-filter, .price-filter').forEach(checkbox => {
                            checkbox.addEventListener('change', updateFilterCounts);
                        });

                        document.getElementById('clearAllFilters')?.addEventListener('click', () => {
                            document.querySelectorAll('.factory-filter, .target-filter, .price-filter').forEach(checkbox => {
                                checkbox.checked = false;
                            });
                            const defaultSort = document.querySelector('.sort-radio[value="gia-nothing"]');
                            if (defaultSort) defaultSort.checked = true;
                            updateFilterTags();

                            location.reload();
                        });

                        updateFilterTags();

                        const renderProductCard = (product, csrfToken, csrfParamName) => {
                            const formattedPrice = new Intl.NumberFormat('vi-VN').format(product.price || 0);
                            const stockQuantity = product.stockQuantity || product.quantity || 0;
                            const isOutOfStock = stockQuantity <= 0;

                            let html = '<div class="group relative bg-white rounded-2xl overflow-hidden shadow-lg hover:shadow-2xl transition-all duration-500 hover:-translate-y-2 border border-slate-100 hover:border-primary-400 flex flex-col product-item" data-product="' + product.id + '" data-stock="' + stockQuantity + '">';

                            html += '<div class="absolute top-3 right-3 z-20">';
                            if (!isOutOfStock) {
                                html += '<span class="px-3 py-1.5 bg-gradient-to-r from-emerald-500 to-green-500 text-white text-xs font-bold rounded-full shadow-lg">Sẵn hàng</span>';
                            } else {
                                html += '<span class="px-3 py-1.5 bg-gradient-to-r from-gray-400 to-gray-500 text-white text-xs font-bold rounded-full shadow-lg">Hết hàng</span>';
                            }
                            html += '</div>';

                            html += '<a href="/product/' + product.id + '" class="relative overflow-hidden h-52 bg-gradient-to-br from-slate-100 to-slate-50 block cursor-pointer">';
                            html += '<img src="/images/product/' + product.image + '" alt="' + product.name + '" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700' + (isOutOfStock ? ' grayscale opacity-70' : '') + '">';
                            html += '<div class="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-center justify-center">';
                            html += '<span class="px-4 py-2 bg-white/95 backdrop-blur-sm text-primary-600 rounded-full font-semibold text-sm flex items-center gap-2 shadow-lg transform scale-90 group-hover:scale-100 transition-transform duration-300"><i class="fas fa-eye"></i> Xem chi tiết</span>';
                            html += '</div>';
                            if (isOutOfStock) {
                                html += '<div class="absolute inset-0 bg-black/20 flex items-center justify-center"><span class="px-4 py-2 bg-gray-800/90 text-white rounded-lg font-semibold text-sm">Tạm hết hàng</span></div>';
                            }
                            html += '</a>';

                            html += '<div class="p-4 flex flex-col flex-1">';
                            html += '<a href="/product/' + product.id + '" class="block group/title"><h4 class="font-bold text-slate-800 mb-1 line-clamp-2 text-base leading-tight group-hover/title:text-primary-600 transition-colors">' + product.name + '</h4></a>';
                            html += '<p class="text-sm text-gray-500 mb-2 line-clamp-2 flex-1 leading-snug">' + (product.shortDesc || '') + '</p>';

                            html += '<div class="flex items-center gap-1 mb-2"><div class="flex gap-0.5 text-sm"><i class="fas fa-star text-yellow-400"></i><i class="fas fa-star text-yellow-400"></i><i class="fas fa-star text-yellow-400"></i><i class="fas fa-star text-yellow-400"></i><i class="fas fa-star-half-alt text-yellow-400"></i></div><span class="text-xs text-gray-500">(128)</span></div>';

                            html += '<div class="flex items-center justify-between pt-2 border-t border-slate-100">';
                            html += '<div><span class="text-lg font-bold text-primary-600">' + formattedPrice + '₫</span></div>';
                            html += '<form method="post" action="/add-product-to-cart/' + product.id + '" class="add-to-cart-form">';
                            html += '<input type="hidden" name="productId" value="' + product.id + '">';
                            html += '<input type="hidden" name="quantity" value="1">';
                            html += '<input type="hidden" name="' + csrfParamName + '" value="' + csrfToken + '">';
                            
                            if (!isOutOfStock) {
                                html += '<button type="submit" class="w-11 h-11 bg-gradient-to-br from-primary-500 to-primary-600 text-white rounded-xl font-semibold shadow-lg shadow-primary-500/30 hover:shadow-xl hover:shadow-primary-500/40 transition-all transform hover:scale-110 active:scale-95 flex items-center justify-center add-to-cart-btn relative overflow-hidden group/cart" data-product-id="' + product.id + '" data-no-loading="true">';
                                html += '<i class="fas fa-shopping-cart group-hover/cart:scale-110 transition-transform relative z-10"></i>';
                                html += '<span class="absolute inset-0 bg-white/20 rounded-xl transform scale-0 group-hover/cart:scale-100 transition-transform duration-300"></span>';
                                html += '</button>';
                            } else {
                                html += '<button type="button" disabled class="w-11 h-11 bg-gray-300 text-gray-500 rounded-xl font-semibold cursor-not-allowed flex items-center justify-center" title="Sản phẩm đã hết hàng" data-out-of-stock="true">';
                                html += '<i class="fas fa-shopping-cart"></i>';
                                html += '</button>';
                            }
                            html += '</form></div></div>';

                            html += '<div class="h-1 bg-gradient-to-r from-primary-400 via-accent-400 to-primary-500 transform scale-x-0 group-hover:scale-x-100 transition-transform duration-500 origin-left"></div>';
                            html += '</div>';

                            return html;
                        }

                        const backToTopBtn = document.querySelector('.back-to-top');
                        window.addEventListener('scroll', () => {
                            if (window.scrollY > 300) {
                                backToTopBtn.classList.remove('opacity-0', 'invisible');
                                backToTopBtn.classList.add('opacity-100', 'visible');
                            } else {
                                backToTopBtn.classList.add('opacity-0', 'invisible');
                                backToTopBtn.classList.remove('opacity-100', 'visible');
                            }
                        });

                        backToTopBtn.addEventListener('click', (e) => {
                            e.preventDefault();
                            window.scrollTo({ top: 0, behavior: 'smooth' });
                        });

                        const searchInput = document.getElementById('searchInput');
                        const searchSuggestions = document.getElementById('searchSuggestions');
                        const productsContainer = document.getElementById('productsContainer');
                        let searchTimeout;
                        let suggestionTimeout;

                        function removeVietnameseTones(str) {
                            if (!str) return '';
                            str = str.toLowerCase();
                            str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, 'a');
                            str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, 'e');
                            str = str.replace(/ì|í|ị|ỉ|ĩ/g, 'i');
                            str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, 'o');
                            str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, 'u');
                            str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, 'y');
                            str = str.replace(/đ/g, 'd');
                            return str;
                        }

                        function getWordsFromName(name) {
                            if (!name) return [];

                            return name.toLowerCase().split(/[\s\-\_\,\.\(\)\[\]\/\\]+/).filter(w => w.length > 0);
                        }

                        function filterProductsByVietnameseName(products, searchTerm) {
                            if (!searchTerm || !products || products.length === 0) {
                                return products;
                            }
                            
                            const searchTermLower = searchTerm.toLowerCase().trim();
                            const searchWords = searchTermLower.split(/\s+/).filter(w => w.length > 0);

                            const userTypedWithTones = searchTermLower !== removeVietnameseTones(searchTermLower);
                            
                            console.log('Search term:', searchTermLower);
                            console.log('Search words:', searchWords);
                            console.log('User typed with tones:', userTypedWithTones);
                            
                            return products.filter(product => {
                                if (!product.name) return false;
                                
                                const productName = product.name.toLowerCase();
                                const productWords = getWordsFromName(productName);

                                for (let si = 0; si < searchWords.length; si++) {
                                    const searchWord = searchWords[si];
                                    
                                    let wordMatched = false;
                                    
                                    if (userTypedWithTones) {

                                        for (const productWord of productWords) {
                                            if (productWord === searchWord || productWord.startsWith(searchWord)) {
                                                wordMatched = true;
                                                break;
                                            }
                                        }
                                    } else {

                                        const searchWordNoTones = removeVietnameseTones(searchWord);
                                        for (const productWord of productWords) {
                                            const productWordNoTones = removeVietnameseTones(productWord);
                                            if (productWordNoTones === searchWordNoTones || productWordNoTones.startsWith(searchWordNoTones)) {
                                                wordMatched = true;
                                                break;
                                            }
                                        }
                                    }

                                    if (!wordMatched) {
                                        return false;
                                    }
                                }
                                
                                return true;
                            });
                        }

                        function showSearchSuggestions(products, searchTerm) {

                            const filteredProducts = filterProductsByVietnameseName(products, searchTerm);
                            
                            if (!filteredProducts || filteredProducts.length === 0) {
                                searchSuggestions.classList.add('hidden');
                                return;
                            }
                            
                            const limitedProducts = filteredProducts.slice(0, 6);
                            let html = '';
                            
                            limitedProducts.forEach(product => {
                                const formattedPrice = new Intl.NumberFormat('vi-VN').format(product.price || 0);
                                html += '<a href="/product/' + product.id + '" class="suggestion-item flex items-center gap-3 p-3 hover:bg-slate-50 transition-colors border-b border-slate-100 last:border-b-0">';
                                html += '<img src="/images/product/' + product.image + '" alt="' + product.name + '" class="w-12 h-12 object-cover rounded-lg">';
                                html += '<div class="flex-1 min-w-0">';
                                html += '<h4 class="font-medium text-slate-800 text-sm line-clamp-1">' + product.name + '</h4>';
                                html += '<span class="text-primary-600 font-bold text-sm">' + formattedPrice + '₫</span>';
                                html += '</div>';
                                html += '</a>';
                            });
                            
                            if (filteredProducts.length > 6) {
                                html += '<div class="p-3 text-center border-t border-slate-100">';
                                html += '<button type="button" id="viewAllResults" class="text-primary-600 hover:text-primary-700 font-medium text-sm">Xem tất cả ' + filteredProducts.length + ' kết quả <i class="fas fa-arrow-right ml-1"></i></button>';
                                html += '</div>';
                            }
                            
                            searchSuggestions.innerHTML = html;
                            searchSuggestions.classList.remove('hidden');

                            document.getElementById('viewAllResults')?.addEventListener('click', () => {
                                searchSuggestions.classList.add('hidden');
                                performSearch(searchInput.value.trim());
                            });
                        }

                        function performSearch(searchTerm) {
                            if (!searchTerm) {
                                location.reload();
                                return;
                            }

                            const originalPagination = document.getElementById('originalPagination');
                            if (originalPagination) {
                                originalPagination.classList.add('hidden');
                            }
                            
                            productsContainer.innerHTML = '<div class="col-span-full text-center py-16"><div class="inline-block"><div class="animate-spin rounded-full h-16 w-16 border-4 border-primary-600 border-t-transparent"></div></div><p class="mt-4 text-gray-500">Đang tìm kiếm...</p></div>';

                            fetch('/search?keyword=' + encodeURIComponent(searchTerm))
                                .then(response => {
                                    if (!response.ok) {
                                        throw new Error('HTTP ' + response.status + ': ' + response.statusText);
                                    }
                                    return response.json();
                                })
                                .then(data => {
                                    let productList = Array.isArray(data) ? data : (data && data.products ? data.products : []);

                                    productList = filterProductsByVietnameseName(productList, searchTerm);

                                    allFilteredProducts = productList;
                                    currentFilterPage = 1;
                                    
                                    if (productList.length === 0) {
                                        productsContainer.innerHTML = '<div class="col-span-full text-center py-16"><div class="w-24 h-24 mx-auto mb-6 bg-slate-100 rounded-full flex items-center justify-center"><i class="fas fa-search text-4xl text-gray-300"></i></div><h3 class="text-xl font-bold text-gray-700 mb-2">Không tìm thấy sản phẩm nào cho "' + searchTerm + '"</h3><p class="text-gray-500">Hãy thử từ khóa khác</p></div>';
                                        document.getElementById('filterPagination')?.classList.add('hidden');
                                    } else {

                                        const firstPageProducts = productList.slice(0, PRODUCTS_PER_PAGE);
                                        renderProductResults(firstPageProducts);
                                        renderPagination(productList.length, 1);
                                    }
                                })
                                .catch(error => {
                                    console.error('Error searching:', error);
                                    productsContainer.innerHTML = '<div class="col-span-full text-center py-16"><div class="w-24 h-24 mx-auto mb-6 bg-red-100 rounded-full flex items-center justify-center"><i class="fas fa-exclamation-triangle text-4xl text-red-400"></i></div><h3 class="text-xl font-bold text-red-600 mb-2">Lỗi tìm kiếm</h3><p class="text-gray-500">' + error.message + '</p></div>';
                                    document.getElementById('filterPagination')?.classList.add('hidden');
                                });
                        }

                        searchInput.addEventListener('input', function (e) {
                            const searchTerm = e.target.value.trim();
                            
                            clearTimeout(suggestionTimeout);
                            
                            if (searchTerm === '') {
                                searchSuggestions.classList.add('hidden');
                                return;
                            }

                            suggestionTimeout = setTimeout(() => {
                                fetch('/search?keyword=' + encodeURIComponent(searchTerm))
                                    .then(response => response.json())
                                    .then(data => {
                                        const productList = Array.isArray(data) ? data : (data && data.products ? data.products : []);
                                        showSearchSuggestions(productList, searchTerm);
                                    })
                                    .catch(error => {
                                        console.error('Error fetching suggestions:', error);
                                        searchSuggestions.classList.add('hidden');
                                    });
                            }, 200);
                        });

                        searchInput.addEventListener('keydown', function(e) {
                            if (e.key === 'Enter') {
                                e.preventDefault();
                                searchSuggestions.classList.add('hidden');
                                performSearch(this.value.trim());
                            }
                        });

                        document.addEventListener('click', function(e) {
                            if (!searchInput.contains(e.target) && !searchSuggestions.contains(e.target)) {
                                searchSuggestions.classList.add('hidden');
                            }
                        });

                        searchInput.addEventListener('focus', function() {
                            if (this.value.trim() && searchSuggestions.innerHTML) {
                                searchSuggestions.classList.remove('hidden');
                            }
                        });

                        
                        const PRODUCTS_PER_PAGE = 9;
                        let currentFilterPage = 1;
                        let allFilteredProducts = [];
                        let currentFilterParams = null;

                        function renderProductResults(products, emptyMessage = 'Không tìm thấy sản phẩm') {
                            productsContainer.innerHTML = '';

                            if (!products || products.length === 0) {
                                productsContainer.innerHTML = '<div class="col-span-full text-center py-16"><div class="w-24 h-24 mx-auto mb-6 bg-slate-100 rounded-full flex items-center justify-center"><i class="fas fa-search text-4xl text-gray-300"></i></div><h3 class="text-xl font-bold text-gray-700 mb-2">' + emptyMessage + '</h3><p class="text-gray-500">Hãy thử từ khóa khác</p></div>';
                                return;
                            }

                            const csrfToken = document.querySelector('meta[name="_csrf"]')?.getAttribute('content');
                            const csrfParamName = document.querySelector('meta[name="_csrf_parameter"]')?.getAttribute('content') || '_csrf';

                            products.forEach((product) => {
                                const html = renderProductCard(product, csrfToken, csrfParamName);
                                productsContainer.insertAdjacentHTML('beforeend', html);
                            });
                        }

                        function renderPagination(totalProducts, currentPage) {
                            const totalPages = Math.ceil(totalProducts / PRODUCTS_PER_PAGE);
                            const paginationContainer = document.getElementById('filterPagination');
                            
                            if (!paginationContainer) return;
                            
                            if (totalPages <= 1) {
                                paginationContainer.classList.add('hidden');
                                return;
                            }
                            
                            paginationContainer.classList.remove('hidden');
                            
                            let html = '<nav class="flex items-center justify-center gap-2">';

                            if (currentPage > 1) {
                                html += '<button class="filter-page-btn w-10 h-10 flex items-center justify-center border-2 border-transparent text-primary-600 rounded-xl hover:bg-primary-50 hover:border-primary-200 transition-all font-semibold" data-page="' + (currentPage - 1) + '"><i class="fas fa-chevron-left"></i></button>';
                            }

                            for (let i = 1; i <= totalPages; i++) {
                                if (i === currentPage) {
                                    html += '<button class="w-10 h-10 flex items-center justify-center bg-gradient-to-r from-primary-600 to-primary-700 text-white rounded-xl font-bold shadow-md shadow-primary-500/30">' + i + '</button>';
                                } else {
                                    html += '<button class="filter-page-btn w-10 h-10 flex items-center justify-center border-2 border-transparent text-slate-700 rounded-xl hover:bg-slate-50 hover:border-slate-200 transition-all font-semibold" data-page="' + i + '">' + i + '</button>';
                                }
                            }

                            if (currentPage < totalPages) {
                                html += '<button class="filter-page-btn w-10 h-10 flex items-center justify-center border-2 border-transparent text-primary-600 rounded-xl hover:bg-primary-50 hover:border-primary-200 transition-all font-semibold" data-page="' + (currentPage + 1) + '"><i class="fas fa-chevron-right"></i></button>';
                            }
                            
                            html += '</nav>';
                            paginationContainer.innerHTML = html;

                            paginationContainer.querySelectorAll('.filter-page-btn').forEach(btn => {
                                btn.addEventListener('click', function() {
                                    const page = parseInt(this.dataset.page);
                                    goToFilterPage(page);
                                });
                            });
                        }

                        function goToFilterPage(page) {
                            currentFilterPage = page;
                            const startIndex = (page - 1) * PRODUCTS_PER_PAGE;
                            const endIndex = startIndex + PRODUCTS_PER_PAGE;
                            const pageProducts = allFilteredProducts.slice(startIndex, endIndex);
                            
                            renderProductResults(pageProducts);
                            renderPagination(allFilteredProducts.length, page);

                            productsContainer.scrollIntoView({ behavior: 'smooth', block: 'start' });
                        }

                        const btnFilter = document.getElementById('btnFilter');
                        btnFilter.addEventListener('click', async function () {
                            const factories = Array.from(document.querySelectorAll('.factory-filter:checked')).map(el => el.value);
                            const targets = Array.from(document.querySelectorAll('.target-filter:checked')).map(el => el.value);
                            const prices = Array.from(document.querySelectorAll('.price-filter:checked')).map(el => el.value);
                            const sort = document.querySelector('.sort-radio:checked')?.value || 'gia-nothing';

                            const params = new URLSearchParams();
                            factories.forEach(f => params.append('factories', f));
                            targets.forEach(t => params.append('targets', t));
                            prices.forEach(p => params.append('prices', p));
                            params.append('sort', sort);
                            
                            currentFilterParams = params;

                            const originalPagination = document.getElementById('originalPagination');
                            if (originalPagination) {
                                originalPagination.classList.add('hidden');
                            }

                            try {
                                productsContainer.innerHTML = '<div class="col-span-full text-center py-16"><div class="inline-block"><div class="animate-spin rounded-full h-16 w-16 border-4 border-primary-600 border-t-transparent"></div></div><p class="mt-4 text-gray-500">Đang lọc sản phẩm...</p></div>';

                                const response = await fetch('/products/filter-data?' + params.toString());
                                const data = await response.json();
                                console.log('Filter API response:', data);

                                allFilteredProducts = data || [];
                                currentFilterPage = 1;

                                if (allFilteredProducts.length === 0) {
                                    productsContainer.innerHTML = '<div class="col-span-full text-center py-16"><div class="w-24 h-24 mx-auto mb-6 bg-slate-100 rounded-full flex items-center justify-center"><i class="fas fa-filter text-4xl text-gray-300"></i></div><h3 class="text-xl font-bold text-gray-700 mb-2">Không tìm thấy sản phẩm</h3><p class="text-gray-500">Hãy thử thay đổi bộ lọc</p></div>';
                                    document.getElementById('filterPagination')?.classList.add('hidden');
                                } else {

                                    const filterInfo = document.getElementById('filterInfo');
                                    const filterResultCount = document.getElementById('filterResultCount');
                                    if (filterInfo) {
                                        filterInfo.classList.remove('hidden');
                                        filterResultCount.textContent = 'Tìm thấy ' + allFilteredProducts.length + ' sản phẩm';
                                    }

                                    const firstPageProducts = allFilteredProducts.slice(0, PRODUCTS_PER_PAGE);
                                    renderProductResults(firstPageProducts);
                                    renderPagination(allFilteredProducts.length, 1);
                                }
                            } catch (error) {
                                console.error('Error filtering:', error);
                                productsContainer.innerHTML = '<div class="col-span-full text-center py-16"><div class="w-24 h-24 mx-auto mb-6 bg-red-100 rounded-full flex items-center justify-center"><i class="fas fa-exclamation-triangle text-4xl text-red-400"></i></div><h3 class="text-xl font-bold text-red-600 mb-2">Lỗi lọc sản phẩm</h3><p class="text-gray-500">' + error.message + '</p></div>';
                            }
                        });
                    </script>
                </body>

                </html>