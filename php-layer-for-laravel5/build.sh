#!/usr/bin/env bash

PHP_VERSION=7.3.5

yum update -y && \
    yum install -y autoconf \
    bison \
    gcc \
    gcc-c++ \
    libcurl-devel \
    libxml2-devel \
    zip \
    tar \
    make \
    git

cd /tmp
curl -sL http://www.openssl.org/source/openssl-1.0.1k.tar.gz | tar -xvz
cd /tmp/openssl-1.0.1k
./config && make && make install

cd /tmp
curl -sL https://github.com/php/php-src/archive/php-${PHP_VERSION}.tar.gz | tar -xvz
cd php-src-php-${PHP_VERSION}
./buildconf --force && \
    ./configure \
      --prefix=/usr/local/ \
      --with-openssl=/usr/local/ssl \
      --with-curl \
      --enable-pcntl \
      --without-pear && \
    make install

mkdir /tmp/layer
cd /tmp/layer

cp /opt/layer/bootstrap /tmp/layer
chmod +x bootstrap

mkdir /tmp/layer/bin && \
    cp /usr/local/bin/php /tmp/layer/bin

# amazon-linux-extras install -y php7.3
# yum install -y php-cli php-mbstring php-mysqlnd php-pdo php-pgsql zip openssl gcc

# mkdir /tmp/layer
# cd /tmp/layer
# cp /opt/layer/bootstrap ./
# cp /opt/layer/php.ini ./

# mkdir ./bin
# cp /usr/bin/php ./bin/

# mkdir lib
# for lib in libncurses.so.6 libtinfo.so.6 libpcre.so.1 libcrypto.so.10 libc.so.6; do
#   cp "/lib64/${lib}" lib/
# done

# cp /usr/lib64/libedit.so.0 lib/

# mkdir php.d/
# cp -a /etc/php.d/* ./php.d/
# cp -a /etc/php.ini ./php.d/php.ini
# cp -a /usr/lib64/php ./lib/

zip -r /opt/layer/php-layer.zip ./
