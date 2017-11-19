"借鉴spf13-vim,系统相关
" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/zsh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }
    
    " Arrow Key Fix {
        " https://github.com/spf13/spf13-vim/issues/780
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }

" }

"自定义
"插件无关配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
"winpos 5 5          " 设定窗口位置  
"set lines=40 columns=155    " 设定窗口大小  
"set nu              " 显示行号  
set go=             " 不要图形按钮  
syntax on           " 语法高亮

set magic                   " 设置魔术

"autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
"autocmd InsertEnter * se cul    " 用浅色高亮当前行  
"set cmdheight=1     " 命令行（在状态行下）的高度，设置为1  
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
"set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
set novisualbell    " 不要闪烁(不明白)  
if has('statusline')
	set statusline=%f\ %{WebDevIconsGetFileTypeSymbol()}\ %F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
endif
set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  
"设置折叠
"set foldenable      " 允许折叠  
"set foldmethod=manual   " 手动折叠  
"set foldmethod=indent
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠  
"set foldmethod=indent
set foldcolumn=0
set foldlevel=99
nnoremap <space> za

set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
set shiftwidth=4
set sts=4
set tabstop=4
set expandtab

"设置鼠标拖动改变分屏大小
if has('mouse')
	set mouse=a
endif

"无备份文件
set noswapfile
let g:SuperTabDefaultCompletionType="context" 
let g:SimpylFold_docstring_preview=1
set splitbelow
set splitright

" 设置配色方案
if has('gui_running')
	set background=dark
	let g:solarized_termcolors=256
	let g:solarized_termtrans=1
	let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
	color solarized             " Load a colorscheme
else
	"colorscheme zenburn
	set background=dark
	let g:onehalfdark_termcolors=256
	colorscheme onehalfdark 
	"let g:solarized_termcolors=256
	"let g:solarized_termtrans=1
	"let g:solarized_contrast="normal"
    "let g:solarized_visibility="normal"
	"color solarized             " Load a colorscheme
