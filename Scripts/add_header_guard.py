import argparse
import os
import uuid
import string

parser = argparse.ArgumentParser(prog='Header guard generator')
parser.add_argument("-f", dest="filename")

args = parser.parse_args()
filename = args.filename
if filename == None:
    exit(0)

print(f"Processing {filename}")
remove_specials = str.maketrans("", "", string.punctuation)
root, ext = os.path.splitext(filename)
ext = ext.translate(remove_specials)
basename = os.path.basename(root)
guid = str(uuid.uuid4()).translate(remove_specials).lower()

guard = "HEADER_"
for index, c in enumerate(basename):
    if index == 0:
        guard += c.upper()
        continue
    if c.isupper():
        guard += f"_{c}"
        continue
    guard += c.upper()
guard += f"_{ext.upper()}"
guard += f"_{guid}"
print(f"Calculated unique guard for file: {guard}")
    
        










