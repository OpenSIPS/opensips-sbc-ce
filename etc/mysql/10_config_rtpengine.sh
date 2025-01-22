#!/bin/bash

echo "Configuring OpenSIPS CP RTPEngine Tool ..."

mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} -e \
	"INSERT INTO rtpengine (socket, set_id)
	 SELECT 'udp:${RTPENGINE_IP}:${RTPENGINE_PORT}', 0
		 WHERE NOT EXISTS (
		 SELECT 1 FROM rtpengine WHERE socket = 'udp:${RTPENGINE_IP}:${RTPENGINE_PORT}');"

