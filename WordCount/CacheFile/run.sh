#! /bin/bash

STREAM_JAR_PATH="/root/hadoop-1.2.1/contrib/streaming/hadoop-streaming-1.2.1.jar"
INPUT_FILE_PATH="/123.txt"
OUTPUT_PATH="/output"

/root/hadoop-1.2.1/bin/hadoop fs -rmr -skipTrash $OUTPUT_PATH
/root/hadoop-1.2.1/bin/hadoop jar $STREAM_JAR_PATH \
        -input $INPUT_FILE_PATH \
        -output $OUTPUT_PATH \
        -mapper "python map.py map_func ABC" \
        -reducer "python reduce.py" \
        -jobconf "mapred.reduce.tasks=3" \
        -cacheFile "hdfs://master:9000/white_list#ABC" \
        -file ./map.py \
        -file ./reduce.py
