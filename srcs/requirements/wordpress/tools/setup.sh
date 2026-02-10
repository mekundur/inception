#!/bin/bash

set -e

if [ ! -f wp-config.php ]; then
	echo "Downloading WordPress..."
	curl -O https://wordpress.org/latest.tar.gz
	tar -xzf latest.tar.gz
	rm latest.tar.gz
	mv wordpress/* .
	#rmdir wordpress

	echo "Configuring WordPress..."

	cp wp-config-sample.php wp-config.php

	sed -i "s/database_name_here/$DB_NAME/" wp-config.php
	sed -i "s/username_here/$DB_USER/" wp-config.php
	sed -i "s/password_here/$DB_PASSWORD/" wp-config.php
	sed -i "s/localhost/mariadb/" wp-config.php
fi

exec "$@"
