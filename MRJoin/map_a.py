import sys

for line in sys.stdin:
    ss = line.strip().split()
    key = ss[0]
    val = ss[1]
    print "%s\t1\t%s" % (key, val)
