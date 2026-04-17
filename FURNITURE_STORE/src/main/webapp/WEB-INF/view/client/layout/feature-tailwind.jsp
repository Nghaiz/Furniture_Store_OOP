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

                
                <section
                    class="w-full bg-gradient-to-br from-slate-50 to-white py-20 md:py-28 relative overflow-hidden">
                   
                    <div
                        class="absolute top-0 left-0 w-64 h-64 bg-primary-100 rounded-full -translate-x-1/2 -translate-y-1/2 blur-3xl opacity-50">
                    </div>
                    <div
                        class="absolute bottom-0 right-0 w-80 h-80 bg-accent-100 rounded-full translate-x-1/3 translate-y-1/3 blur-3xl opacity-50">
                    </div>

                    <div class="max-w-7xl mx-auto px-4 relative z-10">
                        
                        <div class="text-center mb-16">
                            <p class="text-primary-700 text-sm font-bold tracking-widest uppercase mb-4">
                                <i class="fas fa-shield-alt mr-2"></i> Cam kết của chúng tôi
                            </p>
                            <h2 class="text-3xl md:text-4xl font-bold text-slate-900 mb-4">Tại sao chọn Furniture Store?
                            </h2>
                            <p class="text-gray-600 max-w-2xl mx-auto">Chúng tôi cam kết mang đến trải nghiệm mua sắm
                                tốt nhất với những dịch vụ hàng đầu</p>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
                            
                            <div
                                class="group text-center p-8 bg-white rounded-3xl shadow-lg hover:shadow-2xl transition-all duration-300 hover:-translate-y-2 border-2 border-transparent hover:border-primary-500">
                                <div class="flex justify-center mb-6">
                                    <div
                                        class="relative w-24 h-24 bg-gradient-to-br from-primary-500 to-primary-700 rounded-2xl flex items-center justify-center transform rotate-3 group-hover:rotate-6 transition-transform shadow-lg">
                                        <i class="fas fa-truck text-3xl text-white"></i>
                                        <div
                                            class="absolute -bottom-2 -right-2 w-8 h-8 bg-accent-400 rounded-full flex items-center justify-center">
                                            <i class="fas fa-check text-white text-xs"></i>
                                        </div>
                                    </div>
                                </div>
                                <h5
                                    class="text-xl font-bold text-gray-900 mb-3 group-hover:text-primary-600 transition-colors">
                                    Miễn phí vận chuyển</h5>
                                <p class="text-gray-600 text-sm leading-relaxed">Miễn phí ship cho đơn hàng từ
                                    2.000.000₫. Giao hàng toàn quốc nhanh chóng.</p>
                            </div>

                           
                            <div
                                class="group text-center p-8 bg-white rounded-3xl shadow-lg hover:shadow-2xl transition-all duration-300 hover:-translate-y-2 border-2 border-transparent hover:border-primary-500">
                                <div class="flex justify-center mb-6">
                                    <div
                                        class="relative w-24 h-24 bg-gradient-to-br from-blue-500 to-blue-700 rounded-2xl flex items-center justify-center transform -rotate-3 group-hover:-rotate-6 transition-transform shadow-lg">
                                        <i class="fas fa-shield-alt text-3xl text-white"></i>
                                        <div
                                            class="absolute -bottom-2 -right-2 w-8 h-8 bg-accent-400 rounded-full flex items-center justify-center">
                                            <i class="fas fa-lock text-white text-xs"></i>
                                        </div>
                                    </div>
                                </div>
                                <h5
                                    class="text-xl font-bold text-gray-900 mb-3 group-hover:text-primary-600 transition-colors">
                                    Thanh toán an toàn</h5>
                                <p class="text-gray-600 text-sm leading-relaxed">Bảo mật 100% thông tin. Hỗ trợ VNPay,
                                    Visa, MasterCard và COD.</p>
                            </div>

                            
                            <div
                                class="group text-center p-8 bg-white rounded-3xl shadow-lg hover:shadow-2xl transition-all duration-300 hover:-translate-y-2 border-2 border-transparent hover:border-primary-500">
                                <div class="flex justify-center mb-6">
                                    <div
                                        class="relative w-24 h-24 bg-gradient-to-br from-accent-400 to-accent-600 rounded-2xl flex items-center justify-center transform rotate-3 group-hover:rotate-6 transition-transform shadow-lg">
                                        <i class="fas fa-undo-alt text-3xl text-white"></i>
                                        <div
                                            class="absolute -bottom-2 -right-2 w-8 h-8 bg-primary-500 rounded-full flex items-center justify-center">
                                            <span class="text-white text-xs font-bold">30</span>
                                        </div>
                                    </div>
                                </div>
                                <h5
                                    class="text-xl font-bold text-gray-900 mb-3 group-hover:text-primary-600 transition-colors">
                                    Đổi trả 30 ngày</h5>
                                <p class="text-gray-600 text-sm leading-relaxed">Cam kết đổi trả miễn phí trong 30 ngày
                                    nếu sản phẩm lỗi từ nhà sản xuất.</p>
                            </div>

                            
                            <div
                                class="group text-center p-8 bg-white rounded-3xl shadow-lg hover:shadow-2xl transition-all duration-300 hover:-translate-y-2 border-2 border-transparent hover:border-primary-500">
                                <div class="flex justify-center mb-6">
                                    <div
                                        class="relative w-24 h-24 bg-gradient-to-br from-rose-500 to-rose-700 rounded-2xl flex items-center justify-center transform -rotate-3 group-hover:-rotate-6 transition-transform shadow-lg">
                                        <i class="fas fa-headset text-3xl text-white"></i>
                                        <div
                                            class="absolute -bottom-2 -right-2 w-8 h-8 bg-green-500 rounded-full flex items-center justify-center animate-pulse">
                                            <span class="w-2 h-2 bg-white rounded-full"></span>
                                        </div>
                                    </div>
                                </div>
                                <h5
                                    class="text-xl font-bold text-gray-900 mb-3 group-hover:text-primary-600 transition-colors">
                                    Hỗ trợ 24/7</h5>
                                <p class="text-gray-600 text-sm leading-relaxed">Đội ngũ tư vấn luôn sẵn sàng hỗ trợ bạn
                                    mọi lúc, mọi nơi.</p>
                            </div>
                        </div>
                    </div>
                </section>