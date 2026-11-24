
FROM php:8.5.12-apache

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libzip-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd \
       --with-freetype --with-jpeg \
    && docker-php-ext-install \
       mysqli \
       pdo_mysql \
       intl \
       gd \
       zip \
       exif \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i \
    's/AllowOverride None/AllowOverride All/' \
    /etc/apache2/apache2.conf

WORKDIR /var/www/html
