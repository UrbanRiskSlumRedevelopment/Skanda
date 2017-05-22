FROM kartoza/postgis:9.5-2.2

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV ALLOW_IP_RANGE '0.0.0.0/0'

COPY ./skanda_schema.sql /usr/src/app
COPY ./skanda_data.sql /usr/src/app

COPY ./deploy/scripts/insideWaitForPsql.sh /usr/src/app
