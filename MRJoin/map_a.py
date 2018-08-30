import sys

for line in sys.stdin:
    ss = line.strip().split()
    print "%s\t1\t%s" % (ss[0], ss[1])
