#!/bin/sh

if [ -f reports/reportPeriodicalPapers.html ]; then rm reports/reportPeriodicalPapers.html; fi

java -jar tools/lodflowReport.jar "ontology/ldwpoESWC.owl" "ldwpo:project_PeriodicalPapers" > reports/PeriodicalPapersReport.html
