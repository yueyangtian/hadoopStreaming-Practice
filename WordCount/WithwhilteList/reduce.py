import sys


count = 0;
prev_word = None
for line in sys.stdin:
    word,cur_count = line.strip().split('\t')
    if prev_word == None:
        prev_word = word

    if prev_word != word:
        print '\t'.join([prev_word, str(count)])
        count = 0
        prev_word = word
    
    count = count + int(cur_count)
print '\t'.join([prev_word, str(count)])


