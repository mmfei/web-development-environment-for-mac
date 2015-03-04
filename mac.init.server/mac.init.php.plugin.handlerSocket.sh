wget http://php-handlersocket.googlecode.com/files/php-handlersocket-0.3.1.tar.gz -O php-handlersocket-0.3.1.tar.gz ;
tar xvzf php-handlersocket-0.3.1.tar.gz -C php-handlersocket-0.3.1; 
cd php-handlersocket-0.3.1;
phpize;
./configure --with-php-config=/usr/local/php/bin/php-config;
# 如果这里提示要安装libhsclient的话, 请看https://github.com/DeNA/HandlerSocket-Plugin-for-MySQL/blob/master/docs-en/installation.en.txt,搜索--disable-handlersocket-server
make;
sudo make install;


git clone https://github.com/kjdev/php-ext-handlersocketi.git;
cd php-ext-handlersocketi/;
phpize;
./configure --with-php-config=/usr/local/php/bin/php-config --disable-handlersocket-hsclient;        
make;
sudo make install;
