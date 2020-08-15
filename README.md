# dotfiles  
Linux Config Files  
A relative minimal install  
[Have a suggestion?](https://github.com/casjay-dotfiles/minimal/issues) Go to issues!

#### All Unix and Linux  
Preresquites
```bash
sudo apt install -yy git curl gnupg python3 python3-pil libjpeg-dev
sudo yum install -y git curl gnupg python3
sudo pacman -Syyu --noconfirm git curl gnupg python3
```
### Automated Install  
```bash
bash -c "$(curl -LsS https://raw.githubusercontent.com/casjay-dotfiles/minimal/master/install.sh)"
```

### Update the dotfiles  
```bash
UPDATE=yes bash -c "$(curl -LsS https://raw.githubusercontent.com/casjay-dotfiles/minimal/master/install.sh)"
```

### Manual Install  
##### Yum based distros:  
```shell
sudo yum install epel-release redhat-lsb git curl wget vim tmux zsh fish sudo neofetch \
gnupg net-tools powerline htop lsof mercurial bzr strace cowsay thefuck screen subversion
```
##### Apt based distros:  
```shell
sudo apt-get install lsb-release git curl wget vim tmux zsh fish sudo neofetch gnupg \
net-tools powerline htop lsof mercurial bzr strace cowsay thefuck screen subversion
```
##### Pacman based Distro:  
```shell
sudo pacman -Syy lsb-release git curl wget vim tmux zsh fish sudo neofetch gnupg \
net-tools powerline htop lsof mercurial bzr strace cowsay thefuck screen subversion
```
#### Windows install  
```shell
git clone https://github.com/casjay-dotfiles/minimal.git /tmp/dotfiles
cp -Rfva /tmp/dotfiles/etc/skel/. ~/
mv -fv ~/.config/bash/profile/.alias.win ~/.config/bash/profile/00-alias.bash
mv -fv ~/.config/bash/profile/.profile.win ~/.config/bash/profile/00-profile.bash
mv -fv ~/.config/bash/profile/.powerline.win ~/.config/bash/profile/01-powerline.bash
rm -Rfv /tmp/dotfiles
source ~/.bashrc
clear
```

## ScreenShots
##### Bash
![Bash](https://raw.githubusercontent.com/casjay-dotfiles/minimal/master/screenshots/term-bash.png "Bash Shell")
##### Fish
![Fish](https://raw.githubusercontent.com/casjay-dotfiles/minimal/master/screenshots/term-fish.png "Fish Shell")
##### ZSH
![zsh](https://raw.githubusercontent.com/casjay-dotfiles/minimal/master/screenshots/term-zsh.png "ZSH Shell")
##### TMUX
![TMUX](https://raw.githubusercontent.com/casjay-dotfiles/minimal/master/screenshots/term-tmux.png "TMUX")
##### SCREEN
![Screen](https://raw.githubusercontent.com/casjay-dotfiles/minimal/master/screenshots/term-screen.png "Screen")
