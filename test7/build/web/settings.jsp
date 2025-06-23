<%-- 
    Document   : settings
    Created on : Jun 11, 2025, 9:09:58 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setAttribute("currentPage", "settings");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Settings</title>
        <link rel="stylesheet" href="./assets/css/stylesheet.css">
    </head>
    <body>
        <jsp:include page="./assets/includes/sidebar.jsp" />
        <jsp:include page="./assets/includes/header.jsp" />
        <div class="main-content">

            <div class="settings-container">
                <div class="settings-menu">
                    <div class="settings-item active" data-setting="edit-profile">
                        <img src="./assets/icon/user-pen.png" alt="edit" class="icon" />
                        Chỉnh sửa hồ sơ
                    </div>
                    <div class="settings-item" data-setting="change-password">
                        <img src="./assets/icon/key.png" alt="change-password" class="icon" />
                        Đổi mật khẩu
                    </div>
                    <div class="settings-item" data-setting="processing-orders">
                        <img src="./assets/icon/boxes.png" alt="processing-orders" class="icon" />
                        Đơn mua
                    </div>
                    <div class="settings-item" data-setting="completed-orders">
                        <img src="./assets/icon/box-open-full.png" alt="completed-orders" class="icon" />
                        Đã mua
                    </div>
                    <div class="settings-item" data-setting="saved-posts">
                        <img src="./assets/icon/bookmark.png" alt="saved" class="icon" />
                        Đã lưu
                    </div>
                </div>

                <div class="settings-content">
                    <div id="edit-profile" class="active">
                        <form class="settings-form" action="UpdateProfileServlet" method="post"
                              enctype="multipart/form-data">
                            <label for="username">Tên</label>
                            <input type="text" id="username" name="username" required>

                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" required>

                            <label for="phone">Số điện thoại</label>
                            <input type="text" id="phone" name="phone" required>

                            <label for="avatar">Ảnh đại diện</label>
                            <input type="file" id="avatar" name="avatar" accept=".jpg, .jpeg, .png, .gif">

                            <button type="submit">Lưu thay đổi</button>
                        </form>
                    </div>

                    <div id="change-password">
                        <form class="settings-form" action="ChangePasswordServlet" method="post">
                            <label for="currentPassword">Mật khẩu hiện tại</label>
                            <input type="password" id="currentPassword" name="currentPassword" required>

                            <label for="newPassword">Mật khẩu mới</label>
                            <input type="password" id="newPassword" name="newPassword" required>

                            <label for="confirmPassword">Xác nhận mật khẩu mới</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" required>

                            <button type="submit">Đổi mật khẩu</button>
                        </form>
                    </div>

                    <div id="processing-orders">
                        <!-- Thẻ đơn hàng 1 -->
                        <a href="processing-order.jsp" class="order-card">
                            <div class="order-card-header">
                                <span class="order-id">Đơn hàng: #DH12345678</span>
                                <span class="order-status status-delivering">Đang giao hàng</span>
                            </div>
                            <div class="order-card-body">
                                <div class="order-products">
                                    <img src="./image/products/folklore.png" alt="Album folklore"
                                         class="product-thumbnail">
                                </div>
                                <div class="order-info">
                                    <div class="order-date">Ngày đặt: 15/06/2023</div>
                                    <div class="order-total">Tổng tiền: <strong>780.000đ</strong></div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div id="completed-orders">
                        <!-- Thẻ đơn hàng 1 -->
                        <a href="completed-order.jsp" class="order-card">
                            <div class="order-card-header">
                                <span class="order-id">Đơn hàng: #DH12345678</span>
                                <span class="order-status status-delivered">Đã giao hàng</span>
                            </div>
                            <div class="order-card-body">
                                <div class="order-products">
                                    <img src="./image/products/folklore.png" alt="Album folklore"
                                         class="product-thumbnail">
                                </div>
                                <div class="order-info">
                                    <div class="order-date">Ngày đặt: 15/06/2023</div>
                                    <div class="order-total">Tổng tiền: <strong>780.000đ</strong></div>
                                </div>
                            </div>
                        </a>

                        <!-- Thẻ đơn hàng 2 -->
                    </div>

                    <div id="saved-posts">
                        <p>Hiển thị các bài viết đã lưu ở đây...</p>
                    </div>
                </div>
                <script>
                    document.querySelectorAll('.settings-item').forEach(item => {
                        item.addEventListener('click', function () {
                            const id = this.getAttribute('data-setting');

                            document.querySelectorAll('.settings-item').forEach(i => i.classList.remove('active'));
                            document.querySelectorAll('.settings-content > div').forEach(div => div.classList.remove('active'));

                            this.classList.add('active');
                            document.getElementById(id).classList.add('active');
                        });
                    });
                </script>
            </div>
        </div>
        <jsp:include page="./assets/includes/chat.jsp" />
    </body>

    <script src=".assets/js/script.js"></script>
</html>
