<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*, dao.*" %>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="./assets/css/stylesheet.css">
    </head>
    <body>
        <jsp:include page="./assets/includes/sidebar.jsp" />
        <jsp:include page="./assets/includes/header.jsp" />
        <jsp:include page="./assets/includes/chat.jsp" />

        <%
            Account acc = (Account) session.getAttribute("account");
            if (acc == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            int userId = acc.getUserId();
        
            ProductDAO productDAO = new ProductDAO();
            CartDAO cartDAO = new CartDAO();
            CartItemDAO cartItemDAO = new CartItemDAO();
        
            Cart cart = cartDAO.getCartByUserId(userId);
            ArrayList<CartItem> listCartItem = cartItemDAO.getCartItemsByCartId(cart.getCartId());
            double totalAmount = 0;
        %>

        <div class="main-content">
            <div class="cart-container">
                <form method="post" action="checkout">
                    <table class="cart-table">
                        <thead>
                            <tr>
                                <th width="5%"><input type="checkbox" id="select-all"></th>
                                <th width="45%">Sản Phẩm</th>
                                <th width="15%">Đơn Giá</th>
                                <th width="15%">Số Lượng</th>
                                <th width="15%">Số Tiền</th>
                                <th width="5%">Thao Tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(CartItem cartItem : listCartItem) {
                                Product p = productDAO.getProductById(cartItem.getProductId());
                                double itemTotal = p.getPrice() * cartItem.getQuantity();
                                totalAmount += itemTotal;
                            %>
                            <tr class="cart-item">
                                <td><input type="checkbox" name="selectedProductId" value="<%= cartItem.getProductId() %>" checked></td>
                                <td>
                                    <a href="product-detail.jsp?productId=<%= p.getProductId() %>" class="cart-product-info">
                                        <img src="./images/product/<%= p.getImage() %>" alt="" class="product-image">
                                        <div class="product-details">
                                            <div class="product-title"><%= p.getProductName() %></div>
                                        </div>
                                    </a>
                                </td>
                                <td class="product-price"><%= p.getPrice() %></td>
                                <td>
                                    <div class="quantity-control">
                                        <button type="button" class="quantity-btn minus">-</button>
                                        <input type="number" value="<%= cartItem.getQuantity() %>" class="quantity-input">
                                        <button type="button" class="quantity-btn plus">+</button>
                                    </div>
                                </td>
                                <td class="product-total"><%= itemTotal %></td>
                                <td><button type="button" class="delete-btn">Xóa</button></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>

                    <div class="sticky-footer">
                        <div class="footer-content">
                            <div class="footer-left">
                                <input type="checkbox" id="footer-select-all">
                                <label for="footer-select-all">Chọn tất cả</label>
                                <button type="button" class="delete-selected">Xóa</button>
                            </div>
                            <div class="footer-right">
                                <div class="total-price">
                                    <span>Tổng thanh toán (<span id="selected-count">1</span> sản phẩm):</span>
                                    <strong><%= totalAmount %></strong>
                                </div>
                                <input type="submit" value="Mua Hàng" class="checkout-btn"/>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const selectAllTop = document.getElementById("select-all");
                const selectAllBottom = document.getElementById("footer-select-all");
                const checkboxes = document.querySelectorAll(".cart-item input[type='checkbox']");
                const quantityInputs = document.querySelectorAll(".quantity-input");
                const totalPriceEl = document.querySelector(".total-price strong");
                const cartId = <%= cart.getCartId() %>; // ✅ moved here to be global

                function updateTotal() {
                    let total = 0;
                    let selectedCount = 0;

                    document.querySelectorAll(".cart-item").forEach(item => {
                        const checkbox = item.querySelector("input[type='checkbox']");
                        const price = parseFloat(item.querySelector(".product-price").innerText);
                        const quantity = parseInt(item.querySelector(".quantity-input").value);

                        if (checkbox.checked) {
                            total += price * quantity;
                            selectedCount++;
                        }

                        item.querySelector(".product-total").innerText = (price * quantity).toFixed(2);
                    });

                    totalPriceEl.innerText = total.toFixed(2);
                    document.querySelector("label[for='footer-select-all']").innerHTML = `Chọn tất cả (<span>${selectedCount}</span>)`;
                    document.getElementById("selected-count").innerText = selectedCount;
                }

                function toggleAllCheckboxes(isChecked) {
                    checkboxes.forEach(cb => cb.checked = isChecked);
                    updateTotal();
                }

                selectAllTop.addEventListener("change", e => {
                    toggleAllCheckboxes(e.target.checked);
                    selectAllBottom.checked = e.target.checked;
                });

                selectAllBottom.addEventListener("change", e => {
                    toggleAllCheckboxes(e.target.checked);
                    selectAllTop.checked = e.target.checked;
                });

                checkboxes.forEach(cb => cb.addEventListener("change", updateTotal));

                quantityInputs.forEach(input => {
                    input.addEventListener("input", () => {
                        if (input.value < 1)
                            input.value = 1;
                        updateTotal();
                    });
                });

                updateTotal();

                quantityInputs.forEach(input => {
                    const row = input.closest(".cart-item");
                    const productId = row.querySelector("input[type='checkbox']").value;

                    row.querySelector(".plus").addEventListener("click", () => {
                        updateQuantity(productId, 1, input);
                    });

                    row.querySelector(".minus").addEventListener("click", () => {
                        if (parseInt(input.value) > 1) {
                            updateQuantity(productId, -1, input);
                        }
                    });
                });

                function updateQuantity(productId, change, inputEl) {
                    fetch('<%= request.getContextPath() %>/update-cart-quantity', {
                        method: 'POST',
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                        body: `cartId=${cartId}&productId=${productId}&addAmount=${change}`
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            const newValue = parseInt(inputEl.value) + change;
                            inputEl.value = newValue > 0 ? newValue : 1;
                            updateTotal();
                        } else {
                            alert("Cập nhật thất bại!");
                        }
                    })
                    .catch(() => alert("Lỗi khi kết nối đến server."));
                }

                // ✅ Moved inside DOMContentLoaded and use cartId
                document.querySelectorAll(".delete-btn").forEach(btn => {
                    btn.addEventListener("click", function () {
                        const row = btn.closest(".cart-item");
                        const productId = row.querySelector("input[type='checkbox']").value;

                        if (!confirm("Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng không?"))
                            return;

                        fetch("<%= request.getContextPath() %>/delete-cart-item", {
                            method: "POST",
                            headers: {"Content-Type": "application/x-www-form-urlencoded"},
                            body: `cartId=${cartId}&productId=${productId}`
                        })
                        .then(res => res.json())
                        .then(data => {
                            if (data.success) {
                                row.remove();
                                updateTotal();
                            } else {
                                alert("Xóa thất bại!");
                            }
                        })
                        .catch(() => alert("Lỗi kết nối khi xóa sản phẩm."));
                    });
                });

            });
        </script>
    </body>
</html>
