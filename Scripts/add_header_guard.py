import argparse
import os
import uuid
import string
import datetime

parser = argparse.ArgumentParser(prog='Header guard generator')
parser.add_argument("-f", dest="filename", required=True, help="filename to generate guard for")
parser.add_argument("-p", "--prefix", dest="prefix", default="HEADER", help="prefix for quard variable")
parser.add_argument("--uuid", dest="uuid_suffix", action="store_true", help="Use uuid as a suffix")
parser.add_argument("--date", dest="date_suffix", action="store_true", help="Use date as a suffix")
parser.add_argument("--datetime", dest="datetime_suffix", action="store_true", help="Use datetime as a suffix")
parser.add_argument("-s", "--simplify", dest="simplify", action="store_true", help="simplify format - don't use any prefix")
parser.add_argument("-x", "--execute", dest="execute", action="store_true", help="look for and mofify file in-place to add header guard")

args = parser.parse_args()
filename = args.filename
if filename == None:
    exit(0)

print(f"Processing {filename}")
remove_specials = str.maketrans("", "", string.punctuation)
root, ext = os.path.splitext(filename)
ext = ext.translate(remove_specials)
basename = os.path.basename(root)
suffix = ""
generated_uuid = str(uuid.uuid4())
generated_date = datetime.datetime.now()
if args.uuid_suffix:
    suffix =  "_" + generated_uuid.translate(remove_specials).upper()
elif args.date_suffix:
    suffix = generated_date.strftime("_%d_%m_%Y")
elif args.datetime_suffix:
    suffix = generated_date.strftime("_%H%M%S_%d_%m_%Y")

guard = "" if args.simplify else f"{args.prefix}_"
for index, c in enumerate(basename):
    if index == 0:
        guard += c.upper()
        continue
    if c.isupper():
        guard += f"_{c}"
        continue
    guard += c.upper()
guard += f"_{ext.upper()}"
guard += suffix
print(f"Calculated unique guard for file: {guard}")

if not args.execute:
    exit(0)

file_content = ''
with open(filename, 'r') as file:
    file_content = file.read()

additional_content = f"""
#ifndef {guard}
#define {guard}
"""
file_content = additional_content + file_content
additional_content = f"""
#endif // {guard}
"""
file_content += additional_content

with open(filename, 'w') as file:
    file.write(file_content)

        










