for((i=0;i<10;++i)); do
    if [ $(($i%2)) == 0 ]; then
        echo "$i hadoop" >> 1.txt
    else
        echo "$i java" >> 2.txt
    fi
done