endif

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb2312
set fileencoding=utf-8
"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java,go,py文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.go,*.py,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件
	exec "w"
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: vritxii") 
        call append(line(".")+2, "\# mail: nkdzt@foxmail.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 

	elseif &filetype == 'go' 
		call setline(1, "\package main")
		call append(line("."), "\/**")
        call append(line(".")+1,"\#########################################################################") 
        call append(line(".")+2, "\# File Name: ".expand("%")) 
        call append(line(".")+3, "\# Author: vritxii") 
        call append(line(".")+4, "\# mail: nkdzt@foxmail.com") 
        call append(line(".")+5, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+6, "\#########################################################################") 
        call append(line(".")+7, "\**/") 
		call append(line(".")+8, "")
		
	elseif &filetype == "python"
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: vritxii") 
        call append(line(".")+2, "\# mail: nkdzt@foxmail.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/env python3") 
		call append(line(".")+6, "")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: vritxii") 
        call append(line(".")+2, "    > Mail: nkdzt@foxmail.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif

    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif

    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 

"<leader>: \
"键盘命令
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
"快速打开文件
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easier horizontal scrolling
map zl zL
map zh zH
" Easier formatting
nnoremap <silent> <leader>q gwip

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"新建标签  
map <M-F2> :tabnew<CR>  

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
	elseif &filetype == 'go'
		exec "!go run %"
	elseif &filetype == 'python'
		exec "!intelpy %"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'bash'
        exec "!bash %"
    elseif &filetype == 'perl'
        exec "!perl %"
    elseif &filetype == 'lua'
        exec "!lua %"
	elseif &filetype == "r"
		exec "!Rscript %"
	elseif &filetype == "ruby"
		exec "!ruby %"
    endif
endfunc

"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
	if &filetype == "cpp"
		exec "!g++ % -g -o %<"
		exec "!gdb ./%<"
	elseif &filetype == "c"
		exec "!gcc % -g -o %<"
		exec "!gdb ./%<"
	endif
endfunc

function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
    endif
endfunc

""实用设置
inoremap <Tab> <C-R>=CleverTab()<CR>
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
"<leader>: \
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"允许插件  
filetype plugin on
"共享剪贴板  
set clipboard+=unnamed 
"从不备份  
set nobackup
"make 运行
:set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=manual
set foldlevel=3 
set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 语法高亮
set syntax=on
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
set relativenumber
" 历史记录数
set history=1000
"禁止生成临时文件
"set nobackup
"set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.GB2312
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
set tags=tags  
set autochdir 
" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
set nocompatible

"初始化Vundele
set rtp+=~/.vim/bundle/IVundle.vim
call vundle#begin('~/.vim/bundle')
" alternatively, pass a path where Vundle should install plugins
" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'chxuan/change-colorscheme'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"本地插件仓库 
Plugin 'file:///home/nihility/.vim/bundle/IVundle.vim'
"Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup'
Plugin 'sonph/onehalf'
Plugin 'ascenator/L9'
"Plugin 'christoomey/vim-run-interactive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'croaky/vim-colors-github'
Plugin 'danro/rename.vim'
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ctrlpvim/ctrlp.vim'
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
Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown' 'p_markdown'
Plugin 'gabrielelana/vim-markdown'
"Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
"Plugin 'nelstrom/vim-markdown-preview'
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
"巨漂亮的NerdTree文件名高亮及图标插件
if has('gui_running')
	Plugin 'ryanoasis/vim-devicons'
endif
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
"代码注释
Plugin 'tpope/vim-commentary'
"高亮括号插件
Plugin 'kien/rainbow_parentheses.vim'
call vundle#end()

filetype plugin indent on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"gui配置{
	if has('gui_running')
		set guifont=monaco\ 12   " 设置字体  
		set guioptions-=T           " 隐藏工具栏
		set guioptions-=m           " 隐藏菜单栏
		let g:Work = "~/github"		"设置gvim默认工作目录和换存目录
		function Cw(dir)
			execute ":cd  ".a:dir
		endfunction
		call Cw(Work)
	endif
	if has("multi_byte")
		" UTF-8 编码
		set encoding=utf-8
		set termencoding=utf-8
		set formatoptions+=mM
		set fencs=utf-8,gbk
		if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)'
			set ambiwidth=double
		endif
		if has("win32")
			source $VIMRUNTIME/delmenu.vim
			source $VIMRUNTIME/menu.vim
			language messages zh_CN.utf-8
		endif
	else
		echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
	endif
"}

"<leader>: \
"插件配置
"************************************************************
"easymotion {
	if isdirectory(expand("~/.vim/bundle/vim-easymotion/"))
		map s <Plug>(easymotion-s)
		map S <Plug>(easymotion-sol-bd-jk)
		let g:EasyMotion_smartcase = 1
		map <Leader><Leader>j <Plug>(easymotion-j)
		map <Leader><Leader>k <Plug>(easymotion-k)
		map <Leader><Leader>h <Plug>(easymotion-linebackward)
		map <Leader><Leader>l <Plug>(easymotion-lineforward)
		map <Leader><Leader>. <Plug>(easymotion-repeat)
		" <Leader>f{char} to move to {char}
		map <Leader>f <Plug>(easymotion-bd-f)
		nmap <Leader>f <Plug>(easymotion-overwin-f)
		" s{char}{char} to move to {char}{char}
		nmap s <Plug>(easymotion-overwin-f2)
		" Move to line
		map <Leader>L <Plug>(easymotion-bd-jk)
		nmap <Leader>L <Plug>(easymotion-overwin-line)
		" Move to word
		map <Leader>w <Plug>(easymotion-bd-w)
		nmap <Leader>w <Plug>(easymotion-overwin-w)
	endif
"}

"change-colorcheme {
	if isdirectory(expand("~/.vim/bundle/change-colorscheme/"))
		map <F10> :NextColorScheme<CR>
		imap <F10> <ESC> :NextColorScheme<CR>
		map <F9> :PreviousColorScheme<CR>
		imap <F9> <ESC> :PreviousColorScheme<CR>
	endif
"}

"vim-devicons {
	if isdirectory(expand("~/.vim/bundle/vim-devicons/")) && has('gui_running')
		" loading the plugin
		let g:webdevicons_enable = 1
		" adding the flags to NERDTree
		let g:webdevicons_enable_nerdtree = 1
		" adding the custom source to unite 
		let g:webdevicons_enable_unite = 1
		" adding the column to vimfiler
		let g:webdevicons_enable_vimfiler = 1
		" adding to vim-airline's tabline
		let g:webdevicons_enable_airline_tabline = 1
		" adding to vim-airline's statusline 
		let g:webdevicons_enable_airline_statusline = 1
		" ctrlp glyphs
		let g:webdevicons_enable_ctrlp = 1
		" whether or not to show the nerdtree brackets around flags 
		let g:webdevicons_conceal_nerdtree_brackets = 1
		" the amount of space to use after the glyph character (default ' ')
		let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
		" Force extra padding in NERDTree so that the filetype icons line up vertically
		let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
		" enable folder/directory glyph flag (disabled by default with 0)
		let g:WebDevIconsUnicodeDecorateFolderNodes = 1
		" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
		let g:DevIconsEnableFolderExtensionPatternMatching = 1
		" enable custom folder/directory glyph exact matching 
		" (enabled by default when g:WebDevIconsUnicodeDecorateFolderNodes is set to 1)
		let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1

	endif
"}
"airline {
	if isdirectory(expand("~/.vim/bundle/vim-airline/"))
		" airline
		let g:airline_theme="luna"
		"let g:airline_theme="badwolf"
		let g:airline_powerline_fonts = 1
		"let g:airline_section_b = '%{strftime("%c")}'
		"let g:airline_section_y = 'BN: %{bufnr("%")}'
		let g:airline#extensions#tabline#enabled = 1
		let g:airline#extensions#tabline#left_sep = ' '
		let g:airline#extensions#tabline#left_alt_sep = '|'
		if !exists('g:airline_symbols')
			let g:airline_symbols = {}
		endif
		let g:airline_left_sep = ''
		let g:airline_left_alt_sep = ''
		let g:airline_right_sep = ''
		let g:airline_right_alt_sep = ''
		nnoremap <C-N> :bn<CR>
		nnoremap <C-P> :bp<CR>
	endif
"}

"vim-markdown {
	if isdirectory(expand("~/.vim/bundle/vim-markdown/"))
		let g:markdown_include_jekyll_support = 0
		let g:markdown_enable_folding = 1
		let g:markdown_enable_insert_mode_leader_mappings = 1
		let g:markdown_enable_conceal = 0
	endif
"}

"clang_complete {
	if isdirectory(expand("~/.vim/bundle/clang_complete/"))
		let g:clang_complete_copen=1
		let g:clang_periodic_quickfix=1
		let g:clang_snippets=1
		let g:clang_close_preview=1
		let g:clang_use_library=1
		let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'
	endif
"}

" minimap{
	if isdirectory(expand("~/.vim/bundle/vim-minimap/"))
		nnoremap <F7> :Minimap<CR>
		nnoremap <C-M> :MinimapClose<CR>
		let g:minimap_show='<leader>ms'
		let g:minimap_update='<leader>mu'
		let g:minimap_close='<leader>mc'
		let g:minimap_toggle='<leader>mt'
		let g:minimap_highlight='Visual'
	endif
" }

" NerdTree {
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
		map <silent> <F3> :NERDTreeToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>
        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=1
        let NERDTreeQuitOnOpen=0
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
		"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
		autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg <CR><CR> && exec "redr!"
		"autocmd VimEnter * NERDTree
		autocmd VimEnter * wincmd w
    endif
" }

"vim-nerdtree-syntax-highlight {
	if isdirectory(expand("~/.vim/bundle/vim-nerdtree-syntax-highlight/"))
		"关闭高亮
		"let g:NERDTreeDisableFileExtensionHighlight = 1
		"let g:NERDTreeDisableExactMatchHighlight = 1
		"let g:NERDTreeDisablePatternMatchHighlight = 1
		"高亮文件名
		let g:NERDTreeFileExtensionHighlightFullName = 1
		let g:NERDTreeExactMatchHighlightFullName = 1
		let g:NERDTreePatternMatchHighlightFullName = 1
		"高亮文件夹
		let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
		let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
		"关闭不必要类型文件高亮
		let g:NERDTreeLimitedSyntax = 1
		
		" If you have vim-devicons you can customize your icons for each file type.
		let g:NERDTreeExtensionHighlightColor = {} "this line is needed to avoid error
		let g:NERDTreeExtensionHighlightColor['css'] = '' "assigning it to an empty string will skip highlight
		"定义颜色
		" you can add these colors to your .vimrc to help customizing
		let s:brown = "905532"
		let s:aqua =  "3AFFDB"
		let s:blue = "689FB6"
		let s:darkBlue = "44788E"
		let s:purple = "834F79"
		let s:lightPurple = "834F79"
		let s:red = "AE403F"
		let s:beige = "F5C06F"
		let s:yellow = "F09F17"
		let s:orange = "D4843E"
		let s:darkOrange = "F16529"
		let s:pink = "CB6F6F"
		let s:salmon = "EE6E73"
		let s:green = "8FAA54"
		let s:lightGreen = "31B53E"
		let s:white = "FFFFFF"
		let s:rspec_red = 'FE405F'
		let s:git_orange = 'F54D27'

		let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
		let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

		let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
		let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

		let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
		let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb
	endif
"}

" TagBar {
    if isdirectory(expand("~/.vim/bundle/tagbar/"))
        "nnoremap <silent> <leader>tt :TagbarToggle<CR>
		nnoremap <silent> <F4> :TagbarToggle<CR>
    endif
"}

" Rainbow {
    if isdirectory(expand("~/.vim/bundle/rainbow_parentheses.vim/"))
        let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
		let g:rbpt_max = 16
		let g:rbpt_loadcmd_toggle = 0
		let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['Darkblue',    'SeaGreen3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['gray',        'RoyalBlue3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3'],
			\ ]
		" 不加入这行, 防止黑色括号出现, 很难识别
		" \ ['black',       'SeaGreen3'],
		au VimEnter * RainbowParenthesesToggle
		au Syntax * RainbowParenthesesLoadRound
		au Syntax * RainbowParenthesesLoadSquare
		au Syntax * RainbowParenthesesLoadBraces
    endif
"}

" vim-commentary {
	if isdirectory(expand("~/.vim/bundle/tComment/"))
		"vim-commentary
		"为python和shell等添加注释
		autocmd FileType python,shell,coffee set commentstring=#\ %s
		"修改注释风格
		autocmd FileType java,c,cpp set commentstring=//\ %s
		"使用方法
		"gcc     注释当前行（普通模式）
		"gc      可视模式下，注释当前选中的部分
		"gcu     撤销上一次注释的部分，可以是一行也可以是多行
		"gcgc    撤销注释当前行和邻近的上下两行
	endif
"}

" Functions{
	" Initialize NERDTree as needed {
    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
    " }

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }

    " Shell command {
    function! s:RunShellCommand(cmdline)
        botright new

        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=shell
        setlocal syntax=shell

        call setline(1, a:cmdline)
        call setline(2, substitute(a:cmdline, '.', '=', 'g'))
        execute 'silent $read !' . escape(a:cmdline, '%#')
        setlocal nomodifiable
        1
    endfunction

    command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
