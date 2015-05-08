git clone https://github.com/pote/gpm.git;
cd gpm;
./configure --prefix=/usr/local/gpm;
make install;

sudo ln -s /usr/local/gpm/bin/gpm /usr/bin/gpm;
