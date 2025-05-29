<%-- 
    Document   : changepass
    Created on : May 28, 2025, 5:54:57 PM
    Author     : PC ADMIN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SecondUni-ChangePassword</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/changepass.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/global.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/font/themify-icons/themify-icons.css">
    </head>

    <body>
        <div class="container">
            <img class="logo" src="${pageContext.request.contextPath}/asset/images/Logo_Deleted_Background.png" alt="Logo" />
            <div >
                <a href="#" class="home-btn">
                    <i class="ti-home"></i>
                </a>
            </div>
            <div class="changepass-box">
                <h2 class="box-title">Đổi mật khẩu</h2>

                <form action="changepass" method="post">
                    <div class="input-group" style="position: relative;">
                        <input type="password"  id="currentpassword" placeholder="Mật khẩu hiện tại" required />
                        <i class="ti-eye toggle-password"
                           style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
                    </div>
                    <div class="input-group" style="position: relative;">
                        <input type="password"  id="newpassword" placeholder="Mật khẩu mới" required />
                        <i class="ti-eye toggle-password"
                           style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
                    </div>

                    <% if (request.getParameter("success") != null) { %>
                    <span class="success-text">Thành công!</span>
                    <% } %>
                    <% if (request.getParameter("error") != null) { %>
                    <span class="error-text">Mật khẩu bị lặp lại!</span>
                    <% } %>

                    <button class="submit-btn">Đổi mật khẩu</button>
                </form>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/asset/js/show-password.js"></script>
    </body>
</html>
