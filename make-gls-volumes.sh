mkdir -p /gfs/joomla-volume/administrator
mkdir -p /gfs/joomla-volume/components
mkdir -p /gfs/joomla-volume/images

cp -R -n Joomla/administrator/. /gfs/joomla-volume/administrator
cp -R -n Joomla/components/. /gfs/joomla-volume/components
cp -R -n Joomla/images/. /gfs/joomla-volume/images

chown -R www-data:www-data /gfs/joomla-volume
