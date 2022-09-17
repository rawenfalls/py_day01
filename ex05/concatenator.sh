#/bin/sh

OUTPUT_FILE="./hh_positions.csv"
INPUT_DIR="out_dir"
UNTIL_DOT=".csv"

FILE_LIST=($(ls $INPUT_DIR/*$INPUT_FILE_EXTENTION))

cat ${FILE_LIST[0]} | head -n 1 > $OUTPUT_FILE

for file in ${FILE_LIST[@]}
do
  cat $file \
    | tail -n +2 \
    >> $OUTPUT_FILE
done
