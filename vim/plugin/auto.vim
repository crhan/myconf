"---------------------------------------------------------------------------
"    Description:  Programming Automation
"    Help:         F2 key or "mm" to compile and debug
"    Author:       ywgx.ch@gmail.com
"    Version:      1.7
"    License:      GPL v2.0
"---------------------------------------------------------------------------
set autoindent smartindent nocp
set exrc ts=4 sw=4 backspace=2 softtabstop=4
set nu cin magic showmode hlsearch incsearch wildmenu
im  ,, <ESC>
im  ;; <ESC>
map <Up>   gk
map <Down> gj
no! <M-k> <Up>
no! <M-j> <Down>
no! <M-h> <left>
no! <M-l> <Right>
nm <silent> ;; :q<CR>
nm <silent> ,, :wqa<CR>
au FileType python,ruby :call Py()
au FileType cpp,c,cc,h :call Cc()
func Py()
	nm mm :call CR1()<CR>
	im mm <ESC>
	im <F2> <ESC>
	if exists("$DISPLAY")
		nm <F2> :call CR()<CR>
	else
		nm <F2> :call CR1()<CR>
	en
endf
func Cc()
	ino , ,<space>
	ino ; ;<space>
	ino <= <space><=<space>
	ino *= <space>*=<space>
	ino /= <space>/=<space>
	ino >> <space>>><space>
	ino << <space><<<space>
	ino >= <space>>=<space>
	ino == <space>==<space>
	ino += <space>+=<space>
	ino && <space>&&<space>
	ino != <space>!=<space>
	nm<Space> i<Space> <Esc>l
	im<silent> mm <ESC>A;<ESC>
	im<silent> nn <ESC>A;<ESC>o
	nm<silent> # :<esc>i<esc>i#
	if exists("$DISPLAY")
		nm<F2> :call CR()<CR><CR>
		im<F2> <ESC> :call CR()<CR><CR>
		nm mm :call CR1()<CR><CR>
	else
		nm<F2> :call CR1()<CR>
		im<F2> <ESC> :call CR1()<CR>
		nm mm :call CR1()<CR>
	en
	nm<silent> ca I/*<ESC><left>A<ESC><left>
	nm<silent> cd :s/\/\*//g<cr><ESC>:s/\*\///g<cr><ESC>
endf
func CR()
	exe "w"
	if &filetype == 'c'
		exe "!gcc -Wall % -o %<"
		exe "!clear;./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'cpp'
		exe "!g++ -Wall % -o %<"
		exe "!clear;./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'python'
		exe "!clear;python %"
	elsei &filetype == 'ruby'
		exe "!clear;ruby  %"
	elsei &filetype == 'sh'
		exe "!clear;bash %"
	elsei &filetype == 'pl'
		exe "!clear;perl %"
	en
endf
func CR1()
	exe "w"
	if &filetype == 'c'
		exe "!gcc -Wall % -o %<"
		exe "!./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'cpp'
		exe "!g++ -Wall % -o %<"
		exe "!./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'python'
		exe "!python %"
	elsei &filetype == 'ruby'
		exe "!ruby  %"
	elsei &filetype == 'sh'
		exe "!bash %"
	elsei &filetype == 'pl'
		exe "!perl %"
	en
endf
