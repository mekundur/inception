#!/bin/bash
# set -e

# Download WordPress if not present
if [ ! -d wp-includes ]; then
    curl -O https://wordpress.org/latest.tar.gz
    tar -xf latest.tar.gz
    rm latest.tar.gz
    mv wordpress/* .
    rmdir wordpress
fi

# Configure wp-config.php
if [ ! -f wp-config.php ]; then
    cp wp-config-sample.php wp-config.php
    sed -i "s/database_name_here/$DB_NAME/" wp-config.php
    sed -i "s/username_here/$DB_USER/" wp-config.php
    sed -i "s/password_here/$DB_PASSWORD/" wp-config.php
    sed -i "s/localhost/mariadb/" wp-config.php
    # sed -i "s/localhost/${DB_HOST}:${DB_PORT}/" wp-config.php
fi

# Install WP-CLI if not present
if ! command -v wp &> /dev/null; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

# Wait for MariaDB to be ready
until mysqladmin ping -h"${DB_HOST}" -P"${DB_PORT}" --silent; do
    echo "Waiting for MariaDB..."
    sleep 10
done

# Run WordPress installation if DB is empty
# if [ -z "$(wp option get siteurl --allow-root)" ]; then
if ! wp core is-installed --allow-root; then
    wp core install \
      --url="https://$DOMAIN_NAME" \
      --title=$WP_TITLE \
      --admin_user=$WP_ADMIN \
      --admin_email=$WP_ADMIN_EMAIL \
      --admin_password=$WP_ADMIN_PASS \
      --skip-email \
      --allow-root

    # Create a regular user
    wp user create $WP_USER $WP_USER_EMAIL \
      --role=author \
      --user_pass=$WP_USER_PASS \
      --allow-root
fi

# Update site URL and home to include custom port
# wp option update siteurl "https://$DOMAIN_NAME:$NGINX_PORT" --allow-root
# wp option update home "https://$DOMAIN_NAME:$NGINX_PORT" --allow-root

exec "$@"
