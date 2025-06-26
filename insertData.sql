-- Accounts
SET IDENTITY_INSERT Accounts ON;
INSERT INTO Accounts (userId, username, password, fullName, email, phone, avatar, role, createdAt) VALUES
(1, 'john_doe', 'hashed_password_1', 'John Doe', 'john.doe@example.com', '123-456-7890', 'avatar_john.jpg', 'user', GETDATE()),
(2, 'jane_smith', 'hashed_password_2', 'Jane Smith', 'jane.smith@example.com', '987-654-3210', 'avatar_jane.jpg', 'user', GETDATE()),
(3, 'alice_wonder', 'hashed_password_3', 'Alice Wonderland', 'alice.w@example.com', '555-111-2222', 'avatar_alice.jpg', 'user', GETDATE()),
(4, 'bob_builder', 'hashed_password_4', 'Bob The Builder', 'bob.b@example.com', '111-222-3333', 'avatar_bob.jpg', 'user', GETDATE()),
(5, 'charlie_chaplin', 'hashed_password_5', 'Charlie Chaplin', 'charlie.c@example.com', '444-555-6666', 'avatar_charlie.jpg', 'user', GETDATE()),
(6, 'diana_prince', 'hashed_password_6', 'Diana Prince', 'diana.p@example.com', '777-888-9999', 'avatar_diana.jpg', 'user', GETDATE()),
(7, 'eve_adams', 'hashed_password_7', 'Eve Adams', 'eve.a@example.com', '333-444-5555', 'avatar_eve.jpg', 'user', GETDATE()),
(8, 'frank_sinatra', 'hashed_password_8', 'Frank Sinatra', 'frank.s@example.com', '666-777-8888', 'avatar_frank.jpg', 'user', GETDATE()),
(9, 'grace_kelly', 'hashed_password_9', 'Grace Kelly', 'grace.k@example.com', '222-333-4444', 'avatar_grace.jpg', 'user', GETDATE()),
(10, 'harry_potter', 'hashed_password_10', 'Harry Potter', 'harry.p@example.com', '999-000-1111', 'avatar_harry.jpg', 'user', GETDATE()),
(11, 'admin_user', 'hashed_admin_pass', 'Admin User', 'admin@example.com', '000-111-2222', 'avatar_admin.jpg', 'admin', GETDATE()),
(12, 'seller_alpha', 'hashed_seller_pass_a', 'Alpha Seller', 'alpha.s@example.com', '111-000-2222', 'avatar_alpha.jpg', 'seller', GETDATE()),
(13, 'seller_beta', 'hashed_seller_pass_b', 'Beta Seller', 'beta.s@example.com', '222-111-3333', 'avatar_beta.jpg', 'seller', GETDATE()),
(14, 'chris_evans', 'hashed_chris_pass', 'Chris Evans', 'chris.e@example.com', '333-222-4444', 'avatar_chris.jpg', 'user', GETDATE()),
(15, 'olivia_wilde', 'hashed_olivia_pass', 'Olivia Wilde', 'olivia.w@example.com', '444-333-5555', 'avatar_olivia.jpg', 'user', GETDATE()),
(16, 'peter_parker', 'hashed_peter_pass', 'Peter Parker', 'peter.p@example.com', '555-444-6666', 'avatar_peter.jpg', 'user', GETDATE()),
(17, 'quinn_harley', 'hashed_quinn_pass', 'Quinn Harley', 'quinn.h@example.com', '666-555-7777', 'avatar_quinn.jpg', 'user', GETDATE()),
(18, 'rachel_green', 'hashed_rachel_pass', 'Rachel Green', 'rachel.g@example.com', '777-666-8888', 'avatar_rachel.jpg', 'user', GETDATE()),
(19, 'steve_rogers', 'hashed_steve_pass', 'Steve Rogers', 'steve.r@example.com', '888-777-9999', 'avatar_steve.jpg', 'user', GETDATE()),
(20, 'tina_turner', 'hashed_tina_pass', 'Tina Turner', 'tina.t@example.com', '999-888-0000', 'avatar_tina.jpg', 'user', GETDATE());
SET IDENTITY_INSERT Accounts OFF;

