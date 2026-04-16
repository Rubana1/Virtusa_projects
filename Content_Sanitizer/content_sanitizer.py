# SocialMedia Content Sanitizer

# Sample posts
posts = [
    {"user": "User123", "text": "I hate this platform http://badlink.com"},
    {"user": "User456", "text": "This is a good day"},
    {"user": "User123", "text": "Such a toxic comment! visit http://example.com"},
    {"user": "User789", "text": "bad behavior should stop"},
]

# Banned words
banned_words = ["bad", "toxic", "hate"]

# Counters
total_posts = len(posts)
cleaned = 0
blocked = 0

# Dictionary
user_flags = {}

# File to store links
link_file = open("links_found.txt", "w")

for post in posts:
    text = post["text"]
    user = post["user"]
    original_text = text
    flagged = False

    if user not in user_flags:
        user_flags[user] = 0

    # Word Masking
    for word in banned_words:
        if word in text.lower():
            text = text.replace(word, "***")
            flagged = True

    # Link Extraction
    words = original_text.split()
    for w in words:
        if w.startswith("http"):
            link_file.write(w + "\n")

    # Count results
    if flagged:
        cleaned += 1
        user_flags[user] += 1
    else:
        blocked += 1

    print(f"Processed Post: {text}")

link_file.close()

print("\n--- Report ---")
print(f"Total Posts Screened: {total_posts} | Cleaned: {cleaned} | Blocked: {blocked}")

print("\nUser Flag Report:")
for user, count in user_flags.items():
    print(f"{user}: {count}")