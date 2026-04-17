<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Trang chủ - FURNITURE STORE</title>
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
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
                    <link href="/client/css/style.css" rel="stylesheet">
                    <link href="/client/css/override.css" rel="stylesheet">
                    <link href="/client/css/effects.css" rel="stylesheet">
                    <meta name="_csrf" content="${_csrf.token}" />
                    <meta name="_csrf_header" content="${_csrf.headerName}" />
                    <style>
                        * {
                            margin: 0;
                            padding: 0;
                            box-sizing: border-box;
                        }

                        html {
                            scroll-behavior: smooth;
                        }

                        body {
                            font-family: 'Open Sans', sans-serif;
                        }

                        .spinner-show {
                            opacity: 1;
                            visibility: visible;
                        }

                        .spinner-hide {
                            opacity: 0;
                            visibility: hidden;
                        }

                        
                        .testimonial-carousel,
                        .news-carousel {
                            position: relative;
                        }

                        .testimonial-track,
                        .news-track {
                            display: flex;
                            transition: transform 0.5s cubic-bezier(0.4, 0, 0.2, 1);
                        }

                        .testimonial-slide,
                        .news-slide {
                            flex-shrink: 0;
                            padding: 0 1rem;
                            padding-bottom: 1rem;
                        }

                       
                        .testimonial-slide>div,
                        .news-slide>article {
                            box-shadow: 0 10px 40px -10px rgba(0, 0, 0, 0.1);
                        }

                        .testimonial-slide>div:hover,
                        .news-slide>article:hover {
                            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
                        }

                        
                        .line-clamp-2 {
                            display: -webkit-box;
                            -webkit-line-clamp: 2;
                            -webkit-box-orient: vertical;
                            overflow: hidden;
                        }

                        .line-clamp-3 {
                            display: -webkit-box;
                            -webkit-line-clamp: 3;
                            -webkit-box-orient: vertical;
                            overflow: hidden;
                        }
                    </style>
                </head>

                <body class="tw-bg-gradient-to-br tw-from-slate-50 tw-to-slate-100">

                   
                    <div id="spinner"
                        class="spinner-show tw-fixed tw-inset-0 tw-w-full tw-h-full tw-bg-white tw-flex tw-items-center tw-justify-center tw-z-50 tw-transition-all tw-duration-800">
                        <div class="tw-relative tw-w-16 tw-h-16">
                            <div
                                class="tw-animate-spin tw-rounded-full tw-h-16 tw-w-16 tw-border-4 tw-border-primary-600 tw-border-t-transparent">
                            </div>
                        </div>
                    </div>
                    

                    <jsp:include page="../layout/header-tailwind.jsp" />
                    <jsp:include page="../layout/banner-tailwind.jsp" />

                    <!-- Metrics Section -->
                    <section class="tw-w-full tw-py-32 tw-bg-gradient-to-br tw-from-white tw-to-slate-50">
                        <div class="tw-max-w-7xl tw-mx-auto tw-px-4">
                            <!-- Section Header -->
                            <div class="tw-text-center tw-mb-20">
                                <p
                                    class="tw-text-primary-700 tw-text-sm tw-font-bold tw-tracking-widest tw-uppercase tw-mb-4">
                                    Con số nói lên tất cả</p>
                                <h2 class="tw-text-4xl md:tw-text-5xl tw-font-bold tw-text-slate-900 tw-mb-4">Tại sao
                                    khách hàng tin tưởng chúng tôi</h2>
                                <p class="tw-text-xl tw-text-gray-600 tw-max-w-2xl tw-mx-auto tw-leading-relaxed">
                                    Hơn một thập kỷ nỗ lực tạo ra những sản phẩm nội thất chất lượng cao với giá tốt
                                    nhất
                                </p>
                            </div>

                            <!-- Metrics Cards -->
                            <div class="tw-grid tw-grid-cols-1 md:tw-grid-cols-2 lg:tw-grid-cols-4 tw-gap-8">
                                <!-- Card 1 -->
                                <div
                                    class="tw-group tw-relative tw-bg-white tw-rounded-2xl tw-p-8 md:tw-p-10 tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 hover:tw--translate-y-3 tw-border tw-border-slate-200 hover:tw-border-primary-600 tw-overflow-hidden">
                                    <div
                                        class="tw-absolute tw-top-0 tw-right-0 tw-w-20 tw-h-20 tw-bg-primary-50 tw-rounded-full tw--mr-10 tw--mt-10 group-hover:tw-scale-150 tw-transition-transform tw-duration-500">
                                    </div>
                                    <div class="tw-relative tw-z-10">
                                        <div
                                            class="tw-w-14 tw-h-14 tw-bg-gradient-to-br tw-from-primary-500 tw-to-primary-700 tw-rounded-xl tw-flex tw-items-center tw-justify-center tw-mb-6 group-hover:tw-scale-110 tw-transition-transform">
                                            <i class="fas fa-hammer tw-text-white tw-text-2xl"></i>
                                        </div>
                                        <p
                                            class="tw-text-primary-700 tw-text-xs tw-font-bold tw-tracking-widest tw-uppercase tw-mb-3">
                                            Kinh nghiệm</p>
                                        <p class="tw-text-5xl tw-font-bold tw-text-slate-900 tw-mb-2">12+</p>
                                        <p class="tw-text-gray-600 tw-font-semibold">Năm chế tác nội thất</p>
                                        <p class="tw-text-gray-500 tw-text-sm tw-mt-2">12 xưởng trên khắp Việt Nam</p>
                                    </div>
                                </div>

                                <!-- Card 2 -->
                                <div
                                    class="tw-group tw-relative tw-bg-white tw-rounded-2xl tw-p-8 md:tw-p-10 tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 hover:tw--translate-y-3 tw-border tw-border-slate-200 hover:tw-border-accent-500 tw-overflow-hidden">
                                    <div
                                        class="tw-absolute tw-top-0 tw-right-0 tw-w-20 tw-h-20 tw-bg-accent-50 tw-rounded-full tw--mr-10 tw--mt-10 group-hover:tw-scale-150 tw-transition-transform tw-duration-500">
                                    </div>
                                    <div class="tw-relative tw-z-10">
                                        <div
                                            class="tw-w-14 tw-h-14 tw-bg-gradient-to-br tw-from-accent-400 tw-to-accent-600 tw-rounded-xl tw-flex tw-items-center tw-justify-center tw-mb-6 group-hover:tw-scale-110 tw-transition-transform">
                                            <i class="fas fa-pencil-ruler tw-text-white tw-text-2xl"></i>
                                        </div>
                                        <p
                                            class="tw-text-accent-600 tw-text-xs tw-font-bold tw-tracking-widest tw-uppercase tw-mb-3">
                                            Sáng tạo</p>
                                        <p class="tw-text-5xl tw-font-bold tw-text-slate-900 tw-mb-2">340+</p>
                                        <p class="tw-text-gray-600 tw-font-semibold">Thiết kế theo yêu cầu</p>
                                        <p class="tw-text-gray-500 tw-text-sm tw-mt-2">Hoàn thiện thủ công mỗi tuần</p>
                                    </div>
                                </div>

                                <!-- Card 3 -->
                                <div
                                    class="tw-group tw-relative tw-bg-white tw-rounded-2xl tw-p-8 md:tw-p-10 tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 hover:tw--translate-y-3 tw-border tw-border-slate-200 hover:tw-border-red-700 tw-overflow-hidden">
                                    <div
                                        class="tw-absolute tw-top-0 tw-right-0 tw-w-20 tw-h-20 tw-bg-red-50 tw-rounded-full tw--mr-10 tw--mt-10 group-hover:tw-scale-150 tw-transition-transform tw-duration-500">
                                    </div>
                                    <div class="tw-relative tw-z-10">
                                        <div
                                            class="tw-w-14 tw-h-14 tw-bg-gradient-to-br tw-from-red-500 tw-to-rose-600 tw-rounded-xl tw-flex tw-items-center tw-justify-center tw-mb-6 group-hover:tw-scale-110 tw-transition-transform">
                                            <i class="fas fa-star tw-text-white tw-text-2xl"></i>
                                        </div>
                                        <p
                                            class="tw-text-red-600 tw-text-xs tw-font-bold tw-tracking-widest tw-uppercase tw-mb-3">
                                            Hạnh phúc</p>
                                        <p class="tw-text-5xl tw-font-bold tw-text-slate-900 tw-mb-2">9K</p>
                                        <p class="tw-text-gray-600 tw-font-semibold">Gia đình hài lòng</p>
                                        <p class="tw-text-gray-500 tw-text-sm tw-mt-2">Đánh giá trung bình 4.9/5 ⭐</p>
                                    </div>
                                </div>

                                <!-- Card 4 -->
                                <div
                                    class="tw-group tw-relative tw-bg-white tw-rounded-2xl tw-p-8 md:tw-p-10 tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 hover:tw--translate-y-3 tw-border tw-border-slate-200 hover:tw-border-primary-700 tw-overflow-hidden">
                                    <div
                                        class="tw-absolute tw-top-0 tw-right-0 tw-w-20 tw-h-20 tw-bg-green-50 tw-rounded-full tw--mr-10 tw--mt-10 group-hover:tw-scale-150 tw-transition-transform tw-duration-500">
                                    </div>
                                    <div class="tw-relative tw-z-10">
                                        <div
                                            class="tw-w-14 tw-h-14 tw-bg-gradient-to-br tw-from-primary-600 tw-to-primary-700 tw-rounded-xl tw-flex tw-items-center tw-justify-center tw-mb-6 group-hover:tw-scale-110 tw-transition-transform">
                                            <i class="fas fa-leaf tw-text-white tw-text-2xl"></i>
                                        </div>
                                        <p
                                            class="tw-text-primary-700 tw-text-xs tw-font-bold tw-tracking-widest tw-uppercase tw-mb-3">
                                            Bền vững</p>
                                        <p class="tw-text-5xl tw-font-bold tw-text-slate-900 tw-mb-2">72%</p>
                                        <p class="tw-text-gray-600 tw-font-semibold">Vật liệu xanh</p>
                                        <p class="tw-text-gray-500 tw-text-sm tw-mt-2">Gỗ đạt chứng chỉ bền vững</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Collections Section -->
                    <section class="tw-w-full tw-py-32 tw-bg-white">
                        <div class="tw-max-w-7xl tw-mx-auto tw-px-4">
                            <!-- Section Header -->
                            <div class="tw-mb-20">
                                <p
                                    class="tw-text-primary-700 tw-text-sm tw-font-bold tw-tracking-widest tw-uppercase tw-mb-4">
                                    Bộ sưu tập độc quyền</p>
                                <div
                                    class="tw-flex tw-flex-col lg:tw-flex-row lg:tw-items-end lg:tw-justify-between tw-gap-8">
                                    <div class="tw-flex-1">
                                        <h2
                                            class="tw-text-4xl md:tw-text-5xl tw-font-bold tw-text-slate-900 tw-mb-4 tw-leading-tight">
                                            Tinh tuyển cảm hứng từ lối sống hiện đại
                                        </h2>
                                        <p class="tw-text-lg tw-text-gray-600 tw-leading-relaxed">
                                            Khám phá các bộ sưu tập được curated kỹ lưỡng, mỗi phòng một câu chuyện, mỗi
                                            sản phẩm một đặc sắc
                                        </p>
                                    </div>
                                    <a href="/products"
                                        class="tw-px-8 tw-py-4 tw-bg-gradient-to-r tw-from-primary-500 tw-to-primary-700 tw-text-white tw-rounded-xl tw-font-bold hover:tw-shadow-lg tw-transition-all tw-transform hover:tw-scale-105 tw-whitespace-nowrap tw-h-fit">
                                        Xem danh mục →
                                    </a>
                                </div>
                            </div>

                            <!-- Collection Cards -->
                            <div class="tw-grid tw-grid-cols-1 md:tw-grid-cols-2 lg:tw-grid-cols-3 tw-gap-8">
                                <!-- Collection Card 1 -->
                                <a href="/products"
                                    class="tw-group tw-relative tw-h-96 tw-rounded-3xl tw-overflow-hidden tw-shadow-xl hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-block">
                                    <div
                                        class="tw-absolute tw-inset-0 tw-bg-gradient-to-t tw-from-black/70 tw-via-black/30 tw-to-transparent tw-z-10">
                                    </div>
                                    <img src="https://images.unsplash.com/photo-1484101403633-562f891dc89a?auto=format&fit=crop&w=800&q=80"
                                        alt="Phòng khách"
                                        class="tw-absolute tw-inset-0 tw-w-full tw-h-full tw-object-cover group-hover:tw-scale-110 tw-transition-transform tw-duration-700">

                                    <div
                                        class="tw-absolute tw-inset-0 tw-flex tw-flex-col tw-justify-between tw-p-8 tw-z-20">
                                        <div class="tw-text-right">
                                            <span
                                                class="tw-inline-block tw-px-4 tw-py-2 tw-bg-primary-600/90 tw-backdrop-blur-sm tw-text-white tw-text-xs tw-font-bold tw-rounded-full tw-shadow-lg">
                                                <i class="fas fa-chair tw-mr-2"></i> Phòng khách
                                            </span>
                                        </div>
                                        <div
                                            class="tw-transform group-hover:tw-translate-y-0 tw-translate-y-2 tw-transition-transform tw-duration-300">
                                            <h3
                                                class="tw-text-white tw-text-2xl md:tw-text-3xl tw-font-bold tw-mb-3 tw-leading-tight">
                                                Đường nét mềm mại & ánh sáng ấm</h3>
                                            <p
                                                class="tw-text-white/90 tw-text-base tw-mb-6 tw-leading-relaxed tw-opacity-0 group-hover:tw-opacity-100 tw-transition-opacity tw-duration-300">
                                                Sofa dáng thấp, bàn trà module, chất liệu trung tính kết hợp tinh tế để
                                                tạo nên một góc phòng khách tuyệt vời.</p>
                                            <div
                                                class="tw-inline-block tw-px-4 tw-py-2 tw-bg-accent-400 tw-text-slate-900 tw-rounded-lg tw-font-bold tw-text-sm tw-shadow-lg tw-transform group-hover:tw-scale-105 tw-transition-transform">
                                                Khám phá ngay <i class="fas fa-arrow-right tw-ml-2"></i>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                                <!-- Collection Card 2 -->
                                <a href="/products"
                                    class="tw-group tw-relative tw-h-96 tw-rounded-3xl tw-overflow-hidden tw-shadow-xl hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-block">
                                    <div
                                        class="tw-absolute tw-inset-0 tw-bg-gradient-to-t tw-from-black/70 tw-via-black/30 tw-to-transparent tw-z-10">
                                    </div>
                                    <img src="https://images.unsplash.com/photo-1505691938895-1758d7feb511?auto=format&fit=crop&w=800&q=80"
                                        alt="Phòng ngủ"
                                        class="tw-absolute tw-inset-0 tw-w-full tw-h-full tw-object-cover group-hover:tw-scale-110 tw-transition-transform tw-duration-700">

                                    <div
                                        class="tw-absolute tw-inset-0 tw-flex tw-flex-col tw-justify-between tw-p-8 tw-z-20">
                                        <div class="tw-text-right">
                                            <span
                                                class="tw-inline-block tw-px-4 tw-py-2 tw-bg-primary-600/90 tw-backdrop-blur-sm tw-text-white tw-text-xs tw-font-bold tw-rounded-full tw-shadow-lg">
                                                <i class="fas fa-bed tw-mr-2"></i> Phòng ngủ
                                            </span>
                                        </div>
                                        <div
                                            class="tw-transform group-hover:tw-translate-y-0 tw-translate-y-2 tw-transition-transform tw-duration-300">
                                            <h3
                                                class="tw-text-white tw-text-2xl md:tw-text-3xl tw-font-bold tw-mb-3 tw-leading-tight">
                                                Sắc trung tính cho buổi sáng chậm rãi</h3>
                                            <p
                                                class="tw-text-white/90 tw-text-base tw-mb-6 tw-leading-relaxed tw-opacity-0 group-hover:tw-opacity-100 tw-transition-opacity tw-duration-300">
                                                Giường bọc nệm cao cấp, tab đầu giường có ổ điện tiện lợi, đèn ngủ dịu
                                                nhẹ cho một giấc ngủ ngon.</p>
                                            <div
                                                class="tw-inline-block tw-px-4 tw-py-2 tw-bg-accent-400 tw-text-slate-900 tw-rounded-lg tw-font-bold tw-text-sm tw-shadow-lg tw-transform group-hover:tw-scale-105 tw-transition-transform">
                                                Tăng thêm ấm cúng <i class="fas fa-arrow-right tw-ml-2"></i>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                                <!-- Collection Card 3 -->
                                <a href="/products"
                                    class="tw-group tw-relative tw-h-96 tw-rounded-3xl tw-overflow-hidden tw-shadow-xl hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-block">
                                    <div
                                        class="tw-absolute tw-inset-0 tw-bg-gradient-to-t tw-from-black/70 tw-via-black/30 tw-to-transparent tw-z-10">
                                    </div>
                                    <img src="https://images.unsplash.com/photo-1524758870432-af57e54afa26?auto=format&fit=crop&w=800&q=80"
                                        alt="Góc làm việc"
                                        class="tw-absolute tw-inset-0 tw-w-full tw-h-full tw-object-cover group-hover:tw-scale-110 tw-transition-transform tw-duration-700">

                                    <div
                                        class="tw-absolute tw-inset-0 tw-flex tw-flex-col tw-justify-between tw-p-8 tw-z-20">
                                        <div class="tw-text-right">
                                            <span
                                                class="tw-inline-block tw-px-4 tw-py-2 tw-bg-primary-600/90 tw-backdrop-blur-sm tw-text-white tw-text-xs tw-font-bold tw-rounded-full tw-shadow-lg">
                                                <i class="fas fa-cube tw-mr-2"></i> Góc làm việc
                                            </span>
                                        </div>
                                        <div
                                            class="tw-transform group-hover:tw-translate-y-0 tw-translate-y-2 tw-transition-transform tw-duration-300">
                                            <h3
                                                class="tw-text-white tw-text-2xl md:tw-text-3xl tw-font-bold tw-mb-3 tw-leading-tight">
                                                Bàn nổi bật & lưu trữ thông minh</h3>
                                            <p
                                                class="tw-text-white/90 tw-text-base tw-mb-6 tw-leading-relaxed tw-opacity-0 group-hover:tw-opacity-100 tw-transition-opacity tw-duration-300">
                                                Kệ treo tường hiện đại, bàn làm việc không dây, ghế công thái học thoáng
                                                khí cho môi trường làm việc lý tưởng.</p>
                                            <div
                                                class="tw-inline-block tw-px-4 tw-py-2 tw-bg-accent-400 tw-text-slate-900 tw-rounded-lg tw-font-bold tw-text-sm tw-shadow-lg tw-transform group-hover:tw-scale-105 tw-transition-transform">
                                                Thiết kế góc làm việc <i class="fas fa-arrow-right tw-ml-2"></i>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </section>

                    <!-- Story Section -->
                    <section class="tw-w-full tw-py-32 tw-bg-slate-900 tw-relative tw-overflow-hidden">
                        <!-- Background Pattern -->
                        <div class="tw-absolute tw-inset-0 tw-opacity-10">
                            <div class="tw-absolute tw-inset-0"
                                style="background-image: url('https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?auto=format&fit=crop&w=1920&q=80'); background-size: cover; background-position: center;">
                            </div>
                        </div>
                        <div
                            class="tw-absolute tw-inset-0 tw-bg-gradient-to-br tw-from-slate-900/95 tw-via-slate-800/90 tw-to-primary-900/80">
                        </div>

                        
                        <div
                            class="tw-absolute tw-top-20 tw-left-20 tw-w-72 tw-h-72 tw-bg-primary-500/20 tw-rounded-full tw-blur-3xl">
                        </div>
                        <div
                            class="tw-absolute tw-bottom-20 tw-right-20 tw-w-96 tw-h-96 tw-bg-accent-500/20 tw-rounded-full tw-blur-3xl">
                        </div>

                        <div class="tw-max-w-7xl tw-mx-auto tw-px-4 tw-relative tw-z-10">
                            <!-- Section Header -->
                            <div class="tw-text-center tw-mb-20">
                                <p
                                    class="tw-text-primary-400 tw-text-sm tw-font-bold tw-tracking-widest tw-uppercase tw-mb-4">
                                    <i class="fas fa-gem tw-mr-2"></i> Lựa chọn hàng tuần
                                </p>
                                <h2 class="tw-text-4xl md:tw-text-5xl tw-font-bold tw-text-white tw-mb-4">Sản phẩm tiêu
                                    biểu</h2>
                                <p class="tw-text-lg tw-text-gray-300 tw-max-w-2xl tw-mx-auto">Bảng cảm hứng được
                                    curated từ các sản phẩm yêu thích nhất của khách hàng</p>
                            </div>

                            <!-- Story Content -->
                            <div class="tw-grid tw-grid-cols-1 lg:tw-grid-cols-2 tw-gap-12 tw-items-stretch">
                                
                                <div
                                    class="tw-relative tw-rounded-3xl tw-overflow-hidden tw-min-h-[650px] tw-shadow-2xl tw-group">
                                    
                                    <img src="https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?auto=format&fit=crop&w=800&q=80"
                                        alt="Living room inspiration"
                                        class="tw-absolute tw-inset-0 tw-w-full tw-h-full tw-object-cover group-hover:tw-scale-110 tw-transition-transform tw-duration-700">

                                    
                                    <div
                                        class="tw-absolute tw-inset-0 tw-bg-gradient-to-t tw-from-black/90 tw-via-black/50 tw-to-black/20">
                                    </div>

                                    
                                    <div
                                        class="tw-absolute tw-inset-4 tw-border-2 tw-border-white/20 tw-rounded-2xl tw-pointer-events-none">
                                    </div>

                                    
                                    <div
                                        class="tw-absolute tw-inset-0 tw-flex tw-flex-col tw-justify-end tw-p-10 md:tw-p-14">
                                        <span
                                            class="tw-inline-block tw-w-fit tw-px-5 tw-py-2 tw-bg-primary-500/90 tw-backdrop-blur-sm tw-text-white tw-text-xs tw-font-bold tw-rounded-full tw-mb-6 tw-shadow-lg">
                                            <i class="fas fa-sparkles tw-mr-2"></i> Bảng cảm hứng trong tuần
                                        </span>
                                        <h3
                                            class="tw-text-white tw-text-3xl md:tw-text-4xl tw-font-bold tw-mb-6 tw-leading-tight tw-drop-shadow-lg">
                                            Gỗ sồi tự nhiên, vải xanh sage và điểm nhấn cam
                                        </h3>
                                        <p class="tw-text-white/90 tw-leading-relaxed tw-text-lg tw-mb-8 tw-max-w-lg">
                                            Chúng tôi kết hợp những đường nét vượt thời gian với bề mặt chạm tay mềm mại
                                            để mỗi căn phòng đều vừa tinh gọn vừa ấm áp.
                                        </p>

                                        
                                        <div
                                            class="tw-flex tw-gap-8 tw-mb-8 tw-p-4 tw-bg-white/10 tw-backdrop-blur-sm tw-rounded-2xl tw-w-fit">
                                            <div class="tw-text-center">
                                                <p class="tw-text-3xl tw-font-bold tw-text-white">150+</p>
                                                <p class="tw-text-white/70 tw-text-sm">Sản phẩm</p>
                                            </div>
                                            <div class="tw-w-px tw-bg-white/30"></div>
                                            <div class="tw-text-center">
                                                <p class="tw-text-3xl tw-font-bold tw-text-accent-400">4.9</p>
                                                <p class="tw-text-white/70 tw-text-sm">Đánh giá</p>
                                            </div>
                                            <div class="tw-w-px tw-bg-white/30"></div>
                                            <div class="tw-text-center">
                                                <p class="tw-text-3xl tw-font-bold tw-text-white">2K+</p>
                                                <p class="tw-text-white/70 tw-text-sm">Khách hàng</p>
                                            </div>
                                        </div>

                                        <a href="/products"
                                            class="tw-inline-block tw-w-fit tw-px-8 tw-py-4 tw-bg-gradient-to-r tw-from-primary-500 tw-to-primary-600 tw-text-white tw-rounded-xl tw-font-bold hover:tw-shadow-lg hover:tw-shadow-primary-500/30 tw-transition-all tw-transform hover:tw-scale-105">
                                            Xem bộ sưu tập <i class="fas fa-arrow-right tw-ml-2"></i>
                                        </a>
                                    </div>
                                </div>

                                <!-- Top Products -->
                                <div
                                    class="tw-bg-white tw-rounded-3xl tw-p-8 md:tw-p-10 tw-shadow-2xl tw-transition-all tw-duration-300 tw-border tw-border-slate-200">
                                    <div class="tw-mb-8">
                                        <div class="tw-flex tw-items-center tw-justify-between tw-mb-4">
                                            <p
                                                class="tw-text-primary-700 tw-text-sm tw-font-bold tw-tracking-widest tw-uppercase">
                                                <i class="fas fa-trophy tw-text-accent-400 tw-mr-2"></i> Tâm điểm trong
                                                tuần
                                            </p>
                                            <span
                                                class="tw-px-3 tw-py-1 tw-bg-red-500 tw-text-white tw-text-xs tw-font-bold tw-rounded-full tw-animate-pulse tw-shadow-lg">
                                                🔥 HOT
                                            </span>
                                        </div>
                                        <h3 class="tw-text-slate-900 tw-text-3xl md:tw-text-4xl tw-font-bold">Yêu thích
                                            nhất</h3>
                                        <div
                                            class="tw-w-20 tw-h-1.5 tw-bg-gradient-to-r tw-from-primary-600 tw-via-accent-400 tw-to-primary-700 tw-rounded-full tw-mt-4">
                                        </div>
                                    </div>

                                    <c:choose>
                                        <c:when test="${not empty products}">
                                            <div class="tw-space-y-4">
                                                <c:forEach var="product" items="${products}" varStatus="status">
                                                    <c:if test="${status.index lt 3}">
                                                        <a href="/product/${product.id}"
                                                            class="tw-group tw-flex tw-gap-4 tw-p-4 tw-rounded-2xl tw-bg-gradient-to-r tw-from-slate-50 tw-to-white hover:tw-from-primary-50 hover:tw-to-accent-50 tw-transition-all tw-duration-300 tw-border-2 tw-border-slate-100 hover:tw-border-primary-500 tw-relative tw-overflow-hidden tw-shadow-sm hover:tw-shadow-lg">
                                                            
                                                            <div
                                                                class="tw-flex-shrink-0 tw-w-20 tw-h-20 tw-rounded-xl tw-overflow-hidden tw-shadow-md tw-relative">
                                                                <img src="/images/product/${product.image}"
                                                                    alt="${product.name}"
                                                                    class="tw-w-full tw-h-full tw-object-cover group-hover:tw-scale-110 tw-transition-transform tw-duration-500">
                                                                
                                                                <div
                                                                    class="tw-absolute tw-top-0 tw-left-0 tw-w-7 tw-h-7 tw-bg-gradient-to-br tw-from-primary-600 tw-to-primary-700 tw-flex tw-items-center tw-justify-center tw-text-white tw-font-bold tw-text-xs tw-rounded-br-lg tw-shadow">
                                                                    ${status.count}
                                                                    <c:if test="${status.index eq 0}">
                                                                        <i
                                                                            class="fas fa-crown tw-text-accent-400 tw-absolute tw--top-1 tw--right-1 tw-text-[8px]"></i>
                                                                    </c:if>
                                                                </div>
                                                            </div>

                                                            <!-- Product Info -->
                                                            <div class="tw-flex-1 tw-min-w-0">
                                                                <p
                                                                    class="tw-font-bold tw-text-slate-900 tw-text-base tw-mb-1 group-hover:tw-text-primary-600 tw-transition-colors line-clamp-1">
                                                                    ${product.name}
                                                                </p>
                                                                <p
                                                                    class="tw-text-gray-500 tw-text-sm tw-mb-2 line-clamp-1">
                                                                    ${product.shortDesc}
                                                                </p>
                                                                <div class="tw-flex tw-items-center tw-gap-3">
                                                                    <span class="tw-flex tw-items-center tw-text-sm">
                                                                        <i
                                                                            class="fas fa-star tw-text-yellow-400 tw-mr-1"></i>
                                                                        <span
                                                                            class="tw-text-gray-600 tw-font-semibold">4.9</span>
                                                                    </span>
                                                                    <span class="tw-text-gray-300">|</span>
                                                                    <span class="tw-text-gray-500 tw-text-xs">
                                                                        <i class="fas fa-shopping-bag tw-mr-1"></i>Đã
                                                                        bán 128
                                                                    </span>
                                                                </div>
                                                            </div>

                                                            
                                                            <div
                                                                class="tw-text-right tw-flex-shrink-0 tw-flex tw-flex-col tw-justify-center">
                                                                <div
                                                                    class="tw-text-xl tw-font-bold tw-text-primary-600 tw-whitespace-nowrap">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" />₫
                                                                </div>
                                                                <span
                                                                    class="tw-px-2 tw-py-0.5 tw-bg-accent-100 tw-text-accent-700 tw-text-xs tw-font-semibold tw-rounded tw-mt-1 tw-inline-block">
                                                                    Best Seller
                                                                </span>
                                                            </div>

                                                            
                                                            <div
                                                                class="tw-absolute tw-right-3 tw-top-1/2 tw--translate-y-1/2 tw-opacity-0 group-hover:tw-opacity-100 tw-transform tw-translate-x-2 group-hover:tw-translate-x-0 tw-transition-all">
                                                                <i class="fas fa-chevron-right tw-text-primary-500"></i>
                                                            </div>
                                                        </a>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="tw-text-center tw-py-12">
                                                <i class="fas fa-box-open tw-text-6xl tw-text-gray-300 tw-mb-4"></i>
                                                <p class="tw-text-gray-500">Danh mục đang được cập nhật. Vui lòng quay
                                                    lại sau ít phút.</p>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                    <div class="tw-mt-8 tw-pt-6 tw-border-t-2 tw-border-slate-100">
                                        <a href="/products"
                                            class="tw-group tw-flex tw-items-center tw-justify-center tw-gap-3 tw-w-full tw-px-6 tw-py-4 tw-bg-gradient-to-r tw-from-primary-600 tw-to-primary-700 tw-text-white tw-rounded-xl tw-font-bold hover:tw-shadow-lg hover:tw-shadow-primary-500/30 tw-transition-all tw-transform hover:tw-scale-[1.02]">
                                            <span>Xem tất cả sản phẩm yêu thích</span>
                                            <i
                                                class="fas fa-arrow-right group-hover:tw-translate-x-2 tw-transition-transform"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Showcase Section -->
                    <section
                        class="tw-w-full tw-py-24 tw-bg-gradient-to-br tw-from-slate-50 tw-via-white tw-to-primary-50/30 tw-relative tw-overflow-hidden">
                        
                        <div
                            class="tw-absolute tw-top-0 tw-left-0 tw-w-96 tw-h-96 tw-bg-primary-100/40 tw-rounded-full tw-blur-3xl tw--translate-x-1/2 tw--translate-y-1/2">
                        </div>
                        <div
                            class="tw-absolute tw-bottom-0 tw-right-0 tw-w-80 tw-h-80 tw-bg-accent-100/40 tw-rounded-full tw-blur-3xl tw-translate-x-1/3 tw-translate-y-1/3">
                        </div>
                        <div
                            class="tw-absolute tw-top-1/2 tw-left-1/2 tw--translate-x-1/2 tw--translate-y-1/2 tw-w-[800px] tw-h-[800px] tw-bg-gradient-to-br tw-from-primary-50/20 tw-to-accent-50/20 tw-rounded-full tw-blur-3xl">
                        </div>

                        <div class="tw-max-w-7xl tw-mx-auto tw-px-4 tw-relative tw-z-10">
                            <!-- Section Header -->
                            <div class="tw-mb-16">
                                <div class="tw-flex tw-items-center tw-gap-3 tw-mb-6">
                                    <div
                                        class="tw-w-12 tw-h-1 tw-bg-gradient-to-r tw-from-primary-500 tw-to-primary-600 tw-rounded-full">
                                    </div>
                                    <p
                                        class="tw-text-primary-600 tw-text-sm tw-font-bold tw-tracking-widest tw-uppercase">
                                        Hàng mới cập nhật</p>
                                    <span
                                        class="tw-px-3 tw-py-1 tw-bg-red-500 tw-text-white tw-text-xs tw-font-bold tw-rounded-full tw-animate-pulse tw-shadow-lg">
                                        NEW
                                    </span>
                                </div>

                                <div
                                    class="tw-flex tw-flex-col lg:tw-flex-row lg:tw-items-end lg:tw-justify-between tw-gap-8 tw-mb-10">
                                    <div class="tw-flex-1 tw-max-w-2xl">
                                        <h2
                                            class="tw-text-4xl md:tw-text-5xl tw-font-extrabold tw-text-slate-900 tw-mb-5 tw-leading-tight">
                                            Thiết kế nổi bật cho
                                            <span
                                                class="tw-text-transparent tw-bg-clip-text tw-bg-gradient-to-r tw-from-primary-600 tw-to-accent-500">
                                                sinh hoạt hằng ngày</span>
                                        </h2>
                                        <p class="tw-text-lg tw-text-gray-600 tw-leading-relaxed tw-mb-5">
                                            Vân gỗ ấm áp, đệm mây mềm mại, giải pháp lưu trữ thông minh. Mỗi sản phẩm
                                            đều được chọn lọc tỉ mỉ cho từng không gian sống.
                                        </p>
                                        <div class="tw-flex tw-flex-wrap tw-gap-4 tw-text-sm">
                                            <span
                                                class="tw-inline-flex tw-items-center tw-gap-2 tw-px-4 tw-py-2 tw-bg-green-50 tw-text-green-700 tw-rounded-full tw-font-medium tw-border tw-border-green-200">
                                                <i class="fas fa-shield-alt"></i> Bảo hành 3 năm
                                            </span>
                                            <span
                                                class="tw-inline-flex tw-items-center tw-gap-2 tw-px-4 tw-py-2 tw-bg-blue-50 tw-text-blue-700 tw-rounded-full tw-font-medium tw-border tw-border-blue-200">
                                                <i class="fas fa-truck"></i> Miễn phí lắp đặt
                                            </span>
                                            <span
                                                class="tw-inline-flex tw-items-center tw-gap-2 tw-px-4 tw-py-2 tw-bg-purple-50 tw-text-purple-700 tw-rounded-full tw-font-medium tw-border tw-border-purple-200">
                                                <i class="fas fa-sync-alt"></i> Đổi trả 30 ngày
                                            </span>
                                        </div>
                                    </div>
                                    <div class="tw-flex tw-flex-col sm:tw-flex-row tw-gap-3">
                                        <a href="/products"
                                            class="tw-group tw-px-6 tw-py-3.5 tw-bg-white tw-text-slate-700 tw-rounded-xl tw-font-semibold tw-border-2 tw-border-slate-200 hover:tw-border-primary-500 hover:tw-text-primary-600 tw-transition-all tw-flex tw-items-center tw-justify-center tw-gap-2 tw-shadow-sm hover:tw-shadow-md">
                                            <i
                                                class="fas fa-th-large group-hover:tw-scale-110 tw-transition-transform"></i>
                                            <span>Xem tất cả</span>
                                        </a>
                                        <a href="/products?page=1"
                                            class="tw-group tw-px-6 tw-py-3.5 tw-bg-gradient-to-r tw-from-primary-500 tw-to-primary-600 tw-text-white tw-rounded-xl tw-font-semibold hover:tw-shadow-lg hover:tw-shadow-primary-500/30 tw-transition-all tw-flex tw-items-center tw-justify-center tw-gap-2 tw-transform hover:tw-scale-105">
                                            <i class="fas fa-fire-alt group-hover:tw-animate-pulse"></i>
                                            <span>Xem hàng mới</span>
                                            <i
                                                class="fas fa-arrow-right group-hover:tw-translate-x-1 tw-transition-transform"></i>
                                        </a>
                                    </div>
                                </div>

                                <!-- Product Filter -->
                                <div class="tw-flex tw-gap-2 tw-overflow-x-auto tw-pb-2 scrollbar-hide">
                                    <button
                                        class="tw-px-5 tw-py-2.5 tw-bg-gradient-to-r tw-from-primary-500 tw-to-primary-600 tw-text-white tw-rounded-full tw-font-semibold tw-whitespace-nowrap tw-shadow-md hover:tw-shadow-lg tw-transition-all tw-flex tw-items-center tw-gap-2">
                                        <i class="fas fa-sparkles tw-text-xs"></i> Tất cả
                                    </button>
                                    <button
                                        class="tw-px-5 tw-py-2.5 tw-bg-white tw-text-gray-600 tw-border-2 tw-border-gray-200 tw-rounded-full tw-font-semibold tw-whitespace-nowrap hover:tw-border-red-400 hover:tw-text-red-500 hover:tw-bg-red-50 tw-transition-all tw-flex tw-items-center tw-gap-2">
                                        <i class="fas fa-fire tw-text-red-400"></i> Hot
                                    </button>
                                    <button
                                        class="tw-px-5 tw-py-2.5 tw-bg-white tw-text-gray-600 tw-border-2 tw-border-gray-200 tw-rounded-full tw-font-semibold tw-whitespace-nowrap hover:tw-border-accent-400 hover:tw-text-accent-600 hover:tw-bg-accent-50 tw-transition-all tw-flex tw-items-center tw-gap-2">
                                        <i class="fas fa-percent tw-text-accent-500"></i> Sale
                                    </button>
                                    <button
                                        class="tw-px-5 tw-py-2.5 tw-bg-white tw-text-gray-600 tw-border-2 tw-border-gray-200 tw-rounded-full tw-font-semibold tw-whitespace-nowrap hover:tw-border-blue-400 hover:tw-text-blue-600 hover:tw-bg-blue-50 tw-transition-all tw-flex tw-items-center tw-gap-2">
                                        <i class="fas fa-star tw-text-yellow-400"></i> Bán chạy
                                    </button>
                                    <button
                                        class="tw-px-5 tw-py-2.5 tw-bg-white tw-text-gray-600 tw-border-2 tw-border-gray-200 tw-rounded-full tw-font-semibold tw-whitespace-nowrap hover:tw-border-purple-400 hover:tw-text-purple-600 hover:tw-bg-purple-50 tw-transition-all tw-flex tw-items-center tw-gap-2">
                                        <i class="fas fa-gem tw-text-purple-400"></i> Cao cấp
                                    </button>
                                </div>
                            </div>

                            <!-- Product Grid -->
                            <div class="tw-grid tw-grid-cols-1 sm:tw-grid-cols-2 lg:tw-grid-cols-4 tw-gap-6">
                                <c:forEach var="product" items="${products}">
                                    <div class="product tw-group tw-relative tw-bg-white tw-rounded-2xl tw-overflow-hidden tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-500 hover:tw--translate-y-2 tw-border tw-border-slate-100 hover:tw-border-primary-400 tw-flex tw-flex-col"
                                        data-product="${product.id}" data-stock="${product.quantity}">
                                        
                                        <div class="tw-absolute tw-top-3 tw-right-3 tw-z-20">
                                            <c:choose>
                                                <c:when test="${product.quantity > 0}">
                                                    <span
                                                        class="tw-px-3 tw-py-1.5 tw-bg-gradient-to-r tw-from-emerald-500 tw-to-green-500 tw-text-white tw-text-xs tw-font-bold tw-rounded-full tw-shadow-lg">
                                                        Sẵn hàng
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span
                                                        class="tw-px-3 tw-py-1.5 tw-bg-gradient-to-r tw-from-gray-400 tw-to-gray-500 tw-text-white tw-text-xs tw-font-bold tw-rounded-full tw-shadow-lg">
                                                        Hết hàng
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                        
                                        <a href="/product/${product.id}"
                                            class="tw-relative tw-overflow-hidden tw-h-56 tw-bg-gradient-to-br tw-from-slate-100 tw-to-slate-50 tw-block tw-cursor-pointer">
                                            <img src="/images/product/${product.image}" alt="${product.name}"
                                                class="product-image tw-w-full tw-h-full tw-object-cover group-hover:tw-scale-110 tw-transition-transform tw-duration-700 ${product.quantity <= 0 ? 'tw-grayscale tw-opacity-70' : ''}">

                                            
                                            <div
                                                class="tw-absolute tw-inset-0 tw-bg-black/40 tw-opacity-0 group-hover:tw-opacity-100 tw-transition-opacity tw-duration-300 tw-flex tw-items-center tw-justify-center">
                                                <span
                                                    class="tw-px-5 tw-py-3 tw-bg-white/95 tw-backdrop-blur-sm tw-text-primary-600 tw-rounded-full tw-font-semibold tw-text-sm tw-flex tw-items-center tw-gap-2 tw-shadow-lg tw-transform tw-scale-90 group-hover:tw-scale-100 tw-transition-transform tw-duration-300">
                                                    <i class="fas fa-eye tw-text-lg"></i> Xem chi tiết
                                                </span>
                                            </div>

                                            
                                            <c:if test="${product.quantity <= 0}">
                                                <div
                                                    class="tw-absolute tw-inset-0 tw-bg-black/20 tw-flex tw-items-center tw-justify-center">
                                                    <span
                                                        class="tw-px-4 tw-py-2 tw-bg-gray-800/90 tw-text-white tw-rounded-lg tw-font-semibold tw-text-sm">
                                                        Tạm hết hàng
                                                    </span>
                                                </div>
                                            </c:if>
                                        </a>

                                        
                                        <div class="tw-p-4 tw-flex tw-flex-col tw-flex-1">
                                            <a href="/product/${product.id}" class="tw-block group/title">
                                                <h5
                                                    class="tw-font-bold tw-text-slate-800 tw-mb-2 line-clamp-2 tw-text-lg tw-leading-snug group-hover/title:tw-text-primary-600 tw-transition-colors">
                                                    ${product.name}
                                                </h5>
                                            </a>
                                            <p
                                                class="tw-text-sm tw-text-gray-500 tw-mb-3 line-clamp-2 tw-flex-1 tw-leading-relaxed">
                                                ${product.shortDesc}
                                            </p>

                                            
                                            <div class="tw-flex tw-items-center tw-gap-2 tw-mb-3">
                                                <div class="tw-flex tw-gap-0.5">
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star-half-alt tw-text-yellow-400"></i>
                                                </div>
                                                <span class="tw-text-sm tw-text-gray-500 tw-font-medium">(128)</span>
                                            </div>

                                           
                                            <div
                                                class="tw-flex tw-items-center tw-justify-between tw-pt-3 tw-border-t tw-border-slate-100">
                                                <div>
                                                    <span class="tw-text-xl tw-font-bold tw-text-primary-600">
                                                        <fmt:formatNumber type="number" value="${product.price}" />₫
                                                    </span>
                                                </div>
                                                <form method="post" action="/add-product-to-cart/${product.id}"
                                                    class="add-to-cart-form">
                                                    <input type="hidden" name="productId" value="${product.id}">
                                                    <input type="hidden" name="quantity" value="1">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}">
                                                    <c:choose>
                                                        <c:when test="${product.quantity > 0}">
                                                            <button type="submit"
                                                                class="tw-w-12 tw-h-12 tw-bg-gradient-to-br tw-from-primary-500 tw-to-primary-600 tw-text-white tw-rounded-xl tw-font-semibold tw-shadow-lg tw-shadow-primary-500/30 hover:tw-shadow-xl hover:tw-shadow-primary-500/40 tw-transition-all tw-transform hover:tw-scale-110 active:tw-scale-95 tw-flex tw-items-center tw-justify-center add-to-cart-btn tw-relative tw-overflow-hidden group/cart"
                                                                data-product-id="${product.id}" data-no-loading="true">
                                                                <i
                                                                    class="fas fa-shopping-cart tw-text-lg group-hover/cart:tw-scale-110 tw-transition-transform tw-relative tw-z-10"></i>
                                                                
                                                                <span
                                                                    class="tw-absolute tw-inset-0 tw-bg-white/20 tw-rounded-xl tw-transform tw-scale-0 group-hover/cart:tw-scale-100 tw-transition-transform tw-duration-300"></span>
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="button" disabled
                                                                class="tw-w-12 tw-h-12 tw-bg-gray-300 tw-text-gray-500 tw-rounded-xl tw-font-semibold tw-cursor-not-allowed tw-flex tw-items-center tw-justify-center"
                                                                title="Sản phẩm đã hết hàng">
                                                                <i class="fas fa-shopping-cart tw-text-lg"></i>
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </form>
                                            </div>
                                        </div>

                                        
                                        <div
                                            class="tw-h-1 tw-bg-gradient-to-r tw-from-primary-400 tw-via-accent-400 tw-to-primary-500 tw-transform tw-scale-x-0 group-hover:tw-scale-x-100 tw-transition-transform tw-duration-500 tw-origin-left">
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            
                            <div class="tw-mt-14 tw-text-center">
                                <a href="/products"
                                    class="tw-group tw-inline-flex tw-items-center tw-gap-3 tw-px-10 tw-py-4 tw-bg-white tw-text-slate-700 tw-rounded-2xl tw-font-bold tw-border-2 tw-border-slate-200 hover:tw-border-primary-500 hover:tw-text-primary-600 tw-transition-all tw-transform hover:tw-scale-105 hover:tw-shadow-lg">
                                    <span>Khám phá thêm sản phẩm</span>
                                    <i
                                        class="fas fa-arrow-right group-hover:tw-translate-x-2 tw-transition-transform"></i>
                                </a>
                            </div>
                        </div>
                    </section>

                    <!-- Testimonials Section -->
                    <section
                        class="tw-w-full tw-py-24 tw-bg-gradient-to-br tw-from-slate-100 tw-via-white tw-to-primary-50 tw-overflow-hidden">
                        <div class="tw-max-w-7xl tw-mx-auto tw-px-4">
                            <!-- Section Header -->
                            <div class="tw-text-center tw-mb-16">
                                <p
                                    class="tw-text-primary-700 tw-text-sm tw-font-bold tw-tracking-widest tw-uppercase tw-mb-4">
                                    <i class="fas fa-quote-left tw-mr-2"></i> Khách hàng chia sẻ
                                </p>
                                <h2 class="tw-text-4xl md:tw-text-5xl tw-font-bold tw-text-slate-900 tw-mb-4">Họ nói gì
                                    về chúng tôi?</h2>
                                <p class="tw-text-lg tw-text-gray-600 tw-max-w-2xl tw-mx-auto">
                                    Hàng nghìn khách hàng đã tin tưởng và hài lòng với sản phẩm của Furniture Store
                                </p>
                            </div>

                            
                            <div class="tw-relative tw-px-16">
                                
                                <button onclick="moveTestimonial(-1)"
                                    class="tw-absolute tw-left-0 tw-top-1/2 tw--translate-y-1/2 tw-z-20 tw-w-14 tw-h-14 tw-bg-white tw-rounded-full tw-shadow-xl hover:tw-shadow-2xl tw-flex tw-items-center tw-justify-center tw-text-primary-600 hover:tw-bg-primary-600 hover:tw-text-white tw-transition-all tw-transform hover:tw-scale-110 tw-border-2 tw-border-slate-200 hover:tw-border-primary-600">
                                    <i class="fas fa-chevron-left tw-text-lg"></i>
                                </button>

                                
                                <button onclick="moveTestimonial(1)"
                                    class="tw-absolute tw-right-0 tw-top-1/2 tw--translate-y-1/2 tw-z-20 tw-w-14 tw-h-14 tw-bg-white tw-rounded-full tw-shadow-xl hover:tw-shadow-2xl tw-flex tw-items-center tw-justify-center tw-text-primary-600 hover:tw-bg-primary-600 hover:tw-text-white tw-transition-all tw-transform hover:tw-scale-110 tw-border-2 tw-border-slate-200 hover:tw-border-primary-600">
                                    <i class="fas fa-chevron-right tw-text-lg"></i>
                                </button>

                                <div class="testimonial-carousel tw-overflow-hidden tw-pt-6">
                                    <div class="testimonial-track tw-flex tw-transition-transform tw-duration-500 tw-ease-out"
                                        id="testimonialTrack">
                                        <!-- Testimonial 1 -->
                                        <div class="testimonial-slide tw-px-4 tw-pb-4">
                                            <div
                                                class="tw-bg-white tw-rounded-3xl tw-p-8 tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border tw-border-slate-200 hover:tw-border-primary-400 tw-relative tw-group tw-transform hover:tw--translate-y-2">
                                                
                                                <div
                                                    class="tw-absolute tw--top-4 tw-left-8 tw-w-10 tw-h-10 tw-bg-gradient-to-br tw-from-primary-500 tw-to-primary-600 tw-rounded-full tw-flex tw-items-center tw-justify-center tw-shadow-lg">
                                                    <i class="fas fa-quote-left tw-text-white tw-text-sm"></i>
                                                </div>

                                                
                                                <div class="tw-flex tw-gap-1 tw-mb-5 tw-mt-2">
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                </div>

                                                <p class="tw-text-gray-700 tw-leading-relaxed tw-mb-6 tw-text-base">
                                                    "Sản phẩm chất lượng tuyệt vời! Bộ sofa tôi mua đã được 2 năm mà vẫn
                                                    như mới. Đội ngũ tư vấn rất nhiệt tình và chuyên nghiệp."
                                                </p>

                                                
                                                <a href="/products"
                                                    class="tw-inline-flex tw-items-center tw-gap-2 tw-px-4 tw-py-2 tw-bg-primary-50 tw-text-primary-600 tw-rounded-full tw-text-sm tw-font-semibold hover:tw-bg-primary-100 tw-transition-colors tw-mb-6">
                                                    <i class="fas fa-shopping-bag"></i>
                                                    <span>Sofa Nordic Style</span>
                                                    <i class="fas fa-external-link-alt tw-text-xs"></i>
                                                </a>

                                                
                                                <div
                                                    class="tw-flex tw-items-center tw-gap-4 tw-pt-5 tw-border-t tw-border-slate-100">
                                                    <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop"
                                                        alt="Customer"
                                                        class="tw-w-14 tw-h-14 tw-rounded-full tw-object-cover tw-border-3 tw-border-primary-200 tw-shadow-md">
                                                    <div>
                                                        <h4 class="tw-font-bold tw-text-slate-900">Nguyễn Thị Hương</h4>
                                                        <p
                                                            class="tw-text-sm tw-text-gray-500 tw-flex tw-items-center tw-gap-1">
                                                            <i class="fas fa-map-marker-alt tw-text-primary-500"></i> Hà
                                                            Nội
                                                        </p>
                                                    </div>
                                                    <div class="tw-ml-auto">
                                                        <span
                                                            class="tw-inline-flex tw-items-center tw-gap-1 tw-px-3 tw-py-1.5 tw-bg-green-100 tw-text-green-700 tw-text-xs tw-font-semibold tw-rounded-full tw-shadow-sm">
                                                            <i class="fas fa-check-circle"></i><span>Đã mua</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Testimonial 2 -->
                                        <div class="testimonial-slide tw-px-4 tw-pb-4">
                                            <div
                                                class="tw-bg-white tw-rounded-3xl tw-p-8 tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border tw-border-slate-200 hover:tw-border-primary-400 tw-relative tw-group tw-transform hover:tw--translate-y-2">
                                                <div
                                                    class="tw-absolute tw--top-4 tw-left-8 tw-w-10 tw-h-10 tw-bg-gradient-to-br tw-from-primary-500 tw-to-primary-600 tw-rounded-full tw-flex tw-items-center tw-justify-center tw-shadow-lg">
                                                    <i class="fas fa-quote-left tw-text-white tw-text-sm"></i>
                                                </div>

                                                <div class="tw-flex tw-gap-1 tw-mb-5 tw-mt-2">
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                </div>

                                                <p class="tw-text-gray-700 tw-leading-relaxed tw-mb-6 tw-text-base">
                                                    "Giao hàng nhanh, đóng gói cẩn thận. Giường ngủ đúng như mô tả, chắc
                                                    chắn và đẹp. Giá cả hợp lý so với chất lượng."
                                                </p>

                                                <a href="/products"
                                                    class="tw-inline-flex tw-items-center tw-gap-2 tw-px-4 tw-py-2 tw-bg-primary-50 tw-text-primary-600 tw-rounded-full tw-text-sm tw-font-semibold hover:tw-bg-primary-100 tw-transition-colors tw-mb-6">
                                                    <i class="fas fa-shopping-bag"></i>
                                                    <span>Giường gỗ sồi cao cấp</span>
                                                    <i class="fas fa-external-link-alt tw-text-xs"></i>
                                                </a>

                                                <div
                                                    class="tw-flex tw-items-center tw-gap-4 tw-pt-5 tw-border-t tw-border-slate-100">
                                                    <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop"
                                                        alt="Customer"
                                                        class="tw-w-14 tw-h-14 tw-rounded-full tw-object-cover tw-border-3 tw-border-primary-200 tw-shadow-md">
                                                    <div>
                                                        <h4 class="tw-font-bold tw-text-slate-900">Trần Văn Minh</h4>
                                                        <p
                                                            class="tw-text-sm tw-text-gray-500 tw-flex tw-items-center tw-gap-1">
                                                            <i class="fas fa-map-marker-alt tw-text-primary-500"></i>
                                                            TP. Hồ Chí Minh
                                                        </p>
                                                    </div>
                                                    <div class="tw-ml-auto">
                                                        <span
                                                            class="tw-inline-flex tw-items-center tw-gap-1 tw-px-3 tw-py-1.5 tw-bg-green-100 tw-text-green-700 tw-text-xs tw-font-semibold tw-rounded-full tw-shadow-sm">
                                                            <i class="fas fa-check-circle"></i><span>Đã mua</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Testimonial 3 -->
                                        <div class="testimonial-slide tw-px-4 tw-pb-4">
                                            <div
                                                class="tw-bg-white tw-rounded-3xl tw-p-8 tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border tw-border-slate-200 hover:tw-border-primary-400 tw-relative tw-group tw-transform hover:tw--translate-y-2">
                                                <div
                                                    class="tw-absolute tw--top-4 tw-left-8 tw-w-10 tw-h-10 tw-bg-gradient-to-br tw-from-primary-500 tw-to-primary-600 tw-rounded-full tw-flex tw-items-center tw-justify-center tw-shadow-lg">
                                                    <i class="fas fa-quote-left tw-text-white tw-text-sm"></i>
                                                </div>

                                                <div class="tw-flex tw-gap-1 tw-mb-5 tw-mt-2">
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star-half-alt tw-text-yellow-400"></i>
                                                </div>

                                                <p class="tw-text-gray-700 tw-leading-relaxed tw-mb-6 tw-text-base">
                                                    "Mình đã mua cả bộ bàn ăn và tủ quần áo. Chất lượng gỗ rất tốt, bảo
                                                    hành 3 năm khiến mình yên tâm hơn rất nhiều."
                                                </p>

                                                <a href="/products"
                                                    class="tw-inline-flex tw-items-center tw-gap-2 tw-px-4 tw-py-2 tw-bg-primary-50 tw-text-primary-600 tw-rounded-full tw-text-sm tw-font-semibold hover:tw-bg-primary-100 tw-transition-colors tw-mb-6">
                                                    <i class="fas fa-shopping-bag"></i>
                                                    <span>Bộ bàn ăn 6 ghế</span>
                                                    <i class="fas fa-external-link-alt tw-text-xs"></i>
                                                </a>

                                                <div
                                                    class="tw-flex tw-items-center tw-gap-4 tw-pt-5 tw-border-t tw-border-slate-100">
                                                    <img src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop"
                                                        alt="Customer"
                                                        class="tw-w-14 tw-h-14 tw-rounded-full tw-object-cover tw-border-3 tw-border-primary-200 tw-shadow-md">
                                                    <div>
                                                        <h4 class="tw-font-bold tw-text-slate-900">Lê Thị Mai</h4>
                                                        <p
                                                            class="tw-text-sm tw-text-gray-500 tw-flex tw-items-center tw-gap-1">
                                                            <i class="fas fa-map-marker-alt tw-text-primary-500"></i> Đà
                                                            Nẵng
                                                        </p>
                                                    </div>
                                                    <div class="tw-ml-auto">
                                                        <span
                                                            class="tw-inline-flex tw-items-center tw-gap-1 tw-px-3 tw-py-1.5 tw-bg-green-100 tw-text-green-700 tw-text-xs tw-font-semibold tw-rounded-full tw-shadow-sm">
                                                            <i class="fas fa-check-circle"></i><span>Đã mua</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Testimonial 4 -->
                                        <div class="testimonial-slide tw-px-4 tw-pb-4">
                                            <div
                                                class="tw-bg-white tw-rounded-3xl tw-p-8 tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border tw-border-slate-200 hover:tw-border-primary-400 tw-relative tw-group tw-transform hover:tw--translate-y-2">
                                                <div
                                                    class="tw-absolute tw--top-4 tw-left-8 tw-w-10 tw-h-10 tw-bg-gradient-to-br tw-from-primary-500 tw-to-primary-600 tw-rounded-full tw-flex tw-items-center tw-justify-center tw-shadow-lg">
                                                    <i class="fas fa-quote-left tw-text-white tw-text-sm"></i>
                                                </div>

                                                <div class="tw-flex tw-gap-1 tw-mb-5 tw-mt-2">
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                </div>

                                                <p class="tw-text-gray-700 tw-leading-relaxed tw-mb-6 tw-text-base">
                                                    "Dịch vụ lắp đặt miễn phí rất chuyên nghiệp. Thợ đến đúng giờ, làm
                                                    việc gọn gàng và sạch sẽ. Sẽ tiếp tục ủng hộ shop!"
                                                </p>

                                                <a href="/products"
                                                    class="tw-inline-flex tw-items-center tw-gap-2 tw-px-4 tw-py-2 tw-bg-primary-50 tw-text-primary-600 tw-rounded-full tw-text-sm tw-font-semibold hover:tw-bg-primary-100 tw-transition-colors tw-mb-6">
                                                    <i class="fas fa-shopping-bag"></i>
                                                    <span>Bàn làm việc thông minh</span>
                                                    <i class="fas fa-external-link-alt tw-text-xs"></i>
                                                </a>

                                                <div
                                                    class="tw-flex tw-items-center tw-gap-4 tw-pt-5 tw-border-t tw-border-slate-100">
                                                    <img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100&h=100&fit=crop"
                                                        alt="Customer"
                                                        class="tw-w-14 tw-h-14 tw-rounded-full tw-object-cover tw-border-3 tw-border-primary-200 tw-shadow-md">
                                                    <div>
                                                        <h4 class="tw-font-bold tw-text-slate-900">Phạm Hoàng Nam</h4>
                                                        <p
                                                            class="tw-text-sm tw-text-gray-500 tw-flex tw-items-center tw-gap-1">
                                                            <i class="fas fa-map-marker-alt tw-text-primary-500"></i>
                                                            Hải Phòng
                                                        </p>
                                                    </div>
                                                    <div class="tw-ml-auto">
                                                        <span
                                                            class="tw-inline-flex tw-items-center tw-gap-1 tw-px-3 tw-py-1.5 tw-bg-green-100 tw-text-green-700 tw-text-xs tw-font-semibold tw-rounded-full tw-shadow-sm">
                                                            <i class="fas fa-check-circle"></i><span>Đã mua</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Testimonial 5 -->
                                        <div class="testimonial-slide tw-px-4 tw-pb-4">
                                            <div
                                                class="tw-bg-white tw-rounded-3xl tw-p-8 tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border tw-border-slate-200 hover:tw-border-primary-400 tw-relative tw-group tw-transform hover:tw--translate-y-2">
                                                <div
                                                    class="tw-absolute tw--top-4 tw-left-8 tw-w-10 tw-h-10 tw-bg-gradient-to-br tw-from-primary-500 tw-to-primary-600 tw-rounded-full tw-flex tw-items-center tw-justify-center tw-shadow-lg">
                                                    <i class="fas fa-quote-left tw-text-white tw-text-sm"></i>
                                                </div>

                                                <div class="tw-flex tw-gap-1 tw-mb-5 tw-mt-2">
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                </div>

                                                <p class="tw-text-gray-700 tw-leading-relaxed tw-mb-6 tw-text-base">
                                                    "Đặt hàng online rất tiện, website dễ sử dụng. Sản phẩm về đúng như
                                                    ảnh, thậm chí còn đẹp hơn mong đợi nhiều lắm!"
                                                </p>

                                                <a href="/products"
                                                    class="tw-inline-flex tw-items-center tw-gap-2 tw-px-4 tw-py-2 tw-bg-primary-50 tw-text-primary-600 tw-rounded-full tw-text-sm tw-font-semibold hover:tw-bg-primary-100 tw-transition-colors tw-mb-6">
                                                    <i class="fas fa-shopping-bag"></i>
                                                    <span>Kệ tivi gỗ óc chó</span>
                                                    <i class="fas fa-external-link-alt tw-text-xs"></i>
                                                </a>

                                                <div
                                                    class="tw-flex tw-items-center tw-gap-4 tw-pt-5 tw-border-t tw-border-slate-100">
                                                    <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=100&h=100&fit=crop"
                                                        alt="Customer"
                                                        class="tw-w-14 tw-h-14 tw-rounded-full tw-object-cover tw-border-3 tw-border-primary-200 tw-shadow-md">
                                                    <div>
                                                        <h4 class="tw-font-bold tw-text-slate-900">Đỗ Thị Lan</h4>
                                                        <p
                                                            class="tw-text-sm tw-text-gray-500 tw-flex tw-items-center tw-gap-1">
                                                            <i class="fas fa-map-marker-alt tw-text-primary-500"></i>
                                                            Cần Thơ
                                                        </p>
                                                    </div>
                                                    <div class="tw-ml-auto">
                                                        <span
                                                            class="tw-inline-flex tw-items-center tw-gap-1 tw-px-3 tw-py-1.5 tw-bg-green-100 tw-text-green-700 tw-text-xs tw-font-semibold tw-rounded-full tw-shadow-sm">
                                                            <i class="fas fa-check-circle"></i><span>Đã mua</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Testimonial 6 -->
                                        <div class="testimonial-slide tw-px-4 tw-pb-4">
                                            <div
                                                class="tw-bg-white tw-rounded-3xl tw-p-8 tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border tw-border-slate-200 hover:tw-border-primary-400 tw-relative tw-group tw-transform hover:tw--translate-y-2">
                                                <div
                                                    class="tw-absolute tw--top-4 tw-left-8 tw-w-10 tw-h-10 tw-bg-gradient-to-br tw-from-primary-500 tw-to-primary-600 tw-rounded-full tw-flex tw-items-center tw-justify-center tw-shadow-lg">
                                                    <i class="fas fa-quote-left tw-text-white tw-text-sm"></i>
                                                </div>

                                                <div class="tw-flex tw-gap-1 tw-mb-5 tw-mt-2">
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                </div>

                                                <p class="tw-text-gray-700 tw-leading-relaxed tw-mb-6 tw-text-base">
                                                    "Mua ghế công thái học để làm việc tại nhà. Ngồi cả ngày không bị
                                                    đau lưng. Giá tốt hơn nhiều so với hàng nhập khẩu."
                                                </p>

                                                <a href="/products"
                                                    class="tw-inline-flex tw-items-center tw-gap-2 tw-px-4 tw-py-2 tw-bg-primary-50 tw-text-primary-600 tw-rounded-full tw-text-sm tw-font-semibold hover:tw-bg-primary-100 tw-transition-colors tw-mb-6">
                                                    <i class="fas fa-shopping-bag"></i>
                                                    <span>Ghế công thái học Pro</span>
                                                    <i class="fas fa-external-link-alt tw-text-xs"></i>
                                                </a>

                                                <div
                                                    class="tw-flex tw-items-center tw-gap-4 tw-pt-5 tw-border-t tw-border-slate-100">
                                                    <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop"
                                                        alt="Customer"
                                                        class="tw-w-14 tw-h-14 tw-rounded-full tw-object-cover tw-border-3 tw-border-primary-200 tw-shadow-md">
                                                    <div>
                                                        <h4 class="tw-font-bold tw-text-slate-900">Vũ Đức Thắng</h4>
                                                        <p
                                                            class="tw-text-sm tw-text-gray-500 tw-flex tw-items-center tw-gap-1">
                                                            <i class="fas fa-map-marker-alt tw-text-primary-500"></i>
                                                            Nghệ An
                                                        </p>
                                                    </div>
                                                    <div class="tw-ml-auto">
                                                        <span
                                                            class="tw-inline-flex tw-items-center tw-gap-1 tw-px-3 tw-py-1.5 tw-bg-green-100 tw-text-green-700 tw-text-xs tw-font-semibold tw-rounded-full tw-shadow-sm">
                                                            <i class="fas fa-check-circle"></i><span>Đã mua</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Testimonial 7 -->
                                        <div class="testimonial-slide tw-px-4 tw-pb-4">
                                            <div
                                                class="tw-bg-white tw-rounded-3xl tw-p-8 tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border tw-border-slate-200 hover:tw-border-primary-400 tw-relative tw-group tw-transform hover:tw--translate-y-2">
                                                <div
                                                    class="tw-absolute tw--top-4 tw-left-8 tw-w-10 tw-h-10 tw-bg-gradient-to-br tw-from-primary-500 tw-to-primary-600 tw-rounded-full tw-flex tw-items-center tw-justify-center tw-shadow-lg">
                                                    <i class="fas fa-quote-left tw-text-white tw-text-sm"></i>
                                                </div>

                                                <div class="tw-flex tw-gap-1 tw-mb-5 tw-mt-2">
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star-half-alt tw-text-yellow-400"></i>
                                                </div>

                                                <p class="tw-text-gray-700 tw-leading-relaxed tw-mb-6 tw-text-base">
                                                    "Nội thất nhà mới hoàn toàn từ Furniture Store. Căn nhà trở nên sang
                                                    trọng hơn hẳn. Cảm ơn team đã tư vấn nhiệt tình!"
                                                </p>

                                                <a href="/products"
                                                    class="tw-inline-flex tw-items-center tw-gap-2 tw-px-4 tw-py-2 tw-bg-primary-50 tw-text-primary-600 tw-rounded-full tw-text-sm tw-font-semibold hover:tw-bg-primary-100 tw-transition-colors tw-mb-6">
                                                    <i class="fas fa-shopping-bag"></i>
                                                    <span>Combo phòng khách luxury</span>
                                                    <i class="fas fa-external-link-alt tw-text-xs"></i>
                                                </a>

                                                <div
                                                    class="tw-flex tw-items-center tw-gap-4 tw-pt-5 tw-border-t tw-border-slate-100">
                                                    <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100&h=100&fit=crop"
                                                        alt="Customer"
                                                        class="tw-w-14 tw-h-14 tw-rounded-full tw-object-cover tw-border-3 tw-border-primary-200 tw-shadow-md">
                                                    <div>
                                                        <h4 class="tw-font-bold tw-text-slate-900">Ngô Thanh Tâm</h4>
                                                        <p
                                                            class="tw-text-sm tw-text-gray-500 tw-flex tw-items-center tw-gap-1">
                                                            <i class="fas fa-map-marker-alt tw-text-primary-500"></i>
                                                            Bình Dương
                                                        </p>
                                                    </div>
                                                    <div class="tw-ml-auto">
                                                        <span
                                                            class="tw-inline-flex tw-items-center tw-gap-1 tw-px-3 tw-py-1.5 tw-bg-green-100 tw-text-green-700 tw-text-xs tw-font-semibold tw-rounded-full tw-shadow-sm">
                                                            <i class="fas fa-check-circle"></i><span>Đã mua</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Testimonial 8 -->
                                        <div class="testimonial-slide tw-px-4 tw-pb-4">
                                            <div
                                                class="tw-bg-white tw-rounded-3xl tw-p-8 tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border tw-border-slate-200 hover:tw-border-primary-400 tw-relative tw-group tw-transform hover:tw--translate-y-2">
                                                <div
                                                    class="tw-absolute tw--top-4 tw-left-8 tw-w-10 tw-h-10 tw-bg-gradient-to-br tw-from-primary-500 tw-to-primary-600 tw-rounded-full tw-flex tw-items-center tw-justify-center tw-shadow-lg">
                                                    <i class="fas fa-quote-left tw-text-white tw-text-sm"></i>
                                                </div>

                                                <div class="tw-flex tw-gap-1 tw-mb-5 tw-mt-2">
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                </div>

                                                <p class="tw-text-gray-700 tw-leading-relaxed tw-mb-6 tw-text-base">
                                                    "Tủ quần áo thiết kế thông minh, tận dụng tối đa không gian. Chất gỗ
                                                    đẹp, hoàn thiện tỉ mỉ. Rất hài lòng với sản phẩm!"
                                                </p>

                                                <a href="/products"
                                                    class="tw-inline-flex tw-items-center tw-gap-2 tw-px-4 tw-py-2 tw-bg-primary-50 tw-text-primary-600 tw-rounded-full tw-text-sm tw-font-semibold hover:tw-bg-primary-100 tw-transition-colors tw-mb-6">
                                                    <i class="fas fa-shopping-bag"></i>
                                                    <span>Tủ quần áo 4 cánh</span>
                                                    <i class="fas fa-external-link-alt tw-text-xs"></i>
                                                </a>

                                                <div
                                                    class="tw-flex tw-items-center tw-gap-4 tw-pt-5 tw-border-t tw-border-slate-100">
                                                    <img src="https://images.unsplash.com/photo-1580489944761-15a19d654956?w=100&h=100&fit=crop"
                                                        alt="Customer"
                                                        class="tw-w-14 tw-h-14 tw-rounded-full tw-object-cover tw-border-3 tw-border-primary-200 tw-shadow-md">
                                                    <div>
                                                        <h4 class="tw-font-bold tw-text-slate-900">Hoàng Thị Nga</h4>
                                                        <p
                                                            class="tw-text-sm tw-text-gray-500 tw-flex tw-items-center tw-gap-1">
                                                            <i class="fas fa-map-marker-alt tw-text-primary-500"></i>
                                                            Quảng Ninh
                                                        </p>
                                                    </div>
                                                    <div class="tw-ml-auto">
                                                        <span
                                                            class="tw-inline-flex tw-items-center tw-gap-1 tw-px-3 tw-py-1.5 tw-bg-green-100 tw-text-green-700 tw-text-xs tw-font-semibold tw-rounded-full tw-shadow-sm">
                                                            <i class="fas fa-check-circle"></i><span>Đã mua</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Testimonial 9 -->
                                        <div class="testimonial-slide tw-px-4 tw-pb-4">
                                            <div
                                                class="tw-bg-white tw-rounded-3xl tw-p-8 tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border tw-border-slate-200 hover:tw-border-primary-400 tw-relative tw-group tw-transform hover:tw--translate-y-2">
                                                <div
                                                    class="tw-absolute tw--top-4 tw-left-8 tw-w-10 tw-h-10 tw-bg-gradient-to-br tw-from-primary-500 tw-to-primary-600 tw-rounded-full tw-flex tw-items-center tw-justify-center tw-shadow-lg">
                                                    <i class="fas fa-quote-left tw-text-white tw-text-sm"></i>
                                                </div>

                                                <div class="tw-flex tw-gap-1 tw-mb-5 tw-mt-2">
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                    <i class="fas fa-star tw-text-yellow-400"></i>
                                                </div>

                                                <p class="tw-text-gray-700 tw-leading-relaxed tw-mb-6 tw-text-base">
                                                    "Mua bộ bàn ghế sân vườn rất đẹp và bền. Chịu mưa nắng tốt, sau 1
                                                    năm vẫn như mới. Shop tư vấn rất tận tâm!"
                                                </p>

                                                <a href="/products"
                                                    class="tw-inline-flex tw-items-center tw-gap-2 tw-px-4 tw-py-2 tw-bg-primary-50 tw-text-primary-600 tw-rounded-full tw-text-sm tw-font-semibold hover:tw-bg-primary-100 tw-transition-colors tw-mb-6">
                                                    <i class="fas fa-shopping-bag"></i>
                                                    <span>Bộ bàn ghế sân vườn</span>
                                                    <i class="fas fa-external-link-alt tw-text-xs"></i>
                                                </a>

                                                <div
                                                    class="tw-flex tw-items-center tw-gap-4 tw-pt-5 tw-border-t tw-border-slate-100">
                                                    <img src="https://images.unsplash.com/photo-1566492031773-4f4e44671857?w=100&h=100&fit=crop"
                                                        alt="Customer"
                                                        class="tw-w-14 tw-h-14 tw-rounded-full tw-object-cover tw-border-3 tw-border-primary-200 tw-shadow-md">
                                                    <div>
                                                        <h4 class="tw-font-bold tw-text-slate-900">Bùi Văn Hùng</h4>
                                                        <p
                                                            class="tw-text-sm tw-text-gray-500 tw-flex tw-items-center tw-gap-1">
                                                            <i class="fas fa-map-marker-alt tw-text-primary-500"></i>
                                                            Vũng Tàu
                                                        </p>
                                                    </div>
                                                    <div class="tw-ml-auto">
                                                        <span
                                                            class="tw-inline-flex tw-items-center tw-gap-1 tw-px-3 tw-py-1.5 tw-bg-green-100 tw-text-green-700 tw-text-xs tw-font-semibold tw-rounded-full tw-shadow-sm">
                                                            <i class="fas fa-check-circle"></i><span>Đã mua</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                
                                <div class="tw-flex tw-justify-center tw-gap-2 tw-mt-10" id="testimonialDots">
                                    <button
                                        class="tw-w-3 tw-h-3 tw-rounded-full tw-bg-primary-600 tw-transition-all hover:tw-scale-125"></button>
                                    <button
                                        class="tw-w-3 tw-h-3 tw-rounded-full tw-bg-gray-300 hover:tw-bg-primary-400 tw-transition-all hover:tw-scale-125"></button>
                                    <button
                                        class="tw-w-3 tw-h-3 tw-rounded-full tw-bg-gray-300 hover:tw-bg-primary-400 tw-transition-all hover:tw-scale-125"></button>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- News Section -->
                    <section class="tw-w-full tw-py-24 tw-bg-white">
                        <div class="tw-max-w-7xl tw-mx-auto tw-px-4">
                            <!-- Section Header -->
                            <div
                                class="tw-flex tw-flex-col lg:tw-flex-row lg:tw-items-end lg:tw-justify-between tw-gap-8 tw-mb-16">
                                <div>
                                    <p
                                        class="tw-text-primary-700 tw-text-sm tw-font-bold tw-tracking-widest tw-uppercase tw-mb-4">
                                        <i class="fas fa-newspaper tw-mr-2"></i> Tin tức & Blog
                                    </p>
                                    <h2 class="tw-text-4xl md:tw-text-5xl tw-font-bold tw-text-slate-900 tw-mb-4">Cập
                                        nhật mới nhất</h2>
                                    <p class="tw-text-lg tw-text-gray-600 tw-max-w-2xl">
                                        Khám phá xu hướng nội thất, mẹo trang trí nhà cửa và tin tức mới nhất từ
                                        Furniture Store
                                    </p>
                                </div>
                                <a href="#"
                                    class="tw-px-8 tw-py-4 tw-bg-gradient-to-r tw-from-primary-500 tw-to-primary-700 tw-text-white tw-rounded-xl tw-font-bold hover:tw-shadow-lg tw-transition-all tw-transform hover:tw-scale-105 tw-whitespace-nowrap tw-h-fit">
                                    Xem tất cả <i class="fas fa-arrow-right tw-ml-2"></i>
                                </a>
                            </div>

                            
                            <div class="tw-relative tw-px-16">
                                
                                <button onclick="moveNews(-1)"
                                    class="tw-absolute tw-left-0 tw-top-1/2 tw--translate-y-1/2 tw-z-20 tw-w-14 tw-h-14 tw-bg-white tw-rounded-full tw-shadow-xl hover:tw-shadow-2xl tw-flex tw-items-center tw-justify-center tw-text-primary-600 hover:tw-bg-primary-600 hover:tw-text-white tw-transition-all tw-transform hover:tw-scale-110 tw-border-2 tw-border-slate-200 hover:tw-border-primary-600">
                                    <i class="fas fa-chevron-left tw-text-lg"></i>
                                </button>

                                
                                <button onclick="moveNews(1)"
                                    class="tw-absolute tw-right-0 tw-top-1/2 tw--translate-y-1/2 tw-z-20 tw-w-14 tw-h-14 tw-bg-white tw-rounded-full tw-shadow-xl hover:tw-shadow-2xl tw-flex tw-items-center tw-justify-center tw-text-primary-600 hover:tw-bg-primary-600 hover:tw-text-white tw-transition-all tw-transform hover:tw-scale-110 tw-border-2 tw-border-slate-200 hover:tw-border-primary-600">
                                    <i class="fas fa-chevron-right tw-text-lg"></i>
                                </button>

                                <div class="news-carousel tw-overflow-hidden">
                                    <div class="news-track tw-flex tw-transition-transform tw-duration-500 tw-ease-out"
                                        id="newsTrack">
                                        <!-- News 1 -->
                                        <div class="news-slide tw-px-4 tw-pb-4">
                                            <article
                                                class="tw-group tw-bg-white tw-rounded-3xl tw-overflow-hidden tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border-2 tw-border-transparent hover:tw-border-primary-500">
                                                <div class="tw-relative tw-h-56 tw-overflow-hidden">
                                                    <img src="https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?auto=format&fit=crop&w=800&q=80"
                                                        alt="News"
                                                        class="tw-w-full tw-h-full tw-object-cover group-hover:tw-scale-110 tw-transition-transform tw-duration-700">
                                                    <div class="tw-absolute tw-top-4 tw-left-4">
                                                        <span
                                                            class="tw-px-4 tw-py-2 tw-bg-accent-400 tw-text-slate-900 tw-text-xs tw-font-bold tw-rounded-full">
                                                            Xu hướng
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="tw-p-6">
                                                    <div
                                                        class="tw-flex tw-items-center tw-gap-4 tw-text-sm tw-text-gray-500 tw-mb-4">
                                                        <span><i
                                                                class="far fa-calendar-alt tw-mr-2"></i>27/11/2025</span>
                                                        <span><i class="far fa-clock tw-mr-2"></i>5 phút đọc</span>
                                                    </div>
                                                    <h3
                                                        class="tw-font-bold tw-text-xl tw-text-slate-900 tw-mb-3 group-hover:tw-text-primary-600 tw-transition-colors line-clamp-2">
                                                        Xu hướng nội thất 2025: Phong cách tối giản kết hợp thiên nhiên
                                                    </h3>
                                                    <p class="tw-text-gray-600 line-clamp-3 tw-mb-4">
                                                        Khám phá những xu hướng nội thất mới nhất năm 2025 với sự kết
                                                        hợp giữa thiết kế tối giản và yếu tố thiên nhiên...
                                                    </p>
                                                    <a href="#"
                                                        class="tw-inline-flex tw-items-center tw-text-primary-600 tw-font-semibold hover:tw-text-primary-700 tw-transition-colors">
                                                        Đọc thêm <i
                                                            class="fas fa-arrow-right tw-ml-2 group-hover:tw-translate-x-2 tw-transition-transform"></i>
                                                    </a>
                                                </div>
                                            </article>
                                        </div>

                                        <!-- News 2 -->
                                        <div class="news-slide tw-px-4 tw-pb-4">
                                            <article
                                                class="tw-group tw-bg-white tw-rounded-3xl tw-overflow-hidden tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border-2 tw-border-transparent hover:tw-border-primary-500">
                                                <div class="tw-relative tw-h-56 tw-overflow-hidden">
                                                    <img src="https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?auto=format&fit=crop&w=800&q=80"
                                                        alt="News"
                                                        class="tw-w-full tw-h-full tw-object-cover group-hover:tw-scale-110 tw-transition-transform tw-duration-700">
                                                    <div class="tw-absolute tw-top-4 tw-left-4">
                                                        <span
                                                            class="tw-px-4 tw-py-2 tw-bg-primary-500 tw-text-white tw-text-xs tw-font-bold tw-rounded-full">
                                                            Mẹo hay
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="tw-p-6">
                                                    <div
                                                        class="tw-flex tw-items-center tw-gap-4 tw-text-sm tw-text-gray-500 tw-mb-4">
                                                        <span><i
                                                                class="far fa-calendar-alt tw-mr-2"></i>25/11/2025</span>
                                                        <span><i class="far fa-clock tw-mr-2"></i>8 phút đọc</span>
                                                    </div>
                                                    <h3
                                                        class="tw-font-bold tw-text-xl tw-text-slate-900 tw-mb-3 group-hover:tw-text-primary-600 tw-transition-colors line-clamp-2">
                                                        10 cách bố trí phòng khách nhỏ trông rộng rãi hơn
                                                    </h3>
                                                    <p class="tw-text-gray-600 line-clamp-3 tw-mb-4">
                                                        Những mẹo đơn giản giúp không gian phòng khách nhỏ của bạn trông
                                                        rộng rãi và thoáng đãng hơn...
                                                    </p>
                                                    <a href="#"
                                                        class="tw-inline-flex tw-items-center tw-text-primary-600 tw-font-semibold hover:tw-text-primary-700 tw-transition-colors">
                                                        Đọc thêm <i
                                                            class="fas fa-arrow-right tw-ml-2 group-hover:tw-translate-x-2 tw-transition-transform"></i>
                                                    </a>
                                                </div>
                                            </article>
                                        </div>

                                        <!-- News 3 -->
                                        <div class="news-slide tw-px-4 tw-pb-4">
                                            <article
                                                class="tw-group tw-bg-white tw-rounded-3xl tw-overflow-hidden tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border-2 tw-border-transparent hover:tw-border-primary-500">
                                                <div class="tw-relative tw-h-56 tw-overflow-hidden">
                                                    <img src="https://images.unsplash.com/photo-1586023492125-27b2c045efd7?auto=format&fit=crop&w=800&q=80"
                                                        alt="News"
                                                        class="tw-w-full tw-h-full tw-object-cover group-hover:tw-scale-110 tw-transition-transform tw-duration-700">
                                                    <div class="tw-absolute tw-top-4 tw-left-4">
                                                        <span
                                                            class="tw-px-4 tw-py-2 tw-bg-red-500 tw-text-white tw-text-xs tw-font-bold tw-rounded-full">
                                                            Khuyến mãi
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="tw-p-6">
                                                    <div
                                                        class="tw-flex tw-items-center tw-gap-4 tw-text-sm tw-text-gray-500 tw-mb-4">
                                                        <span><i
                                                                class="far fa-calendar-alt tw-mr-2"></i>23/11/2025</span>
                                                        <span><i class="far fa-clock tw-mr-2"></i>3 phút đọc</span>
                                                    </div>
                                                    <h3
                                                        class="tw-font-bold tw-text-xl tw-text-slate-900 tw-mb-3 group-hover:tw-text-primary-600 tw-transition-colors line-clamp-2">
                                                        Black Friday 2025: Giảm đến 50% toàn bộ sản phẩm
                                                    </h3>
                                                    <p class="tw-text-gray-600 line-clamp-3 tw-mb-4">
                                                        Chương trình khuyến mãi lớn nhất năm với hàng nghìn sản phẩm
                                                        được giảm giá sâu...
                                                    </p>
                                                    <a href="#"
                                                        class="tw-inline-flex tw-items-center tw-text-primary-600 tw-font-semibold hover:tw-text-primary-700 tw-transition-colors">
                                                        Đọc thêm <i
                                                            class="fas fa-arrow-right tw-ml-2 group-hover:tw-translate-x-2 tw-transition-transform"></i>
                                                    </a>
                                                </div>
                                            </article>
                                        </div>

                                        <!-- News 4 -->
                                        <div class="news-slide tw-px-4 tw-pb-4">
                                            <article
                                                class="tw-group tw-bg-white tw-rounded-3xl tw-overflow-hidden tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border-2 tw-border-transparent hover:tw-border-primary-500">
                                                <div class="tw-relative tw-h-56 tw-overflow-hidden">
                                                    <img src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?auto=format&fit=crop&w=800&q=80"
                                                        alt="News"
                                                        class="tw-w-full tw-h-full tw-object-cover group-hover:tw-scale-110 tw-transition-transform tw-duration-700">
                                                    <div class="tw-absolute tw-top-4 tw-left-4">
                                                        <span
                                                            class="tw-px-4 tw-py-2 tw-bg-blue-500 tw-text-white tw-text-xs tw-font-bold tw-rounded-full">
                                                            Hướng dẫn
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="tw-p-6">
                                                    <div
                                                        class="tw-flex tw-items-center tw-gap-4 tw-text-sm tw-text-gray-500 tw-mb-4">
                                                        <span><i
                                                                class="far fa-calendar-alt tw-mr-2"></i>20/11/2025</span>
                                                        <span><i class="far fa-clock tw-mr-2"></i>10 phút đọc</span>
                                                    </div>
                                                    <h3
                                                        class="tw-font-bold tw-text-xl tw-text-slate-900 tw-mb-3 group-hover:tw-text-primary-600 tw-transition-colors line-clamp-2">
                                                        Cách chọn sofa phù hợp với không gian sống
                                                    </h3>
                                                    <p class="tw-text-gray-600 line-clamp-3 tw-mb-4">
                                                        Hướng dẫn chi tiết giúp bạn chọn được chiếc sofa hoàn hảo cho
                                                        không gian sống của mình...
                                                    </p>
                                                    <a href="#"
                                                        class="tw-inline-flex tw-items-center tw-text-primary-600 tw-font-semibold hover:tw-text-primary-700 tw-transition-colors">
                                                        Đọc thêm <i
                                                            class="fas fa-arrow-right tw-ml-2 group-hover:tw-translate-x-2 tw-transition-transform"></i>
                                                    </a>
                                                </div>
                                            </article>
                                        </div>

                                        <!-- News 5 -->
                                        <div class="news-slide tw-px-4 tw-pb-4">
                                            <article
                                                class="tw-group tw-bg-white tw-rounded-3xl tw-overflow-hidden tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border-2 tw-border-transparent hover:tw-border-primary-500">
                                                <div class="tw-relative tw-h-56 tw-overflow-hidden">
                                                    <img src="https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?auto=format&fit=crop&w=800&q=80"
                                                        alt="News"
                                                        class="tw-w-full tw-h-full tw-object-cover group-hover:tw-scale-110 tw-transition-transform tw-duration-700">
                                                    <div class="tw-absolute tw-top-4 tw-left-4">
                                                        <span
                                                            class="tw-px-4 tw-py-2 tw-bg-purple-500 tw-text-white tw-text-xs tw-font-bold tw-rounded-full">
                                                            Sự kiện
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="tw-p-6">
                                                    <div
                                                        class="tw-flex tw-items-center tw-gap-4 tw-text-sm tw-text-gray-500 tw-mb-4">
                                                        <span><i
                                                                class="far fa-calendar-alt tw-mr-2"></i>18/11/2025</span>
                                                        <span><i class="far fa-clock tw-mr-2"></i>4 phút đọc</span>
                                                    </div>
                                                    <h3
                                                        class="tw-font-bold tw-text-xl tw-text-slate-900 tw-mb-3 group-hover:tw-text-primary-600 tw-transition-colors line-clamp-2">
                                                        Khai trương showroom mới tại Hà Nội
                                                    </h3>
                                                    <p class="tw-text-gray-600 line-clamp-3 tw-mb-4">
                                                        Furniture Store chính thức khai trương showroom thứ 12 với không
                                                        gian trưng bày hiện đại...
                                                    </p>
                                                    <a href="#"
                                                        class="tw-inline-flex tw-items-center tw-text-primary-600 tw-font-semibold hover:tw-text-primary-700 tw-transition-colors">
                                                        Đọc thêm <i
                                                            class="fas fa-arrow-right tw-ml-2 group-hover:tw-translate-x-2 tw-transition-transform"></i>
                                                    </a>
                                                </div>
                                            </article>
                                        </div>

                                        <!-- News 6 -->
                                        <div class="news-slide tw-px-4 tw-pb-4">
                                            <article
                                                class="tw-group tw-bg-white tw-rounded-3xl tw-overflow-hidden tw-shadow-lg hover:tw-shadow-2xl tw-transition-all tw-duration-300 tw-h-full tw-border-2 tw-border-transparent hover:tw-border-primary-500">
                                                <div class="tw-relative tw-h-56 tw-overflow-hidden">
                                                    <img src="https://images.unsplash.com/photo-1540518614846-7eded433c457?auto=format&fit=crop&w=800&q=80"
                                                        alt="News"
                                                        class="tw-w-full tw-h-full tw-object-cover group-hover:tw-scale-110 tw-transition-transform tw-duration-700">
                                                    <div class="tw-absolute tw-top-4 tw-left-4">
                                                        <span
                                                            class="tw-px-4 tw-py-2 tw-bg-green-500 tw-text-white tw-text-xs tw-font-bold tw-rounded-full">
                                                            Bền vững
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="tw-p-6">
                                                    <div
                                                        class="tw-flex tw-items-center tw-gap-4 tw-text-sm tw-text-gray-500 tw-mb-4">
                                                        <span><i
                                                                class="far fa-calendar-alt tw-mr-2"></i>15/11/2025</span>
                                                        <span><i class="far fa-clock tw-mr-2"></i>6 phút đọc</span>
                                                    </div>
                                                    <h3
                                                        class="tw-font-bold tw-text-xl tw-text-slate-900 tw-mb-3 group-hover:tw-text-primary-600 tw-transition-colors line-clamp-2">
                                                        Cam kết vật liệu xanh & bền vững
                                                    </h3>
                                                    <p class="tw-text-gray-600 line-clamp-3 tw-mb-4">
                                                        Furniture Store cam kết sử dụng 100% gỗ từ nguồn bền vững được
                                                        chứng nhận FSC...
                                                    </p>
                                                    <a href="#"
                                                        class="tw-inline-flex tw-items-center tw-text-primary-600 tw-font-semibold hover:tw-text-primary-700 tw-transition-colors">
                                                        Đọc thêm <i
                                                            class="fas fa-arrow-right tw-ml-2 group-hover:tw-translate-x-2 tw-transition-transform"></i>
                                                    </a>
                                                </div>
                                            </article>
                                        </div>
                                    </div>
                                </div>

                                
                                <div class="tw-flex tw-justify-center tw-gap-2 tw-mt-10" id="newsDots">
                                    <button
                                        class="tw-w-3 tw-h-3 tw-rounded-full tw-bg-primary-600 tw-transition-all hover:tw-scale-125"></button>
                                    <button
                                        class="tw-w-3 tw-h-3 tw-rounded-full tw-bg-gray-300 hover:tw-bg-primary-400 tw-transition-all hover:tw-scale-125"></button>
                                </div>
                            </div>
                        </div>
                    </section>

                    
                    <jsp:include page="../layout/feature-tailwind.jsp" />

                    <!-- Footer -->
                    <jsp:include page="../layout/footer-tailwind.jsp" />

                    <!-- Back to Top -->
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

                    
                    <script>
                        (function () {
                            let testimonialIndex = 0;
                            let testimonialAutoPlay = null;

                            function getTestimonialSlidesPerView() {
                                if (window.innerWidth >= 1024) return 3;
                                if (window.innerWidth >= 768) return 2;
                                return 1;
                            }

                            function initTestimonialCarousel() {
                                const track = document.getElementById('testimonialTrack');
                                const slides = document.querySelectorAll('.testimonial-slide');
                                const dotsContainer = document.getElementById('testimonialDots');

                                if (!track || slides.length === 0) {
                                    console.error('Testimonial carousel elements not found');
                                    return;
                                }

                                const slidesPerView = getTestimonialSlidesPerView();
                                const slideWidth = 100 / slidesPerView;

                                
                                slides.forEach(slide => {
                                    slide.style.width = slideWidth + '%';
                                    slide.style.flexShrink = '0';
                                });

                                
                                const maxIndex = Math.max(0, slides.length - slidesPerView);
                                if (testimonialIndex > maxIndex) testimonialIndex = 0;

                                
                                track.style.transform = 'translateX(' + (-testimonialIndex * slideWidth) + '%)';

                                
                                if (dotsContainer) {
                                    const totalDots = Math.ceil(slides.length / slidesPerView);
                                    let dotsHTML = '';
                                    for (let i = 0; i < totalDots; i++) {
                                        const isActive = Math.floor(testimonialIndex / slidesPerView) === i;
                                        dotsHTML += '<button onclick="goToTestimonial(' + (i * slidesPerView) + ')" class="tw-w-3 tw-h-3 tw-rounded-full tw-transition-all hover:tw-scale-125 ' + (isActive ? 'tw-bg-[#80c61a] tw-w-8' : 'tw-bg-gray-300 hover:tw-bg-[#80c61a]/50') + '"></button>';
                                    }
                                    dotsContainer.innerHTML = dotsHTML;
                                }
                            }

                            
                            window.moveTestimonial = function (direction) {
                                const slides = document.querySelectorAll('.testimonial-slide');
                                const slidesPerView = getTestimonialSlidesPerView();
                                const maxIndex = Math.max(0, slides.length - slidesPerView);

                                testimonialIndex += direction;
                                if (testimonialIndex > maxIndex) testimonialIndex = 0;
                                if (testimonialIndex < 0) testimonialIndex = maxIndex;

                                initTestimonialCarousel();
                            };

                            window.goToTestimonial = function (index) {
                                testimonialIndex = index;
                                initTestimonialCarousel();
                            };

                            let newsIndex = 0;
                            let newsAutoPlay = null;

                            function getNewsSlidesPerView() {
                                if (window.innerWidth >= 1024) return 3;
                                if (window.innerWidth >= 768) return 2;
                                return 1;
                            }

                            function initNewsCarousel() {
                                const track = document.getElementById('newsTrack');
                                const slides = document.querySelectorAll('.news-slide');
                                const dotsContainer = document.getElementById('newsDots');

                                if (!track || slides.length === 0) {
                                    console.error('News carousel elements not found');
                                    return;
                                }

                                const slidesPerView = getNewsSlidesPerView();
                                const slideWidth = 100 / slidesPerView;

                                
                                slides.forEach(slide => {
                                    slide.style.width = slideWidth + '%';
                                    slide.style.flexShrink = '0';
                                });

                                
                                const maxIndex = Math.max(0, slides.length - slidesPerView);
                                if (newsIndex > maxIndex) newsIndex = 0;

                                
                                track.style.transform = 'translateX(' + (-newsIndex * slideWidth) + '%)';

                                
                                if (dotsContainer) {
                                    const totalDots = Math.ceil(slides.length / slidesPerView);
                                    let dotsHTML = '';
                                    for (let i = 0; i < totalDots; i++) {
                                        const isActive = Math.floor(newsIndex / slidesPerView) === i;
                                        dotsHTML += '<button onclick="goToNews(' + (i * slidesPerView) + ')" class="tw-w-3 tw-h-3 tw-rounded-full tw-transition-all hover:tw-scale-125 ' + (isActive ? 'tw-bg-[#80c61a] tw-w-8' : 'tw-bg-gray-300 hover:tw-bg-[#80c61a]/50') + '"></button>';
                                    }
                                    dotsContainer.innerHTML = dotsHTML;
                                }
                            }

                            
                            window.moveNews = function (direction) {
                                const slides = document.querySelectorAll('.news-slide');
                                const slidesPerView = getNewsSlidesPerView();
                                const maxIndex = Math.max(0, slides.length - slidesPerView);

                                newsIndex += direction;
                                if (newsIndex > maxIndex) newsIndex = 0;
                                if (newsIndex < 0) newsIndex = maxIndex;

                                initNewsCarousel();
                            };

                            window.goToNews = function (index) {
                                newsIndex = index;
                                initNewsCarousel();
                            };

                            function initAllCarousels() {
                                initTestimonialCarousel();
                                initNewsCarousel();

                                
                                if (testimonialAutoPlay) clearInterval(testimonialAutoPlay);
                                if (newsAutoPlay) clearInterval(newsAutoPlay);

                                testimonialAutoPlay = setInterval(function () {
                                    window.moveTestimonial(1);
                                }, 5500);

                                newsAutoPlay = setInterval(function () {
                                    window.moveNews(1);
                                }, 5500);

                                
                                const testimonialCarousel = document.querySelector('.testimonial-carousel');
                                if (testimonialCarousel) {
                                    testimonialCarousel.addEventListener('mouseenter', function () {
                                        clearInterval(testimonialAutoPlay);
                                    });
                                    testimonialCarousel.addEventListener('mouseleave', function () {
                                        testimonialAutoPlay = setInterval(function () {
                                            window.moveTestimonial(1);
                                        }, 5000);
                                    });
                                }

                                
                                const newsCarousel = document.querySelector('.news-carousel');
                                if (newsCarousel) {
                                    newsCarousel.addEventListener('mouseenter', function () {
                                        clearInterval(newsAutoPlay);
                                    });
                                    newsCarousel.addEventListener('mouseleave', function () {
                                        newsAutoPlay = setInterval(function () {
                                            window.moveNews(1);
                                        }, 5000);
                                    });
                                }

                            }

                            
                            if (document.readyState === 'loading') {
                                document.addEventListener('DOMContentLoaded', initAllCarousels);
                            } else {
                                initAllCarousels();
                            }

                            
                            window.addEventListener('load', initAllCarousels);

                            
                            window.addEventListener('resize', function () {
                                initTestimonialCarousel();
                                initNewsCarousel();
                            });
                        })();
                    </script>
                </body>

                </html>