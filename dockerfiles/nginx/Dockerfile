FROM alpine:3.7
LABEL maintainer="Filippo 'joeyrs' Civiletti <fc@xafe.it>" architecture="AMD64/x86_64" version="10.1" date="2018.04.28"
LABEL maintainer="GB 'gionniboy' Pullarà  <info@firegarden.co>" architecture="AMD64/x86_64" version="1.12.2" date="2018.04.28"
RUN (apk add --no-cache nginx && mkdir -p /var/log/nginx /run/nginx)
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/nginx_vhost.conf /etc/nginx/conf.d/default.conf
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
