<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SecondUni - Login</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/login.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/global.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/icon/themify-icons/themify-icons.css">

    </head>
    <body>
        <div class="container">
            <img class="logo" src="${pageContext.request.contextPath}/view/assets/images/logo/Logo_Deleted_Background.png" alt="Logo" />
<!--            <div >
                <a href="#" class="home-btn">
                    <i class="ti-home"></i>
                </a>
            </div>-->

            <div class="login-box">
                <h1 class="box-title">Đăng nhập</h1>

                <form action="login" method="post">
                    <div class="input-group">
                        <input type="text" name="username" placeholder="Email" required />
                    </div>

                    <div class="input-group" style="position: relative;">
                        <input type="password" name="password" id="password" placeholder="Mật khẩu" required />
                        <i class="ti-eye toggle-password"
                           style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
                    </div>

                    <div class="remember-container">
                        <input type="checkbox" id="remember" name="remember"/>
                        <label for="remember">Ghi nhớ tôi</label>

                        <% if (request.getParameter("error") != null) { %>
                        <span class="error-text">Không chính xác!</span>
                        <% } %>
                    </div>

                    <button class="submit-btn" type="submit">Đăng nhập</button>
                </form>

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

                <div class="login-signup">
                    Bạn chưa có tài khoản? <a href="/view/signup.jsp">Đăng ký</a>
                </div>
            </div>
        </div>


        <script src="${pageContext.request.contextPath}/asset/js/show-password.js"></script>

    </body>
</html>
