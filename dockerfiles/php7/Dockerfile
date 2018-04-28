FROM  alpine:3.7
LABEL maintainer="Filippo 'joeyrs' Civiletti <fc@xafe.it>" architecture="AMD64/x86_64" version="10.1" date="2018.04.28"
LABEL maintainer="GB 'gionniboy' Pullarà  <info@firegarden.co>" architecture="AMD64/x86_64" version="7.1.16" date="2018.04.28"
RUN   (apk add --no-cache php7 \
                           php7-bcmath \
                           php7-cli \
                           php7-curl \
                           php7-ctype \
                           php7-dom \
                           php7-fpm \
                           php7-gettext \
                           php7-gd \
                           php7-iconv \
                           php7-imap \
                           php7-intl \
                           php7-json \
                           php7-imap \
                           php7-ldap \
                           php7-mbstring \
                           php7-mcrypt \
                           php7-mysqlnd \
                           php7-pdo \
                           php7-pgsql \
                           php7-pear \
                           php7-posix \
                           php7-redis \
                           php7-session \
                           php7-soap \
                           php7-xdebug \
                           php7-xml \
                           php7-xmlrpc )
RUN ( sed -i 's/^;daemonize = yes/daemonize = no/' /etc/php7/php-fpm.conf \
      && sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php7/php-fpm.d/www.conf )
      # && sed -i 's/user = nobody/user = www-data/' /etc/php7/php-fpm.d/www.conf \
      ##&& sed -i 's/group = nobody/group = www-data/' /etc/php7/php-fpm.d/www.conf )
EXPOSE 9000
CMD ["php-fpm7"]
