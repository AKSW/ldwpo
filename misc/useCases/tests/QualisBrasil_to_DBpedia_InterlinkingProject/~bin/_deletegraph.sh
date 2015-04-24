#!/bin/bash

echo "SPARQL CLEAR GRAPH <$1>;" | isql-vt -S 1111 -U dba -P Desk1top
