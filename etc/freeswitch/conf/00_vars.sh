#!/bin/bash

eval "sed -E -i 's/external_sip_ip=[^\"]+/external_sip_ip=${FREESWITCH_IP}/' /etc/freeswitch/vars.xml"
eval "sed -E -i 's/external_rtp_ip=[^\"]+/external_rtp_ip=${FREESWITCH_IP}/' /etc/freeswitch/vars.xml"
