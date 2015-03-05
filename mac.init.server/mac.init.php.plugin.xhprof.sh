wget http://pecl.php.net/get/xhprof-0.9.4.tgz;
tar xvzf xhprof-0.9.4.tgz;
cd xhprof-0.9.4;
cd extension;
/usr/local/php/bin/phpize;
./configure --with-php-config=/usr/local/php/bin/php-config;
make;
sudo make install;

