#!/bin/bash
#creating the Datasets directory
mkdir -p tests/Graphs/QualisBrasil/csv

#removing csv files if they exist
if [ -f tests/Graphs/QualisBrasil/csv/evaluations.csv ]; then rm tests/Graphs/QualisBrasil/csv/evaluations.csv; fi 


echo "creating evaluations.csv file..."
mysql -u qualisproject -pqualisproject qualisproject --default-character-set=utf8 -B -e "select * from QualisEvaluation;" | sed 's/\t/","/g;s/^/"/;s/$/"/;s/\n//g' > tests/Graphs/QualisBrasil/csv/evaluations.csv

