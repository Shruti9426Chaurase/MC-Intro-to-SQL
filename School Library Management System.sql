create database SLMS;
use SLMS;
show tables in slms;
CREATE TABLE Author (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Biography TEXT
);

-- Table: Book
CREATE TABLE Book (
    ISBN VARCHAR(13) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT NOT NULL,
    Genre VARCHAR(50),
    PublishedYear YEAR,
    AvailableCopies INT NOT NULL,
    TotalCopies INT NOT NULL,
    ShelfLocation VARCHAR(50),
    BookStatus ENUM('Available', 'Checked Out') DEFAULT 'Available',
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID) ON DELETE CASCADE
);
ALTER TABLE Book MODIFY COLUMN PublishedYear INT;

-- Table: Student
CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Grade VARCHAR(10) NOT NULL,
    ContactInfo VARCHAR(100)
);

-- Table: Checkout
CREATE TABLE Checkout (
    CheckoutID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    ISBN VARCHAR(13) NOT NULL,
    CheckoutDate DATE NOT NULL,
    ReturnDate DATE,
    Status ENUM('Checked Out', 'Returned') DEFAULT 'Checked Out',
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN) ON DELETE CASCADE
);

-- Table: Reservation
CREATE TABLE Reservation (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    ISBN VARCHAR(13) NOT NULL,
    ReservationDate DATE NOT NULL,
    PickupDeadline DATE NOT NULL,
    Status ENUM('Pending', 'Expired', 'Fulfilled') DEFAULT 'Pending',
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN) ON DELETE CASCADE
);

-- Table: Fine
CREATE TABLE Fine (
    FineID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    Amount DECIMAL(8, 2) NOT NULL,
    IssuedDate DATE NOT NULL,
    Status ENUM('Paid', 'Unpaid') DEFAULT 'Unpaid',
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE
);

-- Table: Review
CREATE TABLE Review (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(13) NOT NULL,
    StudentID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATE NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN) ON DELETE CASCADE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE
);

-- Insert sample authors
INSERT INTO Author (FirstName, LastName, Biography)
VALUES 
('J.K.', 'Rowling', 'Author of the Harry Potter series.'),
('George', 'Orwell', 'Known for 1984 and Animal Farm.'),
('Jane', 'Austen', 'Famous for Pride and Prejudice.'),
('Mark', 'Twain', 'Author of The Adventures of Tom Sawyer.');

-- Insert sample books
INSERT INTO Book (ISBN, Title, AuthorID, Genre, PublishedYear, AvailableCopies, TotalCopies, ShelfLocation, BookStatus)
VALUES
('9780439139601', 'Harry Potter and the Goblet of Fire', 1, 'Fantasy', 2000, 5, 10, 'A1', 'Available'),
('9780451524935', '1984', 2, 'Dystopian', 1949, 2, 5, 'B2', 'Checked Out'),
('9780141439518', 'Pride and Prejudice', 3, 'Romance', 1813, 3, 5, 'C3', 'Available'),
('9780142437179', 'The Adventures of Tom Sawyer', 4, 'Adventure', 1876, 4, 4, 'D4', 'Available');

-- Insert sample students
INSERT INTO Student (FirstName, LastName, Grade, ContactInfo)
VALUES
('Alice', 'Smith', '10', 'alice.smith@example.com'),
('Bob', 'Johnson', '11', 'bob.johnson@example.com'),
('Charlie', 'Brown', '9', 'charlie.brown@example.com'),
('Daisy', 'Miller', '12', 'daisy.miller@example.com');

-- Insert sample checkouts
INSERT INTO Checkout (StudentID, ISBN, CheckoutDate, ReturnDate, Status)
VALUES
(1, '9780439139601', '2025-01-10', NULL, 'Checked Out'),
(2, '9780451524935', '2025-01-05', '2025-01-12', 'Returned'),
(3, '9780141439518', '2025-01-15', NULL, 'Checked Out');

-- Insert sample reservations
INSERT INTO Reservation (StudentID, ISBN, ReservationDate, PickupDeadline, Status)
VALUES
(4, '9780439139601', '2025-01-20', '2025-01-25', 'Pending'),
(2, '9780141439518', '2025-01-18', '2025-01-23', 'Fulfilled');

-- Insert sample fines
INSERT INTO Fine (StudentID, Amount, IssuedDate, Status)
VALUES
(1, 5.00, '2025-01-20', 'Unpaid'),
(3, 2.50, '2025-01-15', 'Paid');

-- Insert sample reviews
INSERT INTO Review (ISBN, StudentID, Rating, Comment, ReviewDate)
VALUES
('9780439139601', 1, 5, 'Amazing book!', '2025-01-15'),
('9780451524935', 2, 4, 'Very thought-provoking.', '2025-01-10'),
('9780141439518', 3, 3, 'A bit slow for my taste.', '2025-01-18');


-- Average rating for each book:
SELECT Title, AVG(Rating) AS AverageRating
FROM Book
JOIN Review ON Book.ISBN = Review.ISBN
GROUP BY Book.ISBN, Title;

-- Top 10 checked-out books:
SELECT Title, COUNT(CheckoutID) AS TotalCheckouts
FROM Book
JOIN Checkout ON Book.ISBN = Checkout.ISBN
GROUP BY Book.ISBN, Title
ORDER BY TotalCheckouts DESC
LIMIT 10;

-- Books with reservations pending:
SELECT Title, COUNT(ReservationID) AS PendingReservations
FROM Book
JOIN Reservation ON Book.ISBN = Reservation.ISBN
WHERE Reservation.Status = 'Pending'
GROUP BY Book.ISBN, Title;

-- Fines grouped by payment status:
SELECT Status, SUM(Amount) AS TotalAmount, COUNT(FineID) AS TotalFines
FROM Fine
GROUP BY Status;

