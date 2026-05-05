# OpenSIPS SBC - Community Edition - Setup

## Prerequisites

To run this platform, you need to have [Docker](https://www.docker.com/) and [Docker
Compose](https://docs.docker.com/compose/) installed on your machine. Also, `git` is another requirement to clone the repository.

## Network

All containers run in **host networking mode**, sharing the host's network stack directly. This means each container binds to the host's interfaces and ports are accessible without any forwarding.

IP addresses are configured in the [.env](/.env) file and split into two categories:

- **Private IP** — the host interface used for local communication (`HOST_IP`, `MYSQL_IP`, `RTPENGINE_IP`); must be set to an interface address on the host machine.
- **Public IP** — the externally reachable IP for SIP signaling and media (`OPENSIPS_IP`, `RTPENGINE_PUBLIC_IP`).

For local deployments without a dedicated public IP, use the private IP for both.

## Configuration

The `.env` file exposes the following variables:

**Host**
- `HOST_IP`: *(required, private IP)* host interface IP; used by OpenSIPS, MySQL, and RTPEngine to bind locally

**OpenSIPS**
- `OPENSIPS_IP`: *(required, public IP)* public IP for SIP signaling
- `OPENSIPS_PORT`: SIP listening port; preset to `57306`

**MySQL**
- `MYSQL_IP`: *(required, private IP)* IP MySQL binds to
- `MYSQL_PORT`: MySQL listening port; preset to `3306`
- `MYSQL_ROOT_PASSWORD`: root password; preset to `root`
- `MYSQL_DATABASE`: database name; preset to `opensips`
- `MYSQL_USER`: database user; preset to `opensips`
- `MYSQL_PASSWORD`: database user password; preset to `opensipsrw`

**RTPEngine**
- `RTPENGINE_IP`: *(required, private IP)* IP RTPEngine binds to
- `RTPENGINE_PUBLIC_IP`: *(required, public IP)* public IP advertised in SDP
- `RTPENGINE_PORT`: RTPEngine control port; preset to `12222`
- `RTPENGINE_LOG_LEVEL`: log verbosity level; preset to `6`
- `MINPORT`: lower bound of the RTP port range; preset to `30000`
- `MAXPORT`: upper bound of the RTP port range; preset to `30100`

## Start Service

Once the configuration is finalized (i.e. editting the `.env` file), you can
start the service using:
``` shell
docker-compose up  # if you use the standalone Docker Compose

# use --build when you need to rebuild the images (e.g. after editing the modules.inc.php)
docker-compose up --build

# or
docker compose up --build  # if you use the Docker Compose plugin

# add -d to run in detached mode
docker-compose up --build -d
```