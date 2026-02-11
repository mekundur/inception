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
fi

# Install WP-CLI if not present
if ! command -v wp &> /dev/null; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

# Run WordPress installation if DB is empty
if ! wp core is-installed --allow-root; ttrhen
    wp core install \
      --url="https://$DOMAIN_NAME" \
      --title="My WordPress Site" \
      --admin_user="admin" \
      --admin_password="admin_password" \
      --admin_email="admin@example.com" \
      --skip-email \
      --allow-root

    # Create a regular user
    wp user create wp_user wp_user@example.com \
      --role=author \
      --user_pass=wp_password \
      --allow-root
fi


exec "$@"
