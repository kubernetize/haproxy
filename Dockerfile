FROM ghcr.io/kubernetize/alpine-service-base:3.21.2

LABEL org.opencontainers.image.authors="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    adduser -h /var/lib/haproxy -s /bin/false -D -H -u 18521 haproxy && \
    apk --no-cache add haproxy && \
    chown haproxy: /var/lib/haproxy

USER 18521

CMD ["/usr/sbin/haproxy", "-f", "/etc/haproxy/haproxy.cfg", "-p", "/tmp/haproxy.pid"]
