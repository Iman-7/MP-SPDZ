import re

import sys

# print 'Number of arguments:', len(sys.argv), 'arguments.'
# print ('Argument List:', str(sys.argv))

input_file_path = sys.argv[1] 

with open(input_file_path, "r") as file:
    data = file.read()
print("current test file results:", input_file_path)

# Define a regular expression pattern to match the real-time measurement
pattern = r'real\s+(\d+m\d+\.\d+s)'

# Search for the pattern in the data
match = re.findall(pattern, data)

for m in match:
    out = m.split('m')
    minutes = float(out[0])
    seconds = float(out[1][:-1])
    # print(minutes, seconds)
    total_seconds = minutes * 60 + seconds
    # print("Real Time in Seconds:", total_seconds)
    print(total_seconds)