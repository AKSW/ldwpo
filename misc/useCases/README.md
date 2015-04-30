Instructions for running toy experiments
===

There are three possible toy experiments to run LDWPO:  
* **runningQualisBrasilProjectReports.sh** - create some documents in reports folder;
* **runningQualisConversion.sh** - extract data from legacy system and upload as linked data, using Sparqlify; and
* **runningQualisInterlinking.sh** - interlink data to DBpeda, using LIMES.

To run those experiments, the environment should be setup:
* install LIMES, Sparqlify, Virtuoso TripleStore, MySql Server following the instructions; 
* change user and password for virtuoso TripleStore= "dba" and "dba";
* change user, database, and password for Mysql Server = "qualisproject", "qualisproject", "qualisproject";

