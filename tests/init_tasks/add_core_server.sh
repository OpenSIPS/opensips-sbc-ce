mysql opensips -e "REPLACE INTO dispatcher (destination) VALUES ('$1');"
mysql opensips -e "REPLACE INTO dialplan_sip (dpid, match_op, match_exp, repl_exp) VALUES (1, 1, '$2', 0);"
