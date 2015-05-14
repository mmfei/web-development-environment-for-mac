git clone //github.com/goagent/goagent.git;
echo "请输入你的appid(多个请用|隔开)"
read appid;

if [ -z "$appid" ]; then
    echo "请输入你的appid(多个请用|隔开),再试一次"
    read appid;
fi

echo "编辑文件local/proxy.ini , 把appid = 改成 appid = 你申请的appid"
cp local/proxy.ini local/proxy.ini.bk;cat local/proxy.ini.bk | sed "s/appid = .*/appid = $appid/g" > local/proxy.ini;

echo "导入ca.crt证书"
open local/ca.crt;

echo "开始上传Goagent文件到Google app , 上传后 在https://appengine.google.com/ , 可以看到对应的Application的Status是Running就对了."
echo '这里要填写你在appengine.google.com申请的apppid,可以多个'
echo "如果出现AttributeError: can't set attribute这个错误:"
echo "  请到google.com/settings/security , 确认 '不够安全的应用的访问权限' 已经启用"
echo "  请停用两步验证"
echo "  尝试sudo执行"
echo "  执行这步请先翻墙(这个略坑),不过网上有免费的翻墙vpn,找试用的那种"
python server/uploader.py;
