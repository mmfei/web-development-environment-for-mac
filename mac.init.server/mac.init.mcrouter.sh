pwd=`pwd`;
git clone https://github.com/facebook/folly.git;
cd folly/folly;
#for linux
#autoreconf -ivf;
#./configure --prefix=/usr/local/folly;

#for osx
./bootstrap-osx-homebrew.sh
make;
make check;
make install;

cd $pwd;

git clone https://github.com/facebook/mcrouter.git;
cd mcrouter/mcrouter;
autoreconf --install;
./configure --prefix=/usr/local/mcrouter;
make;
make install;
