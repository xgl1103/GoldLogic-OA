FROM php:8.2-fpm-alpine

# 系统依赖 + PHP 扩展（ThinkPHP6 需要的 pdo_mysql/gd/mbstring/intl/zip 等）
RUN apk add --no-cache \
        freetype libjpeg-turbo libpng libzip icu-libs oniguruma libxml2 curl \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        freetype-dev libjpeg-turbo-dev libpng-dev \
        libzip-dev icu-dev oniguruma-dev libxml2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" \
        pdo_mysql pdo gd mbstring exif intl zip pcntl bcmath opcache \
    && docker-php-ext-enable pdo_mysql gd mbstring intl zip opcache \
    && apk del .build-deps

# 验证码字体（对齐 captcha.php 的绝对路径）
COPY oa-env/fonts/ /usr/share/goldlogic/fonts/
COPY docker/php/php.ini /usr/local/etc/php/conf.d/goldlogic.ini

WORKDIR /var/www/html

EXPOSE 9000
CMD ["php-fpm"]