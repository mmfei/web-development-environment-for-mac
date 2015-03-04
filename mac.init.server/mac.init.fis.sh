#如果报错 , 请安装nodejs
sudo npm install fis -g;
sudo ln -s /usr/local/node/bin/fis /usr/bin/fis;

#项目编译
cd /data1/htdocs/fanxing.kugou.com;
fis release -ompDd ./;
