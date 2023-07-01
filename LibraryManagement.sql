use analysis;

-- Create the Books table
CREATE TABLE Books (
  BookID INT PRIMARY KEY,
  Title VARCHAR(255),
  Author VARCHAR(255),
  Publisher VARCHAR(255),
  PublicationYear INT,
  ISBN VARCHAR(255),
  Genre VARCHAR(255),
  Availability BOOLEAN
);

-- Create the Borrowers table
CREATE TABLE Borrowers (
  BorrowerID INT PRIMARY KEY,
  Name VARCHAR(255),
  Address VARCHAR(255),
  PhoneNumber VARCHAR(255),
  Email VARCHAR(255)
);

-- Create the Loans table
CREATE TABLE Loans (
  LoanID INT PRIMARY KEY,
  BookID INT,
  BorrowerID INT,
  DateBorrowed DATE,
  DueDate DATE,
  DateReturned DATE,
  FOREIGN KEY (BookID) REFERENCES Books (BookID),
  FOREIGN KEY (BorrowerID) REFERENCES Borrowers (BorrowerID)
);

-- Create the Reservations table
CREATE TABLE Reservations (
  ReservationID INT PRIMARY KEY,
  BookID INT,
  BorrowerID INT,
  DateReserved DATE,
  DateNeeded DATE,
  Status VARCHAR(255),
  FOREIGN KEY (BookID) REFERENCES Books (BookID),
  FOREIGN KEY (BorrowerID) REFERENCES Borrowers (BorrowerID)
);

-- Get all available books:
SELECT * FROM Books WHERE Availability = 1;

-- Get all borrowed books:
SELECT Books.Title, Books.Author, Borrowers.Name, Loans.DateBorrowed, Loans.DueDate
FROM Books
INNER JOIN Loans ON Books.BookID = Loans.BookID
INNER JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID;

-- Get all reserved books:
SELECT Books.Title, Books.Author, Borrowers.Name, Reservations.DateReserved, Reservations.DateNeeded
FROM Books
INNER JOIN Reservations ON Books.BookID = Reservations.BookID
INNER JOIN Borrowers 
ON Reservations.BorrowerID = Borrowers.BorrowerID;

-- Get all books borrowed by a specific borrower:
SELECT Books.Title, Books.Author, Loans.DateBorrowed, Loans.DueDate, Loans.DateReturned
FROM Books
INNER JOIN Loans ON Books.BookID = Loans.BookID
INNER JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID
WHERE Borrowers.BorrowerID = Loans.BorrowerID;

-- Get all reservations made by a specific borrower:
SELECT Books.Title, Books.Author, Reservations.DateReserved, Reservations.DateNeeded, Reservations.Status
FROM Books
INNER JOIN Reservations ON Books.BookID = Reservations.BookID
INNER JOIN Borrowers ON Reservations.BorrowerID = Borrowers.BorrowerID
WHERE Borrowers.BorrowerID = Reservations.BorrowerID;


