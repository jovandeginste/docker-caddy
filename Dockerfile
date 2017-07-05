FROM alpine
MAINTAINER Jo Vandeginste <jo.vandeginste@gmail.com>
EXPOSE 80 443
VOLUME /var/log/caddy

ADD etc/ /etc/caddy
ADD html /var/www/html
ENV HOME=/etc/caddy CADDYPATH=/etc/caddy
WORKDIR /var/log/caddy

RUN apk update && apk add ca-certificates wget && update-ca-certificates  
RUN mkdir -p /tmp/caddy && wget -qO- https://github.com/mholt/caddy/releases/download/v0.10.4/caddy_v0.10.4_linux_amd64.tar.gz | tar xz -C /tmp/caddy/ && mv -v /tmp/caddy/caddy /bin/caddy && rm -rf /tmp/caddy

CMD /bin/caddy -agree -log=/var/log/caddy/caddy.log -conf=/etc/caddy/Caddyfile
