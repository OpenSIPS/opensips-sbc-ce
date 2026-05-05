# OpenSIPS SBC - Community Edition - Getting Started

Once the setup of the platform is completely done, you can follow this
guide that shows you how you can get the platform provisioned.

All operations described in this guide are performed through the **OpenSIPS Control Panel** web interface. You can access it at [http://localhost/cp](http://localhost/cp) using the following credentials:
* username: `admin`
* password: `opensips`

## Core Servers

Core servers are the internal SIP platforms that the SBC routes traffic to and from. The SBC always routes traffic to the first active core server in the set, probes each one with OPTIONS requests every 30 seconds, and automatically fails over to the next available server if one stops responding.

From the left panel, go to `System` -> `Core Servers` to add, edit, or remove core server destinations. Changes take effect after clicking `Reload`.

## SIP Mappings

SIP Mappings define which core server set handles traffic for a given SIP domain. From the left panel, go to `System` -> `SIP Mappings` to add, edit, or remove mappings.

## DID Mappings

DID Mappings define how inbound DIDs from PSTN are routed to a core server set, with optional rewriting of the request URI user part. From the left panel, go to `System` -> `DID Mappings` to manage rules.

Each rule has the following fields:
- **Dialled Number** — regex pattern matched against the inbound DID
- **Substitution Expression** — regex that captures the part(s) of the DID to be replaced (e.g. `(.*)` to capture the entire number)
- **Replacement Expression** — the value to substitute in, in `number[@domain]` format; if the domain is omitted, the destination domain is preserved
- **Core Servers Group** — the core server set to route the call to once matched

## PSTN Routing

PSTN routing is managed via Dynamic Routing. From the left panel, go to `System` -> `Dynamic Routing`. There are three tabs:
* **Gateways** — manage PSTN gateways; gateways must be defined here for both inbound and outbound PSTN traffic
* **Carriers** — group gateways into carriers
* **Rules** — define routing rules that map destination prefixes to gateway lists (outbound)

## RTPEngine

Active RTPEngine instances can be inspected and managed from `System` -> `RTPEngine`.

## Monitoring

* `System` -> `Dialog` — view currently active calls
* `System` -> `Statistics Monitor` — track inbound/outbound call counters and other statistics
* `System` -> `Status Report` — view the overall health status of the OpenSIPS instance
* `System` -> `MI Commands` — run management interface commands directly