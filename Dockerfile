FROM php:8.2-fpm

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="Filippo 'joeyrs' Civiletti <fc@xafe.it>" architecture="AMD64/x86_64" version="0.5" date="2018.04.28"
LABEL maintainer="GB 'gionniboy' Pullarà  <giovbat@gmail.com>" architecture="AMD64/x86_64" version="0.5" date="2021.04.17"

RUN apt-get -qq update \
    && apt-get -qq upgrade -y \
    && apt-get -y install locales \
    && apt-get -y install git \
    && rm -rf /var/lib/apt/lists/* \
    # Set timezone to UTC by default
    && ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime \
    # Use unicode
    && locale-gen C.UTF-8 || true

ENV LANG=C.UTF-8

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
