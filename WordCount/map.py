import sys
for line in sys.stdin:
    word_arr = line.strip().split(' ')
    for word in word_arr:
        print '\t'.join([word.strip(), str(1)])
