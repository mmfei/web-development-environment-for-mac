wget http://pecl.php.net/get/yar-1.2.4.tgz;
tar xvzf yar-1.2.4.tgz;
cd yar-1.2.4;
/usr/local/php/bin/phpize;
./configure --with-php-config=/usr/local/php/bin/php-config;
make;
make install;

