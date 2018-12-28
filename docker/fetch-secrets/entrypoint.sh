#!/bin/bash -eu

ENVIRONMENTS=$(vault list -format=json "projects/$PROJECT/environments" | jq -r 'join(",")')

for ENVIRONMENT in ${ENVIRONMENTS//,/ }
do
  mkdir -p "/environments/${ENVIRONMENT}"
  gomplate -f "/work/secrets.tmpl.env" \
    -d secrets="vault:///projects/$PROJECT/environments/$ENVIRONMENT" \
    -o "/environments/${ENVIRONMENT}/secrets.env"
done
