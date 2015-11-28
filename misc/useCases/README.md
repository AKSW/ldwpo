Running the toy experiments
====
* **Special note:** Due to security reasons, the toy experiments skip the step "retrieving raw data from legacy systems" as it is originally planned. However, raw data are available in csv files to be converted in ntriples and run the experiments.

* **Requirements:**
* on Ubuntu 12.04, install Sparqlify and Virtuoso Triple Store.
* copy all the content of this github into a folder.
* unzip the "Qualis\temp\csv\evaluations.7z" file into the folder (a 150 Mb csv file to convert to linked data).

* **options for running:**
** **periodicalPapersProject.sh**: runs the PeriodicalPapers LDWProject, converting a csv file to linked data, saving the data into a graph dubbed <http://lod.unicentro.br/LattesProduction/>. The graph will be hosted in localhost:8890/sparql.
** **qualisProject.sh**: runs the QualisBrasil LDWProject, converting a csv file to linked data, interlinking data to DBpedia resources and saving the data into a graph dubbed <http://lod.unicentro.br/QualisBrasil/>. The graph will be hosted in localhost:8890/sparql.
** **qualisProject.sh**: runs the QualisBrasil LDWProject, converting a csv file to linked data, interlinking data to DBpedia resources and saving the data into a graph dubbed <http://lod.unicentro.br/QualisBrasil/>. The graph will be hosted in localhost:8890/sparql.
** **periodicalPapersReport.sh**: generates the PeriodicalPapersReport into reports folder.
** **qualisReport.sh**: generates the QualisBrasilReport into reports folder.
