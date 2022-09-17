#!/bin/sh
OUTPUT_DIR="out_dir"
INPUT_FILE="../ex03/hh_positions.csv"
UNTIL_DOT=".csv"
tail -n +2 "../ex03/hh_positions.csv" | cut -f 2 -d ',' | cut -f 1 -d 'T' | cut -f 2 -d '"' | sort | uniq -ci | while read -r line ; do words=($line); echo "${words[1]}" "" "${words[0]}" | sort | cat ; done
# tail -n +2 "../ex03/hh_positions.csv" | cut -f 2 -d ',' | cut -f 1 -d 'T' | cut -f 2 -d '"' | sort | uniq | while read -r line ; do words=($line); echo  >> "${words[0]}.csv"; done
# var = tail -n +2 "../ex03/hh_positions.csv" | sort
# tail -n +2 "../ex03/hh_positions.csv" | sort | while read -r line ; do words=($line); echo "${words[0]}" >> ${words[0]} ; done
UNIQUE_DATES=$(cat $INPUT_FILE \
				| tail -n +2 \
				| awk 'BEGIN{FS=",\""} {split($2, result, "T"); print result[1];}' \
				| sort \
				| uniq \
			  )
mkdir -p $OUTPUT_DIR
for date in $UNIQUE_DATES
do
	CURRENT_FILE="$OUTPUT_DIR/$date$UNTIL_DOT"
	touch $CURRENT_FILE

	  cat $INPUT_FILE | head -n 1 > $CURRENT_FILE

cat $INPUT_FILE \
    | tail -n +2 \
    | awk -v date=$date \
      'BEGIN{FS=OFS=","}
      {
        i = index($2, date);
        if (i > 0)
        {
          print $0;
        }
      }' \
    >> $CURRENT_FILE

done
