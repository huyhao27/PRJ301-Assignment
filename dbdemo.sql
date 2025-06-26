-- Drop the database if it exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'SecondUniDB')
BEGIN
    ALTER DATABASE SecondUniDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE SecondUniDB;
END
GO

CREATE DATABASE SecondUniDB;
GO

USE SecondUniDB;
GO


-- Accounts
CREATE TABLE Accounts (
    userId INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL UNIQUE,
    password NVARCHAR(100) NOT NULL,
    fullName NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    phone NVARCHAR(20),
    avatar NVARCHAR(255),
	role VARCHAR(10) DEFAULT 'user',
    createdAt DATETIME DEFAULT GETDATE()
);
GO

-- Posts
CREATE TABLE Posts (
    postId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    content NVARCHAR(MAX),
    image NVARCHAR(255),
    createdAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (userId) REFERENCES Accounts(userId) ON DELETE CASCADE
);
GO

-- Likes
CREATE TABLE Likes (
    userId INT NOT NULL,
    postId INT NOT NULL,
    likedAt DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (userId, postId),
    FOREIGN KEY (userId) REFERENCES Accounts(userId),
    FOREIGN KEY (postId) REFERENCES Posts(postId)
);
GO

-- Comments
CREATE TABLE Comments (
    commentId INT IDENTITY(1,1) PRIMARY KEY,
    postId INT NOT NULL,
    userId INT NOT NULL,
    content NVARCHAR(MAX) NOT NULL,
    createdAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (postId) REFERENCES Posts(postId),
    FOREIGN KEY (userId) REFERENCES Accounts(userId)
);
GO

-- SavedPosts
CREATE TABLE SavedPosts (
    userId INT NOT NULL,
    postId INT NOT NULL,
    savedAt DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (userId, postId),
    FOREIGN KEY (userId) REFERENCES Accounts(userId),
    FOREIGN KEY (postId) REFERENCES Posts(postId)
);
GO

-- Messages
CREATE TABLE Messages (
    messageId INT IDENTITY(1,1) PRIMARY KEY,
    senderId INT NOT NULL,
    receiverId INT NOT NULL,
    content NVARCHAR(MAX) NOT NULL,
    sentAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (senderId) REFERENCES Accounts(userId),
    FOREIGN KEY (receiverId) REFERENCES Accounts(userId)
);
GO

-- Follows
CREATE TABLE Follows (
    followerId INT NOT NULL,
    followingId INT NOT NULL,
    followedAt DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (followerId, followingId),
    FOREIGN KEY (followerId) REFERENCES Accounts(userId),
    FOREIGN KEY (followingId) REFERENCES Accounts(userId)
);
GO

-- Notifications
CREATE TABLE Notifications (
    userId INT NOT NULL,
    postId INT,
    type NVARCHAR(10) NOT NULL CHECK (type IN ('like', 'cmt', 'fl')),
    createdAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (userId) REFERENCES Accounts(userId),
    FOREIGN KEY (postId) REFERENCES Posts(postId)
);
GO

-- Categories
CREATE TABLE Categories (
    categoryId INT IDENTITY(1,1) PRIMARY KEY,
    categoryName NVARCHAR(100) NOT NULL
);
GO

-- Products
CREATE TABLE Products (
    productId INT IDENTITY(1,1) PRIMARY KEY,
    sellerId INT NOT NULL,
    productName NVARCHAR(100) NOT NULL,
    image NVARCHAR(255),
    description NVARCHAR(MAX),
    price DECIMAL(10, 2) NOT NULL,
    quantity INT DEFAULT 0,
    categoryId INT,
    createdAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (sellerId) REFERENCES Accounts(userId),
    FOREIGN KEY (categoryId) REFERENCES Categories(categoryId)
);
GO

-- Carts
CREATE TABLE Carts (
    cartId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES Accounts(userId)
);
GO

-- CartItems
CREATE TABLE CartItems (
    cartId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT DEFAULT 1,
    PRIMARY KEY (cartId, productId),
    FOREIGN KEY (cartId) REFERENCES Carts(cartId),
    FOREIGN KEY (productId) REFERENCES Products(productId)
);
GO

-- Orders
CREATE TABLE Orders (
    orderId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    totalPrice DECIMAL(10, 2) NOT NULL,
    status NVARCHAR(50) DEFAULT 'Pending',
    orderDate DATETIME DEFAULT GETDATE(),
    shippingAddress NVARCHAR(MAX) NOT NULL,
    FOREIGN KEY (userId) REFERENCES Accounts(userId)
);
GO

-- OrderItems
CREATE TABLE OrderItems (
    orderId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT DEFAULT 1,
    PRIMARY KEY (orderId, productId),
    FOREIGN KEY (orderId) REFERENCES Orders(orderId),
    FOREIGN KEY (productId) REFERENCES Products(productId)
);
GO

-- Reviews
CREATE TABLE Reviews (
    reviewId INT IDENTITY(1,1) PRIMARY KEY,
    productId INT NOT NULL,
    userId INT NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment NVARCHAR(MAX),
    reviewedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (productId) REFERENCES Products(productId),
    FOREIGN KEY (userId) REFERENCES Accounts(userId)
);
GO
