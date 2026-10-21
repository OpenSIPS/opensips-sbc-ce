#!/bin/bash

cd "$(dirname "$0")"
. functions

echo "Configuring OpenSIPS-CP database connection..."

set_db_config() {
    # escape the sed delimiter and the metacharacters of the replacement
    value=$(printf '%s' "$2" | sed 's/[|&\\]/\\&/g')

    sed -i "s|\$config->db_$1 = \".*\";|\$config->db_$1 = \"${value}\";|" \
        /var/www/html/opensips-cp/config/db.inc.php
}

set_db_config host "${MYSQL_IP}"
set_db_config port "${MYSQL_PORT}"
set_db_config user "${MYSQL_USER}"
set_db_config pass "${MYSQL_PASSWORD}"
set_db_config name "${MYSQL_DATABASE}"

sed -i "s/127.0.0.1/${HOST_IP}/g" /var/www/html/opensips-cp/config/db_schema.mysql

add_table /var/www/html/opensips-cp/config/db_schema.mysql
