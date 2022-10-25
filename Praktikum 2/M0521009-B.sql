-- Alfiki Diastama Afan Firdaus
-- M0521009
-- Kelas A

-- Tulis SQL query untuk menjawab nomor 1
SELECT
   [Title],
   [Address] 
FROM
   [BOOK],
   [PUBLISHER] 
WHERE
   [BOOK].[PublisherName] = [PUBLISHER].[Name] 
ORDER BY
   [Title] ASC;

-- Tulis SQL query untuk menjawab nomor 2
SELECT
   [Title],
   COUNT ([BOOK_AUTHORS].[AuthorName]) AS [AuthorCount] 
FROM
   [BOOK],
   [BOOK_AUTHORS] 
WHERE
   [BOOK].[BookId] = [BOOK_AUTHORS].[BookId] 
GROUP BY
   [BOOK].[Title] 
ORDER BY
   [Title] ASC;

-- Tulis SQL query untuk menjawab nomor 3
SELECT
   TOP (5) [Name],
   COUNT ([BOOK_LOANS].[CardNo]) AS [LoansCount] 
FROM
   [BORROWER],
   [BOOK_LOANS] 
WHERE
   [BOOK_LOANS].[CardNo] = [BORROWER].[CardNo] 
GROUP BY
   [BORROWER].[Name] 
ORDER BY
   [LoansCount] DESC;

-- Tulis SQL query untuk menjawab nomor 4
SELECT
   [LIBRARY_BRANCH].[BranchName],
   [BOOK].[Title],
   [BOOK_COPIES].[No_Of_Copies] - [T].[Total] [BookAvailability] 
FROM
   [BOOK_COPIES] 
   JOIN
      (
         SELECT
            [BOOK_COPIES].[BranchId],
            [BOOK_COPIES].[BookId],
            COUNT ([BOOK_LOANS].[BookId]) TOTAL 
         FROM
            [BOOK_COPIES] 
            LEFT JOIN
               [BOOK_LOANS] 
               ON [BOOK_COPIES].[BookId] = [BOOK_LOANS].[BookId] 
               AND [BOOK_COPIES].[BranchId] = [BOOK_LOANS].[BranchId] 
         GROUP BY
            [BOOK_COPIES].[BookId],
            [BOOK_COPIES].[BranchId] 
      )
      AS [T] 
      ON [BOOK_COPIES].[BookId] = [T].[BookId] 
      AND [BOOK_COPIES].[BranchId] = [T].[BranchId] 
   JOIN
      [BOOK] 
      ON [BOOK].[BookId] = [BOOK_COPIES].[BookId] 
   JOIN
      [LIBRARY_BRANCH] 
      ON [LIBRARY_BRANCH].[BranchId] = [BOOK_COPIES].[BranchId] 
ORDER BY
   [LIBRARY_BRANCH].BranchName,
   [BOOK].[Title];

-- Tulis SQL query untuk menjawab nomor 5
SELECT
   TOP 5 [BORROWER].[Name],
   [BORROWER].[CardNo],
   SUM (DATEDIFF (DAY, [BOOK_LOANS].[DueDate], '2022-10-26') * 5000) Fine 
FROM
   [BOOK_LOANS] 
   JOIN
      [BORROWER] 
      ON [BOOK_LOANS].[CardNo] = [BORROWER].[CardNo] 
WHERE
   [BOOK_LOANS].[DueDate] < '2022-10-26' 
GROUP BY
   [BORROWER].[Name],
   [BORROWER].[CardNo] 
ORDER BY
   FINE DESC;