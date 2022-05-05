#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "fhirserver" --dbname "fhirdb" <<-EOSQL
    GRANT ALL PRIVILEGES ON DATABASE fhirdb TO fhirserver;    
EOSQL
#CREATE SCHEMA fhirdata AUTHORIZATION fhirserver;
