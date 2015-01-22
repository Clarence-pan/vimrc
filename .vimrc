" VIM使用技巧
" ==============
" :e #n      -- 编辑buffer中的第n个文件，可以通过:ls查看buffer列表
" * / #      -- 快速查找位于光标位置的单词（全词匹配）。
" g~w        -- 切换大小写至单词结束
"
" 补全
" -----
"  <c-n>
"  <c-p>       -- 这两个是字典补全
"
" 查找
" -----
"  :vimgrep /pattern/gj path/to/files 
"
" 切换大小写
" ------------
"  <visual-mode>:   u -> 小写 U -> 大写
"
"
" 配置
" ==================== 
" windows or linux?
if has('unix')
	let g:isLinux=1
	let g:isWindows=0
else
	let g:isLinux=0
	let g:isWindows=1
endif

"Tlist -- tag list
let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的    
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim   
"let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联  
"let Tlist_Ctags_Cmd='d:\usr\bin\ctags.exe' " for windows
let Tlist_Ctags_Cmd='ctags' " for windows
let Tlist_Auto_Highlight_Tag=0       " 不要自动去高亮当前的tag

" line number
set nu 								"显示行号number
set rnu 							"relative number

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
colorscheme desert

"传说中的去掉边框用下边这一句 
set go= 

"打开语法高亮 
syntax on 

"在windows版本中vim的退格键模式默认与vi兼容，与我们的使用习惯不太符合，下边这条可以改过来 
set backspace=indent,eol,start 

"用空格键替换制表符 
"set expandtab  " 暂时不要扩展

"有时中文会显示乱码，用一下几条命令解决 
" Vim 有四个跟字符编码方式有关的选项，encoding、fileencoding、fileencodings、termencoding (这些选项可能的取值请参考 Vim 在线帮助 :help encoding-names)，它们的意义如下:
" 
"    encoding: Vim 内部使用的字符编码方式，包括 Vim 的 buffer (缓冲区)、菜单文本、消息文本等。
"    fileencoding: Vim 中当前编辑的文件的字符编码方式，Vim 保存文件时也会将文件保存为这种字符编码方式 (不管是否新文件都如此)。
"    fileencodings: Vim 启动时会按照它所列出的字符编码方式逐一探测即将打开的文件的字符编码方式，并且将 fileencoding 设置为最终探测到的字符编码方式。因此最好将 Unicode 编码方式放到这个列表的最前面，将拉丁语系编码方式 latin1 放到最后面。
"    termencoding: Vim 所工作的终端 (或者 Windows 的 Console 窗口) 的字符编码方式。这个选项在 Windows 下对我们常用的 GUI 模式的 gVim 无效，而对 Console 模式的 Vim 而言就是 Windows 控制台的代码页，并且通常我们不需要改变它。
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
language messages en_US.utf-8
set langmenu=en_US
let $LANG='en_US.utf-8'
let LANG='en_US.utf-8'

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
noremap <F8> <Plug>MarkSet


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
noremap <F3>    <esc>:Grep<cr>
noremap <s-F3>  <esc>:Rgrep<cr>
noremap <a-F3>  <esc>:GrepBuffer<cr>




" 自定义键映射
" -----------------
"  打开windows下的vim配置文件
noremap <leader>er :split $MYVIMRC<cr>20<C-w>+
noremap <F12> :split $MYVIMRC<cr>20<C-w>+
noremap <leader>sr :source $MYVIMRC<cr>
"  切换窗口
noremap <F4>   <esc><c-w>j
noremap <s-F4> <esc><c-w>k
noremap <F6>   <esc><c-w>w
noremap <s-F6> <esc><c-w>p
noremap <a-F6>   <esc><c-w>h
noremap <a-s-F6> <esc><c-w>l

"  切换tag list窗口
noremap <c-F6> <esc>:Tlist<cr>

"  关闭当前窗口
noremap <c-F4> <esc><c-w>c

"  调出符号ts命令
noremap <c-N> <esc>:ts 

"  兼容windows风格的保存
noremap <c-s>  <esc>:w<cr>
"  快速向下翻页
nmap <a-space> <esc><c-d>
nmap <space> <esc><c-d>
nmap <s-space> <esc><c-u>
nmap <c-space> <esc><c-u>

"  git operations
nnoremap \gd :! git diff %<cr>
nnoremap \gc :! git commit %<cr>

" 调试期间为了方便查找vim的tag
set tags=./tags,tags,d:\software\vim\vimfiles\tags

" 文件浏览器和tag列表
let g:winManagerWindowLayout='FileExplorer|TagList'


" 帮助语言中文
set helplang=cn


