#homepage : http://zookeeper.apache.org/
#download : http://www.apache.org/dyn/closer.cgi/zookeeper/
#install : 
#start : http://zookeeper.apache.org/doc/trunk/zookeeperStarted.html
wget //mirror.apache-kr.org/zookeeper/current/zookeeper-3.4.6.tar.gz;
tar xvzf zookeeper-3.4.6.tar.gz -C /usr/local/zookeeper-3.4.6;
ln -s /usr/local/zookeeper-3.4.6 /usr/local/zookeeper;

cat > /usr/local/zookeeper/conf/zoo.cfg <<EOF
Time=2000    
dataDir=/data1/zookeeper/data    
dataLogDir=/data1/zookeeper/logs    
clientPort=4180
EOF

#tickTime: zookeeper中使用的基本时间单位, 毫秒值.
#dataDir: 数据目录. 可以是任意目录.
#dataLogDir: log目录, 同样可以是任意目录. 如果没有设置该参数, 将使用和dataDir相同的设置.
#clientPort: 监听client连接的端口号.

#启动服务器
/usr/local/zookeeper/bin/zkServer.sh start;
#停止
# /usr/local/zookeeper/bin/zkServer.sh stop;

#启动客户端 , 连接zkServer
/usr/local/zookeeper/bin/zkCli.sh -server localhost:4180


#集群配置(本地启用三个zookeeper进程代替集群)
mkdir -p /data1/software/zookeeperServers;

tar xvzf /data1/software/tarball/zookeeper-3.4.6.tar.gz -C /data1/software/zookeeperServers/;
mv /data1/software/zookeeperServers/zookeeper-3.4.6 /data1/software/zookeeperServers/zookeeper-3.4.6_1;

tar xvzf /data1/software/tarball/zookeeper-3.4.6.tar.gz -C /data1/software/zookeeperServers/;
mv /data1/software/zookeeperServers/zookeeper-3.4.6 /data1/software/zookeeperServers/zookeeper-3.4.6_2;

tar xvzf /data1/software/tarball/zookeeper-3.4.6.tar.gz -C /data1/software/zookeeperServers/;
mv /data1/software/zookeeperServers/zookeeper-3.4.6 /data1/software/zookeeperServers/zookeeper-3.4.6_3;

#initLimit: zookeeper集群中的包含多台server, 其中一台为leader, 集群中其余的server为follower. initLimit参数配置初始化连接时, follower和leader之间的最长心跳时间. 此时该参数设置为5, 说明时间限制为5倍tickTime, 即5*2000=10000ms=10s.
#syncLimit: 该参数配置leader和follower之间发送消息, 请求和应答的最大时间长度. 此时该参数设置为2, 说明时间限制为2倍tickTime, 即4000ms.
#server.X=A:B:C 其中X是一个数字, 表示这是第几号server. A是该server所在的IP地址. B配置该server和集群中的leader交换消息所使用的端口. C配置选举leader时所使用的端口. 由于配置的是伪集群模式, 所以各个server的B, C参数必须不同.


#在之前设置的dataDir中新建myid文件, 写入一个数字, 该数字表示这是第几号server. 该数字必须和zoo.cfg文件中的server.X中的X一一对应.
#/Users/apple/zookeeper0/data/myid文件中写入0, /Users/apple/zookeeper1/data/myid文件中写入1, /Users/apple/zookeeper2/data/myid文件中写入2.

mkdir -p /data1/zookeeper/1/data/ /data1/zookeeper/1/logs /data1/zookeeper/2/data/ /data1/zookeeper/2/logs /data1/zookeeper/3/data/ /data1/zookeeper/3/logs;

cat > /data1/software/zookeeperServers/zookeeper-3.4.6_1/conf/zoo.cfg <<EOF
Time=2000    
initLimit=5    
syncLimit=2    
dataDir=/data1/zookeeper/1/data    
dataLogDir=/data1/zookeeper/1/logs    
clientPort=4181  
server.1=127.0.0.1:8880:7770    
server.2=127.0.0.1:8881:7771    
server.3=127.0.0.1:8882:7772
EOF

echo 1 > /data1/zookeeper/1/data/myid;


cat > /data1/software/zookeeperServers/zookeeper-3.4.6_2/conf/zoo.cfg <<EOF
Time=2000    
initLimit=5    
syncLimit=2    
dataDir=/data1/zookeeper/2/data    
dataLogDir=/data1/zookeeper/2/logs    
clientPort=4182  
server.1=127.0.0.1:8880:7770    
server.2=127.0.0.1:8881:7771    
server.3=127.0.0.1:8882:7772
EOF
echo 2 > /data1/zookeeper/2/data/myid;

cat > /data1/software/zookeeperServers/zookeeper-3.4.6_3/conf/zoo.cfg <<EOF
Time=2000    
initLimit=5    
syncLimit=2    
dataDir=/data1/zookeeper/3/data    
dataLogDir=/data1/zookeeper/3/logs    
clientPort=4183 
server.1=127.0.0.1:8880:7770    
server.2=127.0.0.1:8881:7771    
server.3=127.0.0.1:8882:7772
EOF

echo 3 > /data1/zookeeper/3/data/myid;
