
# 安装godep
go get github.com/kr/godep;
go install github.com/kr/godep;
go get github.com/bitly/nsq/...;

#启动lookup
nsqlookupd
#启动一个nsqd , 并指定lookup的地址
nsqd --lookupd-tcp-address=127.0.0.1:4160
#打开一个监控网址
nsqadmin --lookupd-http-address=127.0.0.1:4161
#往一个地址发送消息
curl -d "hello world 1" "http://127.0.0.1:4151/put?topic=test"
#消费, 消费输出到output-dir指定的目录
nsq_to_file --topic=test --output-dir=/data1/logs/nsq --lookupd-http-address=127.0.0.1:4161
# 持续生产
curl -d "hello world 2" "http://127.0.0.1:4151/put?topic=test"
# 持续生产
curl -d "hello world 3" "http://127.0.0.1:4151/put?topic=test"
