# Retail Insights Data Analysis (SQL Project)

## Business Case
A regional supermarket chain, **FreshMart**, is facing losses due to poor inventory management.  
Some items are overstocked while others run out quickly. This project provides data-driven insights to optimize inventory.

## Problem Statement
Develop a **Stock Health Report** system that:
- Identifies products nearing expiration
- Detects dead stock (unsold products)
- Analyzes revenue contribution by category

## Objectives
- Design a relational database for retail management
- Analyze inventory performance
- Generate insights for better decision-making

## Database Schema

### Categories
- CategoryID
- CategoryName

### Products
- ProductID
- ProductName
- CategoryID
- ExpiryDate
- StockCount
- Price

### SalesTransactions
- TransactionID
- ProductID
- Quantity
- TransactionDate


## Key Features

- Inventory tracking
- Expiry analysis
- Dead stock detection
- Revenue analysis


## SQL Reports

### 1. Expiring Soon Products
- Finds products:
  - Expiring within 7 days
  - Having stock > 50
 
<img width="644" height="459" alt="Expiring soon" src="https://github.com/user-attachments/assets/09685060-dc62-417a-a91a-7c7298016146" />


### 2. Dead Stock Analysis
- Identifies products:
  - Not sold in the last 60 days

<img width="774" height="473" alt="Dead stock" src="https://github.com/user-attachments/assets/5db555ab-4223-46c7-ae2e-c2b408136a58" />


### 3. Revenue Contribution
- Calculates:
  - Total revenue per category
  - Based on last month's sales

<img width="549" height="854" alt="Revenue contribution" src="https://github.com/user-attachments/assets/c24fdb47-3812-4600-bdcc-5811b7957255" />


## Technologies Used
- SQL
- MySQL

