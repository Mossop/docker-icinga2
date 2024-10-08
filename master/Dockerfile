FROM alpine:3.20
ARG S6_OVERLAY_VERSION=3.2.0.0
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp

RUN \
  tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
  tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz && \
  rm /tmp/*.tar.xz && \
  apk add \
    bash \
    nginx \
    php83-fpm \
    php83-pdo \
    php83-pdo_pgsql \
    php83-pgsql \
    icinga2 \
    icingaweb2 \
    monitoring-plugins \
    shadow \
    postgresql15-client && \
  mkdir -p /icinga/config /icinga/data /defaults/config /defaults/data && \
  mv /etc/icinga2 /defaults/config && \
  mv /var/lib/icinga2 /defaults/data && \
  rm -rf /etc/icingaweb2 /var/lib/icingaweb2 /defaults/data/icinga2/certs && \
  usermod -a -G icingaweb2 nobody

COPY rootfs /
COPY master/rootfs /

ENV POSTGRES_HOST="postgres"
ENV POSTGRES_PORT="5432"

ENV ICINGA_DB="icinga"
ENV ICINGA_DB_USER="icinga"
ENV ICINGA_DB_PASS="icinga"

ENV ICINGAWEB_DB="icinga-web"
ENV ICINGAWEB_DB_USER="icinga"
ENV ICINGAWEB_DB_PASS="icinga"

ENV ADMIN_USER="admin"
ENV ADMIN_PASS="admin"

EXPOSE 80/tcp
EXPOSE 5665/tcp

ENTRYPOINT ["/init"]
