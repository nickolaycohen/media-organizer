import sqlite3
import os

# Path to the Apple Photos database
# db_path = os.path.expanduser("/Volumes/Extreme Pro/Photos Library/All-Media/database/Photos.sqlite")
db_path="/Volumes/Extreme Pro/Photos Library/All-Media.photoslibrary/database/Photos.sqlite"

# Connect to the database
conn = sqlite3.connect(db_path)
cursor = conn.cursor()

# Define the threshold
threshold = 0.7625

# Query photos above the threshold
query = """
SELECT zuuid FROM ZASSET 
WHERE ZOVERALLAESTHETICSCORE > ? 
and ztrashedstate = 0
ORDER BY ZOVERALLAESTHETICSCORE DESC;
"""
cursor.execute(query, (threshold,))

# Fetch all matching UUIDs
uuids = [row[0] for row in cursor.fetchall()]

# Close the connection
conn.close()

# Save to a file (optional)
with open("photo_uuids.txt", "w") as f:
    for uuid in uuids:
        f.write(uuid + "\n")

print(f"Extracted {len(uuids)} high-quality photos.")
