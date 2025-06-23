<%-- 
    Document   : shop
    Created on : Jun 11, 2025, 11:31:52 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*, dao.*" %>
<%
    request.setAttribute("currentPage", "shop");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop</title>
        <link rel="stylesheet" href="./assets/css/stylesheet.css">
    </head>
    <body>
        <jsp:include page="./assets/includes/sidebar.jsp" />
        <jsp:include page="./assets/includes/header.jsp" />
        <jsp:include page="./assets/includes/chat.jsp" />

        <div class="main-content">
            
            <%
                ProductDAO productDAO = new ProductDAO();
                AccountDAO accDAO = new AccountDAO();
                CategoryDAO categoryDAO = new CategoryDAO();
                ArrayList<Product> listProduct = productDAO.getAllProducts();
                ArrayList<Category> listCategory = categoryDAO.getAllCategories();
            %>
            
            <div class="filter-section">
                <form action="filter" method="get">
                    <div class="selected-filters">
                        <div class="filter-title">
                            <img src="./assets/icon/bfilter.png" class="icon" />
                            <span><strong> Bộ lọc</strong></span>
                        </div>
                        <button type="reset" class="reset-button">Bỏ hết</button>
                    </div>

                    <div class="filter-options">
                        <div class="filter-group">
                            <button type="button" class="filter-toggle">Danh mục</button>
                            <div class="filter-content checkbox-list">
                                <label><input type="checkbox" name="category" value="ao"> Tất cả</label>
                                <% for(Category category : listCategory){ %>
                                    <label><input type="checkbox" name="category" value="<%= category.getCategoryId() %>"> <%= category.getCategoryName() %></label>
                                <% } %>
                            </div>
                        </div>

                        <div class="filter-group">
                            <button type="button" class="filter-toggle">Lọc theo giá</button>
                            <div class="filter-content price-filter">
                                <input type="number" name="minPrice" placeholder="Giá từ"> -
                                <input type="number" name="maxPrice" placeholder="đến">
                                <button type="submit" class="icon-button">
                                    <img src="./assets/icon/bfilter.png" alt="Lọc">
                                </button>
                            </div>
                        </div>

                        <div class="filter-group">
                            <button type="button" class="filter-toggle">Sắp xếp</button>
                            <div class="filter-content radio-list">
                                <label><input type="radio" name="sort" value="default" checked> Mặc định</label>
                                <label><input type="radio" name="sort" value="az">A → Z</label>
                                <label><input type="radio" name="sort" value="za">Z → A</label>
                                <label><input type="radio" name="sort" value="priceAsc"> Giá tăng dần</label>
                                <label><input type="radio" name="sort" value="priceDesc"> Giá giảm dần</label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            
            

            <!-- Product Grid -->
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
    </body>
</html>
