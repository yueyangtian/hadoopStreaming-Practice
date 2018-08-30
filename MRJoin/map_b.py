import sys

for line in sys.stdin:
    ss = line.strip().split()
    print "%s\t2\t%s" % (ss[0],ss[1])
