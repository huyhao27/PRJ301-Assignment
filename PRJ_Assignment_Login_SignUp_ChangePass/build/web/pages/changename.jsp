<%-- 
    Document   : changename
    Created on : May 28, 2025, 11:03:30 PM
    Author     : PC ADMIN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SecondUni-ChangeName</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/changename.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/global.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/font/themify-icons/themify-icons.css">
    </head>

    <body>
        <div class="container">
            <img class="logo" src="${pageContext.request.contextPath}/asset/images/Logo_Deleted_Background.png" alt="Logo" />
            <div>
                <a href="#" class="home-btn">
                    <i class="ti-home"></i>
                </a>
            </div>
            <div class="changename-box">
                <h2 class="box-title">Đổi tên</h2>

                <form action="changename" method="post">
                <div class="input-group">
                    <input type="text"  class="newname" placeholder="Nhập tên mới" required />
                </div>
                
                <% if (request.getParameter("success") != null) { %>
                <span class="success-text">Thành công!</span>
                <% } %>
                <button class="submit-btn">Lưu thay đổi</button>
                </form>
            </div>
        </div>
    </body>
</html>
