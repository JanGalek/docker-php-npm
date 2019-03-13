FROM php:7.2

RUN apt-get update && apt-get install -yq curl gnupg zip unzip ssh \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt update && apt-get install nodejs -yq \
    && npm install -g npx webpack webpack-cli \
    && mkdir -p ~/.ssh && chmod 700 ~/.ssh

CMD ["php", "-a"]
