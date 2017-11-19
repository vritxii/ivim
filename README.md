<p align="center">
    <a href="https://vritxii.com"><img src="./screenshots/ivim.jpg" /></a>
    <br/>
    <h1 style="color:blue" align="center">An awesome Vim config file.</h1>
</p>

## Release Notes
- master:
  - 0.110
	- 添加代码缩略图
	- 添加多个快捷映射
	- 增强C++支持
	- 替换欢迎界面，显示最近打开文件等

  - 0.100
  
- dev:
  - 0.110
	- 增强C++支持
	- 替换欢迎界面，显示最近打开文件等

  - 0.105
	- 添加代码缩略图
	- 添加多个快捷映射

  - 0.101
  

#### 支持golang, python, c, c++, bash等,其中对golang,python支持最好,后期想配成模块，能够用一个简单的匹配文件来打开/关闭某一语言的相关设置。欢迎star, 提issue, 一起改进ivim :)

#### 安装脚本:
```
#!/bin/sh
mkdir ~/vim.bak
mv ~/.vim* ~/vim.bak
git clone http://github.com/vritxii/ivim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim -c PluginInstall
#waiting...
```
尽情享受吧!
#### 尽情享受吧!

#### 配置简易说明:
- 字体: monaco
- 配色: onehalfdark
- 自动补全: YouCompleteMe(YCM)
- 目录树: NerdTree
- 函数列表: tagbar
- 语言相关:
  - vim-go
  - python-mode
  - vim-ruby
  - html5
  - vim-flavored-markdown
  - clang-complete

##### 比较有用的功能:
- 自动补全(没了自动补全感觉不会写代码了...)
- 函数，变量列表，快速跳转
- 文件目录窗口，便捷垂直，水平切分窗口，支持鼠标调整窗口大小,键绑定快速窗口跳转
- 相对行数，能让你快速跳转到当前页面任意行，打开标尺，用十字定位当前光标，并将当前行和列高亮为原谅绿:)
- 一键编译运行，仅支持单文件，目前支持,c,c++,java,bash,python,golang
- 新建文件添加对应代码头(文件名，作者，邮箱，创建时间等)
- python pep8标准检查,虚拟环境，代码折叠，快速搜索和替换（可指定范围)，markdown实时预览
- 简单的代码缩略图，更改vim欢迎界面，显示最近打开文件
- 添加文件名高亮,gvim还显示文件图标
- 一些快捷键设置


##### 内置库引用:

#### 内置库引用:
- colors,docs,Colors.md: https://github.com/rafi/awesome-vim-colorschemes
- bundle/IVundle.vim: https://github.com/VundleVim/Vundle.vim
# 插件
```
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup'
Plugin 'sonph/onehalf'
Plugin 'ascenator/L9'
Plugin 'christoomey/vim-run-interactive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'croaky/vim-colors-github'
Plugin 'danro/rename.vim'
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/tComment'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'godlygeek/tabular'
Plugin 'msanders/snipmate.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'altercation/vim-colors-solarized'
Plugin 'othree/html5.vim'
Plugin 'xsbeats/vim-blade'
Plugin 'Raimondi/delimitMate'
Plugin 'groenewege/vim-less'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tomasr/molokai'
Plugin 'klen/python-mode'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'klen/rope-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'tmhedberg/SimpylFold'
Plugin 'jnurmine/Zenburn'
"C++自动补全
"Plugin 'Rip-Rip/clang_complete'
"代码代码缩略图
Plugin 'severin-lemaignan/vim-minimap'
"欢迎界面
Plugin 'mhinz/vim-startify'
"代码注释
Plugin 'tpope/vim-commentary'
"高亮括号插件
Plugin 'kien/rainbow_parentheses.vim'
if has('gui_running')
    Plugin 'ryanoasis/vim-devicons'
endif
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
```

下面随便截了几张图,不知道为什么总感觉这配色和字体搭配看着很舒服:)

- Welcome Page
![Alt text](./screenshots/welcome.png "welcom page")

- Minimap
![Alt text](./screenshots/minimap.png "minimap")

- golang
![Alt text](./screenshots/golang.png "golang")

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
