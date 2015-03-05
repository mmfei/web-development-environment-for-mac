#如果php版本大于5.4 , 编译报错 , 无法完成
wget http://pecl.php.net/get/taint-1.2.2.tgz;
tar xvzf taint-1.2.2.tgz;
cd taint-1.2.2;
/usr/local/php/bin/phpize;
./configure --with-php-config=/usr/local/php/bin/php-config;
make;
make install;
