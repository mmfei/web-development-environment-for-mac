curl -O https://distfiles.macports.org/MacPorts/MacPorts-2.3.3.tar.bz2;
tar xf MacPorts-2.3.3.tar.bz2 -C /data1/software;
cd /data1/software/MacPorts-2.3.3;
./configure --prefix=/usr/local/macport.2.3.3;
make;
sudo make install;
sudo /usr/local/macport.2.3.3/bin/port -v selfupdate

