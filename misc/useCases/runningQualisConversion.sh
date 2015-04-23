#!/bin/bash

#running for year 2005
# First, we need to upload the a sql file to create the legacy database for year 2005
# Thereafter, run the command line for executing the workflow automatically.

mysql -uqualisproject -pqualisproject < tests/QualisBrasilProject/backupDatabase/2005/QualisProject2005.sql 
java -jar tools/ldStackWorkflow.jar "ontology/ldwpo.owl" "ldwpo:project_QualisBrasil" "ldwpo:ldWorkflow_execution_maintain_qualisbrasil_20150125" > reports/reportQualisConversion2005.html

echo "a report is generated in reports/reportQualisConversion2005.html"

#running for year 2006
# First, we need to upload the a sql file to create the legacy database for year 2006
# Thereafter, run the command line for executing the workflow automatically.

mysql -uqualisproject -pqualisproject < tests/QualisBrasilProject/backupDatabase/2006/QualisProject2006.sql 
java -jar tools/ldStackWorkflow.jar "ontology/ldwpo.owl" "ldwpo:project_QualisBrasil" "ldwpo:ldWorkflow_execution_maintain_qualisbrasil_20150125" > reports/reportQualisConversion2006.html

echo "a report is generated in reports/reportQualisConversion2006.html"

