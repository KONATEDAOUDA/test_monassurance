#!/bin/sh
set -e

# Attendre que MySQL soit prêt
echo "Waiting for MySQL to be ready..."
while ! nc -z db 3306; do
    sleep 1
done
echo "MySQL is ready!"

# Exécuter les migrations
php artisan migrate --force

# Démarrer PHP-FPM
php-fpm