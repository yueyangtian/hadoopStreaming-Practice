#! /bin/bash

STREAM_JAR_PATH="/root/hadoop-1.2.1/contrib/streaming/hadoop-streaming-1.2.1.jar"
INPUT_FILE_A_PATH="/a.txt"
OUTPUT_A_PATH="/output_a"
INPUT_FILE_B_PATH="/b.txt"
OUTPUT_B_PATH="/output_b"
# step 1
/root/hadoop-1.2.1/bin/hadoop fs -rmr -skipTrash $OUTPUT_A_PATH
/root/hadoop-1.2.1/bin/hadoop jar $STREAM_JAR_PATH \
        -input $INPUT_FILE_A_PATH \
        -output $OUTPUT_A_PATH \
        -mapper "python map_a.py" \
        -reducer "cat" \
        -file ./map_a.py \

#step 2        
/root/hadoop-1.2.1/bin/hadoop fs -rmr -skipTrash $OUTPUT_B_PATH
/root/hadoop-1.2.1/bin/hadoop jar $STREAM_JAR_PATH \
        -input $INPUT_FILE_B_PATH \
        -output $OUTPUT_B_PATH \
        -mapper "python map_b.py" \
        -file ./map_b.py \

 step 3        
/root/hadoop-1.2.1/bin/hadoop fs -rmr -skipTrash "/join_output"
/root/hadoop-1.2.1/bin/hadoop jar $STREAM_JAR_PATH \
        -input $OUTPUT_B_PATH,$OUTPUT_A_PATH \
        -output "/join_output" \
        -mapper "cat" \
        -reducer "python join_reduce.py" \
        -file ./join_reduce.py \
        -jobconf stream.num.map.output.key.fields=2 \
        -jobconf num.key.fields.for.partition=1
