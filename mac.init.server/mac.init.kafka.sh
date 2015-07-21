
git clone https://github.com/gradle/gradle;
cd gradle;
./gradlew build;
# 全量安装
./gradlew installAll -Pgradle_installPath=/usr/local/gradle;

wget http://apache.dataguru.cn/kafka/0.8.2.1/kafka-0.8.2.1-src.tgz;
tar xvzf kafka-0.8.2.1-src.tgz;
cd kafka-0.8.2.1-src;

./sbt update #有点慢 , 因为更新
./sbt package
./sbt assembly-package-dependency

#首先启动zookeeper服务，使用kafka提供的单节点脚本

# bin/zookeeper-server-start.sh config/zookeeper.properties &
# “&”号是为了让在后台运行，要不还要在手动放后台或者重新开启一个终端窗口。

# 然后启动kafka服务，同样有现成的脚本
# bin/kafka-server-start.sh config/server.properties &




#三、创建topic
#创建一个topic，名字叫test
#
## bin/kafka-create-topic.sh --zookeeper localhost:2181 --replica 1 --partition 1 --topic test
#复制代码
#$bin/kafka-create-topic.sh
#Missing required argument "[topic]"
#Option                                  Description                            
#------                                  -----------                            
#--partition <Integer: # of partitions>  number of partitions in the topic      
#                                          (default: 1)                         
#--replica <Integer: replication factor> replication factor for each partitions 
#                                          in the topic (default: 1)            
#--replica-assignment-list               for manually assigning replicas to     
#  <broker_id_for_part1_replica1 :         brokers (default: )                  
#  broker_id_for_part1_replica2,                                                
#  broker_id_for_part2_replica1 :                                               
#  broker_id_for_part2_replica2, ...>                                           
#--topic <topic>                         REQUIRED: The topic to be created.     
#--zookeeper <urls>                      REQUIRED: The connection string for    
#                                          the zookeeper connection in the form 
#                                          host:port. Multiple URLS can be      
#                                          given to allow fail-over.
#复制代码
#查看创建的topic
#
## bin/kafka-list-topic.sh --zookeeper localhost:2181 2>/dev/null
#topic: test    partition: 0    leader: 0    replicas: 0    isr: 0
#“2>/dev/null”屏蔽一些线程的启动信息等,只显示想看到的结果。
#
# 
#
# 
#
#四、收发消息
#kafka发送的message可以是文件或者标准输入的一行。
#
##bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test >/dev/null
#hahahahahaha
#收取message
#
## bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning 2>/dev/null
#hahahahahaha
# 
#
#五、多broker测试
#之前是一台机器上当做一个node，现在尝试在一台机器上放3个node，即broker
#
#修改配置文件
#
#复制代码
## cp config/server.properties config/server-1.properties
## cp config/server.properties config/server-2.properties
#
#config/server-1.properties:
#    broker.id=1
#    port=9093
#    log.dir=/tmp/kafka-logs-1
# 
#config/server-2.properties:
#    broker.id=2
#    port=9094
#    log.dir=/tmp/kafka-logs-2
#复制代码
#启动broker1和broker2
#
## JMX_PORT=9997 bin/kafka-server-start.sh config/server-1.properties &
## JMX_PORT=9998 bin/kafka-server-start.sh config/server-2.properties &
#需要设置JMX的端口，防止冲突
#
#可以jps看一下任务
#
## jps
#23398 Kafka
#23300 QuorumPeerMain
#24057 Kafka
#23944 Kafka
#28938 Jps
#创建一个topic
#
## bin/kafka-create-topic.sh --zookeeper localhost:2181 --replica 3 --partition 1 --topic my-replicated-topic
#list一下
#
## bin/kafka-list-topic.sh --zookeeper localhost:2181    
#
#topic: my-replicated-topic    partition: 0    leader: 2    replicas: 2,0,1    isr: 2,0,1
#topic: test    partition: 0    leader: 0    replicas: 0    isr: 0
#partition：同一个topic下可以设置多个partition，将topic下的message存储到不同的partition下，目的是为了提高并行性
#
#leader：负责此partition的读写操作，每个broker都有可能成为某partition的leader
#
#replicas：副本，即此partition在那几个broker上有备份，不管broker是否存活
#
#isr：存活的replicas
#
# 
#
#测试：删除一个broker之后
#
## pkill -9 -f server-1.properties
#
## bin/kafka-list-topic.sh --zookeeper localhost:2181
#topic: my-replicated-topic    partition: 0    leader: 2    replicas: 2,0,1    isr: 2,0
#topic: test    partition: 0    leader: 0    replicas: 0    isr: 0
#可以看到leader的broker.id是2，我们kill掉的是broker.id=1，所以leader不变，replicas也不变，isr则是2,0，因为1被杀掉了
#
# 
#
## pkill -9 -f server-2.properties
#
## bin/kafka-list-topic.sh --zookeeper localhost:2181
#topic: my-replicated-topic    partition: 0    leader: 0    replicas: 2,0,1    isr: 0
#topic: test    partition: 0    leader: 0    replicas: 0    isr: 0
#
