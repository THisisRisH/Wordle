import requests
from random import shuffle

# Fetch the list of five-letter words
url = "https://raw.githubusercontent.com/dwyl/english-words/master/words.txt"
response = requests.get(url)
words = response.text.splitlines()
lenRequire = 6
numberOfWords = 2000
file_path = r"E:\Flutter_project\Wordle\wordle\assets\six_letters_words.txt"

# Filter for five-letter words with unique letters
unique_letter_words = [word for word in words if len(word) == lenRequire and len(set(word)) == lenRequire and word.isalpha()]
shuffle(unique_letter_words)
# Ensure we have at least 2000 words
if len(unique_letter_words) < numberOfWords:
    raise ValueError("Not enough unique letter words found.")

# Write to a text file
with open(file_path, "w") as file:
    for word in unique_letter_words[:numberOfWords]:  # Take only the first 10000
        word = word.upper()
        file.write(word + ",")

print("Text file created with 2000 unique five-letter words.")
