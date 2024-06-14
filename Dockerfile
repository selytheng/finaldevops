FROM php:8.2-fpm

WORKDIR /var/www/html

COPY . .

RUN apt-get update && \
    apt-get install -y \
        libzip-dev \
        unzip \
        zip \
        && docker-php-ext-install zip pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install

EXPOSE 9000

CMD ["php-fpm"]
