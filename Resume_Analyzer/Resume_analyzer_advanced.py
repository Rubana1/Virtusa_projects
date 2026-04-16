# Resume Analyzer & Job Matcher

import spacy
import PyPDF2

# Load NLP model
nlp = spacy.load("en_core_web_sm")

# Predefined skill database
skills_db = [
    "python", "java", "sql", "machine learning",
    "deep learning", "data analysis", "communication",
    "nlp", "react", "spring boot", "tensorflow"
]

# Read PDF Resume
def extract_text_from_pdf(file_path):
    text = ""
    with open(file_path, "rb") as file:
        reader = PyPDF2.PdfReader(file)
        for page in reader.pages:
            text += page.extract_text()
    return text.lower()

# Extract skills using NLP
def extract_skills(text):
    doc = nlp(text)
    found_skills = set()

    for token in doc:
        for skill in skills_db:
            if skill in token.text.lower():
                found_skills.add(skill)

    return list(found_skills)

# Match logic
def match_skills(resume_skills, job_skills):
    matched = set(resume_skills) & set(job_skills)
    missing = set(job_skills) - set(resume_skills)

    if len(job_skills) > 0:
        score = (len(matched) / len(job_skills)) * 100
    else:
        score = 0

    return matched, missing, int(score)

# MAIN FUNCTION
def analyze_resume(resume_path, job_description):

    # Extract resume text
    resume_text = extract_text_from_pdf(resume_path)

    # Extract skills
    resume_skills = extract_skills(resume_text)
    job_skills = extract_skills(job_description.lower())

    # Match
    matched, missing, score = match_skills(resume_skills, job_skills)

    # Output
    print("\n--- Resume Analysis Report ---")
    print("Resume Skills:", resume_skills)
    print("Job Skills:", job_skills)
    print("Matched Skills:", list(matched))
    print("Missing Skills:", list(missing))
    print(f"Match Score: {score}%")

# Example Job Description
job_desc = """
We are looking for a candidate skilled in Python, SQL, Machine Learning,
Deep Learning, Communication, and NLP.
"""

analyze_resume("resume.pdf", job_desc)