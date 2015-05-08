wget http://lftp.yar.ru/ftp/lftp-4.6.1.tar.gz;
tar xvzf lftp-4.6.1.tar.gz;
cd lftp-4.6.1/;
./configure --prefix=/usr/local/lftp.4.6.1 --with-ssl=openssl;
make;
make install;
ln -s /usr/local/lftp.4.6.1 /usr/local/lftp;
