FROM wordpress:5.1

RUN apt-get update \
    && apt-get install -y libldap2-dev libgd-dev \
    && docker-php-ext-install ldap opcache gd \
    && apt-get clean \
    && docker-php-source delete \
    && rm /var/log/dpkg.log
