# OpenSIPS SBC - Community Edition - Testing

OpenSIPS SBC comes with a set of tests to validate the correctness of
the platform.

## Testing

The following tests suite is available:
* [01.simple_call](/tests/01.simple_call/): verifies that a *caller* can successfully call a *callee*, both registered with a core server
* [02.failover](/tests/02.failover/): verifies that when the primary core server is unavailable, traffic fails over to the secondary core server
* [03.inbound_call_1](/tests/03.inbound_call_1/): verifies that an inbound call from a PSTN gateway is routed to the correct *callee* using a DID mapping (no user replacement)
* [03.inbound_call_2](/tests/03.inbound_call_2/): same as above, but the DID mapping replaces the user part of the R-URI with *callee*'s username
* [03.inbound_call_3](/tests/03.inbound_call_3/): same as above, but the DID mapping replaces the user part with *callee*'s full SIP address (user@domain)
* [04.outbound_call](/tests/04.outbound_call/): verifies that a registered *caller* can make an outbound call to a PSTN gateway, with failover to a secondary gateway
* [05.invalid_header](/tests/05.invalid_header/): checks that a request with an invalid SIP header is rejected
* [05.invalid_ruri](/tests/05.invalid_ruri/): checks that a request with an invalid R-URI is rejected
* [05.invalid_sdp](/tests/05.invalid_sdp/): checks that a request with an invalid SDP body is rejected
* [06.test_x_header](/tests/06.test_x_header/): verifies that the `X-SRC-IP` header is correctly added by the SBC when routing a call

## Running the tests

The following command will start a Docker container that will run these SIPssert scenarios:
``` shell
./run-sipssert.sh

# or, if you want to run a specific test
./run-sipssert.sh tests/ -t 01.simple_call
```