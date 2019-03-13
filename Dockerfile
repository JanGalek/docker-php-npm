FROM php:7.2

RUN apt-get update && apt-get install -yq curl gnupg zip unzip ssh \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt update && apt-get install nodejs -yq \
    && npm install -g npx \
    && mkdir -p ~/.ssh && chmod 700 ~/.ssh

CMD ["php", "-a"]
