#!/bin/bash
#creating the Temp directory if it doesn't exist
mkdir -p tests/Graphs/QualisBrasil/nt

#removing evaluations.nt files, if it exists
if [ -f tests/Graphs/QualisBrasil/nt/dbpedia_qualis_links.nt ]; then rm tests/Graphs/QualisBrasil/nt/dbpedia_qualis_links.nt; fi 

#removing QualisBrasil.nt files, if it exists
if [ -f tests/Graphs/QualisBrasil/QualisBrasil.nt ]; then rm tests/Graphs/QualisBrasil/QualisBrasil.nt; fi 

java -jar tools/LIMES-DIST/LIMES.jar tests/QualisBrasil_to_DBpedia_InterlinkingProject/Scripts/linkingQualisToDbpedia.xml


