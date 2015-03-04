#see http://www.cnblogs.com/alexqdh/archive/2012/11/20/2778208.html
pwd = `pwd`;

#安装libevent依赖包
wget https://sourceforge.net/projects/levent/files/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz;
tar xvzf libevent-2.0.22-stable.tar.gz;

cd libevent-2.0.22-stable;
./configure --prefix=/usr/local/libevent.2.0.22;
make;
sudo make install;
ln -s /usr/local/libevent.2.0.22 /usr/local/libevent;

cd $pwd;
#下载memcached服务
wget http://memcached.org/files/memcached-1.4.22.tar.gz;

tar xvzf memcached-1.4.22.tar.gz;

cd memcached-1.4.22;

./configure --prefix=/usr/local/memcached.1.4.22 --with-libevent=/usr/local/libevent;
make;
make install;
ln -s /usr/local/memcached.1.4.22 /usr/local/memcached;


#安装memcache扩展
cd $pwd;
wget http://pecl.php.net/get/memcache-3.0.8.tgz;
tar xvzf memcache-3.0.8.tgz;
cd memcache-3.0.8;
phpize;
./configure;
make;
sudo make install;

#安装php的memcached扩展

#需要安装依赖库libmemcached
cd $pwd;

wget https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz;

tar xvzf libmemcached-1.0.18.tar.gz;
cd libmemcached-1.0.18;
./configure --prefix=/usr/local/libmemcached.1.0.18  --with-memcached;

#这里直接make就会,报错了 error: use of undeclared identifier 'ntohll' 
# 找了很多地方找到修复的方法https://bugs.launchpad.net/libmemcached/+bug/1245562
# The compilation error arises because HAVE_HTONLL is defined, but sys/types.h has not been included:

#编辑文件libmemcached/byteorder.cc
#在39行以后加三行代码:
# #ifdef HAVE_SYS_TYPES_H
# # include <sys/types.h>
# #endif

#编辑文件clients/memflush.cc , 把第42行和第51行做以下改动:
#  if (opt_servers == false)
#		改成
#  if (opt_servers == NULL)

make;
sudo make install;
ln -s /usr/local/libmemcached.1.0.18 /usr/local/libmemcached;

#安装pkg-config
cd $pwd;
wget http://pkgconfig.freedesktop.org/releases/pkg-config-0.28.tar.gz;
tar xvzf pkg-config-0.28.tar.gz;
cd pkg-config-0.28;
./configure  --prefix=/usr/local/pkg-config.0.28 --with-internal-glib
make;
sudo make install;
ln -s /usr/local/pkg-config.0.28 /usr/local/pkg-config;
sudo ln -s /usr/local/pkg-config/bin/pkg-config /usr/sbin/pkg-config;


#安装PHP的memcached扩展
cd $pwd;
wget http://pecl.php.net/get/memcached-2.2.0.tgz;
tar xvzf memcached-2.2.0.tgz;
cd memcached-2.2.0;
phpize;
./configure --with-php-config=/usr/local/php/bin/php-config --with-libmemcached-dir=/usr/local/libmemcached --enable-memcached-json;
make;
make install;
