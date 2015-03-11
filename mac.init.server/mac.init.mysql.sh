brew install cmake;

wget http://cdn.mysql.com/Downloads/MySQL-5.6/mysql-5.6.23.tar.gz; 

tar xvzf mysql-5.6.23.tar.gz; 

cd mysql-5.6.23;

cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql.5.6.23 -DMYSQL_DATADIR=/data1/mysql -DEXTRA_CHARSETS=all -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci -DWITH_INNOBASE_STORAGE_ENGINE=1 -DWITH_MYISAM_STORAGE_ENGINE=1 -DWITH_SSL=yes -DWITH_READLINE=on;

mkdir /data1/mysql;

make;

make test;

make install;

ln -s /usr/local/mysql.5.6.23 /usr/local/mysql;

sudo chown -R root:_mysql /usr/local/mysql
sudo chown -R _mysql:_mysql /data1/mysql

sudo cp /usr/local/mysql/support-files/my-default.cnf /etc/my.cnf

sudo /usr/local/mysql/scripts/mysql_install_db --basedir=/usr/local/mysql --datadir=/data1/mysql --user=_mysql

#解决Reason: image no found
sudo ln -s /usr/local/mysql/lib /usr/local/mysql/lib/mysql;
sudo ln -s /usr/local/mysql/lib/libmysqlclient.18.dylib /usr/lib/libmysqlclient.18.dylib;

sudo /usr/local/mysql/bin/mysqladmin -u root password '新密码'

#最后需要su - root 到root用户权限 , 去启动
#/usr/local/mysql/support-files/mysql.server start
#关闭
#/usr/local/mysql/support-files/mysql.server stop
