FROM alpine:3.12

ENV haproxy_version=2.2.16-r1

RUN apk update && \
    apk add --no-cache haproxy=${haproxy_version} \
    tar \
    wget \
    curl \
    ;

ADD haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
EXPOSE 80
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
