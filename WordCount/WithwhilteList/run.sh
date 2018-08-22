#! /bin/bash

STREAM_JAR_PATH="/root/hadoop-1.2.1/contrib/streaming/hadoop-streaming-1.2.1.jar"
INPUT_FILE_PATH="/123.txt"
OUTPUT_PATH="/output"

/root/hadoop-1.2.1/bin/hadoop fs -rmr -skipTrash $OUTPUT_PATH
/root/hadoop-1.2.1/bin/hadoop jar $STREAM_JAR_PATH \
        -input $INPUT_FILE_PATH \
        -output $OUTPUT_PATH \
        -mapper "python map.py map_func white_list" \
        -reducer "python reduce.py" \
        -file ./map.py \
        -file ./reduce.py \
        -file ./white_list 
