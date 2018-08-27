#! /bin/bash

STREAM_JAR_PATH="/root/hadoop-1.2.1/contrib/streaming/hadoop-streaming-1.2.1.jar"
INPUT_FILE_PATH_1="/1.txt"
INPUT_FILE_PATH_2="/2.txt"
OUTPUT_PATH="/output"

/root/hadoop-1.2.1/bin/hadoop fs -rmr -skipTrash $OUTPUT_PATH
/root/hadoop-1.2.1/bin/hadoop jar $STREAM_JAR_PATH \
        -input $INPUT_FILE_PATH_1,$INPUT_FILE_PATH_2 \
        -output $OUTPUT_PATH \
        -jobconf "mapred.reduce.tasks=1" \
        -mapper "python map_sort.py" \
        -reducer "python reduce_sort.py" \
        -file ./map_sort.py \
        -file ./reduce_sort.py
