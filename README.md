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

### Configuration
If you don't like the μ (or λ, if you're root) comment out line 79 of `.shell_prompt.sh`

---

### Included Configurations:

- Vim, complete with [plugins](https://github.com/nilesr/dotfiles/blob/master/.vim/bundle) and [.vimrc](https://github.com/nilesr/dotfiles/blob/master/.vim/vimrc).
- [.config/fish/config.fish](https://github.com/nilesr/dotfiles/blob/master/.config.fish) containing a few aliases and various configurations
- [.gitconfig](https://github.com/nilesr/dotfiles/blob/master/.gitconfig) with aliases.
- [.inputrc](https://github.com/nilesr/dotfiles/blob/master/.inputrc) to put rlwrap (and bash) in vi mode.
- [.shell_prompt.sh](https://github.com/nilesr/dotfiles/blob/master/.shell_prompt.sh) which is sourced by `.bash_profile` for a stylized bash prompt.
- [.tmux.conf](https://github.com/nilesr/dotfiles/blob/master/.tmux.conf) which enables mouse support and maps some keys.
- [.tmux_theme](https://github.com/nilesr/dotfiles/blob/master/.tmux_theme) which is sourced by `.tmux.conf` for a stylized tmux status line.

---

### Recommneded Configuration:
- Background color of rgb 20 20 20 or #141414
- Text color of rgb 135 135 135 or #878787

---

### Screenshots:

##### Dircolors
![](http://i.imgur.com/DGvwMSv.png)

##### Fish.
Screenshot coming soon

##### Git integration with git aliases.
![](http://i.imgur.com/87USNVW.png)

##### Tmux status line.
![](http://i.imgur.com/qagGwNG.png)

##### Vim with plugins configured.
![](https://i.imgur.com/tzsIxBq.png)

##### gvim
![](http://i.imgur.com/ViZ49jn.png)
![](http://i.imgur.com/YheKQjI.png)

##### Apt status bar
##### FIXME
![](http://i.imgur.com/csviLCC.png)

