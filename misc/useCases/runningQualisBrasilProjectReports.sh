#!/bin/sh

if [ -f reports/report_QualisBrasilConversionProject.html ]; then rm reports/report_QualisBrasilConversionProject.html.html; fi

java -jar tools/reportgen.jar "ontology/ldwpo.owl" "ldwpo:project_QualisBrasil" > reports/report_QualisBrasilConversionProject.html
echo " the report is generated in reports/report_QualisBrasilConversionProject.html"


if [ -f reports/reportQualisBrasil_to_DBpedia_InterlinkingProject.html ]; then rm reports/reportQualisBrasil_to_DBpedia_InterlinkingProject.html; fi

java -jar tools/reportgen.jar "ontology/ldwpo.owl" "ldwpo:project_QualisBrasil_to_DBpedia_Interlinking" > reports/report_QualisBrasilnterlinkProject.html
echo " the report is generated in reports/report_QualisBrasilnterlinkProject.html"

