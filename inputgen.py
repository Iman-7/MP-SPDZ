## python inputgen.py <file path> <size of input>

import sys

# print 'Number of arguments:', len(sys.argv), 'arguments.'
# print ('Argument List:', str(sys.argv))

filePath = sys.argv[1] 
with open(filePath, 'r') as file:
    # read a list of lines into data
    data = file.readlines()

# print (data)
# print ("Input size before:" + data[0])

if filePath.endswith("B.mpc"):
     
    # data[2] = "a = siv64(" + sys.argv[2] + ")" + '\n'
    # data[3] = "b = siv64(" + sys.argv[2] + ")" + '\n'
    data[0] = "a = sbitintvec(None," + sys.argv[2] + ", 64)" + '\n'
    data[1] = "b = sbitintvec(None," + sys.argv[2] + ", 64)" + '\n'

else:
    data[0] = 'n =' + sys.argv[2] + '\n'

print ("############### Testing with input size = " + sys.argv[2])

# and write everything back
with open(filePath, 'w') as file:
    file.writelines( data )