import sys
basecount = 100000
for line in sys.stdin:
    ss = line.strip().split(' ')
   # print ss
    if len(ss) > 1:
        key = ss[0].strip()
        val = ss[1].strip()
        new_key = basecount+int(key)
        part = 1
        if new_key <(100010+100000) / 2:
            part = 0
        print "%s\t%s\t%s" %(str(part), str(new_key), val)
