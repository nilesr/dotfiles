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
- [.shell_prompt.sh](https://github.com/nilesr/dotfiles/blob/master/.shell_prompt.sh) which is used by config.fish for a stylized promptline
- [.tmux.conf](https://github.com/nilesr/dotfiles/blob/master/.tmux.conf) which enables mouse support and maps some keys.
- [.tmux_theme](https://github.com/nilesr/dotfiles/blob/master/.tmux_theme) which is sourced by `.tmux.conf` for a stylized tmux status line.

---

### Recommneded Configuration:
- Background color of #061106
- Text color of #809080

---

### Screenshots:

##### Dircolors
![](https://i.imgur.com/JOg7zLv.png)

##### Fish.
Screenshot coming soon

##### Git integration with git aliases
![](https://i.imgur.com/lK6kS7c.png)

##### Tmux status line.
![](https://i.imgur.com/VXdy8sw.png)

##### Vim with plugins configured.
![](https://i.imgur.com/TjuJuXj.png)
![](http://i.imgur.com/fu6vrTL.png)

##### gvim
![](http://i.imgur.com/ViZ49jn.png)
![](http://i.imgur.com/YheKQjI.png)

##### Apt status bar
![](https://i.imgur.com/Rwhfpw5.png)

---

### Old (get from branch `old`)

##### Dircolors
![](https://i.imgur.com/TDFks6F.png)

##### Tmux status line.
![](http://i.imgur.com/WL0shy8.png)

##### Git integration with git aliases.
![](https://i.imgur.com/0Tz91aF.png)
