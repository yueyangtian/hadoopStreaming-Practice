for((i=0;i<1000;++i)); do
    if [ $(($i%2)) == 0 ]; then
        echo "hadoop    $i" >> 1.txt
    else
        echo "java  $i" >> 2.txt
    fi
done
