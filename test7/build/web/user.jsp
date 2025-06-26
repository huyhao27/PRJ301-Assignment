<%-- 
    Document   : user
    Created on : Jun 21, 2025, 12:09:27 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*, dao.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="./assets/css/stylesheet.css?v=123">
    </head>
    <body>
        <jsp:include page="./assets/includes/sidebar.jsp" />
        <jsp:include page="./assets/includes/header.jsp" />
        <jsp:include page="./assets/includes/chat.jsp" />

        <%
            
            
            ProductDAO productDAO = new ProductDAO();
            AccountDAO accDAO = new AccountDAO();
            PostDAO postDAO = new PostDAO();
            FollowDAO followDAO = new FollowDAO();
            String userIdStr = request.getParameter("userId").trim();
            
            Account acc = (Account) session.getAttribute("account");
            if (acc == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            int userId = 0;
            try {
                userId = Integer.parseInt(userIdStr);
            } catch(Exception e){
            
            }
            
            if(userId == acc.getUserId()){
                response.sendRedirect("profile.jsp");
                return;
            }
            
            Account thisUser = accDAO.getAccountById(userId);
            ArrayList<Post> listPost = postDAO.getPostsByUser(userId);
            ArrayList<Product> listProduct = productDAO.getProductsBySeller(userId);
            ArrayList<Integer> listFollower = followDAO.getFollowers(userId);
            ArrayList<Integer> listFollowing = followDAO.getFollowing(userId);
            
            boolean isFollow = followDAO.isFollowing(acc.getUserId(), userId);
        %>

        <div class="main-content">
            <div class="profile-header">
                <img src="./images/avatar/<%= thisUser.getAvatar() %>" alt="Avatar" class="profile-avatar">
                <div class="profile-info">
                    <h2><%= thisUser.getUsername() %></h2>
                    <div class="profile-stats">
                        <div class="stat-block" id="post-count"><%= listPost.size() %> Bài viết</div>
                        <div class="stat-block" id="followers"><%= listFollower.size() %> Người theo dõi</div>
                        <div class="stat-block" id="following">Đang theo dõi <%= listFollowing.size() %></div>
                    </div>
                </div>
                <div class="user-action">
                    <form method="post" action="follow" class="user-action-form">
                        <input type="hidden" name="userId" value="<%= userId %>" />
                        <input type="hidden" name="action" value="<%= isFollow ? "unfollow" : "follow" %>" />
                        <input type="submit" value="<%= isFollow ? "Unfollow" : "Follow" %>" class="user-action-btn" />
                    </form>
                    
                    <form method="post" action="greeting" class="user-action-form">
                        <input type="hidden" name="userId" value="<%= userId %>" />
                        <input type="submit" value="Chat" class="user-action-btn" />
                    </form>
                </div>
            </div>

            <div class="tab-nav">
                <div class="tab-item active" onclick="showTab('posts')">Bài viết</div>
                <div class="tab-item" onclick="showTab('products')">Sản phẩm</div>
                <div class="tab-item" onclick="showTab('profile-images')">Ảnh</div>
            </div>

            <div id="posts" class="tab-content active">
                <p>Nội dung bài viết ở đây...</p>
            </div>

            <div id="products" class="tab-content">
                <div class="product-list">

                    <%
                        for(Product product : listProduct) {
                    %>


                    <a href="product-detail.jsp?productId=<%= product.getProductId() %>" class="product-item">
                        <div class="product-img">
                            <img src="./images/product/<%= product.getImage() %>" alt="Product">
                        </div>
                        <div class="product-info">
                            <h4 class="product-name"><%= product.getProductName() %></h4>
                            <p class="product-price"><%= product.getPrice() %></p>
                        </div>
                    </a>

                    <%}%>
                </div>
            </div>

            <div id="profile-images" class="tab-content">
                <div class="image-grid">
                    <% for(Post post : listPost){ %>
                    <img src="./images/post/<%= post.getImage() %>" class="image-grid-item"/>
                    <% } %>
                </div>
            </div>
        </div>
        <script>
            function showTab(tabId) {
                const tabs = ['posts', 'products', 'profile-images'];
                const index = tabs.indexOf(tabId);

                document.querySelectorAll('.tab-content').forEach(el => el.classList.remove('active'));
                document.getElementById(tabId).classList.add('active');

                document.querySelectorAll('.tab-item').forEach(el => el.classList.remove('active'));
                document.querySelectorAll('.tab-item')[index].classList.add('active');

                document.querySelector('.tab-nav').style.setProperty('--tab-index', index);
            }
        </script>
    </body>
</html>
