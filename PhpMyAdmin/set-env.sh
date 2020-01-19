sed -i "s/DB_HOST/$DB_HOST/g" config.inc.php
sed -i "s/DB_USER/$DB_USER/g" config.inc.php
sed -i "s/DB_PASSWORD/$DB_PASSWORD/g" config.inc.php
chown www-data.www-data config.inc.php

