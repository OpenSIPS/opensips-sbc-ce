mysql opensips -e "DELETE FROM dispatcher WHERE destination = '$1';"
mysql opensips -e "DELETE FROM dialplan_sip WHERE match_exp = '$2';"
