DROP TABLE [BOOK_LOANS];
DROP TABLE [BOOK_COPIES];
DROP TABLE [BORROWER];
DROP TABLE [LIBRARY_BRANCH];

DROP TABLE [BOOK_AUTHORS];
DROP TABLE [BOOK];
DROP TABLE [PUBLISHER];

CREATE TABLE [PUBLISHER] (
    [Name] NVARCHAR(128) NOT NULL,
    [Address] NTEXT,
    [Phone] NVARCHAR(24),

    CONSTRAINT [PK_Publisher] PRIMARY KEY ([Name])
);

CREATE TABLE [BOOK] (
    [BookId] INT NOT NULL,
    [Title] NVARCHAR(128),
    [PublisherName] NVARCHAR(128),

    CONSTRAINT [PK_Book] PRIMARY KEY ([BookId]),
    CONSTRAINT [FK_Book_PublisherName] FOREIGN KEY ([PublisherName]) REFERENCES [PUBLISHER] ([Name])
);

CREATE TABLE [BOOK_AUTHORS] (
    [BookId] INT NOT NULL,
    [AuthorName] NVARCHAR(128) NOT NULL,

    CONSTRAINT [PK_BookAuthors] PRIMARY KEY ([BookId], [AuthorName]),
    CONSTRAINT [FK_BookAuthors_BookId] FOREIGN KEY ([BookId]) REFERENCES [BOOK] ([BookId])
);

CREATE TABLE [LIBRARY_BRANCH] (
    [BranchId] INT NOT NULL,
    [BranchName] NVARCHAR(128),
    [Address] NTEXT,

    CONSTRAINT [PK_LibraryBranch] PRIMARY KEY ([BranchId])
);

CREATE TABLE [BORROWER] (
    [CardNo] INT NOT NULL,
    [Name] NVARCHAR(128),
    [Address] NTEXT,
    [Phone] NVARCHAR(24),

    CONSTRAINT [PK_Borrower] PRIMARY KEY ([CardNo])
);

CREATE TABLE [BOOK_COPIES] (
    [BookId] INT NOT NULL,
    [BranchId] INT NOT NULL,
    [No_Of_Copies] INT,

    CONSTRAINT [PK_BookCopies] PRIMARY KEY ([BookId], [BranchId]),
    CONSTRAINT [FK_BookCopies_BookId] FOREIGN KEY ([BookId]) REFERENCES [BOOK] ([BookId]),
    CONSTRAINT [FK_BookCopies_BranchId] FOREIGN KEY ([BranchId]) REFERENCES [LIBRARY_BRANCH] ([BranchId])
);

CREATE TABLE [BOOK_LOANS] (
    [BookId] INT NOT NULL,
    [BranchId] INT NOT NULL,
    [CardNo] INT NOT NULL,
    [DateOut] DATE,
    [DueDate] DATE,

    CONSTRAINT [PK_BookLoans] PRIMARY KEY ([BookId], [BranchId], [CardNo]),
    CONSTRAINT [FK_BookLoans_BookId] FOREIGN KEY ([BookId]) REFERENCES [BOOK] ([BookId]),
    CONSTRAINT [FK_BookLoans_BranchId] FOREIGN KEY ([BranchId]) REFERENCES [LIBRARY_BRANCH] ([BranchId]),
    CONSTRAINT [FK_BookLoans_CardNo] FOREIGN KEY ([CardNo]) REFERENCES [BORROWER] ([CardNo])
);
