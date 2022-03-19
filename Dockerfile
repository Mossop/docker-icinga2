FROM alpine
ARG S6_OVERLAY_VERSION=3.0.0.2-2
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch-${S6_OVERLAY_VERSION}.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64-${S6_OVERLAY_VERSION}.tar.xz /tmp

COPY defaults /defaults/
COPY bin /bin/

RUN \
  tar -C / -Jxpf /tmp/s6-overlay-noarch-${S6_OVERLAY_VERSION}.tar.xz && \
  tar -C / -Jxpf /tmp/s6-overlay-x86_64-${S6_OVERLAY_VERSION}.tar.xz && \
  rm /tmp/*.tar.xz && \
  apk add bash nginx php8-fpm icinga2 icingaweb2 patch shadow postgresql14-client && \
  mkdir /config /data && \
  mv /etc/icinga2 /defaults && \
  rm -rf /etc/icingaweb2 && \
  usermod -a -G icingaweb2 nobody

COPY etc /etc/

ENV POSTGRES_HOST="postgres"
ENV POSTGRES_PORT="5432"

ENV ICINGA_DB="icinga"
ENV ICINGA_DB_USER="icinga"
ENV ICINGA_DB_PASS="icinga"

ENV ICINGAWEB_DB="icingaweb"
ENV ICINGAWEB_DB_USER="icinga"
ENV ICINGAWEB_DB_PASS="icinga"

ENV ADMIN_USER="admin"
ENV ADMIN_PASS="admin"

ENTRYPOINT ["/init"]
