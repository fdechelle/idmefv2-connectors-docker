#!/bin/bash

# install IDMEFv2 connectors
cd /idmefv2-connectors
pip install --break-system-packages .

# debug the Wazuh IDMEFv2 connector
pip install --break-system-packages debugpy
python3 -m debugpy -Xfrozen_modules=off --listen 0.0.0.0:5678 --wait-for-client -m idmefv2.connectors.wazuh -c /etc/wazuh-idmefv2.conf