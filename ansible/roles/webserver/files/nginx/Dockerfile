FROM alpine:3.12

ENV nginx_version=1.18.0-r3

RUN apk update \
    && apk add --no-cache nginx=${nginx_version} \
    && mkdir -p /run/nginx \
    && touch /run/nginx/nginx.pid

COPy default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
