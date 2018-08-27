import sys
basecount = 100000
for line in sys.stdin:
    ss = line.strip().split()
    #print ss
    if len(ss) == 2:
        key = ss[1]
        val = ss[0]
        new_key = basecount+int(key)
        print "%s\t%s" %(new_key, val)
