FROM php:7.2-apache

WORKDIR /var/www/html
ADD https://downloads.joomla.org/en/cms/joomla3/3-9-14/Joomla_3-9-14-Stable-Full_Package.tar.gz?format=gz /var/www/html
RUN tar xvfz Joomla_3-9-14-Stable-Full_Package.tar.gz
RUN apt-get update && apt-get install -y \
 libfreetype6-dev \
 libjpeg62-turbo-dev \
 libpng-dev \
 default-mysql-client \
 && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
 && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql mysqli

ADD configuration.php /var/www/html
ADD joomla-config.sh /usr/local/bin

RUN chmod a+x /usr/local/bin/joomla-config.sh
RUN rm -d -r installation
RUN rm -f Joomla_3-9-14-Stable-Full_Package.tar.gz
RUN chown -R www-data:www-data .
RUN sed -i "3i/usr/local/bin/joomla-config.sh" /usr/local/bin/docker-php-entrypoint

VOLUME /gfs

