create database Travel_Booking_System;
use Travel_Booking_System;

-- Creating Flights table

CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    Airline VARCHAR(50),
    DepartureCity VARCHAR(50),
    DestinationCity VARCHAR(50),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    Price DECIMAL(10, 2)
);

-- Creating Hotels table

CREATE TABLE Hotels (
    HotelID INT PRIMARY KEY,
    HotelName VARCHAR(50),
    Location VARCHAR(50),
    RoomType VARCHAR(50),
    PricePerNight DECIMAL(10, 2)
);

-- Creating Customers table

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    PhoneNumber VARCHAR(15)
);

-- Creating Bookings table

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    FlightID INT,
    HotelID INT,
    BookingDate DATETIME,
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID)
);

-- Creating Payments table

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    PaymentDate DATETIME,
    PaymentAmount DECIMAL(10, 2),
    PaymentMethod varchar(50),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- 2. Insert Data Script

-- Insert sample data into Flights table
-- Insert 10 records into the Flights table with real city and airline names

INSERT INTO Flights( FlightID ,Airline ,DepartureCity ,DestinationCity ,DepartureTime, ArrivalTime, Price) Values
(1,'Air India', 'Mumbai', 'Delhi', '2024-01-15 08:00:00', '2024-01-15 10:30:00', 5000.00),
(2,'IndiGo', 'Delhi', 'Bangalore', '2024-01-16 12:30:00', '2024-01-16 15:00:00', 4500.00),
(3,'SpiceJet', 'Chennai', 'Mumbai', '2024-01-17 10:00:00', '2024-01-17 12:30:00', 4000.00),
(4,'Vistara', 'Kolkata', 'Hyderabad', '2024-01-18 15:00:00', '2024-01-18 17:30:00', 5500.00),
(5,'AirAsia', 'Delhi', 'Chennai', '2024-01-19 09:30:00', '2024-01-19 12:00:00', 4800.00),
(6,'GoAir', 'Mumbai', 'Kolkata', '2024-01-20 11:30:00', '2024-01-20 14:00:00', 4200.00),
(7,'SpiceJet', 'Hyderabad', 'Delhi', '2024-01-21 14:00:00', '2024-01-21 16:30:00', 4700.00),
(8,'IndiGo', 'Bangalore', 'Kolkata', '2024-01-22 16:30:00', '2024-01-22 19:00:00', 5100.00),
(9,'Vistara', 'Chennai', 'Mumbai', '2024-01-23 08:30:00', '2024-01-23 11:00:00', 4900.00),
(10,'GoAir', 'Delhi', 'Bangalore', '2024-01-24 13:00:00', '2024-01-24 15:30:00', 4300.00);

-- Insert sample data into Hotels table
-- Insert 15 records into the Hotels table with real hotel names

INSERT INTO Hotels ( HotelID, HotelName, Location, RoomType, PricePerNight) VALUES
(1001,'Grand Hotel', 'Mumbai', 'Single', 3000.00),
(1002,'City View Hotel', 'Delhi', 'Double', 4000.00),
(1003,'Marina Bay Resort', 'Bangalore', 'Suite', 5000.00),
(1004,'Garden Plaza', 'Chennai', 'Single', 3500.00),
(1005,'Skyline Inn', 'Hyderabad', 'Double', 4500.00),
(1006,'Royal Residency', 'Kolkata', 'Suite', 5500.00),
(1007,'Oasis Hotel', 'Delhi', 'Single', 3200.00),
(1008,'Central Park Lodge', 'Mumbai', 'Double', 4200.00),
(1009,'Emerald Tower', 'Hyderabad', 'Suite', 5200.00),
(1010,'Sunset View Hotel', 'Chennai', 'Single', 3300.00),
(1011,'Golden Sands Resort', 'Bangalore', 'Double', 4300.00),
(1012,'Paradise Suites', 'Kolkata', 'Suite', 5300.00),
(1013,'Trident Hotel', 'Mumbai', 'Single', 3100.00),
(1014,'Green Valley Inn', 'Delhi', 'Double', 4100.00),
(1015,'Silver Lagoon', 'Hyderabad', 'Suite', 5100.00);


