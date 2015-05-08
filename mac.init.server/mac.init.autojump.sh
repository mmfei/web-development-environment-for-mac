git clone //github.com/joelthelion/autojump.git;
cd autojump;
./install.sh

echo "[[ -s /Users/mmfei/.autojump/etc/profile.d/autojump.sh ]] && source /Users/mmfei/.autojump/etc/profile.d/autojump.sh" >> ~/.zshrc
echo "autoload -U compinit && compinit -u" >> ~/.zshrc
source ~/.zshrc;
echo '查看字典 j -s'
echo '字典存放路径 ~/Library/autojump/autojump.txt'
