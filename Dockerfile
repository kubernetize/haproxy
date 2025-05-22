FROM ghcr.io/kubernetize/alpine-service-base

LABEL org.opencontainers.image.authors="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    adduser -h /var/lib/haproxy -s /bin/false -D -H -u 18521 haproxy && \
    apk --no-cache add haproxy && \
    sed -i -r -e '/(chroot|pidfile|user|group|daemon)/s/^/#/' /etc/haproxy/haproxy.cfg && \
    chown haproxy: /var/lib/haproxy

USER 18521

CMD ["/usr/sbin/haproxy", "-f", "/etc/haproxy/haproxy.cfg", "-p", "/tmp/haproxy.pid"]
