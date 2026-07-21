# 📚 Online Bookstore SQL Data Analysis Project
 Project Overview

This project focuses on analyzing an Online Bookstore database using SQL and PostgreSQL.

The objective of this project is to explore bookstore sales data, customer behavior, and book performance by writing SQL queries ranging from basic data exploration to advanced analytical queries.

The analysis helps uncover meaningful business insights such as:

- Best-selling books
- Highest revenue-generating books
- Customer purchasing patterns
- Sales trends
- Popular book categories
- Business performance metrics

This project demonstrates practical SQL skills used in real-world data analyst roles.

# 🛠️ Technologies Used

- Database:PostgreSQL
- Query Language:SQL
- Database Tool:pgAdmin 4
- Development Environment:Visual Studio Code
- Version Control:Git & GitHub




# 🗄️ Database Schema

The database consists of three main tables:

## 1. Books Table

Stores information about available books.

Columns:
Book_ID: 
Title:
Author:
Genre:
Published_Year:
Price:
Stock :


## 2. Customers Table

Stores customer information.

Columns:
Customer_ID
Name
Email
Phone
City
Country


## 3. Orders Table

Stores transaction details.

Columns:
Order_ID
Customer_ID
Book_ID
Order_Date
Quantity
Total_Amount



# 🎯 Project Objectives

The main goals of this analysis are:

✔ Understand bookstore sales performance

✔ Identify top-performing books and authors

✔ Analyze customer purchasing behavior

✔ Calculate revenue and sales metrics

✔ Apply advanced SQL techniques for business analysis


# 🔍 SQL Concepts Demonstrated

## Basic SQL

- SELECT statements
- Filtering using WHERE
- Sorting using ORDER BY
- DISTINCT values
- LIMIT

## Intermediate SQL
Aggregate functions
GROUP BY
HAVING
INNER JOIN
LEFT JOIN
CASE statements

📊 Business Questions Answered
Book Analysis
Which books are the best sellers?
Which genres generate the highest revenue?
Which authors have the highest sales performance?
What are the most expensive books?

Customer Analysis
Who are the top spending customers?
How many customers have purchased books?
What is the average customer order value?
Which customers purchase most frequently?

📈 Key Insights

Some examples of insights generated from the analysis:
Identified the highest revenue-generating books.
Found the most popular book categories among customers.
Determined top customers based on total spending.
Analyzed sales trends over time.
Ranked books based on sales performance.

▶️ How to Run This Project
Step 1: Create Database

Create a PostgreSQL database:
CREATE DATABASE Online_Bookstore;

Step 2: Create Tables

Run:

database/01_create_tables.sql
Three tables are created 
1.Books
2.Customers
3.Orders 
using:
CREATE TABLE Books;
CREATE TABLE Customers;
CREATE TABLE Orders;
This will create all required tables.

Step 3: Import Data

Run:

database/02_import_data.sql
using this :

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

This loads the dataset into PostgreSQL.

Step 4: Run Analysis Queries

Execute SQL files from:

queries/

Start with:

01_data_exploration.sql

Then continue with:

02_sales_analysis.sql

03_customer_analysis.sql

04_advanced_analysis.sql

📷 Project Screenshots

Screenshots of all queries results are available in:

results/screenshots/

Examples:

Revenue analysis
Customer ranking
Sales performance
Book analysis

🚀 Skills Developed

Through this project, I practiced:

Database design
PostgreSQL
SQL querying
Data cleaning
Data exploration
Business analysis
Data storytelling
GitHub project management

⭐ Future Improvements

Possible enhancements:

Create a dashboard using Power BI/Tableau
Add customer segmentation analysis
Perform sales forecasting
Automate reporting using Python
Add database optimization techniques