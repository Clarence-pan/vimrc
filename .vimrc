" VIM使用技巧
" ==============
" :e #n      -- 编辑buffer中的第n个文件，可以通过:ls查看buffer列表
"
"
" 配置
" ==================== 
"Tlist -- tag list
let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的    
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim   
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联  

" line number
set nu 								"显示行号number

" intend and tabstop
"设置缩进有三个取值cindent(c风格)、smartindent(智能模式，其实不觉得有什么智能)、autoindent(简单的与上一行保持一致) 
set autoindent                      "自动缩进
"set cindent 
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
set go= 

"打开语法高亮 
syntax on 

"在windows版本中vim的退格键模式默认与vi兼容，与我们的使用习惯不太符合，下边这条可以改过来 
set backspace=indent,eol,start 

"用空格键替换制表符 
"set expandtab  " 暂时不要扩展

"有时中文会显示乱码，用一下几条命令解决 
"set encoding=utf-8
"let &termencoding=&encoding 
"set termencoding=cp
"set fileencodings=utf-8,gbk 
set fileencodings=utf-8
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

" mini buffer 插件配置
" --------------------
" mini buffer 可以将当前编辑的多个文件都列在顶部，像tab一样
" 按键：
"    <c-tab> / <c-s-tab>  - 切换buffer窗口
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Mark 插件
" --------------
"  Mark 插件可以高亮当前行
"  按键：
"  		(<Leader>一般是\)
"    <Leader>m   切换高亮（匹配光标下的文字）
"    <Leader>r   切换高亮（使用正则匹配）
map <F8> <Plug>MarkSet


" Grep 插件     -- wtf: grep还没有vimgrep好用
" ----------------
"  Grep 用来在工程文件中搜索
"  vim有自己的查找功能, 但是跟shell中的grep比起来还是有些差距的, 有时Coding正火急火燎的时候, 真想按下F3, 对光标所在的词来个全工程范围的grep, 不用敲那些繁琐的命令, 现在福音来了, 跟我同样懒的人不在少数, 在grep.vim脚本的前部可以找到一些说明文档:
"  :Grep	按照指定的规则在指定的文件中查找
"  :Rgrep	同上, 但是是递归的grep
"  :GrepBuffer	在所有打开的缓冲区中查找
"  :Bgrep	同上
"  :GrepArgs	在vim的argument filenames (:args)中查找
"  :Fgrep	运行fgrep
"  :Rfgrep	运行递归的fgrep
"  :Egrep	运行egrep
"  :Regrep	运行递归的egrep
"  :Agrep	运行agrep
"  :Ragrep	运行递归的agrep
"  上面的命令是类似这样调用的:
"  :Grep   [<grep_options>] [<search_pattern> [<file_name(s)>]]
"  :Rgrep  [<grep_options>] [<search_pattern> [<file_name(s)>]]
"  :Fgrep  [<grep_options>] [<search_pattern> [<file_name(s)>]]
"  :Rfgrep [<grep_options>] [<search_pattern> [<file_name(s)>]]
"  :Egrep  [<grep_options>] [<search_pattern> [<file_name(s)>]]
"  :Regrep [<grep_options>] [<search_pattern> [<file_name(s)>]]
"  :Agrep  [<grep_options>] [<search_pattern> [<file_name(s)>]]
"  :Ragrep [<grep_options>] [<search_pattern> [<file_name(s)>]]
"  :GrepBuffer [<grep_options>] [<search_pattern>]
"  :Bgrep [<grep_options>] [<search_pattern>]
"  :GrepArgs [<grep_options>] [<search_pattern>]
map <F3>    <esc>:Grep<cr>
map <s-F3>  <esc>:Rgrep<cr>
map <a-F3>  <esc>:GrepBuffer<cr>


" 自定义键映射
" -----------------
"  打开windows下的vim配置文件
map <F12> :e ~/_vimrc<cr>
"  切换窗口
map <F4>   <esc><c-w>j
map <s-F4> <esc><c-w>k
"  兼容windows风格的保存
map <c-s>  <esc>:w<cr>
"  快速向下翻页
map <a-space> <esc><c-d>
map <s-space> <esc><c-u>

" 调试期间为了方便查找vim的tag
set tags=./tags,tags,d:\software\vim\vimfiles\tags

" 文件浏览器和tag列表
let g:winManagerWindowLayout='FileExplorer|TagList'


" 帮助语言中文
set helplang=cn


