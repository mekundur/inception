FROM debian:bookworm

RUN apt update && apt install -y \
	php-fpm \
	php-mysql \
	curl \
	mariadb-client \
	wget \
	less\
	&& rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \ 
	&& chmod +x wp-cli.phar \ 
	&& mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY tools/setup.sh /usr/local/bin/setup.sh
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN chmod +x /usr/local/bin/setup.sh \
    && mkdir -p /var/www/html \
	&& chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

ENTRYPOINT ["/usr/local/bin/setup.sh"]
CMD ["/usr/sbin/php-fpm8.2", "-F"]
 

# RUN apt update && apt install -y \
# 	php \
#   php-fpm \
# 	php-curl \
# 	php-mbstring \
# 	php-mysql \
# 	php-xml \
# 	mariadb-client \
# 	&& rm -rf /var/lib/apt/lists/*
