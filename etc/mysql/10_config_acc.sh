#!/bin/bash

echo "Configuring OpenSIPS acc table..."

cd "$(dirname "$0")"
. functions

add_column acc caller_ip
add_column acc caller_ua
add_column acc callee_ip
add_column acc callee_ua
add_column acc caller_id
add_column acc callee_id
add_column acc leg_status
