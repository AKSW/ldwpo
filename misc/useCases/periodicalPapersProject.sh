#!/bin/bash
rm -rf cache/*
rm -rf /tmp/*
java -jar tools/lodflowEngine.jar "ontology/ldwpoESWC.owl" "ldwpo:project_PeriodicalPapers" "ldwpo:ldWorkflowExecution_maintaining_periodicalPapers_2014" > PeriodicalPapers/temp/runningPeriodicalPapers.html


