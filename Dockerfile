FROM php:8.1-apache

# Install extensions and utilities
RUN apt-get update \
  && apt-get install -y --no-install-recommends libzip-dev zip unzip git && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-install mysqli pdo pdo_mysql

# Enable apache modules
RUN a2enmod rewrite

# Copy project files into web root
COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html/uploads /var/www/html/backend || true

WORKDIR /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
