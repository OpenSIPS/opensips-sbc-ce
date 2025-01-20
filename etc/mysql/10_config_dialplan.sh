#!/bin/bash

echo "Configuring OpenSIPS CP Dialplan Tool ..."

add_dp_rule() {
	local attr="$1"
	local regex="$2"
	local subst="$3"
	local repl="$4"

	[ -n "$subst" ] && subst="'$subst'" || subst=NULL
	[ -n "$repl" ] && repl="'$repl'" || repl=NULL

	mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D"${MYSQL_DATABASE}" -e \
		"INSERT INTO dialplan (dpid, match_op, match_exp, subst_exp, repl_exp, attrs)
		 SELECT 1, 1, '${regex}', ${subst}, ${repl}, '${attr}'
			 WHERE NOT EXISTS (
			 SELECT 1 FROM dialplan WHERE dpid = 1 AND attrs = '${attr}');"
}

add_dp_rule DP_DID '^(\\+|00|011)?[1-9][0-9]{6,}$' '^(\\+|00|011)?([1-9][0-9]{6,})$' '\\2'
add_dp_rule DP_USER '^[a-zA-Z][a-zA-Z0-9\\-_\\.]{4,}$'
add_dp_rule DP_DND_ON '^\\*78$'
add_dp_rule DP_DND_OFF '^\\*79$'
add_dp_rule DP_VMLISTEN '^\\*98$'
