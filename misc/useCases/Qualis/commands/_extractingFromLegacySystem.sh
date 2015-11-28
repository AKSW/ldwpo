#!/bin/bash

#enviroment stuffs
mkdir -p Qualis/temp/csv
if [ -f Qualis/temp/csv/evaluations.csv ]; then rm Qualis/temp/csv/evaluations.csv; fi 

echo "creating evaluations.csv file..."
mysql -u qualisproject -pqualisproject qualisproject --default-character-set=utf8 -B -e "select * from qualisEvaluationReal;" | sed 's/\t/","/g;s/^/"/;s/$/"/;s/\n//g' > Qualis/temp/csv/evaluations.csv
