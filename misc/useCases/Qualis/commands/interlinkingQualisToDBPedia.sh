#!/bin/bash
#creating the Temp directory if it doesn't exist
mkdir -p Qualis/temp/nt

#removing evaluations.nt files, if it exists
if [ -f Qualis/temp/nt/dbpedia_qualis_links.nt ]; then rm Qualis/temp/nt/dbpedia_qualis_links.nt; fi 

#removing QualisBrasil.nt files, if it exists
if [ -f Qualis/temp/QualisBrasil.nt ]; then rm Qualis/temp/QualisBrasil.nt; fi 

java -jar tools/LIMES-DIST/LIMES.jar Qualis/toolConfigurations/linkingQualisToDbpedia.xml


