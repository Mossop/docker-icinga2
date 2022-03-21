FROM alpine
ARG S6_OVERLAY_VERSION=3.0.0.2-2
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch-${S6_OVERLAY_VERSION}.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64-${S6_OVERLAY_VERSION}.tar.xz /tmp

RUN \
  tar -C / -Jxpf /tmp/s6-overlay-noarch-${S6_OVERLAY_VERSION}.tar.xz && \
  tar -C / -Jxpf /tmp/s6-overlay-x86_64-${S6_OVERLAY_VERSION}.tar.xz && \
  rm /tmp/*.tar.xz && \
  apk add \
    bash \
    icinga2 && \
  mkdir -p /icinga/config /icinga/data /defaults/config /defaults/data && \
  mv /etc/icinga2 /defaults/config && \
  mv /var/lib/icinga2 /defaults/data && \
  rm -rf /defaults/config/icinga2/certs

COPY rootfs /

ENTRYPOINT ["/init"]