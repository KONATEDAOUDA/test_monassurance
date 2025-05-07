FROM php:8.2-fpm-bullseye

ARG user=laravel
ARG uid=1000

# Installation des dépendances système
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libpq-dev \
    zip \
    unzip \
    libgmp-dev \
    netcat \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) \
        pdo \
        pdo_mysql \
        mbstring \
        exif \
        pcntl \
        bcmath \
        gd \
        sockets \
        zip

# Installation de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Création de l'utilisateur
RUN useradd -G www-data,root -u ${uid} -d /home/${user} ${user} \
    && mkdir -p /home/${user}/.composer \
    && chown -R ${user}:${user} /home/${user}

# Configuration de PHP-FPM
RUN echo "clear_env = no" >> /usr/local/etc/php-fpm.d/www.conf && \
    echo "listen = 9000" >> /usr/local/etc/php-fpm.d/www.conf

# Définition du répertoire de travail
WORKDIR /var/www

# Copie des dossiers du projet
COPY app /var/www/app/
COPY bootstrap /var/www/bootstrap/
COPY config /var/www/config/
COPY database /var/www/database/
COPY nginx /var/www/nginx/
COPY public /var/www/public/
COPY resources /var/www/resources/
COPY routes /var/www/routes/
COPY storage /var/www/storage/
COPY tests /var/www/tests/

# Copie des fichiers de configuration
COPY artisan /var/www/
COPY composer.json /var/www/
COPY composer.lock /var/www/
COPY package.json /var/www/
COPY package-lock.json /var/www/
COPY phpunit.xml /var/www/
COPY vite.config.js /var/www/

# Copie du script d'entrée
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Configuration des permissions
RUN chown -R ${user}:${user} /var/www \
    && chmod -R 755 /var/www/storage \
    && chmod -R 755 /var/www/bootstrap/cache

# Passage à l'utilisateur non-root
USER ${user}

# Installation des dépendances
RUN composer install --no-interaction --optimize-autoloader

# Exposition du port
EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]