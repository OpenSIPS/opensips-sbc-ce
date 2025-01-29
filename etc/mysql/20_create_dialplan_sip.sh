#!/bin/bash

echo "Configuring Dialplan SIP Table ..."

TABLE_EXISTS=$(mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D"${MYSQL_DATABASE}" -e \
    "SELECT 1 FROM information_schema.tables WHERE table_schema = '${MYSQL_DATABASE}' AND table_name = 'dialplan_sip';")

if [ -n "$TABLE_EXISTS" ]; then
    echo "Table dialplan_sip already exists"
else
    echo "Creating dialplan_sip table"

    TABLE_VERSION=$(mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D"${MYSQL_DATABASE}" -se \
        "SELECT table_version FROM version WHERE table_name = 'dialplan';")

    mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D"${MYSQL_DATABASE}" -e \
        "INSERT INTO version (table_name, table_version) values ('dialplan_sip', '${TABLE_VERSION}');"

    mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D"${MYSQL_DATABASE}" -e \
        "CREATE TABLE dialplan_sip LIKE dialplan;"
fi
