FROM debian:bookworm

RUN apt update && apt install -y \
	php-fpm \
	php-mysql \
	curl \
	mariadb-client 
	# && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php

COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

WORKDIR /var/www/html

ENTRYPOINT ["/usr/local/bin/setup.sh"]
CMD ["/usr/sbin/php-fpm8.2", "-F"]
 