" }

" vim-go{
	if isdirectory(expand("~/.vim/bundle/vim-go/"))
		let g:go_fmt_command = "goimports"
		"let mapleader = ','
		" go快捷键,<leader>是默认是\
		let g:go_highlight_functions = 1
		let g:go_highlight_methods = 1
		let g:go_highlight_structs = 1
		let g:go_highlight_operators = 1
		let g:go_highlight_build_constraints = 1
		let g:go_fmt_command = "goimports"
		let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
		let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
		au FileType go nmap <Leader>gil <Plug>(go-implements)
		au FileType go nmap <Leader>gi <Plug>(go-info)
		au FileType go nmap <Leader>gd <Plug>(go-doc)
		au FileType go nmap <Leader>gdv <Plug>(go-doc-vertical)
		au FileType go nmap <leader>gr <Plug>(go-run)
		au FileType go nmap <leader>gb <Plug>(go-build)
		au FileType go nmap <leader>gt <Plug>(go-test)
		au FileType go nmap <leader>gc <Plug>(go-coverage)
		au FileType go nmap <Leader>gds <Plug>(go-def-split)
		au FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
		au FileType go nmap <Leader>gdt <Plug>(go-def-tab)
		au FileType go nmap <Leader>grn <Plug>(go-rename)
	endif