-- Posts
SET IDENTITY_INSERT Posts ON;
INSERT INTO Posts (postId, userId, content, image, createdAt) VALUES
(1, 1, 'Enjoying a beautiful sunset!', 'sunset.jpg', GETDATE()),
(2, 2, 'Just finished a great workout!', 'workout.png', GETDATE()),
(3, 3, 'My new art project is finally done!', 'art_project.jpeg', GETDATE()),
(4, 4, 'Building something amazing today.', 'building_site.jpg', GETDATE()),
(5, 5, 'Laughing all the way!', 'funny_moment.gif', GETDATE()),
(6, 6, 'Empowering women everywhere.', 'women_power.jpg', GETDATE()),
(7, 7, 'Exploring new places.', 'travel_pic.jpg', GETDATE()),
(8, 8, 'Singing my heart out.', 'singing_stage.png', GETDATE()),
(9, 9, 'A classic moment revisited.', 'classic_film.jpg', GETDATE()),
(10, 10, 'Magic is real!', 'magic_trick.jpg', GETDATE()),
(11, 1, 'Having a lovely day!', 'day_out.jpg', GETDATE()),
(12, 2, 'Healthy eating for a healthy life.', 'healthy_food.png', GETDATE()),
(13, 3, 'Inspiration strikes!', 'inspiration.jpeg', GETDATE()),
(14, 4, 'Progress report on my latest build.', 'construction.jpg', GETDATE()),
(15, 5, 'Spreading joy one smile at a time.', 'happy_face.gif', GETDATE()),
(16, 6, 'Strength and grace.', 'graceful_pose.jpg', GETDATE()),
(17, 7, 'Adventure awaits!', 'adventure_landscape.jpg', GETDATE()),
(18, 8, 'Jazz night vibes.', 'jazz_club.png', GETDATE()),
(19, 9, 'Elegance never fades.', 'elegant_dress.jpg', GETDATE()),
(20, 10, 'A new spell learned.', 'spellbook.jpg', GETDATE());
SET IDENTITY_INSERT Posts OFF;

-- Likes
INSERT INTO Likes (userId, postId, likedAt) VALUES
(2, 1, GETDATE()),
(3, 1, GETDATE()),
(1, 2, GETDATE()),
(4, 2, GETDATE()),
(5, 3, GETDATE()),
(1, 3, GETDATE()),
(2, 4, GETDATE()),
(3, 5, GETDATE()),
(4, 6, GETDATE()),
(5, 7, GETDATE()),
(6, 8, GETDATE()),
(7, 9, GETDATE()),
(8, 10, GETDATE()),
(9, 11, GETDATE()),
(10, 12, GETDATE()),
(1, 13, GETDATE()),
(2, 14, GETDATE()),
(3, 15, GETDATE()),
(4, 16, GETDATE()),
(5, 17, GETDATE()),
(6, 18, GETDATE()),
(7, 19, GETDATE()),
(8, 20, GETDATE()),
(9, 1, GETDATE()),
(10, 2, GETDATE()); -- Added a few more to reach close to 20 unique combos

-- Comments
SET IDENTITY_INSERT Comments ON;
INSERT INTO Comments (commentId, postId, userId, content, createdAt) VALUES
(1, 1, 2, 'Amazing shot!', GETDATE()),
(2, 1, 3, 'Looks peaceful!', GETDATE()),
(3, 2, 1, 'Great work!', GETDATE()),
(4, 3, 5, 'So creative!', GETDATE()),
(5, 4, 1, 'Keep up the good work!', GETDATE()),
(6, 5, 2, 'Hilarious!', GETDATE()),
(7, 6, 3, 'Inspiring!', GETDATE()),
(8, 7, 4, 'Where is this?', GETDATE()),
(9, 8, 5, 'Beautiful voice!', GETDATE()),
(10, 9, 6, 'Timeless!', GETDATE()),
(11, 10, 7, 'How did you do that?', GETDATE()),
(12, 11, 8, 'Looks like fun!', GETDATE()),
(13, 12, 9, 'Yum, healthy!', GETDATE()),
(14, 13, 10, 'So true!', GETDATE()),
(15, 14, 1, 'Impressive progress!', GETDATE()),
(16, 15, 2, 'You always make me smile!', GETDATE()),
(17, 16, 3, 'Stunning!', GETDATE()),
(18, 17, 4, 'Ready for an adventure!', GETDATE()),
(19, 18, 5, 'Love the ambiance!', GETDATE()),
(20, 19, 6, 'Pure elegance!', GETDATE());
SET IDENTITY_INSERT Comments OFF;

-- SavedPosts
INSERT INTO SavedPosts (userId, postId, savedAt) VALUES
(1, 2, GETDATE()),
(1, 4, GETDATE()),
(2, 3, GETDATE()),
(3, 1, GETDATE()),
(4, 5, GETDATE()),
(5, 6, GETDATE()),
(6, 7, GETDATE()),
(7, 8, GETDATE()),
(8, 9, GETDATE()),
(9, 10, GETDATE()),
(10, 1, GETDATE()),
(11, 2, GETDATE()),
(12, 3, GETDATE()),
(13, 4, GETDATE()),
(14, 5, GETDATE()),
(15, 6, GETDATE()),
(16, 7, GETDATE()),
(17, 8, GETDATE()),
(18, 9, GETDATE()),
(19, 10, GETDATE());

