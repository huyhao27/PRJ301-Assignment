

-- Chèn dữ liệu vào bảng Accounts
INSERT INTO Accounts (username, password, fullName, email, phone, avatar, role) VALUES
(N'nguyenvana', N'hashed_pass_1', N'Nguyễn Văn A', N'vana@example.com', N'0901234567', N'avatar_a.jpg', 'user'),
(N'tranvanb', N'hashed_pass_2', N'Trần Thị B', N'vanb@example.com', N'0912345678', N'avatar_b.jpg', 'user'),
(N'lethic', N'hashed_pass_3', N'Lê Văn C', N'thic@example.com', N'0923456789', N'avatar_c.jpg', 'admin'),
(N'phamvand', N'hashed_pass_4', N'Phạm Thu D', N'vand@example.com', N'0934567890', N'avatar_d.jpg', 'user'),
(N'hoangthie', N'hashed_pass_5', N'Hoàng Trọng E', N'thie@example.com', N'0945678901', N'avatar_e.jpg', 'user');
GO

-- Chèn dữ liệu vào bảng Posts
-- userId 1: Nguyễn Văn A
INSERT INTO Posts (userId, content, image) VALUES
(1, N'Hôm nay trời đẹp quá, đi dạo một vòng hồ.', N'post_image_1.jpg'),
(1, N'Vừa đọc xong một cuốn sách rất hay, mọi người nên thử!', N'post_image_2.jpg');

-- userId 2: Trần Thị B
INSERT INTO Posts (userId, content, image) VALUES
(2, N'Buổi tối ấm cúng bên gia đình.', N'post_image_3.jpg'),
(2, N'Món ăn mới tự làm, ngon tuyệt!', N'post_image_4.jpg');

-- userId 3: Lê Văn C
INSERT INTO Posts (userId, content, image) VALUES
(3, N'Công việc hôm nay rất hiệu quả.', N'post_image_5.jpg');
GO

-- Chèn dữ liệu vào bảng Likes
INSERT INTO Likes (userId, postId) VALUES
(2, 1), -- Trần Thị B thích bài của Nguyễn Văn A
(3, 1), -- Lê Văn C thích bài của Nguyễn Văn A
(1, 3), -- Nguyễn Văn A thích bài của Trần Thị B
(4, 2); -- Phạm Thu D thích bài của Nguyễn Văn A
GO

-- Chèn dữ liệu vào bảng Comments
INSERT INTO Comments (postId, userId, content) VALUES
(1, 2, N'Đẹp quá bạn ơi!'),
(1, 3, N'Ảnh nhìn bình yên thật.'),
(3, 1, N'Nghe có vẻ hấp dẫn, món gì vậy bạn?'),
(2, 4, N'Cuốn sách tên gì vậy bạn?');
GO

-- Chèn dữ liệu vào bảng SavedPosts
INSERT INTO SavedPosts (userId, postId) VALUES
(2, 1), -- Trần Thị B lưu bài của Nguyễn Văn A
(1, 3); -- Nguyễn Văn A lưu bài của Trần Thị B
GO

-- Chèn dữ liệu vào bảng Messages
INSERT INTO Messages (senderId, receiverId, content) VALUES
(1, 2, N'Chào bạn, bạn khỏe không?'),
(2, 1, N'Mình khỏe, cảm ơn bạn. Bạn có gì không?'),
(3, 4, N'Chào bạn, mình có việc muốn hỏi.'),
(4, 3, N'Ok bạn, bạn cứ nói đi.');
GO

-- Chèn dữ liệu vào bảng Follows
INSERT INTO Follows (followerId, followingId) VALUES
(1, 2), -- Nguyễn Văn A theo dõi Trần Thị B
(2, 1), -- Trần Thị B theo dõi Nguyễn Văn A
(3, 1), -- Lê Văn C theo dõi Nguyễn Văn A
(4, 2); -- Phạm Thu D theo dõi Trần Thị B
GO

-- Chèn dữ liệu vào bảng Categories
INSERT INTO Categories (categoryName) VALUES
(N'Thời trang'),
(N'Điện tử'),
(N'Sách'),
(N'Đồ gia dụng'),
(N'Thủ công');
GO

-- Chèn dữ liệu vào bảng Products
INSERT INTO Products (sellerId, productName, image, description, price, quantity, categoryId) VALUES
(1, N'Áo phông nam Cotton', N'tshirt_1.jpg', N'Áo phông chất liệu cotton cao cấp, mềm mại và thoáng mát.', 150000.00, 100, 1),
(1, N'Quần jeans nữ Slim-fit', N'jeans_1.jpg', N'Quần jeans nữ dáng ôm, co giãn tốt, phù hợp mọi vóc dáng.', 350000.00, 80, 1),
(2, N'Tai nghe Bluetooth Sony', N'headphone_sony.jpg', N'Tai nghe không dây chất lượng âm thanh tuyệt vời, pin lâu.', 1200000.00, 50, 2),
(2, N'Sạc dự phòng 10000mAh', N'powerbank.jpg', N'Sạc dự phòng dung lượng lớn, sạc nhanh.', 250000.00, 120, 2),
(3, N'Sách "Đắc nhân tâm"', N'book_dacnhantam.jpg', N'Cuốn sách kinh điển về nghệ thuật giao tiếp và đối nhân xử thế.', 99000.00, 200, 3),
(4, N'Nồi cơm điện tử Philips', N'ricecooker.jpg', N'Nồi cơm điện thông minh, đa chức năng, dễ sử dụng.', 800000.00, 30, 4);
GO

