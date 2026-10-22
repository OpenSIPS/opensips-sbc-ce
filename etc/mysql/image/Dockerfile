# Oracle Linux 9's glibc requires x86-64-v2, which virtual machines running on
# a generic CPU model do not provide - the Debian variant builds on the baseline
FROM mysql:8.0-debian

# get the latest/newest opensips-mysql-dbschema package
RUN apt-get -y update -qq &&\
    apt-get -y install --no-install-recommends ca-certificates curl &&\
    curl -fsSL https://apt.opensips.org/opensips-org.gpg -o /usr/share/keyrings/opensips-org.gpg &&\
    echo "deb [signed-by=/usr/share/keyrings/opensips-org.gpg] https://apt.opensips.org bookworm 3.6-nightly" > /etc/apt/sources.list.d/opensips.list &&\
    apt-get -y update -qq &&\
    apt-get -y install --no-install-recommends opensips-mysql-dbschema &&\
    apt-get -y purge curl && apt-get -y autoremove &&\
    rm -rf /var/lib/apt/lists/*
