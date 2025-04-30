FROM php:7.4-cli

RUN apt-get update && apt-get install -y \
    git unzip libzip-dev zip \
    && docker-php-ext-install pdo pdo_mysql zip

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app
COPY ./yii2-app-basic .

RUN composer config --no-plugins allow-plugins.yiisoft/yii2-composer true
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

EXPOSE 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "web"]
