import sys

base_value = 100000

for line in sys.stdin:
    key,val = line.strip().split('\t')
    print str(int(key)-base_value) + '\t' + val
