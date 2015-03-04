
echo '';
echo '-------------';
echo '安装pcre';
echo '-------------';
 
wget http://sourceforge.net/projects/pcre/files/pcre/8.36/pcre-8.36.tar.gz/download -O pcre-8.36.tar.gz;
 
tar -xvzf pcre-8.36.tar.gz;
 
cd pcre-8.36;
 
./configure --prefix=/usr/local/pcre.8.36;
 
make ;
 
sudo make install;
 
sudo ln -s /usr/local/pcre.8.36 /usr/local/pcre;


echo '';
echo '-------------';
echo '安装pcre完毕';
echo '-------------';
echo '';


echo '';
echo '-------------';
echo '安装nginx';
echo '-------------';

wget -c http://nginx.org/download/nginx-1.5.12.tar.gz -O nginx-1.5.12.tar.gz;
tar -xvzf nginx-1.5.12.tar.gz;
cd nginx-1.5.12;
./configure --prefix=/usr/local/nginx.1.5.12 --with-pcre=/data1/software/pcre-8.36 --with-cc-opt="-Wno-deprecated-declarations" --with-http_stub_status_module --with-http_ssl_module;
 
sudo make;
 
sudo make install;
 
ln -s /usr/local/nginx.1.5.12/ /usr/local/nginx;
/usr/local/nginx/sbin/nginx -v;

echo '配置nginx';

#sudo mkdir /usr/local/nginx/conf/vhosts/;

echo '';
echo '-------------';
echo '安装nginx完毕';
echo '-------------';
echo '';
