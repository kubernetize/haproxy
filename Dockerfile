FROM alpine:3.15.3

LABEL org.opencontainers.image.authors "Richard Kojedzinszky <richard@kojedz.in>"
LABEL org.opencontainers.image.source https://github.com/kubernetize/haproxy

RUN \
    adduser -h /var/lib/haproxy -s /bin/false -D -H -u 18521 haproxy && \
    apk --no-cache add haproxy libcap && \
    setcap cap_net_bind_service,cap_sys_chroot+ep /usr/sbin/haproxy && \
    apk --no-cache del libcap && \
    chown haproxy: /var/lib/haproxy

USER 18521

CMD ["/usr/sbin/haproxy", "-f", "/etc/haproxy/haproxy.cfg", "-p", "/tmp/haproxy.pid"]
