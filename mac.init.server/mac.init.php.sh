pwd=`pwd`;
#先安装一些需要的库
brew install gettext;

#安装的gettext到了/usr/local/opt/gettext/

cd $pwd;
wget http://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz/download -O libmcrypt-2.5.8.tar.gz;

tar xvzf libmcrypt-2.5.8.tar.gz
cd libmcrypt-2.5.8
./configure --disable-posix-threads --enable-static
make;
sudo make install;

cd $pwd;
wget http://cn2.php.net/distributions/php-5.6.6.tar.gz;
tar xvzf php-5.6.6.tar.gz;
cd php-5.6.6;



./configure \
--prefix=/usr/local/php.5.6.6 \
--with-config-file-path=/usr/local/php.5.6.6/etc \
--enable-inline-optimization \
--disable-debug \
--disable-rpath \
--enable-shared \
--enable-opcache \
--enable-fpm \
--with-fpm-user=www \
--with-fpm-group=www \
--with-mysql=mysqlnd \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--with-gettext=/usr/local/opt/gettext/ \
--enable-mbstring \
--with-iconv \
--with-mcrypt \
--with-mhash \
--with-openssl \
--enable-bcmath \
--enable-soap \
--with-libxml-dir \
--enable-pcntl \
--enable-shmop \
--enable-sysvmsg \
--enable-sysvsem \
--enable-sysvshm \
--enable-sockets \
--with-curl \
--with-zlib \
--enable-zip \
--with-bz2 ;


make ;

sudo make install;

ln -s /usr/local/php.5.6.6 /usr/local/php;

cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf;


#fpm日志 /usr/local/php/var/log/php-fpm.log

#指定pid文件为/usr/local/php/var/run/php-fpm.pid 25行
vi /usr/local/php/etc/php-fpm.conf;
#启动
/usr/local/php/sbin/php-fpm;
#php-fpm 关闭：
#kill -INT `cat /usr/local/php/var/run/php-fpm.pid`
#php-fpm 重启：
#kill -USR2 `cat /usr/local/php/var/run/php-fpm.pid`


sudo mv /usr/bin/php /usr/bin/php.5.5.14;
sudo ln -s /usr/local/php/bin/php /usr/bin/php;
sudo mv /usr/sbin/php-fpm /usr/sbin/php-fpm.5.5.14;
sudo ln -s /usr/local/php/sbin/php-fpm /usr/sbin/php-fpm;
sudo mv /usr/bin/php-config /usr/bin/php-config.5.5.14;
sudo ln -s /usr/local/php/bin/php-config /usr/bin/php-config;
sudo mv /usr/bin/phpize /usr/bin/phpize.5.5.14;
sudo ln -s /usr/local/php/bin/phpize /usr/bin/phpize;



#
#Installing shared extensions:     /usr/local/php.5.6.6/lib/php/extensions/no-debug-non-zts-20131226/Installing PHP CLI binary:        /usr/local/php.5.6.6/bin/Installing PHP CLI man page:      /usr/local/php.5.6.6/php/man/man1/Installing PHP FPM binary:        /usr/local/php.5.6.6/sbin/Installing PHP FPM config:        /usr/local/php.5.6.6/etc/Installing PHP FPM man page:      /usr/local/php.5.6.6/php/man/man8/
#Installing PHP FPM status page:      /usr/local/php.5.6.6/php/php/fpm/
#Installing PHP CGI binary:        /usr/local/php.5.6.6/bin/
#Installing PHP CGI man page:      /usr/local/php.5.6.6/php/man/man1/
#Installing build environment:     /usr/local/php.5.6.6/lib/php/build/
#Installing header files:          /usr/local/php.5.6.6/include/php/
#Installing helper programs:       /usr/local/php.5.6.6/bin/
#  program: phpize
#  program: php-config
#Installing man pages:             /usr/local/php.5.6.6/php/man/man1/
#  page: phpize.1
#  page: php-config.1
#Installing PEAR environment:      /usr/local/php.5.6.6/lib/php/
#[PEAR] Archive_Tar    - installed: 1.3.12
#[PEAR] Console_Getopt - installed: 1.3.1
#[PEAR] Structures_Graph- installed: 1.0.4
#[PEAR] XML_Util       - installed: 1.2.3
#[PEAR] PEAR           - installed: 1.9.5
#Wrote PEAR system config file at: /usr/local/php.5.6.6/etc/pear.conf
#You may want to add: /usr/local/php.5.6.6/lib/php to your php.ini include_path
#/data1/software/php-5.6.6/build/shtool install -c ext/phar/phar.phar /usr/local/php.5.6.6/bin
#ln -s -f /usr/local/php.5.6.6/bin/phar.phar /usr/local/php.5.6.6/bin/phar
#Installing PDO headers:          /usr/local/php.5.6.6/include/php/ext/pdo/