-- Messages
SET IDENTITY_INSERT Messages ON;
INSERT INTO Messages (messageId, senderId, receiverId, content, sentAt) VALUES
(1, 1, 2, 'Hey Jane, how are you?', GETDATE()),
(2, 2, 1, 'Hi John! I am doing great, thanks!', GETDATE()),
(3, 3, 4, 'Can you help me with this?', GETDATE()),
(4, 4, 3, 'Sure, what do you need?', GETDATE()),
(5, 5, 6, 'What time is the meeting?', GETDATE()),
(6, 6, 5, 'It''s at 3 PM.', GETDATE()),
(7, 7, 8, 'Long time no see!', GETDATE()),
(8, 8, 7, 'I know! We should catch up soon.', GETDATE()),
(9, 9, 10, 'Are you free tomorrow?', GETDATE()),
(10, 10, 9, 'Yes, what\s up?', GETDATE()),
(11, 1, 3, 'Just wanted to say hi!', GETDATE()),
(12, 2, 4, 'Checking in!', GETDATE()),
(13, 3, 1, 'Thanks for the help!', GETDATE()),
(14, 4, 2, 'No problem!', GETDATE()),
(15, 5, 7, 'Got any plans for the weekend?', GETDATE()),
(16, 6, 8, 'See you there!', GETDATE()),
(17, 7, 5, 'Thinking of you!', GETDATE()),
(18, 8, 6, 'Good to hear from you!', GETDATE()),
(19, 9, 1, 'Anything new?', GETDATE()),
(20, 10, 2, 'Having a great day!', GETDATE());
SET IDENTITY_INSERT Messages OFF;

-- Follows
INSERT INTO Follows (followerId, followingId, followedAt) VALUES
(1, 2, GETDATE()),
(1, 3, GETDATE()),
(2, 1, GETDATE()),
(3, 1, GETDATE()),
(4, 1, GETDATE()),
(5, 2, GETDATE()),
(6, 3, GETDATE()),
(7, 4, GETDATE()),
(8, 5, GETDATE()),
(9, 6, GETDATE()),
(10, 7, GETDATE()),
(11, 1, GETDATE()),
(12, 2, GETDATE()),
(13, 3, GETDATE()),
(14, 1, GETDATE()),
(15, 2, GETDATE()),
(16, 3, GETDATE()),
(17, 4, GETDATE()),
(18, 5, GETDATE()),
(19, 6, GETDATE());

-- Notifications
INSERT INTO Notifications (userId, postId, type, createdAt) VALUES
(1, 2, 'like', GETDATE()),
(1, 3, 'cmt', GETDATE()),
(2, 1, 'like', GETDATE()),
(3, 1, 'cmt', GETDATE()),
(4, NULL, 'fl', GETDATE()), -- Follow notification
(5, 2, 'like', GETDATE()),
(6, 3, 'cmt', GETDATE()),
(7, 4, 'like', GETDATE()),
(8, NULL, 'fl', GETDATE()),
(9, 5, 'like', GETDATE()),
(10, 6, 'cmt', GETDATE()),
(1, 7, 'like', GETDATE()),
(2, 8, 'cmt', GETDATE()),
(3, 9, 'like', GETDATE()),
(4, NULL, 'fl', GETDATE()),
(5, 10, 'cmt', GETDATE()),
(6, 11, 'like', GETDATE()),
(7, 12, 'cmt', GETDATE()),
(8, 13, 'like', GETDATE()),
(9, 14, 'cmt', GETDATE());

