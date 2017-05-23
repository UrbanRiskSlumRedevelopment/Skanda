#!/bin/bash

#wait until postgres is up
while ! nc -z localhost 5432; do sleep 3; done

createdb -h localhost -U skanda -p 5432 -T template0 housing_survey
psql -h localhost -U skanda -p 5432 housing_survey < ./skanda_schema.sql && \
      psql -h localhost -U skanda -p 5432 housing_survey < ./skanda_data.sql
