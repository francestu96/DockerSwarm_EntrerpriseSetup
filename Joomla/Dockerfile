FROM php:7.2-apache

WORKDIR /var/www/html
ADD https://downloads.joomla.org/en/cms/joomla3/3-9-14/Joomla_3-9-14-Stable-Full_Package.tar.gz?format=gz /var/www/html
ADD https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz /var/www/html 
ADD joomla-setup.sh /usr/local/bin

RUN tar xvfz Joomla_3-9-14-Stable-Full_Package.tar.gz
RUN tar -C /usr/local/bin -xvzf dockerize-linux-amd64-v0.6.1.tar.gz
RUN rm *.tar.gz
RUN apt-get update && apt-get install -y \
 libfreetype6-dev \
 libjpeg62-turbo-dev \
 libpng-dev \
 default-mysql-client \
 && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
 && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql mysqli

RUN chmod a+x /usr/local/bin/joomla-setup.sh
RUN chown -R www-data:www-data .

CMD dockerize -wait tcp://$DB_HOST:3306 -timeout 20s joomla-setup.sh && apache2-foreground
