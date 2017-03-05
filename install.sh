#!/bin/bash

# Initialize and update all submodules.
echo Initializing git submodules.
git submodule init && git submodule update

test -f "$PWD"/.config.fish || (echo "Please run this inside the dotfiles directory"; exit 1) || exit 1

# Remove all dotfiles from the home directory if present.
echo Removing any existing dotfiles from your home directory.
rm -rf ~/.vim ~/.vimrc ~/.bashrc ~/.bash_profile ~/.inputrc ~/.gitconfig ~/.shell_prompt.sh ~/.tmux.conf ~/.tmux_theme ~/.tmux ~/.config/fish/config.fish ~/.putty.sh ~/.tmux_plugins.conf ~/.tmux_theme.insert ~/.tmux_theme.normal ~/.tmux_theme.replace ~/.tmux_theme.visual

# Initialize symlinks.
echo Creating symlinks in your home directory that point to this dotfiles repository.
ln -s "$PWD/.vim" ~/.vim
ln -s "$PWD/.vim/vimrc" ~/.vimrc
ln -s "$PWD/.vizuki.vim" ~/.vim/colors/vizuki.vim &> /dev/null
mkdir -p ~/.config/fish
ln -s "$PWD/.config.fish" ~/.config/fish/config.fish
ln -s "$PWD/.bashrc" ~/.bashrc
ln -s "$PWD/.bash_profile" ~/.bash_profile
ln -s "$PWD/.inputrc" ~/.inputrc
ln -s "$PWD/.gitconfig" ~/.gitconfig
ln -s "$PWD/.shell_prompt.sh" ~/.shell_prompt.sh
ln -s "$PWD/.tmux.conf" ~/.tmux.conf
ln -s "$PWD/.tmux_plugins.conf" ~/.tmux_plugins.conf
ln -s "$PWD/.tmux_theme" ~/.tmux_theme
ln -s "$PWD/.tmux_theme.insert" ~/.tmux_theme.insert
ln -s "$PWD/.tmux_theme.normal" ~/.tmux_theme.normal
ln -s "$PWD/.tmux_theme.visual" ~/.tmux_theme.visual
ln -s "$PWD/.tmux_theme.replace" ~/.tmux_theme.replace
ln -s "$PWD/.tmux" ~/.tmux
ln -s "$PWD/.putty.sh" ~/.putty.sh
echo "Compiling c extension for command-t"
cd "$HOME/.vim/bundle/command-t/ruby/command-t"
ruby extconf.rb
make
cd -
echo "Enabling apt progress bar (don't worry, if you're not on debian/ubuntu it won't hurt you anyways)"
echo 'Dpkg::Progress-Fancy "1";' | sudo tee /etc/apt/apt.conf.d/99progressbar
echo Changing lightline vim theme
sed -i 's/107/108/' "$PWD/.vim/bundle/lightline.vim/autoload/lightline/colorscheme/jellybeans.vim"

echo Fixing tmuxline config
cp "$PWD/.vim/bundle/tmuxline.vim/autoload/tmuxline/themes/lightline_visual.vim" "$PWD/.vim/bundle/tmuxline.vim/autoload/tmuxline/themes/lightline_replace.vim"
sed -i 's/visual/replace/g' "$PWD/.vim/bundle/tmuxline.vim/autoload/tmuxline/themes/lightline_replace.vim"

echo Fixing nautilus
gsettings set org.gnome.nautilus.preferences enable-interactive-search true
echo Backing up /etc/issue
sudo mv /etc/issue /etc/issue.bac
echo Installing banner
sudo tee /etc/issue < "$PWD"/.issue >/dev/null # lint dings me for SC2024 (sudo doesn't affect redirects) here, but I don't need sudo to read from ~/.dotfiles/.issue, so I don't know what it thinks it's warning me about
grep -v Banner /etc/ssh/sshd_config|sudo tee /etc/ssh/sshd_config_new > /dev/null
sudo mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bac
sudo mv /etc/ssh/sshd_config_new /etc/ssh/sshd_config
echo "Banner /etc/issue" | sudo tee -a /etc/ssh/sshd_config
echo Forwarding journald to tty12
sudo mkdir /etc/systemd/journald.conf.d &> /dev/null # don't complain if it already exists (it should)
sudo tee /etc/systemd/journald.conf.d/fw-tty12.conf <<< '[Journal]'
sudo tee -a /etc/systemd/journald.conf.d/fw-tty12.conf <<< 'ForwardToConsole=yes'
sudo tee -a /etc/systemd/journald.conf.d/fw-tty12.conf <<< 'TTYPath=/dev/tty12'
sudo tee -a /etc/systemd/journald.conf.d/fw-tty12.conf <<< 'MaxLevelConsole=info'
# Finished.
echo Dotfiles installation complete.