" }


" YouCompleteMe settings{
"安装命令
"./install.sh --clang-completer --go-completer --enable-coverage --js-completer --system-boost --system-libclang
"cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim
	if isdirectory(expand("~/.vim/bundle/YouCompleteMe/"))
		let g:ycm_key_list_select_completion = ['', '']
		let g:ycm_key_list_previous_completion = ['', '']
		let g:ycm_key_invoke_completion = ''

		"youcompleteme  默认tab  s-tab 和自动补全冲突
		let g:ycm_key_list_select_completion=['<c-n>']
		let g:ycm_key_list_select_completion = ['<Down>']
		let g:ycm_key_list_previous_completion=['<c-p>']
		let g:ycm_key_list_previous_completion = ['<Up>']
		let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
		let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
		let g:ycm_min_num_of_chars_for_completion=1	" 从第2个键入字符就开始罗列匹配项
		let g:ycm_server_python_interpreter='/usr/bin/python2'
		let g:ycm_global_ycm_extra_conf='~/.vim/config/ycm_extra_conf.py'
		let g:ycm_cache_omnifunc=1	" 禁止缓存匹配项,每次都重新生成匹配项

		let g:ycm_error_symbol = '>>'
		let g:ycm_warning_symbol = '>*'
		let g:ycm_seed_identifiers_with_syntax = 1
		let g:ycm_complete_in_comments = 1
		let g:ycm_complete_in_strings = 1 

		nnoremap <leader>u :YcmCompleter GoToDeclaration<CR>
		nnoremap <leader>i :YcmCompleter GoToDefinition<CR>
		nnoremap <leader>o :YcmCompleter GoToInclude<CR>
		
		let g:ycm_collect_identifiers_from_tags_files = 1
		" let g:ycm_semantic_triggers = {} 
		let g:ycm_semantic_triggers =  {
		  \   'c' : ['->', '.','re![_a-zA-z0-9]'],
		  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
		  \             're!\[.*\]\s'],
		  \   'ocaml' : ['.', '#'],
		  \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
		  \   'perl' : ['->'],
		  \   'php' : ['->', '::'],
		  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
		  \   'ruby' : ['.', '::'],
		  \   'lua' : ['.', ':'],
		  \   'erlang' : [':'],
		  \ }
		let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&',']']
	endif