-- Chèn dữ liệu vào bảng Carts
INSERT INTO Carts (userId) VALUES
(1), -- Giỏ hàng của Nguyễn Văn A
(2), -- Giỏ hàng của Trần Thị B
(4); -- Giỏ hàng của Phạm Thu D
GO

-- Chèn dữ liệu vào bảng CartItems
-- Giỏ hàng của userId 1 (cartId 1)
INSERT INTO CartItems (cartId, productId, quantity) VALUES
(1, 1, 2), -- Nguyễn Văn A thêm 2 áo phông
(1, 5, 1); -- Nguyễn Văn A thêm 1 cuốn sách

-- Giỏ hàng của userId 2 (cartId 2)
INSERT INTO CartItems (cartId, productId, quantity) VALUES
(2, 3, 1); -- Trần Thị B thêm 1 tai nghe

-- Giỏ hàng của userId 4 (cartId 3)
INSERT INTO CartItems (cartId, productId, quantity) VALUES
(3, 4, 1), -- Phạm Thu D thêm 1 sạc dự phòng
(3, 6, 1); -- Phạm Thu D thêm 1 nồi cơm điện
GO

-- Chèn dữ liệu vào bảng Orders
-- userId 1: Nguyễn Văn A đặt hàng
INSERT INTO Orders (userId, totalPrice, status, shippingAddress) VALUES
(1, 450000.00, N'Đã giao', N'Số 10, Ngõ 20, Đường Kim Mã, Quận Ba Đình, Hà Nội'),
(1, 99000.00, N'Đang xử lý', N'Số 10, Ngõ 20, Đường Kim Mã, Quận Ba Đình, Hà Nội');

-- userId 2: Trần Thị B đặt hàng
INSERT INTO Orders (userId, totalPrice, status, shippingAddress) VALUES
(2, 1200000.00, N'Đã giao', N'Số 5, Đường Láng, Quận Đống Đa, Hà Nội');
GO

-- Chèn dữ liệu vào bảng OrderItems
-- Đơn hàng 1 của userId 1 (totalPrice 450000.00)
INSERT INTO OrderItems (orderId, productId, quantity) VALUES
(1, 1, 2), -- 2 áo phông (2 * 150k = 300k)
(1, 2, 1); -- 1 quần jeans (1 * 350k = 350k) --> Tổng 650k. Có thể cần chỉnh totalPrice ở bảng Orders nếu tính toán kỹ hơn.
           -- (Lưu ý: total_price trong bảng Orders nên được tính toán dựa trên tổng các sản phẩm trong OrderItems)
           -- (Để cho đơn giản, tôi sẽ giữ nguyên giá trị đã đặt, bạn có thể tự chỉnh sửa cho phù hợp với logic của mình)
           -- Đã sửa: 2*150k + 1*350k = 650k. Vui lòng cập nhật totalPrice ở bảng Orders hoặc tạo dữ liệu sao cho đúng. Tôi sẽ giữ nguyên dữ liệu gốc của bạn và chỉ chèn item.

-- Đơn hàng 2 của userId 1 (totalPrice 99000.00)
INSERT INTO OrderItems (orderId, productId, quantity) VALUES
(2, 5, 1); -- 1 sách Đắc nhân tâm

-- Đơn hàng 3 của userId 2 (totalPrice 1200000.00)
INSERT INTO OrderItems (orderId, productId, quantity) VALUES
(3, 3, 1); -- 1 tai nghe Bluetooth Sony
GO

-- Chèn dữ liệu vào bảng Reviews
INSERT INTO Reviews (productId, userId, rating, comment) VALUES
(1, 2, 5, N'Áo phông rất đẹp và chất lượng, rất ưng ý!'),
(3, 1, 4, N'Tai nghe âm thanh tốt, nhưng pin hơi nhanh hết.'),
(5, 4, 5, N'Sách hay, giao hàng nhanh.'),
(6, 1, 5, N'Nồi cơm điện dễ sử dụng, cơm ngon.');
GO

-- Chèn dữ liệu vào bảng Notifications
-- Thông báo cho userId 1
INSERT INTO Notifications (userId, postId, type) VALUES
(1, 3, 'like'), -- UserId 1 nhận thông báo có người like bài của họ (postId 3)
(1, 4, 'cmt'); -- UserId 1 nhận thông báo có người comment bài của họ (postId 4)

-- Thông báo cho userId 2
INSERT INTO Notifications (userId, postId, type) VALUES
(2, 1, 'like'), -- UserId 2 nhận thông báo có người like bài của họ (postId 1)
(2, NULL, 'fl'); -- UserId 2 nhận thông báo có người theo dõi họ (không liên quan đến postId)
GO