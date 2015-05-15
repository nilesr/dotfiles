There are a ton of fancy dotfiles installers and configuration managers out there but I'm a fan of simplicity. Simply clone this repository and run the `install.sh` script. The script will symlink all the appropriate dotfiles into the appropriate locations for linux.

![](http://i.imgur.com/e4AFBMI.gif)

---

### Install

```shell
$ git clone git@github.com:nilesr/dotfiles.git
$ cd ./dotfiles
$ ./install.sh
```

---

### Included Configurations:

- Vim, complete with [plugins](https://github.com/nilesr/dotfiles/blob/master/.vim/bundle) and [.vimrc](https://github.com/nilesr/dotfiles/blob/master/.vim/vimrc).
- [.bash_profile](https://github.com/nilesr/dotfiles/blob/master/.bash_profile) which sources `.bashrc` for cross-system interoperability.
- [.bashrc](https://github.com/nilesr/dotfiles/blob/master/.bashrc) containing a few aliases and various configurations.
- [.config/fish/config.fish](https://github.com/nilesr/dotfiles/blob/master/.config.fish) containing a few aliases and various configurationsr
- [.gitconfig](https://github.com/nilesr/dotfiles/blob/master/.gitconfig) with aliases.
- [.inputrc](https://github.com/nilesr/dotfiles/blob/master/.inputrc) to put bash in vi mode.
- [.shell_prompt.sh](https://github.com/nilesr/dotfiles/blob/master/.shell_prompt.sh) which is sourced by `.bash_profile` for a stylized bash prompt.
- [.tmux.conf](https://github.com/nilesr/dotfiles/blob/master/.tmux.conf) which enables mouse support and maps some keys.
- [.tmux_theme](https://github.com/nilesr/dotfiles/blob/master/.tmux_theme) which is sourced by `.tmux.conf` for a stylized tmux status line.

---

### Recommneded Configuration:
- Background color of rgb 20 20 20
- Text color of rgb 187 187 187

### Screenshots:

##### Dircolors
![](https://i.imgur.com/TDFks6F.png)

##### Fish.
![](http://i.imgur.com/jyqOPxU.png)

##### Git integration with git aliases.
![](https://i.imgur.com/0Tz91aF.png)

##### Tmux status line.
![](http://i.imgur.com/jyqOPxU.png)

##### Vim with plugins configured.
![](http://i.imgur.com/fu6vrTL.png)
![](http://i.imgur.com/wfmXDSv.png)

