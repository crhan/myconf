"设置菜单为英文
set langmenu=en_US
let $LANG='en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set nocompatible  "关闭与VI的兼容
set nu!   "打开行号
set wrap       "自动折行
"开启语法高亮设置
if !exists("syntax_on")
syntax on
endif
set filetype=c      "设置默认语言为C
set tabstop=4       "设置tab距离为4
set softtabstop=4
set shiftwidth=4    "换行时行间交错使用4个空格
set expandtab
set cindent         "使用C语言的对齐方式
set smartindent     "智能对齐方式
set autoindent      "自动对齐,使用上一行的对齐方式
set ai!             "设置自动缩进
set nocp            "使可以使用backspace
set backspace=indent,eol,start  "使以前的字符也能使用backspace
set ignorecase      "搜索时不区分大小写  set noic为区分
" colorscheme darkgreen "主题颜色类型
set ruler           "在编辑过程中，在右下角显示光标位置的状态行
set showmatch       "设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set incsearch       "搜索自动定位
set hlsearch        "高亮搜索
set autochdir       "自动切换工作目录
"set lines=38 columns=135 "设置窗口大小
set cmdheight=1     "设置cmd窗口的大小
""""""""""""""""""""""'
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
    exec "w"
    exec "!g++ % -o %<"
    exec "! ./%<"
    endfunc
" 设置使用空格折叠
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

set formatoptions=tcrqn


" php文件自动增加php函数字典
au FileType php call AddPHPFuncList()
function AddPHPFuncList()
    set dict+=~/.vim/dictionary/php.list
    set complete +=k
endfunction

filetype plugin on
filetype plugin indent on

"ragtag config
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

