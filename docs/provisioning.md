# OpenSIPS SBC - Community Edition - Provisioning

The SBC can be provisioned through different interfaces

## OpenSIPS Control Panel

The simplest way to provision the SBC is through the OpenSIPS Control Panel. You can access it at [http://localhost/cp](http://localhost/cp) using the following credentials:
* username: `admin`
* password: `opensips`

Here you can manage: **SIP mappings**, **DID mappings**, **core servers**, **PSTN gateways/carriers/rules**.
You can also send **MI commands** to OpenSIPS or view **active dialogs**, **statistics**, and **status reports**.

## OpenSIPS CLI

You can run CLI commands by running the following command to execute `opensips-cli` in the OpenSIPS container:
```shell
docker exec -it opensips opensips-cli  # to enter in interactive mode
Welcome to OpenSIPS Command Line Interface!
(opensips-cli):

# or run a single command, for example:
docker exec -it opensips opensips-cli -x mi reload_routes
```

## OpenSIPS MI

The simplest way to send MI commands is using the `opensips-mi` tool, available inside the OpenSIPS container:
```shell
docker exec -it opensips opensips-mi <command>

# for example:
docker exec -it opensips opensips-mi dp_reload did_map
```

## MySQL

You can also provision the SBC by directly accessing the MySQL database.

```shell
# using a Docker exec command to access the MySQL container
docker exec -it mysql mysql -uopensips -popensipsrw -D opensips

# or use the IP address and port
mysql -h $MYSQL_IP --port=$MYSQL_PORT -uopensips -popensipsrw -D opensips
```