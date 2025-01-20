#!/bin/bash

echo "Configuring OpenSIPS subscriber table..."

cd "$(dirname "$0")"
. functions

add_column subscriber cli
add_column subscriber acls 'varchar(32) DEFAULT "" NOT NULL'
add_column subscriber cfaw_uri
add_column subscriber cfbs_uri
add_column subscriber cfna_uri
add_column subscriber cfnf_uri