-- Insert sample data into Customers table
-- Insert 15 records into the Customers table with Indian names

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber) VALUES
(1,'Aarav', 'Patel', 'aarav.p@email.com', '123-456-7890'),
(2,'Aisha', 'Kumar', 'aisha.k@email.com', '987-654-3210'),
(3,'Arjun', 'Singh', 'arjun.s@email.com', '555-1234'),
(4,'Diya', 'Sharma', 'diya.s@email.com', '789-456-1230'),
(5,'Ishan', 'Verma', 'ishan.v@email.com', '111-222-3333'),
(6,'Avni', 'Gupta', 'avni.g@email.com', '444-555-6666'),
(7,'Advait', 'Kaur', 'advait.k@email.com', '777-888-9999'),
(8,'Ishita', 'Mishra', 'ishita.m@email.com', '333-111-2222'),
(9,'Vihaan', 'Chopra', 'vihaan.c@email.com', '666-777-8888'),
(10,'Anaya', 'Thakur', 'anaya.t@email.com', '999-000-1111'),
(11,'Rohan', 'Pandey', 'rohan.p@email.com', '222-333-4444'),
(12,'Aria', 'Jha', 'aria.j@email.com', '555-666-7777'),
(13,'Reyansh', 'Reddy', 'reyansh.r@email.com', '888-999-0000'),
(14,'Ishani', 'Kulkarni', 'ishani.k@email.com', '111-222-3333'),
(15,'Advay', 'Nair', 'advay.n@email.com', '444-555-6666');

-- Insert sample data into Bookings table
-- Insert 25 records into the Bookings table with generated booking data

INSERT INTO Bookings (BookingID, CustomerID, FlightID, HotelID, BookingDate, TotalPrice) VALUES
(101,1, 1, 1001, '2024-04-01 08:00:00', 3200.00),
(102,2, 2, 1002, '2024-04-02 10:00:00', 4300.00),
(103,3, 3, 1003, '2024-04-03 12:00:00', 5200.00),
(104,4, 4, 1004, '2024-04-04 14:00:00', 3500.00),
(105,5, 5, 1005, '2024-04-05 16:00:00', 4500.00),
(106,6, 6, 1006, '2024-04-06 18:00:00', 5500.00),
(107,7, 7, 1007, '2024-04-07 20:00:00', 4200.00),
(108,8, 8, 1008, '2024-04-08 22:00:00', 5200.00),
(109,9, 9, 1009, '2024-04-09 08:00:00', 3700.00),
(110,10, 10, 1010, '2024-04-10 10:00:00', 4800.00),

(111,11, 1, 1011, '2024-04-11 12:00:00', 5800.00),
(112,12, 2, 1012, '2024-04-12 14:00:00', 3900.00),
(113,13, 3, 1013, '2024-04-13 16:00:00', 4900.00),
(114,14, 4, 1014, '2024-04-14 18:00:00', 5200.00),
(115,15, 5, 1015, '2024-04-15 20:00:00', 4300.00),

(116,1, 6, 1001, '2024-04-16 22:00:00', 5500.00),
(117,2, 7, 1002, '2024-04-17 08:00:00', 3300.00),
(118,3, 8, 1003, '2024-04-18 10:00:00', 4300.00),
(119,4, 9, 1004, '2024-04-19 12:00:00', 5800.00),
(120,5, 10, 1005, '2024-04-20 14:00:00', 4900.00),

(121,6, 1, 1006, '2024-04-21 16:00:00', 4500.00),
(122,7, 2, 1007, '2024-04-22 18:00:00', 5500.00),
(123,8, 3, 1008, '2024-04-23 20:00:00', 4200.00),
(124,9, 4, 1009, '2024-04-24 22:00:00', 5200.00),
(125,10, 5, 1010, '2024-04-25 08:00:00', 4700.00);

-- Insert sample data into Payments table
-- Insert records into the Payment table for the 70 flights and 15 hotel bookings

INSERT INTO Payments (PaymentID, BookingID, PaymentDate, PaymentAmount, PaymentMethod) VALUES

-- Flights

(1, 101, '2024-04-01 08:15:00', 3200.00, 'Credit Card'),
(2, 102, '2024-04-02 10:15:00', 4300.00, 'Debit Card'),
(3, 103, '2024-04-03 12:15:00', 5200.00, 'Credit Card'),
(4, 104, '2024-04-04 14:15:00', 3500.00, 'Debit Card'),
(5, 105, '2024-04-05 16:15:00', 4500.00, 'Credit Card'),
(6, 106, '2024-04-06 18:15:00', 5500.00, 'Debit Card'),
(7, 107, '2024-04-07 20:15:00', 4200.00, 'Credit Card'),
(8, 108, '2024-04-08 22:15:00', 5200.00, 'Debit Card'),
(9, 109, '2024-04-09 08:15:00', 3700.00, 'Credit Card'),
(10, 110, '2024-04-10 10:15:00', 4800.00, 'Debit Card'),

