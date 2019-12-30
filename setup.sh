sed -i "s/\$user = ''/\$user = 'user'/" installation/configuration.php-dist
sed -i "s/\$password = ''/\$password = 'user'/" installation/configuration.php-dist
sed -i "s/\$db = '' /\$db = 'joomla'/" installation/configuration.php-dist
sed -i "s/\$dbprefix = 'jos_'/\$dbprefix = 'prfx_'/" installation/configuration.php-dist
sed -i "s/\$tmp_path = '\/tmp'/\$tmp_path = '\/var\/www\/tmp'/" installation/configuration.php-dist
sed -i "s/\$log_path = '\/var\/logs'/\$log_path = '\/var\/www\/logs'/" installation/configuration.php-dist
sed -i "s/\$cache_handler = 'file'/\$cache_handler = ''/" installation/configuration.php-dist
