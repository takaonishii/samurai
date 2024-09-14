# どんなdockerイメージを利用して構築をするか
FROM php:7.4-apache
# FROM php:8.0-apache

# 設定ファイルをdockerコンテナ内のPHP、Apacheに読み込ませる
ADD php.ini /usr/local/etc/php/
# ADD 000-default.conf /etc/apache2/sites-enabled/

# ミドルウェアインストール
RUN apt-get update 
RUN apt-get install -y libonig-dev
RUN apt-get install -y libxml2-dev

# ImageMagickをインストール
RUN apt-get install -y imagemagick 
RUN apt-get install -y libmagickwand-dev
RUN pecl install imagick
RUN docker-php-ext-enable imagick

# GDをインストール
RUN apt-get update \
  && apt-get install -y libpq-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
  && : 'Install PHP Extensions' \
  && docker-php-ext-install -j$(nproc) pdo_mysql \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install mbstring exif

# Apacheからディレクトリ操作を可能にする
#（www-dataは、Ubuntu上のWebサーバー（Apache、nginxなど）がデフォルトで通常の操作に使用するユーザー）
# データベースの初期化時のファイルコピーを可能にするため、権限の変更
# -COPY . .
# -RUN chown -R www-data:www-data /var/www/html/

WORKDIR /var/www/html

# メールサーバ追加 2023/05/20
# RUN apt-get update && apt-get install -y ssmtp

RUN echo 'sendmail_path = "/usr/local/bin/mhsendmail --smtp-addr=mailhog:1025"' > /usr/local/etc/php/conf.d/mhsendmail.ini
 
RUN curl -sSL https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 -o mhsendmail \
    && chmod +x mhsendmail \
    && mv mhsendmail /usr/local/bin/mhsendmail

# RUN chown -R www-data:www-data /var/www/html

# Apacheのmod_rewrite を有効にする
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
RUN a2enconf fqdn
RUN a2enmod rewrite
RUN service apache2 restart

# SSH対応
# RUN apt install -y openssh-server
# RUN mkdir /var/run/sshd
# RUN echo 'root:!root' | chpasswd
# RUN useradd -m www
# RUN echo 'www:www' | chpasswd

# RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# RUN sed -i 's/#PasswordAuthentication/PasswordAuthentication/' /etc/ssh/sshd_config

# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# EXPOSE 22
# ENTRYPOINT ["/usr/sbin/sshd", "-D"]

# WORKDIR /var/www/html

# CCSystemのコピー
# COPY ./html/ccsystem /var/www/html
