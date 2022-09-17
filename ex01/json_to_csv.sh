#!/bin/sh
jq -rf filter.jq "../ex00/hh.json" > hh.csv
cat hh.csv
