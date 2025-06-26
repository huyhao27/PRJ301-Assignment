<%-- 
    Document   : processing-order
    Created on : Jun 11, 2025, 11:34:33 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing Order</title>
        <link rel="stylesheet" href="./assets/css/stylesheet.css">
    </head>
    <body>
        <jsp:include page="./assets/includes/sidebar.jsp" />
        <jsp:include page="./assets/includes/header.jsp" />
        <jsp:include page="./assets/includes/chat.jsp" />
        
        <div class="main-content">
            <div class="order-container">
                <!-- Header thông tin đơn hàng -->
                <div class="order-header">
                    <div class="order-info">
                        <h2>Đơn hàng #DH12345678</h2>
                        <div class="order-status status-delivering">Đang giao hàng</div>
                        <div class="order-date">Đặt ngày: 15/06/2023</div>
                    </div>
                    <div class="order-actions">
                        <button class="btn btn-outline">Liên hệ Shop</button>
                        <button class="btn btn-primary">Đã nhận được hàng</button>
                    </div>
                </div>

                <!-- Thông tin người nhận -->
                <div class="order-section">
                    <h3 class="section-title">Thông tin người nhận</h3>
                    <div class="section-content">
                        <p><strong>Nguyễn Văn A</strong> | 0912345678</p>
                        <p>123 Đường ABC, Phường XYZ, Quận 1, TP.HCM</p>
                        <p class="note">Lưu ý: Giao hàng giờ hành chính</p>
                    </div>
                </div>

                <!-- Danh sách sản phẩm -->
                <div class="order-section">
                    <h3 class="section-title">Sản phẩm</h3>
                    <div class="order-items">
                        <!-- Sản phẩm 1 -->
                        <div class="order-item">
                            <div class="item-info">
                                <img src="./image/products/folklore.png" alt="Album folklore" class="item-image">
                                <div class="item-details">
                                    <h4 class="item-name">Album folklore - Taylor Swift (Bản Tiêu Chuẩn)</h4>
                                    <div class="item-variant">Màu sắc: Hồng</div>
                                    <div class="item-quantity">x1</div>
                                </div>
                            </div>
                            <div class="item-price">250.000đ</div>
                        </div>

                        <!-- Sản phẩm 2 -->
                        <div class="order-item">
                            <div class="item-info">
                                <img src="./image/products/evermore.png" alt="Album evermore" class="item-image">
                                <div class="item-details">
                                    <h4 class="item-name">Album evermore - Taylor Swift (Bản Deluxe)</h4>
                                    <div class="item-variant">Màu sắc: Xanh lá</div>
                                    <div class="item-quantity">x2</div>
                                </div>
                            </div>
                            <div class="item-price">580.000đ</div>
                        </div>
                    </div>
                </div>

                <!-- Thông tin thanh toán -->
                <div class="order-section">
                    <h3 class="section-title">Thông tin thanh toán</h3>
                    <div class="payment-info">
                        <div class="payment-row">
                            <span>Tạm tính:</span>
                            <span>830.000đ</span>
                        </div>
                        <div class="payment-row">
                            <span>Phí vận chuyển:</span>
                            <span>20.000đ</span>
                        </div>
                        <div class="payment-row total">
                            <span>Tổng cộng:</span>
                            <span>850.000đ</span>
                        </div>
                        <div class="payment-method">
                            <span>Phương thức thanh toán:</span>
                            <span>COD</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
