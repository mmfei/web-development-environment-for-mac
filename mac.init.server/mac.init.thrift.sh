wget http://mirrors.cnnic.cn/apache/thrift/0.9.2/thrift-0.9.2.tar.gz;
tar xvzf thrift-0.9.2.tar.gz;
cd thrift-0.9.2;
./configure --with-java --with-php --with-python --prefix=/usr/local/thrift.0.9.2;
make;
make install;
