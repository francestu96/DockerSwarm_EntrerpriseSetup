#!/usr/bin/env bash

JUSERID=1
JUSERNAME="admin"
JUSEREMAIL="admin@localhost.com"
JUSERPASS="user"
DBPREFIX="prfx_"


rm -f /var/www/html/index.html
sed -i "s/DB_HOST/${DB_HOST}/g" configuration.php
sed -i "s/DB_USER/${DB_USER}/g" configuration.php
sed -i "s/DB_PASSWORD/${DB_PASSWORD}/g" configuration.php
sed -i "s/DB_NAME/${DB_NAME}/g" configuration.php

#sed -i "s/\$user = ''/\$user = '${DB_USER}'/" installation/configuration.php-dist
#sed -i "s/\$password = ''/\$password = '${DB_PASSWORD}'/" installation/configuration.php-dist
#sed -i "s/\$db = ''/\$db = '${DB_NAME}'/" installation/configuration.php-dist
#sed -i "s/\$host = ''/\$host = '${DB_HOST}'/" installation/configuration.php-dist
#sed -i "s/\$dbprefix = 'jos_'/\$dbprefix = '${DBPREFIX}'/" installation/configuration.php-dist
#sed -i "s/\$tmp_path = '\/tmp'/\$tmp_path = '\/var\/www\/tmp'/" installation/configuration.php-dist
#sed -i "s/\$log_path = '\/var\/logs'/\$log_path = '\/var\/www\/logs'/" installation/configuration.php-dist
#sed -i "s/\$cache_handler = 'file'/\$cache_handler = ''/" installation/configuration.php-dist
sed -i "s/#__/${DBPREFIX}/" installation/sql/mysql/joomla.sql
#mv installation/configuration.php-dist configuration.php

cat installation/sql/mysql/joomla.sql | mysql -h $DB_HOST -u $DB_USER --password=$DB_PASSWORD  $DB_NAME
JPASS="$(echo -n "$JUSERPASS" | md5sum | awk '{ print $1 }' )"
echo "INSERT INTO \`${DBPREFIX}users\` (\`id\`, \`name\`, \`username\`, \`email\`, \`password\`, \`block\`, \`sendEmail\`, \`registerDate\`, \`lastvisitDate\`, \`activation\`, \`params\`, \`lastResetTime\`, \`resetCount\`, \`otpKey\`, \`otep\`, \`requireReset\`) VALUES ('${JUSERID}', 'admin', '${JUSERNAME}', '${JUSEREMAIL}', '${JPASS}', '0', '0', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', '', '', '0000-00-00 00:00:00.000000', '0', '', '', '0');" | mysql -h $DB_HOST -u $DB_USER --password=$DB_PASSWORD $DB_NAME
echo "INSERT INTO \`${DBPREFIX}user_usergroup_map\` (\`user_id\`, \`group_id\`) VALUES ('${JUSERID}', '8');" | mysql -h $DB_HOST -u $DB_USER --password=$DB_PASSWORD $DB_NAME
JUSERINC=$((JUSERID+1))
echo "ALTER TABLE \`${DBPREFIX}users\` auto_increment = ${JUSERINC};" | mysql -h $DB_HOST -u $DB_USER --password=$DB_PASSWORD $DB_NAME
