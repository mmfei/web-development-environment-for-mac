wget http://download.oracle.com/otn/berkeley-db/db-6.1.26.tar.gz;
tar -zxvf db-6.1.26.tar.gz
cd db-6.1.26
cd build_unix
../dist/configure --prefix=/usr/local/berkeleydb --enable-cxx
make
make install
echo '/usr/local/berkeleydb/lib/' >> /etc/ld.so.conf
ldconfig

