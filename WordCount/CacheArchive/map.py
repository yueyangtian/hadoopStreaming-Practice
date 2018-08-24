import sys
import os

def get_cachfile_handler(f):
    f_handler_list = []
    if os.path.isdir(f):
        for fd in os.listdir(f):
            f_handler_list.append(f+'/'+fd)

    return f_handler_list


def read_white_list_func(f):
    word_set=set()
    fd_handle = get_cachfile_handler(f)
    for fd in fd_handle:
        file_in=open(fd,'r')
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