-- Categories
SET IDENTITY_INSERT Categories ON;
INSERT INTO Categories (categoryId, categoryName) VALUES
(1, 'Electronics'),
(2, 'Apparel'),
(3, 'Home Goods'),
(4, 'Books'),
(5, 'Sports & Outdoors'),
(6, 'Toys & Games'),
(7, 'Beauty & Personal Care'),
(8, 'Food & Beverages'),
(9, 'Automotive'),
(10, 'Health'),
(11, 'Jewelry'),
(12, 'Pet Supplies'),
(13, 'Office Products'),
(14, 'Garden & Outdoor'),
(15, 'Musical Instruments'),
(16, 'Art Supplies'),
(17, 'Digital Goods'),
(18, 'Services'),
(19, 'Collectibles'),
(20, 'Handmade');
SET IDENTITY_INSERT Categories OFF;
-- Products
SET IDENTITY_INSERT Products ON;
INSERT INTO Products (productId, sellerId, productName, image, description, price, quantity, categoryId, createdAt) VALUES
(1, 12, 'Smartphone X', 'phone_x.jpg', 'Latest model with advanced features.', 999.99, 50, 1, GETDATE()),
(2, 12, 'Laptop Pro', 'laptop_pro.jpg', 'High-performance laptop for professionals.', 1499.00, 30, 1, GETDATE()),
(3, 13, 'Vintage T-Shirt', 'tshirt_vintage.jpg', 'Soft cotton vintage style t-shirt.', 25.00, 100, 2, GETDATE()),
(4, 13, 'Running Shoes', 'shoes_running.jpg', 'Comfortable and durable running shoes.', 75.50, 80, 5, GETDATE()),
(5, 12, 'Smart Speaker', 'smart_speaker.jpg', 'Voice-controlled smart home speaker.', 120.00, 40, 1, GETDATE()),
(6, 13, 'Designer Dress', 'dress_designer.jpg', 'Elegant evening gown.', 250.00, 15, 2, GETDATE()),
(7, 12, 'Wireless Earbuds', 'earbuds_wireless.jpg', 'Crystal clear audio with long battery life.', 89.99, 70, 1, GETDATE()),
(8, 13, 'Yoga Mat', 'yoga_mat.jpg', 'Eco-friendly and non-slip yoga mat.', 35.00, 60, 5, GETDATE()),
(9, 12, 'Gaming Console', 'gaming_console.jpg', 'Next-gen gaming experience.', 499.00, 25, 1, GETDATE()),
(10, 13, 'Leather Wallet', 'wallet_leather.jpg', 'Genuine leather wallet with multiple card slots.', 45.00, 90, 2, GETDATE()),
(11, 12, 'External Hard Drive', 'hdd_external.jpg', '1TB portable external hard drive.', 79.99, 55, 1, GETDATE()),
(12, 13, 'Casual Jeans', 'jeans_casual.jpg', 'Comfortable and stylish denim jeans.', 60.00, 120, 2, GETDATE()),
(13, 12, 'Fitness Tracker', 'fitness_tracker.jpg', 'Monitor your health and fitness.', 55.00, 65, 1, GETDATE()),
(14, 13, 'Backpack', 'backpack.jpg', 'Durable and spacious everyday backpack.', 40.00, 75, 2, GETDATE()),
(15, 12, 'Tablet Pro', 'tablet_pro.jpg', 'Versatile tablet for work and entertainment.', 399.00, 35, 1, GETDATE()),
(16, 13, 'Winter Coat', 'coat_winter.jpg', 'Warm and fashionable winter coat.', 150.00, 20, 2, GETDATE()),
(17, 12, 'Bluetooth Speaker', 'bt_speaker.jpg', 'Portable Bluetooth speaker with rich bass.', 65.00, 80, 1, GETDATE()),
(18, 13, 'Sport Socks (3-pack)', 'socks_sport.jpg', 'Breathable athletic socks.', 12.00, 200, 2, GETDATE()),
(19, 12, 'Smartwatch', 'smartwatch.jpg', 'Stay connected on the go.', 199.00, 45, 1, GETDATE()),
(20, 13, 'Sunglasses', 'sunglasses.jpg', 'Stylish UV protection sunglasses.', 30.00, 110, 2, GETDATE());
SET IDENTITY_INSERT Products OFF;

-- Carts
SET IDENTITY_INSERT Carts ON;
INSERT INTO Carts (cartId, userId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 14),
(12, 15),
(13, 16),
(14, 17),
(15, 18),
(16, 19),
(17, 20),
(18, 1), -- User 1 has another cart for example
(19, 2),
(20, 3);
SET IDENTITY_INSERT Carts OFF;

-- CartItems
INSERT INTO CartItems (cartId, productId, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1),
(7, 8, 2),
(8, 9, 1),
(9, 10, 1),
(10, 11, 1),
(11, 12, 2),
(12, 13, 1),
(13, 14, 1),
(14, 15, 1),
(15, 16, 1),
(16, 17, 1),
(17, 18, 3),
(18, 19, 1),
(19, 20, 1);

