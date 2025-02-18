#!/bin/bash

cd "$(dirname "$0")"
. functions

echo "Configuring OpenSIPS CP DID Mappings Tool..."

mkdir -p /var/www/html/opensips-cp/config/tools/system/dialplan_dispatcher_did
mkdir -p /var/www/html/opensips-cp/web/tools/system/dialplan_dispatcher_did

cp /var/www/html/opensips-cp/web/common/tools/tviewer/samples/index.php /var/www/html/opensips-cp/web/tools/system/dialplan_dispatcher_did/index.php
sed -i 's/$branch = "your_branch";/$branch = "system";/' /var/www/html/opensips-cp/web/tools/system/dialplan_dispatcher_did/index.php
sed -i 's/$module_id = "your_module";/$module_id = "dialplan_dispatcher_did";/' /var/www/html/opensips-cp/web/tools/system/dialplan_dispatcher_did/index.php

cp /var/www/html/opensips-cp/web/common/tools/tviewer/samples/db.inc.php /var/www/html/opensips-cp/config/tools/system/dialplan_dispatcher_did/db.inc.php
sed -i 's/$module_id = "your_module";/$module_id = "dialplan_dispatcher_did";/' /var/www/html/opensips-cp/config/tools/system/dialplan_dispatcher_did/db.inc.php

cp /var/www/html/opensips-cp/web/common/tools/tviewer/samples/settings.inc.php /var/www/html/opensips-cp/config/tools/system/dialplan_dispatcher_did/settings.inc.php
sed -i 's/$config->your_module/$config->dialplan_dispatcher_did/' /var/www/html/opensips-cp/config/tools/system/dialplan_dispatcher_did/settings.inc.php

cp -u dialplan_dispatcher_did/tviewer.inc.php /var/www/html/opensips-cp/config/tools/system/dialplan_dispatcher_did/tviewer.inc.php
