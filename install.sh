#!/bin/bash

# Initialize and update all submodules.
echo Initializing git submodules.
git submodule init && git submodule update

test -f "$PWD"/.config.fish || (echo "Please run this inside the dotfiles directory"; exit 1) || exit 1

# Remove all dotfiles from the home directory if present.
echo Removing any existing dotfiles from your home directory.
rm -rf ~/.vim ~/.vimrc ~/.bashrc ~/.bash_profile ~/.inputrc ~/.gitconfig ~/.shell_prompt.sh ~/.tmux.conf ~/.tmux_theme ~/.tmux ~/.config/fish/config.fish ~/.putty.sh

# Initialize symlinks.
echo Creating symlinks in your home directory that point to this dotfiles repository.
ln -s "$PWD/.vim" ~/.vim
ln -s "$PWD/.vim/vimrc" ~/.vimrc
ln -s "$PWD/.vizuki.vim" ~/.vim/colors/vizuki.vim
mkdir -p ~/.config/fish
ln -s "$PWD/.config.fish" ~/.config/fish/config.fish
ln -s "$PWD/.bashrc" ~/.bashrc
ln -s "$PWD/.bash_profile" ~/.bash_profile
ln -s "$PWD/.inputrc" ~/.inputrc
ln -s "$PWD/.gitconfig" ~/.gitconfig
ln -s "$PWD/.shell_prompt.sh" ~/.shell_prompt.sh
ln -s "$PWD/.tmux.conf" ~/.tmux.conf
ln -s "$PWD/.tmux_theme" ~/.tmux_theme
ln -s "$PWD/.tmux" ~/.tmux
ln -s "$PWD/.putty.sh" ~/.putty.sh
#echo Enabling apt progress bar
#echo 'Dpkg::Progress-Fancy "1";' | sudo tee /etc/apt/apt.conf.d/99progressbar
echo Changing lightline vim theme
cat "$PWD/.vim/bundle/lightline.vim/autoload/lightline/colorscheme/jellybeans.vim"|sed 's/107/108/' > "$PWD/.vim/bundle/lightline.vim/autoload/lightline/colorscheme/jellybeans2.vim"
mv "$PWD/.vim/bundle/lightline.vim/autoload/lightline/colorscheme/jellybeans2.vim" "$PWD/.vim/bundle/lightline.vim/autoload/lightline/colorscheme/jellybeans.vim"
echo Fixing nautilus
gsettings set org.gnome.nautilus.preferences enable-interactive-search true
echo Backing up /etc/issue
sudo mv /etc/issue /etc/issue.bac
echo Installing banner
cat "$PWD"/.issue|sudo tee /etc/issue >/dev/null
cat /etc/ssh/sshd_config|grep -v Banner|sudo tee /etc/ssh/sshd_config_new > /dev/null
sudo mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bac
sudo mv /etc/ssh/sshd_config_new /etc/ssh/sshd_config
echo "Banner /etc/issue" | sudo tee -a /etc/ssh/sshd_config
echo Forwarding journald to tty12
sudo mkdir /etc/systemd/journald.conf.d
cat << EOF| sudo tee /etc/systemd/journald.conf.d/fw-tty12.conf
[Journal]
ForwardToConsole=yes
TTYPath=/dev/tty12
MaxLevelConsole=info
EOF
# Finished.
echo Dotfiles installation complete.
