#cd 网站根目录
wget https://raw.github.com/pypa/virtualenv/master/virtualenv.py;
python virtualenv.py flask;


git clone http://github.com/mitsuhiko/flask.git;
cd flask;
virtualenv myenv;
. myenv/bin/activate;
python setup.py develop;

python;
