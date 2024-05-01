FROM php:8.3-fpm

RUN addgroup --gid 1000 reverb && adduser --disabled-password --gecos "" --ingroup reverb --uid 1000 reverb

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt update && apt install -y libzip-dev zip unzip 7zip sqlite3

RUN docker-php-ext-install pdo_mysql zip pcntl

USER reverb

EXPOSE 9000
