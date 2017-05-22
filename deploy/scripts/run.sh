#!/bin/bash
#try to stop the service if it is running:
if hash systemctl 2>/dev/null; then
	#only run the stop system command if systemctl exists.
	#need to stop the service otherwise systemd will restart the
	#container when we kill it down below
	sudo systemctl stop docker-skanda.service
fi
sudo docker kill skanda-schema
sudo docker rm skanda-schema
sudo docker run -d -p 25432:5432 -t --name "skanda-schema" \
	--env-file ../env.list \
	housing_survey/skanda-image

sudo docker exec skanda-schema /bin/sh -c "/usr/src/app/insideWaitForPsql.sh"
