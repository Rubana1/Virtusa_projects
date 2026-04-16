# SafeLog Password Validator (Java Project)

## Business Case
A cybersecurity firm requires a secure system for their **Employee Portal** to ensure users create strong passwords.  
This project enforces password policies and provides clear feedback to users.

## Problem Statement
Build a Password Strength Checker that:
- Validates user passwords based on security rules
- Provides specific feedback for invalid passwords
- Repeats input until a valid password is entered

## Objectives
- Enforce strong password policies
- Improve security through validation
- Provide user-friendly feedback

## Features

- Minimum length validation (8 characters)
- At least one uppercase letter required
- At least one digit required
- Detailed error messages
- Retry mechanism until valid password

## How It Works

### 1. Input
- User enters a password

### 2. Validation Rules
- Length ≥ 8
- Contains uppercase letter
- Contains digit (0–9)

### 3. Looping Logic
- Uses `for` loop to check each character
- Uses:
  - `Character.isUpperCase()`
  - `Character.isDigit()`

### 4. Feedback System
Displays:
- "Too short"
- "Missing uppercase letter"
- "Missing a digit"

### 5. Retry Mechanism
- Uses `while` loop
- Continues until valid password is entered

## Technologies Used
- Core Java
- OOP Concepts
- String Manipulation
- Loop Control (for loop, while loop)

## How to Run

1. Open terminal / command prompt
2. Compile the program:
javac PasswordValidator.java
java PasswordValidator

<img width="637" height="404" alt="Screenshot 2026-04-16 113253" src="https://github.com/user-attachments/assets/e4b6aa6e-453b-4fec-90c0-6de22bf77cbf" />
