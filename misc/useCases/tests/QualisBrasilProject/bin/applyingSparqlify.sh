#!/bin/bash

#creating the Temp directory if it doesn't exist
mkdir -p tests/Graphs/QualisBrasil/nt

#removing evaluations.nt files, if it exists
if [ -f tests/Graphs/QualisBrasil/nt/evaluations.nt ]; then rm tests/Graphs/QualisBrasil/nt/evaluations.nt; fi 

#removing QualisBrasil.nt files, if it exists
if [ -f tests/Graphs/QualisBrasil/QualisBrasil.nt ]; then rm tests/Graphs/QualisBrasil/QualisBrasil.nt; fi 

echo "generating evaluations.nt file by sparqlify"
sparqlify-csv -f tests/Graphs/QualisBrasil/csv/evaluations.csv -c tests/QualisBrasilProject/Mappings/mappingQualis.english.sml > tests/Graphs/QualisBrasil/nt/evaluations.nt


