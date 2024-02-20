# Use PHP 7.0.33 with Apache
FROM php:7.2-apache

RUN apt-get update && \     
    apt-get install -y libmcrypt-dev && \     
    apt-get install -y wget && \
    apt-get install -y unzip && \
    rm -rf /var/lib/apt/lists/* 


# Install mcrypt extension 
RUN pecl install mcrypt && \     
    docker-php-ext-enable mcrypt

# Install any PHP extensions you might need (example: mysqli, gd, and pdo_mysql)
RUN docker-php-ext-install mysqli

# Optional: Set the working directory, if you want a specific working directory
# WORKDIR /var/www/html

# Copy your PHP application into the image
# Ensure your application is in the same directory as the Dockerfile
# or adjust the path below to point to your application's directory
COPY . /var/www/html

# Optional: Set permissions for the application directory
# RUN chown -R www-data:www-data /var/www/html

# Apache is already configured to start, and ports 80 (and/or 443) will be exposed,
# so there's no need to specify CMD or EXPOSE commands unless you have special requirements

EXPOSE 80