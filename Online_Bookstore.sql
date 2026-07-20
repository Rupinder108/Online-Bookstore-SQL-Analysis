---Project - Online Bookstore 

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

--Import the data intp books Table 
COPY Books(Book_ID, Title, Author, Genre,Published_Year, Price, Stock)
FROM 'C:/Users/dell/Downloads/Books (1).csv'
CSV HEADER;

--Import the data into customers table 
COPY Customers(Customer_ID, Name, Email, Phone, City, Country)
FROM 'C:/Users/dell/Downloads/Customers.csv'
CSV HEADER;

--Import the data into orders table 
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
FROM 'C:/Users/dell/Downloads/Orders (2).csv'
CSV HEADER;

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

--1) Write a SQL query to retrieve all books in the "Fiction" genre:
SELECT * FROM Books
WHERE genre = 'Fiction';

--2) Find the books published after the 1950:
SELECT * FROM Books
WHERE published_year > 1950;

--3) List all customers from Canada:
SELECT * FROM Customers
WHERE country = 'Canada';

--4) Show all the orders placed in November 2023:
SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';


--5) Retrieve the total stock of books available:
SELECT SUM(stock) AS Total_Stock
FROM Books;

--6) Find the details of the most expensive book:
SELECT * FROM Books ORDER BY price DESC LIMIT 1;

--7) Show all customers who ordered more than 1 quantity of a book:
SELECT * FROM Orders
WHERE quantity > 1; 

--8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders
WHERE total_amount > 20;


--9) List all genre s available in the Books table:
SELECT DISTINCT genre 
FROM Books;


--10) Find the book which has the lowest stock 
SELECT * FROM Books 
ORDER BY stock 
LIMIT 5;

--11) Calculate the total revenue generated from all books:
SELECT SUM(Total_Amount) AS Revenue 
FROM Orders;


---Advanced Querriers

--1) Retrieve the total number of books sold for each genre:
SELECT * FROM Books;
SELECT * FROM Orders;
SELECT b.Genre, SUM(o.Quantity) AS Total_Books_Sold
FROM Orders o
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY b.Genre;

--2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(Price) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy';

--3) List the customers who have placed at least 2 orders with customer's name:
SELECT * FROM Orders;

SELECT o.Customer_ID, c.Name, COUNT(o.Order_id) AS Order_Count
FROM Orders o
JOIN Customers c ON o.Customer_id = c. Customer_id
GROUP BY o.Customer_id , c.Name
HAVING COUNT(Order_id) >= 2;


--4) Find the most frequently ordered book and print their names;
SELECT * FROM Orders;

SELECT o.Book_ID, b.Title, COUNT(Order_id) AS Order_Count
FROM Orders o
JOIN Books b ON b. Book_id = o. Book_id
GROUP BY o. Book_id, b. Title
ORDER BY Order_Count DESC LIMIT 7;

--5) Show the top 3 most expensive books of 'Fantasy' Genre;
SELECT * FROM Books;

SELECT * From Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC LIMIT 3;


--6) Retrieve the total quantity of books sold by each author:
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

SELECT b.Author, SUM(o. Quantity) AS Total_Quantity_Books_Sold
FROM Orders o
JOIN Books b ON o. Book_id = b. Book_id
GROUP BY b.Author;

--7) List the cities where customers who spent over $30 are located;
SELECT * FROM Orders;
SELECT * FROM Customers;

SELECT DISTINCT c. City, Total_Amount
FROM Orders o
JOIN customers c ON o. Customer_id = c. Customer_id
WHERE o.Total_Amount > 30;

--8) Find the customers who spent the most on orders:
SELECT * FROM Customers;

SELECT c.Customer_id, c. Name, SUM(o. Total_Amount) AS Total_Spent
FROM Orders o
JOIN Customers c ON o. Customer_id = c. Customer_id
GROUP BY c.Customer_id, c.Name
ORDER BY Total_Spent DESC LIMIT 1;

--9) Calculate the stock remaining after fulfilling all orders;
SELECT * FROM Orders;
SELECT * FROM Books;

SELECT b.Book_id, b.Title, b.Stock, COALESCE(SUM(o.quantity),0) AS Order_Quantity,
b.Stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM Books b
LEFT JOIN Orders o ON b.Book_id = o.Book_id
GROUP BY b.book_id ORDER BY b.Book_id;
