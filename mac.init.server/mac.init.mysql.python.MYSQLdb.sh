wget https://pypi.python.org/packages/source/M/MySQL-python/MySQL-python-1.2.3.tar.gz;

tar xvzf MySQL-python-1.2.3.tar.gz;
cd MySQL-python-1.2.3;
#edit site.cfg , and find mysql_config:
#mysql_config = /usr/local/mysql.5.6.23/bin/mysql_config
python setup.py clean;
python setup.py build;
sudo python setup.py install;
#if couldn't find mysqlclient , 
#export LD_LIBRARY_PATH="/usr/local/mysql/lib:$LD_LIBRARY_PATH";
