#!/bin/bash

# environment stuffs
mkdir -p Qualis/temp/nt
rm -rf cache/*
rm -rf /tmp/*
if [ -f Qualis/temp/nt/evaluations.nt ]; then rm Qualis/temp/nt/evaluations.nt; fi 
if [ -f Qualis/temp/QualisBrasil.nt ]; then rm Qualis/temp/QualisBrasil.nt; fi 

echo "generating evaluations.nt file by sparqlify"
sparqlify-csv -h -f Qualis/temp/csv/evaluations.csv -c Qualis/toolConfigurations/mappingQualis.english.sml > Qualis/temp/nt/evaluations.nt


