# OpenSIPS SBC - Community Edition

[![Run SIPSsert tests](https://github.com/OpenSIPS/opensips-sbc-ce/actions/workflows/sipssert.yml/badge.svg)](https://github.com/OpenSIPS/opensips-sbc-ce/actions/workflows/sipssert.yml)

This project contains a fully functional OpenSIPS setup used as a Session Border Controller
that provides the following features:

* SIP Proxy with **support for UDP and TLS**
* **topology hiding** for all calls
* **dialplans** for SIP user and DID formats
* **NAT traversal** with automatic detection and contact fixing
* **RTPEngine** for media relay
* **mid-registrar** to throttle and manage endpoint registrations towards the core server and to resolve contacts when routing calls to users
* **primary/failover routing** across core servers with automatic failover
* **PSTN routing** via dynamic routing with gateways and rules
* **dialog management** with database-persistent session state
* **SIP digest authentication** for registered endpoints
* **source-based access control** via blacklist filtering
* **OPTIONS keepalive** for endpoint health monitoring
* **call statistics** tracking for inbound and outbound calls
* **HTTP and FIFO management interfaces**

## Getting Started

The simplest way to get the project running is to setup [Docker](https://www.docker.com/) on your host and then run:

``` shell
git clone --recursive https://github.com/OpenSIPS/opensips-sbc-ce.git
cd opensips-sbc-ce

# configure your IP addresses in .env before launching the containers
PRIVATE_IP=10.0.0.23; sed -i 's/#HOST_PRIVATE_IP/'$PRIVATE_IP'/g' .env
PUBLIC_IP=1.2.3.4; sed -i 's/#HOST_PUBLIC_IP/'$PUBLIC_IP'/g' .env
# for local deployments without a public IP, use the private IP for both

docker compose up
```

For more information about setup, please check the [Setup
page](docs/setup.md).

Once everything is initialized, you should be able to access the OpenSIPS
Control Panel using the following credentials:

* URL: [http://localhost/cp](http://localhost/cp)
* User: `admin`
* Password: `opensips`

For more information about provisioning, please check the [Provisioning
page](docs/provisioning.md).


At this point you can follow the [Getting Started](docs/getting-started.md)
tutorial to test the OpenSIPS SBC Community Edition.

## Testing

OpenSIPS SBC comes with a set of tests that you can run once the setup
is complete:
``` shell
./run-sipssert.sh
```

For more information, please check the [Testing page](docs/testing.md).

## OpenSIPS

OpenSIPS configuration is developed in a separate git repository that can be
found [here](https://github.com/OpenSIPS/opensips-sbc-ce-config.git).

## Documentation

Documentation pages contain the following topics:

* [Setup](docs/setup.md) - contains information about how to install and setup
* [Getting Started](docs/getting-started.md) - show how you can use the
SBC to test certain scenarios
* [Components](docs/components.md) - list of components used in the project
* [Provisioning](docs/provisioning.md) - useful information about provisioning
the platform
* [Testing](docs/testing.md) - information about testing the platform
* [Devel](docs/devel.md) - information about development


## Contribute

This project is Community driven, therefore any contribution is welcome. Feel
free to open a pull request for any fix/feature you find useful.

## License

<!-- License source -->
[License-GPLv3]: https://www.gnu.org/licenses/gpl-3.0.en.html "GNU GPLv3"
[Logo-CC_BY]: https://i.creativecommons.org/l/by/4.0/88x31.png "Creative Common Logo"
[License-CC_BY]: https://creativecommons.org/licenses/by/4.0/legalcode "Creative Common License"

The `OpenSIPS SBC Community Edition` source code is licensed under the [GNU General Public License v3.0][License-GPLv3]

All documentation files (i.e. `.md` extension) are licensed under the [Creative Common License 4.0][License-CC_BY]

![Creative Common Logo][Logo-CC_BY]

© 2026 - SIP Point Consulting SRL