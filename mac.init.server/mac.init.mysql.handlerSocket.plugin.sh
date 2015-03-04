brew install automake;
sudo mkdir -p /usr/local/mysql/lib/mysql/plugin;

#这里很坑爹.........地址换了....网上到处都是就的github地址....坑爹来的
git clone https://github.com/DeNA/HandlerSocket-Plugin-for-MySQL.git;

cd HandlerSocket-Plugin-for-MySQL;

./autogen.sh;

./configure --prefix=/usr/local/handlersocket. --with-mysql-source=/data1/software/mysql-5.6.23 --with-mysql-bindir=/usr/local/mysql/bin --with-mysql-plugindir=/usr/local/mysql/lib/mysql/plugin;


make;

sudo make install;

/usr/local/mysql/bin/mysql -u root -p;

#连接mysql后 , 执行 install plugin handlersocket soname 'handlersocket.so';

#验证: show plugins ; 只要出现 handlersocket 就说明成功了



#安装hsclient

./autogen.sh;
./configure --disable-handlersocket-server;
make clean;
make;
sudo make install;
