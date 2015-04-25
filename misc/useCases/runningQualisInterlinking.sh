#!/bin/sh

#tests/qualisBrasilLIMES/bin/interlinkingQualisToDBPedia.sh
#tests/commons/savingIntoVirtuoso.sh tests/Graphs/QualisBrasil/QualisBrasil.nt http://lod.unicentro.br/QualisBrasilTest/
#echo "Finito LIMES ..."


if [ -f reports/workflowInterlink.html ]; then rm reports/workflowInterlink.html; fi

java -jar tools/ldStackWorkflow.jar "ontology/ldwpo.owl" "ldwpo:project_QualisBrasil_to_DBpedia_Interlinking" "ldwpo:ldWorkflow_execution_interlinking_qualisbrasil_20150126" > reports/workflowInterlink.html

echo "a report is generated in reports/workflowInterlink.html"


