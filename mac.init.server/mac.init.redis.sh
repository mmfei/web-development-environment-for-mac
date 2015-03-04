wget wget http://download.redis.io/releases/redis-2.8.19.tar.gz;
tar xvzf redis-2.8.19.tar.gz;
cd redis-2.8.19;
make;
ln -s /data1/software/redis-2.8.19 /usr/local/redis;

#这样就安装好redis服务器了
#启动 ./src/redis-server;
#关闭 ./src/redis-cli;  连上后输入SHUTDOWN 即可关闭
