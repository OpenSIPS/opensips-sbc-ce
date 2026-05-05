# OpenSIPS SBC - Community Edition - Components

The platform is composed of the following containers:

- **mysql**: MySQL database server; used to store OpenSIPS data;
    - *ports*: **3306** (configurable via `MYSQL_PORT` in [.env](/.env))
    - only listens on `127.0.0.1` and `HOST_IP`, so it is accessible from the host and from other machines on the same local network; use `MYSQL_USER`, `MYSQL_PASSWORD` and `MYSQL_DATABASE` from [.env](/.env) to connect

- **opensips**: OpenSIPS SIP server; handles all SIP signaling — registration, call routing, topology hiding, NAT traversal, dialplan translation, and PSTN routing
    - *ports*: **57306** (UDP and TLS, configurable via `OPENSIPS_PORT` in [.env](/.env)), **8888** (Management Interface)
    - listens on `OPENSIPS_IP`, which should be set to the host's public IP address if available, or the private IP for local deployments
    - port **8888** (Management Interface) is bound to `HOST_IP`, so it is accessible only from the host or from other machines on the same local network (e.g. using `opensips-cli`)

- **opensips-cp**: OpenSIPS Control Panel; web interface for managing the SBC
    - *ports*: **80** (listens on all interfaces)
    - accessible at `http://localhost/cp` with default credentials `admin:opensips`

- **rtpengine**: RTP media relay; anchors RTP streams, handles media NAT traversal and SDP rewriting
    - *ports*: **12222** (control port, bound to `RTPENGINE_IP` — private interface), **30000**-**30100** (RTP media ports, bound to `RTPENGINE_PUBLIC_IP` — public interface; configurable via `MINPORT`/`MAXPORT`)