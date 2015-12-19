wget https://pypi.python.org/packages/source/r/robotframework-ride/robotframework-ride-1.4a1.tar.gz\#md5\=fe3a04e0cdce1054943f722fd1f4a526 -O robotframework-ride-1.4a1.tar.gz;
tar xvzf robotframework-ride-1.4a1.tar.gz -C /data1/software/;
cd /data1/software/robotframework-ride-1.4a1;

python setup.py install;

#wget http://softlayer-sng.dl.sourceforge.net/project/wxpython/wxPython/3.0.2.0/wxPython3.0-osx-3.0.2.0-cocoa-py2.7.dmg;
#wget http://sourceforge.net/projects/wxpython/files/wxPython/2.8.12.1/wxPython-src-2.8.12.1.tar.bz2/download -O wxPython-src-2.8.12.1.tar.bz2;
tar xvzf wxPython-src-2.8.12.1.tar.bz2;
cd wxPython-src-2.8.12.1;
mkdir build-carbon-debug
cd build-carbon-debug
arch_flags="-arch i386"
../configure CFLAGS="$arch_flags" CXXFLAGS="$arch_flags" CPPFLAGS="$arch_flags" LDFLAGS="$arch_flags" OBJCFLAGS="$arch_flags" OBJCXXFLAGS="$arch_flags" --enable-unicode --enable-debug --disable-shared
make;cd ..
# Build the samples and demos
cd build-carbon-debug/samples;make;cd ../..
cd build-carbon-debug/demos;  make;cd ../..
