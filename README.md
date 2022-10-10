# kubernetize/haproxy

Simple rootless haproxy from Alpine. Mount haproxy.cfg to /etc/haproxy/haproxy.cfg and then start with:

```sh
$ docker run -it --rm --cap-add CAP_NET_BIND_SERVICE --cap-add CAP_SYS_CHROOT ghcr.io/kubernetize/haproxy
```
