
-- HOSPITAL MANAGEMENT SYSTEM


-- 1. CREATE DATABASE
CREATE DATABASE IF NOT EXISTS HospitalDB;
USE HospitalDB;

-- 2. CREATE TABLES

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialization VARCHAR(100)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    diagnosis VARCHAR(100),
    cost DECIMAL(10,2),
    treatment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);


-- 3. INSERT DUMMY DATA

INSERT INTO Patients (name, age, gender) VALUES
('Ravi', 25, 'Male'),
('Priya', 30, 'Female'),
('Arun', 40, 'Male'),
('Sneha', 35, 'Female');

INSERT INTO Doctors (name, specialization) VALUES
('Dr. Kumar', 'Cardiology'),
('Dr. Meena', 'Neurology'),
('Dr. Raj', 'General');

INSERT INTO Appointments (patient_id, doctor_id, date) VALUES
(1, 1, '2026-04-01'),
(2, 2, '2026-04-02'),
(1, 3, '2026-04-03'),
(3, 1, '2026-04-04'),
(4, 2, '2026-04-05');

INSERT INTO Treatments (patient_id, diagnosis, cost, treatment_date) VALUES
(1, 'Heart Disease', 5000, '2026-04-01'),
(2, 'Migraine', 2000, '2026-04-02'),
(1, 'Fever', 500, '2026-04-03'),
(3, 'Heart Disease', 7000, '2026-04-04'),
(4, 'Migraine', 2500, '2026-04-05');


-- 4. QUERIES (REPORTS)

-- Most Consulted Doctors
SELECT d.name, COUNT(a.appointment_id) AS total_visits
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.name
ORDER BY total_visits DESC;

-- Total Revenue Per Month
SELECT 
    MONTH(treatment_date) AS month,
    SUM(cost) AS total_revenue
FROM Treatments
GROUP BY MONTH(treatment_date)
ORDER BY month;

-- Most Common Diseases
SELECT diagnosis, COUNT(*) AS count
FROM Treatments
GROUP BY diagnosis
ORDER BY count DESC;

-- Patient Visit Frequency
SELECT p.name, COUNT(a.appointment_id) AS visits
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
GROUP BY p.name
ORDER BY visits DESC;

-- Doctor Performance
SELECT 
    d.name,
    COUNT(a.appointment_id) AS total_patients,
    SUM(t.cost) AS revenue_generated
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
JOIN Treatments t ON a.patient_id = t.patient_id
GROUP BY d.name
ORDER BY revenue_generated DESC;