-- Hotels

(11, 111, '2024-04-06 18:30:00', 2800.00, 'Debit Card'),
(12, 112, '2024-04-07 20:30:00', 2100.00, 'Credit Card'),
(13, 113, '2024-04-08 22:30:00', 2500.00, 'Debit Card'),
(14, 114, '2024-04-09 08:30:00', 1700.00, 'Credit Card'),
(15, 115, '2024-04-10 10:30:00', 2000.00, 'Debit Card'),
(31, 116, '2024-04-11 12:30:00', 2400.00, 'Credit Card'),
(32, 117, '2024-04-12 14:30:00', 1600.00, 'Debit Card'),
(33, 118, '2024-04-13 16:30:00', 1900.00, 'Credit Card'),
(34, 119, '2024-04-14 18:30:00', 2000.00, 'Debit Card'),
(35, 120, '2024-04-15 20:30:00', 1800.00, 'Credit Card');

-- 3. Read Operations Script

-- Querying Flights table
SELECT * FROM Flights;

-- Querying Hotels table
SELECT * FROM Hotels;

-- Querying Customers table
SELECT * FROM Customers;

-- Querying Bookings table
SELECT * FROM Bookings;

-- Querying Payments table
SELECT * FROM Payments;

-- 4. Update Operations Script

-- Updating price of a flight
UPDATE Flights SET Price = 375.00 WHERE FlightID = 1;

-- Updating available rooms in a hotel
UPDATE Hotels SET RoomType = 18 WHERE HotelID = 2;

-- Updating customer information
UPDATE Customers SET Email = 'john.d.newemail@example.com' WHERE CustomerID = 3;

-- Updating Booking dates
UPDATE Bookings SET BookingDate = '2024-04-15 20:00:00' WHERE BookingID = 4;

-- Updating Payment Method
UPDATE Payments SET PaymentMethod = 'Dedit Card' WHERE BookingID = 5;

-- Update flight details (change price)
UPDATE Flights SET Price = 220.00 WHERE FlightID = 6;

-- Update hotel information (change location)
UPDATE Hotels SET Location = 'NewCity' WHERE HotelID = 7;

-- Update customer contact details (change phone number)
UPDATE Customers SET PhoneNumber = '555-1234' WHERE CustomerID = 8;

-- 5. Create Booking Script

-- Inserting a new booking
INSERT INTO Bookings (BookingID, CustomerID, FlightID, HotelID, BookingDate) VALUES
(1, 1, 1, 1, '2025-01-15 10:00:00');

-- 6. Payment Script

-- Inserting a new payment
INSERT INTO Payments (PaymentID, BookingID, Amount, PaymentDate) VALUES
(1, 1, 470.00, '2025-01-15 12:00:00');

-- 7. Delete Operations Script

-- Deleting a booking
DELETE FROM Bookings WHERE BookingID = 1;

-- Deleting a flight
DELETE FROM Flights WHERE FlightID = 2;

-- Deleting a hotel
DELETE FROM Hotels WHERE HotelID = 2;

-- Cancel a booking
DELETE FROM Bookings WHERE BookingID = 1;

-- Remove a flight from the system
DELETE FROM Flights WHERE FlightID = 1;

-- Remove a hotel from the system
DELETE FROM Hotels WHERE HotelID = 1;


-- SELECT Questions : 

-- Retrieve the details of all flights departing from 'CityA':
SELECT * FROM Flights WHERE DepartureCity = 'CityA';

-- Find the hotels with room types 'Double' and their prices:
SELECT HotelName, RoomType, PricePerNight FROM Hotels WHERE RoomType = 'Double';

-- Retrieve bookings made for a specific flight (FlightID = 2):
SELECT * FROM Bookings WHERE FlightID = 2;

-- Retrieve the details of flights with prices less than $250
SELECT * FROM Flights WHERE Price < 250.00;

-- Retrieve all payments made within a specific date range (e.g., '2024-03-01' to '2024-03-31'):
SELECT * FROM Payments WHERE PaymentDate BETWEEN '2024-03-01' AND '2024-03-31';


