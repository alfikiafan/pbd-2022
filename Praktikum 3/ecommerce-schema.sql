DROP TABLE [ORDER_CART];
DROP TABLE [ORDER];
DROP TABLE [CUSTOMER];
DROP TABLE [PRODUCT];
DROP TABLE [SELLER];
DROP TABLE [USER];

CREATE TABLE [USER] (
    [ID] UNIQUEIDENTIFIER DEFAULT NEWID(),
    [Type] NVARCHAR(16),
    [Name] NVARCHAR(128),
    [PhoneNo] NVARCHAR(32),
    [Email] NVARCHAR(254),
    [Password] NCHAR(64),
    [RegisteredAt] DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT [PK_User] PRIMARY KEY ([ID])
);

CREATE TABLE [SELLER] (
    [UserID] UNIQUEIDENTIFIER,
    [Revenue] INT,

    CONSTRAINT [PK_Seller] PRIMARY KEY ([UserID]),
    CONSTRAINT [FK_Seller_UserID] FOREIGN KEY ([UserID]) REFERENCES [USER] ([ID])
);

CREATE TABLE [PRODUCT] (
    [ID] UNIQUEIDENTIFIER DEFAULT NEWID(),
    [SellerID] UNIQUEIDENTIFIER,
    [Name] NVARCHAR(128),
    [Description] NTEXT,
    [Price] INT,
    [Stock] INT,

    CONSTRAINT [PK_Product] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_Product_SellerID] FOREIGN KEY ([SellerID]) REFERENCES [SELLER] ([UserID])
);

CREATE TABLE [CUSTOMER] (
    [UserID] UNIQUEIDENTIFIER,
    [Balance] INT,

    CONSTRAINT [PK_Customer] PRIMARY KEY ([UserID]),
    CONSTRAINT [FK_Customer_UserID] FOREIGN KEY ([UserID]) REFERENCES [USER] ([ID])
);

CREATE TABLE [ORDER] (
    [ID] UNIQUEIDENTIFIER DEFAULT NEWID(),
    [PlacedAt] DATETIME DEFAULT CURRENT_TIMESTAMP,
    [CustomerID] UNIQUEIDENTIFIER,
    [IsPaid] BIT,
    [PaidAt] DATETIME, -- Computed

    CONSTRAINT [PK_Order] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_Order_CustomerID] FOREIGN KEY ([CustomerID]) REFERENCES [CUSTOMER] ([UserID])
);

CREATE TABLE [ORDER_CART] (
    [ID] UNIQUEIDENTIFIER DEFAULT NEWID(),
    [OrderID] UNIQUEIDENTIFIER,
    [ProductID] UNIQUEIDENTIFIER,
    [ProductName] NVARCHAR(128), -- Computed
    [ProductPrice] INT, -- Computed
    [Amount] INT,
    [Subtotal] INT, -- Computed

    CONSTRAINT [PK_OrderCart] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_OrderCart_OrderID] FOREIGN KEY ([OrderID]) REFERENCES [ORDER] ([ID]),
    CONSTRAINT [FK_OrderCart_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [PRODUCT] ([ID])
);