-- Orders
SET IDENTITY_INSERT Orders ON;
INSERT INTO Orders (orderId, userId, totalPrice, status, orderDate, shippingAddress) VALUES
(1, 1, 1024.99, 'Completed', GETDATE(), '123 Main St, Anytown, USA'),
(2, 2, 1499.00, 'Pending', GETDATE(), '456 Oak Ave, Otherville, USA'),
(3, 3, 25.00, 'Processing', GETDATE(), '789 Pine Ln, Sometown, USA'),
(4, 4, 75.50, 'Completed', GETDATE(), '101 Elm St, Elsewhere, USA'),
(5, 5, 120.00, 'Shipped', GETDATE(), '202 Birch Rd, Noplace, USA'),
(6, 6, 250.00, 'Pending', GETDATE(), '303 Cedar Dr, Anyplace, USA'),
(7, 7, 89.99, 'Completed', GETDATE(), '404 Willow Way, Nowhere, USA'),
(8, 8, 35.00, 'Processing', GETDATE(), '505 Maple Ct, Everywhere, USA'),
(9, 9, 499.00, 'Shipped', GETDATE(), '606 Spruce Blvd, Thisplace, USA'),
(10, 10, 45.00, 'Completed', GETDATE(), '707 Fir Cir, Thatplace, USA'),
(11, 14, 79.99, 'Pending', GETDATE(), '808 Redwood St, Somecity, USA'),
(12, 15, 120.00, 'Processing', GETDATE(), '909 Palm Ave, Othercity, USA'),
(13, 16, 55.00, 'Shipped', GETDATE(), '111 Ocean Dr, Seaville, USA'),
(14, 17, 40.00, 'Completed', GETDATE(), '222 Mountain Rd, Hilltop, USA'),
(15, 18, 399.00, 'Pending', GETDATE(), '333 Riverfront, Lakeside, USA'),
(16, 19, 150.00, 'Processing', GETDATE(), '444 Forest Path, Woodsland, USA'),
(17, 20, 65.00, 'Shipped', GETDATE(), '555 Desert Dunes, Sandville, USA'),
(18, 1, 199.00, 'Completed', GETDATE(), '123 Main St, Anytown, USA'),
(19, 2, 30.00, 'Pending', GETDATE(), '456 Oak Ave, Otherville, USA'),
(20, 3, 12.00, 'Processing', GETDATE(), '789 Pine Ln, Sometown, USA');
SET IDENTITY_INSERT Orders OFF;

-- OrderItems
INSERT INTO OrderItems (orderId, productId, quantity) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 2, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1),
(7, 8, 1),
(8, 9, 1),
(9, 10, 1),
(10, 11, 1),
(11, 12, 2),
(12, 13, 1),
(13, 14, 1),
(14, 15, 1),
(15, 16, 1),
(16, 17, 1),
(17, 18, 3),
(18, 19, 1),
(19, 20, 1),
(20, 18, 1); -- Add an extra one to ensure 20 items

-- Reviews
SET IDENTITY_INSERT Reviews ON;
INSERT INTO Reviews (reviewId, productId, userId, rating, comment, reviewedAt) VALUES
(1, 1, 2, 5, 'Excellent phone, highly recommend!', GETDATE()),
(2, 2, 1, 4, 'Good laptop for the price.', GETDATE()),
(3, 3, 4, 5, 'Love this vintage t-shirt!', GETDATE()),
(4, 4, 3, 3, 'Shoes are okay, a bit tight.', GETDATE()),
(5, 5, 1, 5, 'Smart speaker works perfectly.', GETDATE()),
(6, 6, 7, 5, 'Beautiful dress, perfect for the event.', GETDATE()),
(7, 7, 8, 4, 'Great earbuds, good sound quality.', GETDATE()),
(8, 8, 9, 5, 'Best yoga mat I''ve ever used.', GETDATE()),
(9, 9, 10, 5, 'Gaming console is a blast!', GETDATE()),
(10, 10, 11, 4, 'Nice wallet, good quality leather.', GETDATE()),
(11, 11, 12, 5, 'Fast and reliable external drive.', GETDATE()),
(12, 12, 13, 4, 'Comfortable jeans for everyday wear.', GETDATE()),
(13, 13, 14, 3, 'Fitness tracker is decent, sometimes glitches.', GETDATE()),
(14, 14, 15, 5, 'Perfect backpack for travel.', GETDATE()),
(15, 15, 16, 5, 'Tablet is powerful and sleek.', GETDATE()),
(16, 16, 17, 4, 'Warm coat, very stylish.', GETDATE()),
(17, 17, 18, 5, 'Amazing sound from this little speaker.', GETDATE()),
(18, 18, 19, 5, 'Super comfortable socks!', GETDATE()),
(19, 19, 20, 4, 'Smartwatch is convenient, battery could be better.', GETDATE()),
(20, 20, 1, 5, 'Love these sunglasses, very fashionable.', GETDATE());
SET IDENTITY_INSERT Reviews OFF;