-- =========================
-- Library Management System
-- =========================
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- 2. Create Tables
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    JoinDate DATE NOT NULL
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    PublishedYear INT
);

CREATE TABLE BorrowRecords (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- 3. Insert Sample Data
INSERT INTO Members (Name, Email, JoinDate) VALUES
('Alice Green', 'alice@example.com', '2024-01-10'),
('Bob Smith', 'bob@example.com', '2024-02-15'),
('Charlie Brown', 'charlie@example.com', '2024-03-20');

INSERT INTO Books (Title, Author, Genre, PublishedYear) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960),
('A Brief History of Time', 'Stephen Hawking', 'Science', 1988);

INSERT INTO BorrowRecords (MemberID, BookID, BorrowDate, ReturnDate) VALUES
(1, 1, '2024-05-01', '2024-05-15'),
(2, 2, '2024-05-03', NULL),
(3, 3, '2024-05-05', '2024-05-20');

-- 4. Select all records
SELECT * FROM Members;
SELECT * FROM Books;
SELECT * FROM BorrowRecords;

-- 5. Filtering Data
SELECT * FROM Books WHERE PublishedYear > 1950;
SELECT * FROM Members WHERE JoinDate > '2024-02-01';

-- 6. Sorting
SELECT * FROM Books ORDER BY Title ASC;
SELECT * FROM Members ORDER BY JoinDate DESC;

-- 7. Update Example
UPDATE Members
SET Email = 'alice.green@example.com'
WHERE MemberID = 1;

-- 8. Delete Example
DELETE FROM Books WHERE BookID = 3;

-- 9. Joins Example
SELECT Members.Name, Books.Title, BorrowRecords.BorrowDate, BorrowRecords.ReturnDate
FROM BorrowRecords
INNER JOIN Members ON BorrowRecords.MemberID = Members.MemberID
INNER JOIN Books ON BorrowRecords.BookID = Books.BookID;

SELECT Members.Name, Books.Title
FROM Members
LEFT JOIN BorrowRecords ON Members.MemberID = BorrowRecords.MemberID
LEFT JOIN Books ON BorrowRecords.BookID = Books.BookID;

-- 10. Aggregate Functions
SELECT COUNT(*) AS TotalMembers FROM Members;

SELECT Members.Name, COUNT(BorrowRecords.RecordID) AS BooksBorrowed
FROM Members
LEFT JOIN BorrowRecords ON Members.MemberID = BorrowRecords.MemberID
GROUP BY Members.Name;

-- 11. Pattern Matching
SELECT * FROM Books WHERE Title LIKE '%Great%';
SELECT * FROM Members WHERE Name LIKE 'A%';
