# OpenSIPS SBC - Community Edition - Development

This document contains information about development of the platform.

## Structure

This repository contains the following directory structure:

* [**docs/**](/docs/): contains documentation files
* [**etc/**](/etc/):
    * [**opensips/**](/etc/opensips/): subproject for OpenSIPS configuration files; contains [opensips.cfg](/etc/opensips/opensips.cfg) and other configuration files
    * [**opensips-cp/**](/etc/opensips-cp/):
        * [**docker-entrypoint.d/**](/etc/opensips-cp/docker-entrypoint.d/): scripts executed at container startup to configure the CP modules:
            * [**00_config_db.sh**](/etc/opensips-cp/docker-entrypoint.d/00_config_db.sh): configures the database connection
            * [**10_config_drouting.sh**](/etc/opensips-cp/docker-entrypoint.d/10_config_drouting.sh): configures the Dynamic Routing module
            * [**21_config_dialplan_dispatcher.sh**](/etc/opensips-cp/docker-entrypoint.d/21_config_dialplan_dispatcher.sh): configures the SIP Mappings module
            * [**22_config_dialplan_dispatcher_did.sh**](/etc/opensips-cp/docker-entrypoint.d/22_config_dialplan_dispatcher_did.sh): configures the DID Mappings module
            * [**dialplan_dispatcher/**](/etc/opensips-cp/docker-entrypoint.d/dialplan_dispatcher/): PHP configuration files for the SIP Mappings CP tool
            * [**dialplan_dispatcher_did/**](/etc/opensips-cp/docker-entrypoint.d/dialplan_dispatcher_did/): PHP configuration files for the DID Mappings CP tool
        * [**image/**](/etc/opensips-cp/image/): [modules.inc.php](/etc/opensips-cp/image/modules.inc.php) — enables/disables modules in the OpenSIPS Control Panel
    * [**mysql/**](/etc/mysql/): scripts to initialize the MySQL database schema
* [**tests/**](/tests/): contains a suite of tests for the platform to be run with SIPssert framework
* [**docker-compose.yml**](/docker-compose.yml): main file that defines services, networks and volumes for the platform
* [**.env**](/.env): environment file that contains configuration for the platform
* [**run-sipssert.sh**](/run-sipssert.sh): script that runs the SIPssert tests (in a Docker container, no need to install SIPssert locally)