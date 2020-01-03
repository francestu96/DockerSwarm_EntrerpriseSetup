#!/usr/bin/env bash

DBPREFIX="prfx_"


rm -f /var/www/html/index.html
sed -i "s/\$host = 'localhost'/\$host = '${DB_HOST}'/" installation/configuration.php-dist
sed -i "s/\$user = ''/\$user = '${DB_USER}'/" installation/configuration.php-dist
sed -i "s/\$password = ''/\$password = '${DB_PASSWORD}'/" installation/configuration.php-dist
sed -i "s/\$db = ''/\$db = '${DB_NAME}'/" installation/configuration.php-dist
sed -i "s/\$dbprefix = 'jos_'/$\dbprefix = '${DBPREFIX}'/" installation/configuration.php-dist
sed -i "s/#__/${DBPREFIX}/" installation/sql/mysql/joomla.sql
cp installation/configuration.php-dist configuration.php

cat installation/sql/mysql/joomla.sql | mysql -h $DB_HOST -u $DB_USER --password=$DB_PASSWORD  $DB_NAME
JPASS="$(echo -n "$JOOMLA_ADMIN_PASS" | md5sum | awk '{ print $1 }' )"
echo "INSERT INTO \`${DBPREFIX}users\` (\`id\`, \`name\`, \`username\`, \`email\`, \`password\`, \`block\`, \`sendEmail\`, \`registerDate\`, \`lastvisitDate\`, \`activation\`, \`params\`, \`lastResetTime\`, \`resetCount\`, \`otpKey\`, \`otep\`, \`requireReset\`) VALUES ('${JUSERID}', 'admin', '${JOOMLA_ADMIN_USER}', '${JOOMLA_ADMIN_EMAIL}', '${JPASS}', '0', '0', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', '', '', '0000-00-00 00:00:00.000000', '0', '', '', '0');" | mysql -h $DB_HOST -u $DB_USER --password=$DB_PASSWORD $DB_NAME
echo "INSERT INTO \`${DBPREFIX}user_usergroup_map\` (\`user_id\`, \`group_id\`) VALUES ('1', '8');" | mysql -h $DB_HOST -u $DB_USER --password=$DB_PASSWORD $DB_NAME
echo "ALTER TABLE \`${DBPREFIX}users\` auto_increment = 2;" | mysql -h $DB_HOST -u $DB_USER --password=$DB_PASSWORD $DB_NAME
rm -d -r installation
