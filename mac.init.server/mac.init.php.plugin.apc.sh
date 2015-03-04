# 由于apc只支持5.4的php编译,换成apcu
wget http://pecl.php.net/get/apcu-4.0.7.tgz;
tar xvzf apcu-4.0.7.tgz;
cd apcu-4.0.7;
/usr/local/php/bin/phpize;
./configure --with-php-config=/usr/local/php/bin/php-config;
make ;
make install;

#wget http://pecl.php.net/get/APC-3.1.13.tgz;
#tar xvzf APC-3.1.13.tgz;;
#cd APC-3.1.13;
#/usr/local/php/bin/phpize;
#./configure --with-php-config=/usr/local/php/bin/php-config;
#make ;
#make install;
