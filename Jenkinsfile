FROM wordpress:5.1

RUN apt-get update \
    && apt-get install -y libldap2-dev \
    && docker-php-ext-install ldap opcache gd \
    && a2enmod http2 \
    && apt-get clean \
    && docker-php-source delete \
    && rm /var/log/dpkg.log
