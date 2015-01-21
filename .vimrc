"Tlist -- tag list
let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的    
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim   
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联  

" line number
set nu 								"显示行号number

" intend and tabstop
"设置缩进有三个取值cindent(c风格)、smartindent(智能模式，其实不觉得有什么智能)、autoindent(简单的与上一行保持一致) 
"set autoindent                      "自动缩进
set cindent 
set shiftwidth=4					"4个空格缩进
set tabstop=4						"tab为4个空格
set nolist							"不显示tab和控制字符 


set showmatch						"显示匹配（的括号等)

" 搜索
" search
set incsearch 						"增量式搜索，更方便
"高亮搜索 
set hlsearch 

" 配色
" color
colorscheme delek 

"传说中的去掉边框用下边这一句 
"set go= 

"打开语法高亮 
syntax on 

"在windows版本中vim的退格键模式默认与vi兼容，与我们的使用习惯不太符合，下边这条可以改过来 
set backspace=indent,eol,start 

"用空格键替换制表符 
"set expandtab  " 暂时不要扩展

"有时中文会显示乱码，用一下几条命令解决 
let &termencoding=&encoding 
set fileencodings=utf-8,gbk 
"很多插件都会要求的配置检测文件类型 
:filetype on 
:filetype plugin on 
:filetype indent on 

"下边这个很有用可以根据不同的文件类型执行不同的命令 
"例如：如果是c/c++类型 
:autocmd FileType c,cpp : set foldmethod=syntax 
:autocmd FileType c,cpp :set number 
:autocmd FileType c,cpp :set cindent 
"例如：如果是python类型 
:autocmd FileType python :set number 
:autocmd FileType python : set foldmethod=syntax 
:autocmd FileType python :set smartindent 


"真的很smart,
"搜索时全小写相当于不区分大小写，只要有一个大写字母出现，则区分大小写
""simple idea, great achievement!
set ignorecase smartcase

"启动gVIM时最大化
au GUIEnter * simalt ~x


"默认字体为Lucida Console，字体大小为11，粗体（个人认为比Fixsys爽一点）
set guifont=Lucida_Console

"mini buffer 插件配置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1




" 帮助语言中文
set helplang=cn



