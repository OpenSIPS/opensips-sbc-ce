FROM ghcr.io/opensips/opensips-cp:9.3.6

# MariaDB's client verifies the server certificate since 11.4, but MySQL only
# auto-generates a self-signed one - keep the connection encrypted, unverified
RUN printf '[client]\nssl-verify-server-cert=0\n' > /etc/mysql/conf.d/ssl.cnf
