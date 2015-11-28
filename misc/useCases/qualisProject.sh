#!/bin/bash
rm -rf cache/*
rm -rf /tmp/*
rm -f Qualis/temp/*
rm -f Qualis/temp/nt/*

mkdir -p Qualis/temp/nt
mkdir -p Qualis/temp/csv

java -jar tools/lodflowEngine.jar "ontology/ldwpoESWC.owl" "ldwpo:project_QualisBrasil" "ldwpo:ldWorkflowExecution_maintaining_qualisBrasil_2014" > Qualis/temp/running_QualisBrasil.html


