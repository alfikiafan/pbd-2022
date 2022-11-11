-- Nomor 1
-- Display the publisher name of the book with the title 'Stay leave nature to be.'

SELECT 
  [PublisherName] 
FROM 
  [BOOK] 
WHERE 
  [Title] = 'Stay leave nature become.';

-- Nomor 2
-- Show a list of author names whose last name is 'Phillips'
SELECT 
  [AuthorName] 
FROM 
  [BOOK_AUTHORS] 
WHERE 
  [AuthorName] LIKE '%Phillips';

-- Nomor 3
-- Display a list of book authors with the title 'Surface wish travel difficult interesting.'
SELECT 
  [AuthorName] 
FROM 
  [BOOK_AUTHORS] 
  JOIN [BOOK] ON [BOOK].[BookId] = [BOOK_AUTHORS].[BookId] 
WHERE 
  [Title] = 'Surface wish travel difficult interesting.';

-- Nomor 4
-- Display a list of library names and the number of borrowers in that library who borrowed before 2022-10-10 (10 October 2022)

SELECT 
  [LIBRARY_BRANCH].[BranchName], 
  COUNT ([BOOK_LOANS].[BranchId]) AS [NumberOfBorrowers] 
FROM 
  [BOOK_LOANS] 
  JOIN [LIBRARY_BRANCH] ON [LIBRARY_BRANCH].[BranchId] = [BOOK_LOANS].[BranchId] 
WHERE 
  [BOOK_LOANS].[DateOut] < '2022-10-10' 
GROUP BY 
  [LIBRARY_BRANCH].[BranchName], 
  [BOOK_LOANS].[BranchId];

-- Nomor 5
-- Display a list of library names and the number of borrowers in that library who borrowed before 2022-10-10 (10 October 2022)
SELECT 
  [LIBRARY_BRANCH].[BranchName], 
  [BOOK].[Title], 
  [BORROWER].[Name], 
  DATEDIFF(
    DAY, [BOOK_LOANS].[DateOut], [BOOK_LOANS].[DueDate]
  ) AS [LoansDuration] 
FROM 
  [BOOK_LOANS] 
  JOIN [LIBRARY_BRANCH] ON [LIBRARY_BRANCH].[BranchId] = [BOOK_LOANS].[BranchId] 
  JOIN [BOOK] ON [BOOK].[BookId] = [BOOK_LOANS].[CardNo] 
  JOIN [BORROWER] ON [BORROWER].[CardNo] = [BOOK_LOANS].[CardNo] 
WHERE 
  DATEDIFF(
    DAY, [BOOK_LOANS].[DateOut], [BOOK_LOANS].[DueDate]
  ) > (
    SELECT 
      CEILING(
        AVG(
          DATEDIFF(
            DAY, [BOOK_LOANS].[DateOut], [BOOK_LOANS].[DueDate]
          )
        )
      ) 
    FROM 
      [BOOK_LOANS]
  );