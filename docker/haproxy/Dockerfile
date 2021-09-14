FROM alpine:3.12

ENV haproxy_version=2.2.17-r1
RUN apk update && apk add --no-cache haproxy=${haproxy_version}
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
EXPOSE 80
ENTRYPOINT ["/usr/sbin/haproxy"]
CMD ["-W", "-db", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]


