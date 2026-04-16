SocialMedia Content Sanitizer (Python Project)

Business Case
A startup is building a safe social media platform for schools.  
This project helps in automatically screening user posts by detecting inappropriate words and extracting links for security review.

Problem Statement
Build a content moderator script that:
- Scans posts
- Replaces banned words with ***
- Extracts URLs
- Generates reports for moderation

 Features
- List processing of social media posts
- Word masking using banned words list
- Link extraction and storage
- User-wise flag tracking
- Final moderation report

Technologies Used
- Python
- Basic string operations
- File handling


How It Works

### 1. Input Data
- List of posts containing user and text

### 2. Word Masking
- Replaces banned words:
  - bad → ***
  - toxic → ***
  - hate → ***

### 3. Link Extraction
- Extracts URLs starting with `http`
- Saves them in: links_found.txt

### 4. User Tracking
- Tracks how many times each user used inappropriate content

### 5. Report Generation
Displays:
Total Posts Screened | Cleaned | Blocked


## How to Run

1. Open terminal
2. Navigate to project folder
3. Run: python content_sanitizer.py

<img width="931" height="401" alt="Screenshot 2026-04-16 113144" src="https://github.com/user-attachments/assets/2a2d79e6-f15f-48bc-ad22-dfeb4e5235f8" />
