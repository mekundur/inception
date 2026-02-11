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
if ! wp core is-installed --allow-root; then
    wp core install \
      --url="https://$DOMAIN_NAME" \
      --title="Welcome mekundur's inception :)" \
      --admin_user="mekundur" \
      --admin_email="mekundur@student.42berlin.de" \
      --admin_password="1989" \
      --skip-email \
      --allow-root

    # Create a regular user
    wp user create student student@student.42berlin.de \
      --role=author \
      --user_pass=student \
      --allow-root
fi


exec "$@"
