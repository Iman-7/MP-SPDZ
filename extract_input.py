import re

import sys

# print 'Number of arguments:', len(sys.argv), 'arguments.'
# print ('Argument List:', str(sys.argv))

input_file_path = sys.argv[1] 

with open(input_file_path, "r") as file:
    script_output = file.read()
print("current test file results:", input_file_path)

times = re.findall(r"Time = (\d+\.\d+) seconds", script_output)
for time in times:
    print(time)