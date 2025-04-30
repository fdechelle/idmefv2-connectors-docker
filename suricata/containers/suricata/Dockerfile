FROM ubuntu:noble

# install git and python
RUN apt-get update -qq; apt-get install -y git python3 python3-pip ; apt-get clean

# install IDMEFv2 python library
RUN pip install --break-system-packages --extra-index-url https://test.pypi.org/simple/ idmefv2

# suricata install and configure
RUN apt-get update -qq; apt-get install -y software-properties-common ; apt-get clean
RUN add-apt-repository ppa:oisf/suricata-stable
RUN apt-get update -qq ; apt-get install -y suricata ; apt-get clean
RUN suricata-update

# extra utils
RUN apt-get update -qq; apt-get install -y curl ; apt-get clean

COPY --chown=suricata:suricata ./files/suricata.yaml /etc/suricata

ARG SURICATA_CONNECTOR_CONFIG_FILE=./files/suricata-idmefv2.conf
COPY ${SURICATA_CONNECTOR_CONFIG_FILE} /etc/suricata-idmefv2.conf

COPY --chmod=0755 ./files/test-suricata-connector.sh /

COPY --chmod=0755 ./files/entrypoint.sh /
CMD [ "/entrypoint.sh" ]
