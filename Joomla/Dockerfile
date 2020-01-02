FROM php:7.2-apache

WORKDIR /var/www/html
ADD https://downloads.joomla.org/en/cms/joomla3/3-9-14/Joomla_3-9-14-Stable-Full_Package.tar.gz?format=gz /var/www/html
RUN tar xvfz Joomla_3-9-14-Stable-Full_Package.tar.gz
RUN apt-get update && apt-get install -y \
 libfreetype6-dev \
 libjpeg62-turbo-dev \
 libpng-dev \
 && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
 && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql mysqli

ADD configuration.php /var/www/html
RUN rm -d -r installation
RUN rm -f Joomla_3-9-14-Stable-Full_Package.tar.gz
RUN chown -R www-data:www-data .
#RUN chmod 777 /var/www/html/setup.sh
#RUN /var/www/html/setup.sh
#RUN rm /var/www/html/setup.sh
VOLUME /gfs

