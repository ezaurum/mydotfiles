#! /bin/zsh

curl -O https://bootstrap.pypa.io/get-pip.py &&
python get-pip.py --user &&
rm get-pip.py &&
yay -S gitflow-avh autoenv-git &&
curl https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf -o ~/.tmux.conf
