#!/bin/bash
mkdir -p /tmp/opensipsdb && envsubst "$(printf '${%s} ' $(env | cut -d'=' -f1))" < /etc/opensips/opensipsdb/subscriber.tmpl > /tmp/opensipsdb/subscriber
envsubst "$(printf '${%s} ' $(env | cut -d'=' -f1))" < /etc/opensips/opensipsdb/version.tmpl > /tmp/opensipsdb/version
envsubst "$(printf '${%s} ' $(env | cut -d'=' -f1))"
