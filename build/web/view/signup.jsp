<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SecondUni - SignUp</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/signup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/global.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/icon/themify-icons/themify-icons.css">
    </head>
    <body>
        <div class="container">
            <img class="logo" src="${pageContext.request.contextPath}/view/images/logo/Logo_Deleted_Background.png" alt="Logo"/>
            <div class="signup-box">
                <h2 class="box-title">Đăng ký</h2>

                <form id="signupForm" action="signup" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

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

                    <c:if test="${not empty error}">
                        <div class="error">${error}</div>
                    </c:if>

                    <button type="submit" class="submit-btn">Đăng ký</button>
                </form>

                <div class="login-signup">
                    Bạn đã có tài khoản rồi? <a href="${pageContext.request.contextPath}/view/login.jsp">Đăng nhập</a>
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

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/view/assets/js/validate_sign_up.js"></script>
        <script src="${pageContext.request.contextPath}/view/assets/js/show_password.js"></script>
    </body>
</html>