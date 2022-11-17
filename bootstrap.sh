#!/usr/bin/env bash

set -e -o pipefail

cat fhirdb.properties
db.host=postgres_postgres_1
db.port=5432
db.database=fhirdb
user=fhirserver
password=Passw0rd!

java -jar ./fhir-persistence-schema-4.11.1-cli.jar \
  --db-type postgresql \
  --prop-file fhirdb.properties \
  --schema-name fhirdata \
  --create-schemas

java -jar fhir-persistence-schema-4.11.1-cli.jar \
--db-type postgresql \
--prop-file fhirdb.properties \
--schema-name fhirdata \
--update-schema \
--grant-to fhirserver \
--pool-size 1
