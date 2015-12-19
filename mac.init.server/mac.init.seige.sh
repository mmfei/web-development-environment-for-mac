#52.24.24.107 download.joedog.org
wget http://download.joedog.org/siege/siege-latest.tar.gz
tar xvzf siege-latest.tar.gz
cd siege-*
./configure --prefix=/usr/local/seige
make
sudo make install
