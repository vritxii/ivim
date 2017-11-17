### An awesome Vim config file.
#### For golang, python, cpp, lua, bash and so on.

Install Script:
```
#!/bin/sh
mkdir ~/vim.bak
mv ~/.vim* ~/vim.bak
git clone http://github.com/vritxii/ivim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim -c PluginInstall
#waiting...
```
Enjoy it!
The font I used is monaco.

References:
- colors,docs,Colors.md: https://github.com/rafi/awesome-vim-colorschemes
- bundle/Vundle.vim: https://github.com/VundleVim/Vundle.vim

Here are some screenshots~

- golang
![Alt text](./screenshots/goland.png "goland")

- python
![Alt text](./screenshots/python.png "python")

- cpp
![Alt text](./screenshots/cpp.png "cpp")

- vimrc
![Alt text](./screenshots/vimrc.png "vimrc")

- bash
![Alt text](./screenshots/bash.png "bash")

- lua
![Alt text](./screenshots/lua.png "lua")
