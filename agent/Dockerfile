FROM alpine
ARG S6_OVERLAY_VERSION=3.1.5.0
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp

RUN \
  tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
  tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz && \
  rm /tmp/*.tar.xz && \
  apk add \
    bash \
    monitoring-plugins \
    icinga2 && \
  mkdir -p /icinga/config /icinga/data /defaults/config /defaults/data && \
  mv /etc/icinga2 /defaults/config && \
  mv /var/lib/icinga2 /defaults/data && \
  rm -rf /defaults/data/icinga2/certs

COPY rootfs /
COPY agent/rootfs /

EXPOSE 5665/tcp

ENTRYPOINT ["/init"]
