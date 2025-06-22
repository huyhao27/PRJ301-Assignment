<%-- 
    Document   : home
    Created on : Jun 11, 2025, 2:59:45 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*, dao.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="./assets/css/stylesheet.css?v=123">
    </head>
    <body>
        <jsp:include page="./assets/includes/sidebar.jsp" />
        <jsp:include page="./assets/includes/header.jsp" />
        <jsp:include page="./assets/includes/chat.jsp" />
        <div class="main-content">

            <div class="insta-post">
                <div class="insta-header">
                    <div class="insta-profile">
                        <img src="./images/test/ultra.jpg" class="insta-avatar" alt="avatar">
                        <span class="insta-username">strangerthingstv</span>
                    </div>
                </div>
                
                

                <img src="./images/test/ultera.jpg" class="post-img" />

                <div class="post-actions">
                    <img src="./assets/icon/heart.png" class="icon-btn heart-btn" alt="like">
                    <img src="./assets/icon/comment-alt.png" class="icon-btn comment-btn comment-toggle" alt="comment"
                         onclick="toggleComments()">
                    <img src="./assets/icon/bookmark.png" class="icon-btn save-btn" alt="save">
                </div>

                <div class="insta-likes">4 lượt thích</div>
                <div class="insta-caption">
                    <strong>strangerthingstv</strong>
                    <span>the final chapter. the highest stakes.</span>
                </div>

                <div class="insta-comments all-comments" id="comment-full" style="display: none;" >
                    <div class="comment"><strong>emmaschmich</strong> y’all better not touch hopper or steve</div>
                    <div class="comment"><strong>rec.byluucas</strong> it's been 84 years...</div>
                    <div class="comment"><strong>fan123</strong> I’m not ready 😭</div>
                </div>

                <form class="comment-form" action="/post-comment" method="POST">
                    <input type="text" name="comment-text" class="comment-input" placeholder="Thêm bình luận..."
                           aria-label="Viết bình luận">
                    <button type="submit" class="comment-submit">Đăng</button>
                </form>



            </div>
        </div>
        
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                function toggleComments() {
                    const commentSection = document.getElementById('comment-full');
                    commentSection.style.display =
                            commentSection.style.display === 'none' ? 'block' : 'none';
                }

                document.querySelector('.comment-toggle').addEventListener('click', toggleComments);

                document.querySelector('.heart-btn').addEventListener('click', function () {
                    const isRedHeart = this.src.includes('redheart.png');
                    this.src = isRedHeart ? './assets/icon/heart.png' : './assets/icon/redheart.png';
                    this.classList.add('like-animation');
                    setTimeout(() => this.classList.remove('like-animation'), 500);
                });

                const saveBtn = document.querySelector('.save-btn');
                saveBtn.addEventListener('click', function () {
                    if (this.src.includes('bookmark.png')) {
                        this.src = './assets/icon/saved.png';
                        this.classList.add('save-animation');
                        setTimeout(() => this.classList.remove('save-animation'), 500);
                    } else {
                        this.src = './assets/icon/bookmark.png';
                    }
                });
            });
        </script>
        <script src=".assets/js/script.js"></script>
    </body>
</html>
