<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Dự án FURNITURE STORE" />
    <meta name="author" content="" />
    <title>Dashboard - FURNITURE STORE</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <link href="/css/custom.css" rel="stylesheet" />
    <link href="/css/admin.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <style>
        /* Dashboard Styles */
        .dashboard-header {
            background: #81c408;
            border-radius: 10px;
            padding: 1.5rem 2rem;
            margin-bottom: 1.5rem;
            color: white;
        }
        
        .dashboard-header h1 {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 0.3rem;
        }
        
        .dashboard-header p {
            opacity: 0.9;
            margin-bottom: 0;
        }
        
        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            border: 1px solid #e9ecef;
            border-top: 3px solid #81c408;
        }
        
        .stat-card:hover {
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.12);
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
            margin-bottom: 1rem;
            background: #81c408;
        }
        
        .stat-number {
            font-size: 2.2rem;
            font-weight: 700;
            color: #333;
            line-height: 1;
            margin-bottom: 0.3rem;
        }
        
        .stat-label {
            font-size: 0.95rem;
            color: #6c757d;
            font-weight: 500;
            margin-bottom: 1rem;
        }
        
        .stat-link {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            font-size: 0.85rem;
            font-weight: 600;
            text-decoration: none;
            background: #f0f9e8;
            color: #81c408;
        }
        
        .stat-link:hover {
            background: #81c408;
            color: white;
        }
        
        .quick-actions {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            border: 1px solid #e9ecef;
            margin-top: 1.5rem;
        }
        
        .quick-actions h5 {
            font-weight: 700;
            color: #333;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .quick-actions h5 i {
            color: #81c408;
        }
        
        .action-btn {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            padding: 0.8rem 1rem;
            border-radius: 8px;
            text-decoration: none;
            color: #333;
            background: #f8f9fa;
            margin-bottom: 0.6rem;
        }
        
        .action-btn:hover {
            background: #81c408;
            color: white;
        }
        
        .action-btn i {
            font-size: 1rem;
            width: 20px;
            text-align: center;
            color: #81c408;
        }
        
        .action-btn:hover i {
            color: white;
        }
        
        .welcome-time {
            background: rgba(255,255,255,0.2);
            padding: 0.4rem 0.8rem;
            border-radius: 5px;
            display: inline-block;
            margin-top: 0.5rem;
            font-size: 0.85rem;
        }
    </style>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />

    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4 py-4">
                    <!-- Dashboard Header -->
                    <div class="dashboard-header">
                        <div class="row align-items-center">
                            <div class="col-md-8">
                                <h1><i class="fas fa-chart-line me-2"></i>Dashboard</h1>
                                <p>Chào mừng bạn đến với trang quản trị Furniture Store</p>
                                <div class="welcome-time">
                                    <i class="far fa-clock me-2"></i>
                                    <span id="currentDateTime"></span>
                                </div>
                            </div>
                            <div class="col-md-4 text-end d-none d-md-block">
                                <i class="fas fa-couch" style="font-size: 4rem; opacity: 0.3;"></i>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Stats Cards -->
                    <div class="row g-4">
                        <div class="col-xl-4 col-md-6">
                            <div class="stat-card">
                                <div class="stat-icon">
                                    <i class="fas fa-users"></i>
                                </div>
                                <div class="stat-number">${countUsers}</div>
                                <div class="stat-label">Tổng số người dùng</div>
                                <a href="/admin/user" class="stat-link">
                                    Xem chi tiết <i class="fas fa-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                        
                        <div class="col-xl-4 col-md-6">
                            <div class="stat-card">
                                <div class="stat-icon">
                                    <i class="fas fa-box-open"></i>
                                </div>
                                <div class="stat-number">${countProducts}</div>
                                <div class="stat-label">Tổng số sản phẩm</div>
                                <a href="/admin/product" class="stat-link">
                                    Xem chi tiết <i class="fas fa-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                        
                        <div class="col-xl-4 col-md-6">
                            <div class="stat-card">
                                <div class="stat-icon">
                                    <i class="fas fa-shopping-cart"></i>
                                </div>
                                <div class="stat-number">${countOrders}</div>
                                <div class="stat-label">Tổng số đơn hàng</div>
                                <a href="/admin/order" class="stat-link">
                                    Xem chi tiết <i class="fas fa-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Quick Actions -->
                    <div class="row mt-4 justify-content-center">
                        <div class="col-lg-8">
                            <div class="quick-actions">
                                <h5 class="text-center justify-content-center"><i class="fas fa-tasks"></i> Các thao tác</h5>
                                <div class="row">
                                    <div class="col-md-6">
                                        <a href="/admin/product/create" class="action-btn">
                                            <i class="fas fa-plus-circle"></i>
                                            <span>Thêm sản phẩm mới</span>
                                        </a>
                                        <a href="/admin/user/create" class="action-btn">
                                            <i class="fas fa-user-plus"></i>
                                            <span>Thêm người dùng mới</span>
                                        </a>
                                    </div>
                                    <div class="col-md-6">
                                        <a href="/admin/order" class="action-btn">
                                            <i class="fas fa-clipboard-list"></i>
                                            <span>Quản lý đơn hàng</span>
                                        </a>
                                        <a href="/admin/warehouse" class="action-btn">
                                            <i class="fas fa-warehouse"></i>
                                            <span>Quản lý kho hàng</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
    <script>
        function updateDateTime() {
            const now = new Date();
            const options = { 
                weekday: 'long', 
                year: 'numeric', 
                month: 'long', 
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit'
            };
            document.getElementById('currentDateTime').textContent = now.toLocaleDateString('vi-VN', options);
        }
        updateDateTime();
        setInterval(updateDateTime, 60000);
    </script>
</body>

</html>