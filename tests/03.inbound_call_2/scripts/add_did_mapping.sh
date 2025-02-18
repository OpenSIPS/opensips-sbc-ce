mysql opensips -e "REPLACE INTO dialplan_did (dpid, match_op, match_exp, subst_exp, repl_exp, attrs) VALUES (1, 1, '$1', '(.*)', '$2', '0');"
