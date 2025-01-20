#!/bin/bash

echo "Configuring DIDs Table ..."

TABLE_EXISTS=$(mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D"${MYSQL_DATABASE}" -e \
    "SELECT 1 FROM information_schema.tables WHERE table_schema = '${MYSQL_DATABASE}' AND table_name = 'dids';")

if [ -n "$TABLE_EXISTS" ]; then
    echo "Table dids already exists"
else
    echo "Creating dids table"
    mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D"${MYSQL_DATABASE}" -e \
        "INSERT INTO version (table_name, table_version) values ('dids','1');"
    
    mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D"${MYSQL_DATABASE}" -e \
        "CREATE TABLE dids (
             id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
             alias_username CHAR(64) DEFAULT '' NOT NULL,
             alias_domain CHAR(64) DEFAULT '' NOT NULL,
             username CHAR(64) DEFAULT '' NOT NULL,
             domain CHAR(64) DEFAULT '' NOT NULL,
             CONSTRAINT alias_idx UNIQUE (alias_username, alias_domain)
         ) ENGINE=InnoDB;"

    mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D"${MYSQL_DATABASE}" -e \
        "CREATE INDEX target_idx ON dids (username, domain);"
fi
