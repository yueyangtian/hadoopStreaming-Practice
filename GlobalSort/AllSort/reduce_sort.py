import sys

base_value = 100000

for line in sys.stdin:
    part,key,val = line.strip().split()
    print part + '\t' + str(key) + '\t' + val
