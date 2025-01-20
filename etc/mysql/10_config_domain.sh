#!/bin/bash

echo "Configuring OpenSIPS CP Domain Tool ..."

mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D"${MYSQL_DATABASE}" -e \
	"INSERT INTO domain (domain)
	 SELECT '${DEFAULT_DOMAIN}'
		 WHERE NOT EXISTS (
		 SELECT 1 FROM domain WHERE domain = '${DEFAULT_DOMAIN}');"
