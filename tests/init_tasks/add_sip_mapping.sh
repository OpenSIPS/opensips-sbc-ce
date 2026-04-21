mysql opensips -e "REPLACE INTO dialplan_sip (dpid, match_op, match_exp, repl_exp) VALUES (1, 1, '$1', 0);"
