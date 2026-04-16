# Resume Analyzer & Job Matcher (Python Project)

## Problem Statement
Fresh graduates often struggle to tailor their resumes for specific job roles.  
This project helps analyze resumes and match them with job descriptions to improve chances of selection.

## Objectives
- Extract key information from resumes
- Compare candidate skills with job requirements
- Provide a match score
- Suggest missing skills for improvement

## Features

- Read resume from PDF file
- Extract skills using NLP (spaCy)
- Compare resume with job description
- Calculate match score (percentage)
- Suggest missing skills

## How It Works

### 1. Resume Input
- Reads resume from PDF using `PyPDF2`

### 2. NLP Processing
- Uses `spaCy` to process text
- Extracts relevant skills from resume and job description

### 3. Skill Matching
- Compares:
  - Resume skills
  - Job required skills

### 4. Score Calculation
- Match Score =  
  (Matched Skills / Total Job Skills) × 100

### 5. Suggestions
- Displays missing skills to improve resume

## Technologies Used
- Python
- spaCy (NLP)
- PyPDF2 (PDF processing)


## How to Run

1. Install dependencies:

pip install spacy PyPDF2
python -m spacy download en_core_web_sm

2. Place your resume file:
resume.pdf

3. Run the program:
python resume_analyzer.py

<img width="993" height="265" alt="Screenshot 2026-04-16 115203" src="https://github.com/user-attachments/assets/3694c255-6816-430e-9c65-8cda5f14a370" />
