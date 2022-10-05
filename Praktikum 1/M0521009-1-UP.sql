CREATE TABLE PUBLISHER (
	[Name] VARCHAR(200) NOT NULL,
	[Address] VARCHAR(400),
	Phone DECIMAL(20),
	CONSTRAINT Pk_PublisherName PRIMARY KEY ([Name])
);

CREATE TABLE BOOK (
	BookId INT PRIMARY KEY,
	Title VARCHAR(200),
	PublisherName VARCHAR(200),
	CONSTRAINT Fk_Book_PublisherName FOREIGN KEY (PublisherName) REFERENCES PUBLISHER ([Name])
);

CREATE TABLE BOOK_AUTHORS (
	BookId Int NOT NULL,
	AuthorName Varchar(200) NOT NULL,
	PRIMARY KEY (BookId, AuthorName),
	CONSTRAINT Fk_BookAuthors_BookId FOREIGN KEY (BookId) REFERENCES Book(BookId)
);