" }


"窗口跳转 {
	"Ctrl-h 切换到左侧的分割窗口
	"Ctrl-j 切换到下方的分割窗口
	"Ctrl-k 切换到上方的分割窗口
	"Ctrl-l 切换到右侧的分割窗口
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>
"}


au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*go,*hpp,*cpp,*.sh match BadWhitespace /\s\+$/

" PyMode {
" Disable if python support not present
    if !has('python') && !has('python3')
        let g:pymode = 0
    endif
    if isdirectory(expand("~/.vim/bundle/python-mode"))
        let g:pymode_lint_checkers = ['pyflakes']
        let g:pymode_trim_whitespaces = 0
        let g:pymode_options = 0
        let g:pymode_rope = 0
    endif
" }
"python虚拟环境支持
py << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" 设置tab
au BufRead,BufNewFile *py,*pyw,*.c,*.h,*go,*hpp,*cpp set tabstop=4

"缩进空格
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

"原谅绿高亮多余空格 
highlight BadWhitespace ctermbg=green guibg=green

" Display tabs at the beginning of a line in Python mode as bad.
"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*go,*hpp,*cpp match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw set textwidth=100

" 使用 UNIX (\n) 行结尾，dos会有^M.
au BufNewFile *.py,*.pyw,*.c,*.h,*go,*hpp,*cpp set fileformat=unix
let python_highlight_all=1

"设置十字标H
set ruler
"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd         " 输入的命令显示出来，看的清楚些  
set showmode
set cursorcolumn
set cursorline
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=black guifg=red
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=black guifg=red

"搜索相关
nnoremap / /
nnoremap ? /
nnoremap <leader>vr :.,$s//gec<left><left><left><left>
xnoremap <leader>vr "ty:.,$s/<c-r>t//gec<left><left><left><left>
nnoremap <leader>zr :.,$s//gec<left><left><left><left>\<<c-r><c-w>\>/
xnoremap <leader>zr "ty:.,$s/\<<c-r>t\>//gec<left><left><left><left>
nnoremap <leader>v/ :%s///gn<left><left><left><left>
