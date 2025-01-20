#!/bin/bash

echo "Installing OpenSIPS database schema..."

cd "$(dirname "$0")"
. functions

TABLE_FILES=(
    "acc-create.sql"
    "alias_db-create.sql"
    "auth_db-create.sql"
    "dialog-create.sql"
    "dialplan-create.sql"
    "dispatcher-create.sql"
    "domain-create.sql"
    "drouting-create.sql"
    "presence-create.sql"
    "rtpproxy-create.sql"
    "sqlops-create.sql"
    "usrloc-create.sql"
)

add_table /usr/share/opensips/mysql/standard-create.sql

for file in "${TABLE_FILES[@]}"; do
    add_table /usr/share/opensips/mysql/$file
done
