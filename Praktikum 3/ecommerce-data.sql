DELETE FROM [ORDER_CART];
DELETE FROM [ORDER];
DELETE FROM [CUSTOMER];
DELETE FROM [PRODUCT];
DELETE FROM [SELLER];
DELETE FROM [USER];

INSERT INTO [USER] ([ID], [Type], [Name], [PhoneNo], [Email], [Password]) VALUES
(N'd56fab63-9b2b-4a42-81cb-b93e73c209dc', N'Seller', N'Taite McLese', N'760-853-8847', N'tmclese0@google.ca', N'a2e483f8bd7d73049f6e098bedf8cd9ee5e7f59fbc411d539206f119a3950a00'),
(N'e6769298-a2e4-45c2-8929-b1c1057f678e', N'Seller', N'Tandy Lipyeat', N'880-308-3129', N'tlipyeat1@cloudflare.com', N'466ee433bb28782a6bb86c48701b0fa25c09c1369ae3d170b715aaba87f339be'),
(N'ddc03b44-6903-4cba-bd9c-00782574e967', N'Customer', N'Prudy Anscombe', N'386-758-2311', N'panscombe2@jigsy.com', N'a22da769ef8285f656214d46eb94eea95ff775801dc1a39960a4e444e819b778'),
(N'8e9c20c6-b3f7-4b92-acd6-4d526b060d6a', N'Customer', N'Cass Swait', N'620-725-3604', N'cswait3@who.int', N'807ccf64ecaf556ceafbdc07d363dbcd3c65eda79f9117664bd7fd761252208d');

INSERT INTO [SELLER] ([UserID], [Revenue]) VALUES
(N'd56fab63-9b2b-4a42-81cb-b93e73c209dc', 283700),
(N'e6769298-a2e4-45c2-8929-b1c1057f678e', 106000);

INSERT INTO [PRODUCT] ([ID], [SellerID], [Name], [Description], [Price], [Stock]) VALUES
(N'effe7289-b04b-4e37-9a22-c57e605815a0', N'd56fab63-9b2b-4a42-81cb-b93e73c209dc', N'Beef - Flank Steak', N'morph global content', 37000, 15),
(N'74db2b01-8e88-4e4f-9f40-5dc8bc94d929', N'd56fab63-9b2b-4a42-81cb-b93e73c209dc', N'Juice - Propel Sport', N'innovate enterprise ROI', 54000, 19),
(N'af41f9da-378e-4e89-b279-c8ed493c6c5b', N'e6769298-a2e4-45c2-8929-b1c1057f678e', N'Beef - Cow Feet Split', N'engage extensible channels', 30000, 13),
(N'9c04c59e-09e1-4f2e-82f0-dce7d2a24e41', N'e6769298-a2e4-45c2-8929-b1c1057f678e', N'Hot Choc Vending', N'scale robust systems', 92000, 31);

INSERT INTO [CUSTOMER] ([UserID], [Balance]) VALUES
(N'ddc03b44-6903-4cba-bd9c-00782574e967', 866400),
(N'8e9c20c6-b3f7-4b92-acd6-4d526b060d6a', 688000);

INSERT INTO [ORDER] ([ID], [CustomerID], [IsPaid], [PaidAt]) VALUES
(N'81825228-3004-4804-a4b2-bf1cab8e3610', N'ddc03b44-6903-4cba-bd9c-00782574e967', 0, NULL),
(N'e6be0d61-0c63-4843-a246-39d51d93ce79', N'ddc03b44-6903-4cba-bd9c-00782574e967', 1, CURRENT_TIMESTAMP),
(N'5f0b7429-d9a1-4c70-8e68-30ea3cf3965b', N'8e9c20c6-b3f7-4b92-acd6-4d526b060d6a', 0, NULL),
(N'e1265bf4-1534-4cd6-8d71-ec288d4fcc56', N'8e9c20c6-b3f7-4b92-acd6-4d526b060d6a', 1, CURRENT_TIMESTAMP);

INSERT INTO [ORDER_CART] ([OrderID], [ProductID], [ProductName], [ProductPrice], [Amount], [Subtotal]) VALUES
(N'81825228-3004-4804-a4b2-bf1cab8e3610', N'effe7289-b04b-4e37-9a22-c57e605815a0', N'Beef - Flank Steak', 37000, 3, 111000),
(N'81825228-3004-4804-a4b2-bf1cab8e3610', N'af41f9da-378e-4e89-b279-c8ed493c6c5b', N'Beef - Cow Feet Split', 30000, 5, 150000),
(N'e6be0d61-0c63-4843-a246-39d51d93ce79', N'74db2b01-8e88-4e4f-9f40-5dc8bc94d929', N'Juice - Propel Sport', 54000, 2, 108000),
(N'e6be0d61-0c63-4843-a246-39d51d93ce79', N'9c04c59e-09e1-4f2e-82f0-dce7d2a24e41', N'Hot Choc Vending', 92000, 4, 368000),
(N'5f0b7429-d9a1-4c70-8e68-30ea3cf3965b', N'af41f9da-378e-4e89-b279-c8ed493c6c5b', N'Beef - Cow Feet Split', 30000, 7, 210000),
(N'5f0b7429-d9a1-4c70-8e68-30ea3cf3965b', N'effe7289-b04b-4e37-9a22-c57e605815a0', N'Beef - Flank Steak', 37000, 1, 37000),
(N'e1265bf4-1534-4cd6-8d71-ec288d4fcc56', N'74db2b01-8e88-4e4f-9f40-5dc8bc94d929', N'Juice - Propel Sport', 54000, 2, 108000),
(N'e1265bf4-1534-4cd6-8d71-ec288d4fcc56', N'9c04c59e-09e1-4f2e-82f0-dce7d2a24e41', N'Hot Choc Vending', 92000, 1, 92000);
