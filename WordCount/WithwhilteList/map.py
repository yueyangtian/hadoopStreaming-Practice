import sys
def read_white_list_func(f):
    word_set=set()
    file_in=open(f,'r')
    for line in file_in:
        word = line.strip()
        word_set.add(word)
    return word_set
def map_func(white_list):
    white_set = read_white_list_func(white_list)
    for line in sys.stdin:
        word_arr = line.strip().split(' ')
        for word in word_arr:
            if word != "" and (word in white_set):
                print '\t'.join([word.strip(), str(1)])

if __name__ == '__main__':
    module = sys.modules[__name__]
    func = getattr(module, sys.argv[1])
    args = None
    if(len(sys.argv) > 1):
        args = sys.argv[2:]
    func(*args)
