#安装gem(ruby的包管理)

#安装rails
#gem install rails -v=2.3.5

#安装rake
#gem install rake;

git clone https://github.com/redmine/redmine;

cd redmine;

gem install bundler;
bundler install;
rake generate_secret_token;

