FROM alpine:3.12

ENV haproxy_version=2.2.17-r1
RUN apk update && apk add --no-cache haproxy=${haproxy_version} 

ADD haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY docker-entrypoint.sh /

EXPOSE 80
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
