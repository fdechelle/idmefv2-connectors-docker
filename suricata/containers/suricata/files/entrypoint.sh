#! /bin/sh

set -e

# install IDMEFv2 connectors
cd /idmefv2-connectors
pip install --break-system-packages .

python3 -m idmefv2.connectors.suricata -c /etc/suricata-idmefv2.conf &

# Allow python server to start
sleep 3

exec /usr/bin/suricata $@
