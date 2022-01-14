FROM php:8.0-fpm-alpine

RUN docker-php-ext-install mysqli \
    && wget -qO- https://github.com/ADOdb/ADOdb/archive/refs/tags/v5.21.3.tar.gz | tar xz -C /var/www

RUN adduser \
    --system nonroot \
    --uid 1000 \
    --no-create-home \
    --disabled-password

COPY . /var/www/html

USER nonroot

ENTRYPOINT ["php-fpm"]

