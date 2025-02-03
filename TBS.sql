create database TravelBookingSystem;
use TravelBookingSystem;

-- Creating Flights table

CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    Airline VARCHAR(100),
    DepartureCity VARCHAR(100),
    ArrivalCity VARCHAR(100),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    Price DECIMAL(10, 2)
);

-- Creating Hotels table
CREATE TABLE Hotels (
    HotelID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(100),
    PricePerNight DECIMAL(10, 2),
    AvailableRooms INT
);

-- Creating Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

-- Creating Bookings table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    FlightID INT,
    HotelID INT,
    BookingDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID)
);

-- Creating Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATETIME,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- 2. Insert Data Script

-- Inserting sample data into Flights table
INSERT INTO Flights (FlightID, Airline, DepartureCity, ArrivalCity, DepartureTime, ArrivalTime, Price) VALUES
(1, 'Airline A', 'New York', 'Los Angeles', '2025-02-01 08:00:00', '2025-02-01 11:00:00', 350.00),
(2, 'Airline B', 'Chicago', 'Miami', '2025-02-02 09:00:00', '2025-02-02 12:30:00', 250.00);

-- Inserting sample data into Hotels table
INSERT INTO Hotels (HotelID, Name, City, PricePerNight, AvailableRooms) VALUES
(1, 'Hotel X', 'Los Angeles', 120.00, 20),
(2, 'Hotel Y', 'Miami', 150.00, 15);

-- Inserting sample data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210');

-- 3. Read Operations Script

-- Querying Flights table
SELECT * FROM Flights;

-- Querying Hotels table
SELECT * FROM Hotels;

-- Querying Customers table
SELECT * FROM Customers;





-- 7. Delete Operations Script

-- Deleting a booking
DELETE FROM Bookings WHERE BookingID = 1;

-- Deleting a flight
DELETE FROM Flights WHERE FlightID = 2;

-- Deleting a hotel
DELETE FROM Hotels WHERE HotelID = 2;

set SQL_SAFE_UPDATES = 0;

-- Modify the foreign key constraint to allow cascading deletions. This way, when you delete a record from the Bookings table, all related records in the Payments table will be deleted automatically.

DELETE FROM Payments WHERE BookingID = 1;
DELETE FROM Bookings WHERE BookingID = 1;

ALTER TABLE Payments
DROP FOREIGN KEY payments_ibfk_1;

ALTER TABLE Payments
ADD CONSTRAINT payments_ibfk_1
FOREIGN KEY (BookingID) REFERENCES Bookings (BookingID)
ON DELETE CASCADE;
