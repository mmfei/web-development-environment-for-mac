wget http://nodejs.org/dist/v0.12.0/node-v0.12.0.tar.gz;
tar xvzf node-v0.12.0.tar.gz;
cd node-v0.12.0;
./configure --prefix=/usr/local/node.0.12.0;
make;
make install;

sudo ln -s /usr/local/node.0.12.0 /usr/local/node;
sudo ln -s /usr/local/node/bin/npm /usr/bin/npm;
sudo ln -s /usr/local/node/bin/node /usr/bin/node;


