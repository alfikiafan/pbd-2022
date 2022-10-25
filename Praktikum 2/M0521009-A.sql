-- Alfiki Diastama Afan Firdaus
-- M0521009
-- Kelas A

DELETE
FROM
   [BOOK_LOANS];
DELETE
FROM
   [BOOK_COPIES];
DELETE
FROM
   [BORROWER];
DELETE
FROM
   [LIBRARY_BRANCH];
DELETE
FROM
   [BOOK_AUTHORS];
DELETE
FROM
   [BOOK];
DELETE
FROM
   [PUBLISHER];

-- Jalankan perintah nomor 1
INSERT INTO
   [PUBLISHER] ([Name], [Address], [Phone]) 
VALUES
   (
      N'Lee-Richards', N'4054 Amanda Lakes North Joshuaberg DC 87606', N'0014083477081334'
   );

-- Jalankan perintah nomor 2
INSERT INTO
   [BOOK] ([BookId], [Title], [PublisherName]) 
VALUES
   (
      31, N'Almost although help either natural state', N'Lee-Richards'
   );

-- Jalankan perintah nomor 3
INSERT INTO
   [BOOK] ([BookId], [Title], [PublisherName]) 
VALUES
   (
      32, N'Surface wish travel difficult interesting', N'Lee-Richards'
   );

-- Jalankan perintah nomor 4
UPDATE
   PUBLISHER 
SET
   [Address] = N'4054 Amanda Lakes, North Joshuaberg, DC 87606', [Phone] = N'001-408-347-7081x334' 
WHERE
   [Name] = N'Lee-Richards';

-- Jalankan perintah nomor 5
DELETE
FROM
   BOOK 
WHERE
   [Title] = N'Surface wish travel difficult interesting';