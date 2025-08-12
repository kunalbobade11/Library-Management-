# 📚 Library Management System

## **Overview**  
The **Library Management System** is a beginner-friendly SQL project designed to help learners practice essential SQL commands in a real-world scenario. It simulates the operations of a small library by managing **Members**, **Books**, and **Borrow Records** through a relational database.  

This project demonstrates how to **create a database from scratch**, establish **table relationships** using foreign keys, and perform **basic SQL operations** like data insertion, retrieval, modification, and deletion.

***

## **Database Structure**  

**1. Members Table**  
Stores information about library members:  
- `MemberID` (Primary Key)  
- `Name`  
- `Email`  
- `JoinDate`  

**2. Books Table**  
Stores information about books:  
- `BookID` (Primary Key)  
- `Title`  
- `Author`  
- `Genre`  
- `PublishedYear`  

**3. BorrowRecords Table**  
Tracks borrowing activity:  
- `RecordID` (Primary Key)  
- `MemberID` (Foreign Key → Members)  
- `BookID` (Foreign Key → Books)  
- `BorrowDate`  
- `ReturnDate`  

***

## **Features & SQL Concepts Covered**
- **Database Creation** (`CREATE DATABASE`, `USE`)  
- **Table Definition** (with primary & foreign keys)  
- **Data Insertion** (`INSERT`)  
- **Data Retrieval** (`SELECT`, `WHERE`, `ORDER BY`, `LIKE`)  
- **Data Update** (`UPDATE`)  
- **Data Deletion** (`DELETE`)  
- **Joins** (`INNER JOIN`, `LEFT JOIN`)  
- **Aggregates & Grouping** (`COUNT`, `GROUP BY`)  

***

## **Sample Queries**
- List all members who joined after February 2024.  
- Show all books published after 1950.  
- Count total members in the library.  
- Show each member along with the total number of books they borrowed.  
- List all members, even if they haven’t borrowed a book.  

***

## **How to Run**
1. Save the SQL script (`library_project.sql`) on your computer.  
2. Run in MySQL:  
   ```bash
   mysql -u root -p < library_project.sql
   ```
3. Run in PostgreSQL:  
   ```bash
   psql -U postgres -f library_project.sql
   ```
4. Run in SQLite (remove `CREATE DATABASE` & `USE`):  
   ```bash
   sqlite3 library.db < library_project.sql
   ```

***
