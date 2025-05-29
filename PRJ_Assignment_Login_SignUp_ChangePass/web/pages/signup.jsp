<%-- 
    Document   : signup
    Created on : May 28, 2025, 5:54:46 PM
    Author     : PC ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SecondUni - SignUp</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/signup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/global.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/font/themify-icons/themify-icons.css">
    </head>

    <body>
        <div class="container">
            <img class="logo" src="${pageContext.request.contextPath}/asset/images/Logo_Deleted_Background.png" alt="Logo" />
<!--            <div >
                <a href="changepass.jsp" class="home-btn">
                    <i class="ti-home"></i>
                </a>
            </div>-->
            <div class="signup-box">
                <h2 class="box-title">Đăng ký</h2>

                <form action="signup" method="post">
                    
                    <div class="input-group">
                        <input type="text" name="name" placeholder="Tên hiển thị" required>
                    </div>

                    <div class="input-group">
                        <input type="text" name="username" placeholder="Nhập email" required>
                    </div>

                    <div class="input-group" style="position: relative;">
                        <input type="password" name="password" id="password" placeholder="Nhập mật khẩu" required>
                        <i class="ti-eye toggle-password"
                           style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
                    </div>

                    <%-- Hiện lỗi nếu có query string ?error=username --%>
                    <% if ("username".equals(request.getParameter("error"))) { %>
                    <div class="error">Email này đã được sử dụng!</div>
                    <% } %>

                    <button type="submit" class="submit-btn">Đăng ký</button>
                </form>

                <div class="login-signup">
                    Bạn đã có tài khoản rồi? <a href="login.jsp">Đăng nhập</a>
                </div>

                <div class="login-alt">
                    <div class="line"></div>
                    <span>Hoặc đăng nhập bằng</span>
                    <div class="line"></div>
                </div>

                <div class="social-icons">
                    <div class="icon"><i class="ti-facebook"></i></div>
                    <div class="icon"><i class="ti-google"></i></div>
                    <div class="icon"><i class="ti-github"></i></div>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/asset/js/show-password.js"></script>
    </body>

</html>

