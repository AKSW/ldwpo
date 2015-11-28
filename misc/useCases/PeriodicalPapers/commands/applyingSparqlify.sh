#!/bin/bash

# environment stuffs
mkdir -p PeriodicalPapers/temp/nt
rm -rf cache/*
rm -rf /tmp/*
if [ -f PeriodicalPapers/temp/nt/references.nt ]; then rm PeriodicalPapers/temp/nt/references.nt; fi 
if [ -f PeriodicalPapers/temp/PeriodicalPapers.nt ]; then rm PeriodicalPapers/temp/PeriodicalPapers.nt; fi 

echo "generating references.nt file by sparqlify"
sparqlify-csv -s '|' -h -f PeriodicalPapers/temp/csv/references.csv -c PeriodicalPapers/toolConfigurations/mappingReferences.english.sml > PeriodicalPapers/temp/nt/references.nt
