# Hospital Management & Patient Analytics System

## Business Case
Hospitals require efficient systems to manage patient records and analyze treatment data.  
This project helps in organizing hospital data and generating useful insights for better decision-making.

## Problem Statement
Design a database system that:
- Stores patient, doctor, appointment, and treatment data
- Performs analytical queries on hospital operations

## Objectives
- Store structured hospital data
- Track appointments and treatments
- Analyze performance and revenue
- Provide meaningful insights


## Database Tables

### Patients
- patient_id
- name
- age
- gender

### Doctors
- doctor_id
- name
- specialization

### Appointments
- appointment_id
- patient_id
- doctor_id
- date

### Treatments
- treatment_id
- patient_id
- diagnosis
- cost
- treatment_date

## Key Features

- Manage patient records
- Track doctor appointments
- Store treatment details
- Analyze hospital performance


## SQL Queries (Reports)

### Most Consulted Doctors
- Identifies doctors with highest patient visits
<img width="756" height="469" alt="Most Consulted doctor" src="https://github.com/user-attachments/assets/60d33f12-fcda-4c06-9925-4d783444369e" />

### Total Revenue Per Month
- Calculates monthly earnings from treatments
<img width="591" height="463" alt="Total revenue per month" src="https://github.com/user-attachments/assets/80120937-dad8-4488-8e0a-298d026ef61f" />

### Most Common Diseases
- Finds frequently occurring diagnoses
<img width="639" height="493" alt="Most Common diseases" src="https://github.com/user-attachments/assets/625780f2-60b2-4d71-90cb-7426f6fd3433" />

### Patient Visit Frequency
- Tracks how often patients visit the hospital
<img width="708" height="513" alt="Patient Visit frequency" src="https://github.com/user-attachments/assets/e25cb6bc-17ed-4225-8cc3-dedda681572c" />

### Doctor Performance
- Evaluates doctors based on:
  - Number of patients handled
  - Revenue generated
<img width="702" height="648" alt="Doc performance" src="https://github.com/user-attachments/assets/a1e31b6e-e3dd-41d6-b13b-3374dca8f870" />

## Technologies Used
- SQL
- MySQL

## How to Run

1. Open MySQL Workbench or Command Line
2. Run the SQL script
