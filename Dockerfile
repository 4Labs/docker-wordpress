FROM wordpress:5.1

RUN apt-get update \
    && apt-get install -y libldap2-dev libgd-dev less mysql-client \
    && docker-php-ext-install ldap opcache gd \
    && apt-get clean \
    && docker-php-source delete \
    && rm /var/log/dpkg.log \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && mv wp-cli.phar /usr/bin/wp-cli \
    && chmod +x /usr/bin/wp-cli \
    && rm /usr/local/etc/php/conf.d/error-logging.ini

# Configure PHP for production environment
COPY php.ini /usr/local/etc/php/php.ini


