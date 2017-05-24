#Docker container for Skanda

FROM postgres:9.6

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV ALLOW_IP_RANGE '0.0.0.0/0'

COPY ./skanda_schema.sql /usr/src/app
COPY ./skanda_data.sql /usr/src/app

COPY ./deploy/scripts/insideWaitForPsql.sh /usr/src/app
RUN mkdir -p /docker-entrypoint-initdb.d
ADD ./deploy/scripts/loadData.sh /docker-entrypoint-initdb.d
