#!/bin/bash
set -e 

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" < /usr/src/app/skanda_schema.sql;
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" housing_survey < /usr/src/app/skanda_data.sql

