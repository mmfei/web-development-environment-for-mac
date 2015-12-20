pwd='/data1/software/tarball/'
dir='/data1/software/'
cd $pwd
#1、安装 zlib
wget http://zlib.net/zlib-1.2.8.tar.gz;
tar -zxf zlib-1.2.8.tar.gz -C $dir
cd $dir/zlib-1.2.8
./configure --prefix=/usr/local/zlib
make
sudo make install
 
cd $pwd
#2、安装 jpeg
wget http://www.ijg.org/files/jpegsrc.v9a.tar.gz;
#安装前先创建jpeg安装文件所需(如下)目录，防止提示类似“无法创建一般文件‘/usr/local/jpeg/***’: 没有那个文件或目录" 的错误
mkdir /usr/local/jpeg
mkdir /usr/local/jpeg/bin
mkdir /usr/local/jpeg/lib
mkdir /usr/local/jpeg/include
mkdir /usr/local/jpeg/man
mkdir /usr/local/jpeg/man1
mkdir /usr/local/jpeg/man/man1
tar -zxf jpegsrc.v9a.tar.gz -C $dir
cd $dir/jpeg-9a
./configure --prefix=/usr/local/jpeg --enable-shared --enable-static
make
sudo make install
 
#安装完成提示：
#Libraries have been installed in:
#/usr/local/jpeg6/lib

cd $pwd;
wget  http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.1.2.tar.bz2;
tar xvzf harfbuzz-1.1.2.tar.bz2 -C $dir;
cd $dir/harfbuzz-1.1.2;
./configure --prefix=/usr/local/harfbuzz.1.1.2
make 
sudo make install

cd $pwd
#3、安装 libpng

wget http://down1.chinaunix.net/distfiles/libpng-1.2.43.tar.bz2;
tar -zxf libpng-1.2.43.tar.bz2 -C $dir
cd $dir/libpng-1.2.43
./configure --prefix=/usr/local/libpng
make
sudo make install 

cd $pwd
#4、安装 freetype
wget http://download.savannah.gnu.org/releases/freetype/freetype-2.6.2.tar.gz;
tar -zxf freetype-2.6.2.tar.gz -C $dir
cd $dir/freetype-2.6.2
mkdir -p /usr/local/freetype
./configure --prefix=/usr/local/freetype
make
sudo make install 

cd $pwd
#5、安装 GD
wget http://down1.chinaunix.net/distfiles/gd-2.0.33.tar.gz;
tar -zxf gd-2.0.33.tar.gz -C $dir
cd $dir/gd-2.0.33
mkdir -p /usr/local/gd2 
./configure --prefix=/usr/local/gd2 --with-jpeg=/usr/local/jpeg/ --with-png=/usr/local/libpng/ --with-zlib=/usr/local/zlib/ --with-freetype=/usr/local/freetype/
make  #这里可能出现找不到png.c文件的,自己改源码到/usr/local/libpng/include/png.c吧
sudo make install


cd $pwd
wget http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz
tar -zxf bzip2-1.0.6.tar.gz -C $dir
cd bzip2-1.0.6
make 
make install PREFIX=/usr/local/bzip2

cd $pwd
wget http://curl.haxx.se/download/curl-7.46.0.tar.gz;
tar -zxf curl-7.46.0.tar.gz -C $dir
cd curl-7.46.0;
./configure --prefix=/usr/local/curl
make 
sudo make install



cd /data1/software/php-5.6.6/ext/zip;
/usr/local/php/bin/phpize
MACOSX_DEPLOYMENT_TARGET=10.5 CFLAGS="-arch ppc -arch ppc64 -arch i386 -arch x86_64 -g -Os -pipe -no-cpp-precomp" CCFLAGS="-arch ppc -arch ppc64 -arch i386 -arch x86_64 -g -Os -pipe" CXXFLAGS="-arch ppc -arch ppc64 -arch i386 -arch x86_64 -g -Os -pipe" LDFLAGS="-arch ppc -arch ppc64 -arch i386 -arch x86_64 -bind_at_load" 
./configure --with-zlib-dir=/usr/local/zlib --with-php-config=/usr/local/php/bin/php-config
make
sudo make install

cd /data1/software/php-5.6.6/ext/gd;
/usr/local/php/bin/phpize
MACOSX_DEPLOYMENT_TARGET=10.5 CFLAGS="-arch ppc -arch ppc64 -arch i386 -arch x86_64 -g -Os -pipe -no-cpp-precomp" CCFLAGS="-arch ppc -arch ppc64 -arch i386 -arch x86_64 -g -Os -pipe" CXXFLAGS="-arch ppc -arch ppc64 -arch i386 -arch x86_64 -g -Os -pipe" LDFLAGS="-arch ppc -arch ppc64 -arch i386 -arch x86_64 -bind_at_load" 
./configure --with-zlib-dir=/usr/local/zlib --with-jpeg-dir=/usr/local/jpeg --with-png-dir=/usr/local/libpng --with-freetype-dir=/usr/local/freetype --with-php-config=/usr/local/php/bin/php-config
make
sudo make install

export LD_LIBRARY_PATH=/lib/:/usr/lib/:/usr/local/lib;
export DYLD_LIBRARY_PATH=/lib/:/usr/lib/:/usr/local/lib;

cd /data1/software/php-5.6.6;
make clean;
./configure --prefix=/usr/local/php.5.6.6 --with-config-file-path=/usr/local/php.5.6.6/etc --enable-inline-optimization --disable-debug --disable-rpath --enable-shared --enable-opcache --enable-fpm --with-fpm-user=www --with-fpm-group=www --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-gettext=/usr/local/opt/gettext/ --enable-mbstring --with-iconv=/usr/local/iconv --with-mcrypt --with-mhash --with-openssl --enable-bcmath --enable-soap --with-libxml-dir --enable-pcntl --enable-shmop --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-sockets --with-curl=/usr/local/curl --with-zlib=/usr/local/zlib/  --enable-phpdbg --with-jpeg-dir=/usr/local/jpeg --with-png-dir=/usr/local/libpng --with-freetype-dir=/usr/local/freetype 
make
sudo make install
