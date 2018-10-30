#! /bin/bash

STREAM_JAR_PATH="/root/hadoop-2.8.4/share/hadoop/tools/lib/hadoop-streaming-2.8.4.jar"
INPUT_FILE_PATH="/123.txt"
OUTPUT_PATH="/output"

/root/hadoop-2.8.4/bin/hadoop fs -rmr -skipTrash $OUTPUT_PATH
/root/hadoop-2.8.4/bin/hadoop jar $STREAM_JAR_PATH \
        -input $INPUT_FILE_PATH \
        -output $OUTPUT_PATH \
        -jobconf "mapred.job.name=test" \
        -mapper "python map.py" \
        -reducer "python reduce.py" \
        -file ./map.py \
        -file ./reduce.py
