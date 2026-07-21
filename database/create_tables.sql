
--Create a table - Books
CREATE TABLE Books (
Book_ID SERIAL PRIMARY KEY,
Title VARCHAR(100),	
Author VARCHAR(100),
Genre VARCHAR(50),	
Published_Year INT,
Price NUMERIC(10,2)	
Stock INT
)

--Create a table- Customers
CREATE TABLE Customers(
Customer_ID SERIAL PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Phone VARCHAR(100),
City VARCHAR(100),
Country VARCHAR(100)
)

--Create a table - Orders
CREATE TABLE Orders(
Order_ID INT PRIMARY KEY 
Customer_ID INT REFERENCES Customers(Customer_ID),
Book_ID INT REFERENCES Books(Books_ID),
Order_Date DATE,
Quantity INT,
Total_Amount NUMERIC(10,2)
)



