FROM debian:jessie

ENV GRAFANA_VERSION=3.1.0-1468321182

WORKDIR /
COPY dist/grafana-4.0.0-pre1.linux-x64.tar.gz /grafana-4.0.0-pre1.linux-x64.tar.gz
RUN tar -xzvf /grafana-4.0.0-pre1.linux-x64.tar.gz
ADD grafana.ini /grafana-4.0.0-pre1/conf/grafana.ini

VOLUME ["/var/lib/grafana", "/var/lib/grafana/plugins", "/var/log/grafana"]

EXPOSE 3000

COPY ./run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
