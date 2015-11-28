#!/bin/sh

if [ -f reports/reportQualisBrasil.html ]; then rm reports/reportQualisBrasil.html; fi

java -jar tools/lodflowReport.jar "ontology/ldwpoESWC.owl" "ldwpo:project_QualisBrasil" > reports/QualisBrasilReport.html
