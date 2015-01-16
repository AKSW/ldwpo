#!/bin/bash

echo "Generating report for the project ldpo:project_qualisbrasil. The output file is reportQualisBrasil.txt"
java -jar reportgen.jar "LinkedDataProjectOntology.owl" "ldpo:project_qualisbrasil" > reportQualisBrasil.txt

echo "Generating report for the project ldpo:project_qualisbrasil. The output file is reportLimes.txt"
java -jar reportgen.jar "LinkedDataProjectOntology.owl" "ldpo:project_limes_workflowExample" > reportLimes.txt

echo "Generating report for the project ldpo:project_itmolod. The output file is reportItmo.txt"
java -jar reportgen.jar "LinkedDataProjectOntology.owl" "ldpo:project_itmolod" > reportItmo.txt

