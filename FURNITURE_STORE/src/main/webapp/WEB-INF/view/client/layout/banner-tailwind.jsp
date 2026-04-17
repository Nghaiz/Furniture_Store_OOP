<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <script>
                    tailwind.config = {
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

                
                <section class="bg-gradient-to-r from-slate-50 to-primary-50 py-16 md:py-24">
                    <div class="max-w-7xl mx-auto px-4">
                        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
                            
                            <div class="space-y-6">
                                <p
                                    class="text-primary-600 font-bold text-sm md:text-base uppercase tracking-widest mb-3">
                                    <i class="fas fa-check-circle mr-2"></i> 100% Sản Phẩm Chính Hãng
                                </p>
                                <h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-slate-900 leading-tight">
                                    Hàng nội thất cao cấp<br />
                                    <span
                                        class="bg-gradient-to-r from-primary-600 to-primary-700 bg-clip-text text-transparent">Rẻ
                                        vô địch</span>
                                </h1>
                                <p class="text-gray-600 text-lg leading-relaxed">
                                    Tìm kiếm nội thất chất lượng cao với giá tốt nhất? Chúng tôi cung cấp các sản phẩm
                                    nội thất cao cấp với mức giá cạnh tranh nhất trên thị trường.
                                </p>
                                <div class="flex gap-4 pt-4">
                                    <a href="/products"
                                        class="px-8 py-3 bg-gradient-to-r from-primary-600 to-primary-700 text-white rounded-lg font-bold hover:shadow-lg transition-all transform hover:-translate-y-1">
                                        Khám phá ngay
                                    </a>
                                </div>
                            </div>

                            
                            <div class="relative">
                                <div id="carouselId" class="relative rounded-3xl overflow-hidden shadow-2xl">
                                    
                                    <div class="flex gap-2 absolute bottom-4 left-1/2 -translate-x-1/2 z-30">
                                        <button
                                            class="carousel-indicator w-3 h-3 rounded-full bg-white/50 hover:bg-white transition-all active"
                                            data-slide="0"></button>
                                        <button
                                            class="carousel-indicator w-3 h-3 rounded-full bg-white/50 hover:bg-white transition-all"
                                            data-slide="1"></button>
                                        <button
                                            class="carousel-indicator w-3 h-3 rounded-full bg-white/50 hover:bg-white transition-all"
                                            data-slide="2"></button>
                                    </div>

                                    
                                    <div class="relative h-96 md:h-[500px] overflow-hidden">
                                        <div
                                            class="carousel-item-wrapper absolute inset-0 transition-opacity duration-500 opacity-100">
                                            <img src="/client/img/anh1.jpg" class="w-full h-full object-cover"
                                                alt="Ghế">
                                            <div class="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent">
                                            </div>
                                            <div class="absolute bottom-6 left-6 right-6">
                                                <span
                                                    class="inline-block px-4 py-2 bg-primary-600 text-white rounded-lg font-bold">
                                                    <i class="fas fa-chair mr-2"></i> Ghế
                                                </span>
                                            </div>
                                        </div>
                                        <div
                                            class="carousel-item-wrapper absolute inset-0 transition-opacity duration-500 opacity-0">
                                            <img src="/client/img/anh2.webp" class="w-full h-full object-cover"
                                                alt="Bàn">
                                            <div class="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent">
                                            </div>
                                            <div class="absolute bottom-6 left-6 right-6">
                                                <span
                                                    class="inline-block px-4 py-2 bg-primary-600 text-white rounded-lg font-bold">
                                                    <i class="fas fa-table mr-2"></i> Bàn
                                                </span>
                                            </div>
                                        </div>
                                        <div
                                            class="carousel-item-wrapper absolute inset-0 transition-opacity duration-500 opacity-0">
                                            <img src="/client/img/anh3.jpg" class="w-full h-full object-cover" alt="Tủ">
                                            <div class="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent">
                                            </div>
                                            <div class="absolute bottom-6 left-6 right-6">
                                                <span
                                                    class="inline-block px-4 py-2 bg-primary-600 text-white rounded-lg font-bold">
                                                    <i class="fas fa-cube mr-2"></i> Tủ
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    
                                    <button
                                        class="carousel-prev absolute left-4 top-1/2 -translate-y-1/2 z-20 w-12 h-12 bg-white/80 hover:bg-white rounded-full flex items-center justify-center transition-all transform hover:scale-110">
                                        <i class="fas fa-chevron-left text-slate-900 text-lg"></i>
                                    </button>
                                    <button
                                        class="carousel-next absolute right-4 top-1/2 -translate-y-1/2 z-20 w-12 h-12 bg-white/80 hover:bg-white rounded-full flex items-center justify-center transition-all transform hover:scale-110">
                                        <i class="fas fa-chevron-right text-slate-900 text-lg"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <script>
                        (function () {
                            const indicators = document.querySelectorAll('.carousel-indicator');
                            const items = document.querySelectorAll('.carousel-item-wrapper');
                            let current = 0;

                            function showSlide(n) {
                                items.forEach(item => item.classList.add('opacity-0'));
                                indicators.forEach(ind => ind.classList.remove('bg-white'));

                                items[n].classList.remove('opacity-0');
                                indicators[n].classList.add('bg-white');
                                current = n;
                            }

                            document.querySelector('.carousel-prev').addEventListener('click', () => {
                                showSlide((current - 1 + items.length) % items.length);
                            });

                            document.querySelector('.carousel-next').addEventListener('click', () => {
                                showSlide((current + 1) % items.length);
                            });

                            indicators.forEach((ind, idx) => {
                                ind.addEventListener('click', () => showSlide(idx));
                            });

                            
                            setInterval(() => {
                                showSlide((current + 1) % items.length);
                            }, 5000);
                        })();
                </script>