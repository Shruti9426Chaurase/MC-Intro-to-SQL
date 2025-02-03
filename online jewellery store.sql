create database online_jewellery_store;
use online_jewellery_store;

create table Customer ( 
  Customer_ID int,
  First_Name varchar(50),
  Last_Name varchar(50),
  Email varchar(50),
  Pass_word varchar(50),
  Address varchar(50),
  Phone int,
  primary key(Customer_ID ));
  
create table Product(
  Product_ID int,
  Product_Name varchar(50),
  Product_Description varchar(50),
  Price int,
  StockQuantity int,
  Weight int,
  Category_ID int,
  primary key(Product_ID),
  foreign key(Category_ID) references Category(Category_ID) );

create table Category(
  Category_ID int,
  Category_Name varchar(50),
  Primary Key(Category_ID) );
  
create table Orders(
  Order_ID int,
  Customer_ID int,
  foreign key(Customer_ID) references Customer(Customer_ID),
  Order_Date date, -- YYYY-MM-DD
  Total_Amount int,
  primary key(Order_ID));
  
create table Order_Detail (
  OrderDetail_ID int,
  primary key(OrderDetail_ID),
  Order_ID int, 
  Foreign Key(Order_ID) references Orders(Order_ID),
  Product_ID int,
  Foreign Key(Product_ID) references Product(Product_ID),
  Quantity int,
  Subtotal int );
  
create table Payment(
  Payment_ID int,
  Primary Key(Payment_ID),
  Order_ID int,
  Foreign Key(Order_ID) references Orders(Order_ID),
  Payment_Date date, -- YYYY-MM-DD
  Payment_Amount int,
  Payment_Method varchar(50) );

create table Cart(
  Cart_ID int,
  Primary Key(Cart_ID),
  Customer_ID int,
  Foreign Key(Customer_ID) references Customer(Customer_ID),
  Product_ID int,
  Foreign Key(Product_ID) references Product(Product_ID),
  Quantity int );
  
  