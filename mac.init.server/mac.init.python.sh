pwd=`pwd`;
cd $pwd;
wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tar.xz;
tar xvzf Python-3.4.3.tar.xz;
cd Python-3.4.3;
./configure --prefix=/usr/local/python.3.4.3;
make;
sudo make install;
sudo ln -s /usr/local/python.3.4.3/bin/python3 /usr/bin/python.3.4.3;
sudo ln -s /usr/bin/python.3.4.3 /usr/bin/python;

cd $pwd;
wget https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz;

tar xvzf Python-2.7.9.tar.xz;
cd Python-2.7.9;
./configure --prefix=/usr/local/python.2.7.9;
make;
sudo make install;
sudo ln -s /usr/local/python.2.7.9/bin/python /usr/bin/python.2.7.9;
sudo ln -s /usr/bin/python.2.7.9 /usr/bin/python2;
