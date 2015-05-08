wget http://www.tcpdump.org/release/libpcap-1.6.2.tar.gz;
tar xvzf libpcap-1.6.2.tar.gz;
cd libpcap-1.6.2;
./configure --prefix=/usr/local/libpcap.1.6.2;
make;
make install;
ln -s /usr/local/libpcap.1.6.2/ /usr/local/libpcap;
#cp /usr/local/libpcap/lib/libpcap.a /usr/local/lib/;
#cp /usr/local/libpcap/include/pcap.h /usr/local/;
#cp /usr/local/libpcap/include/pcap-namedb.h /usr/local/;
#cp /usr/local/libpcap/include/pcap/bpf.h /usr/include/net/;


