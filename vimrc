" Make space more useful
let mapleader = ","
let maplocalleader = "\\"
" window maximize
nnoremap <c--> <c-w><c-o>
" make tab 4 spaces
set tabstop=4 shiftwidth=4 expandtab

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave 
set encoding=utf-8
mapc
noremap <c-n> :NERDTreeToggle<cr>
filetype plugin on
let Tlist_Ctags_Cmd ='c:\program Files (x86)\Vim\vim80\bundle\taglist_46\ctags.exe'
color slate
execute pathogen#infect()
nnoremap <leader>q :call QuickfixToggle()<cr>
let g:quickfix_is_open=0
function! QuickfixToggle()

	if g:quickfix_is_open
		cclose
		let g:quickfix_is_open=0
      else
		copen
		let g:quickfix_is_open=1
	endif
endfunction
nnoremap <leader>f :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
	if &foldcolumn
		setlocal foldcolumn=0
	else
		setlocal foldcolumn=4
	endif
endfunction
augroup filetype_related
	autocmd!
autocmd FileType vim nnoremap <buffer> <localleader>c I'<esc>
autocmd FileType python :iabbrev <buffer> iff if:<left>
autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
augroup END
nnoremap H 0
nnoremap L $
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
inoremap <leader>" <esc>bi"<esc>ei<right>"

iabbrev tpye type
iabbrev @@ 2598050381@qq.com
iabbrev ccopy Copyright 2017 Zhang Xian, all rights reserved.
iabbrev ssig -- <cr>Zhang Xian<cr>2598050381@qq.com
" commonly auto correction and some aliases

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" for quickly edit and sourcing vimrc file
noremap <leader>- ddp
noremap <leader>_ ddP
inoremap <c-u> <esc>viWU<esc>Ei<right>
nnoremap <leader><c-u> viWU<esc>El

nnoremap gt <c-w><c-w>
nnoremap gT <c-w>W
" for quick window switching
inoremap jk <esc>
vnoremap jk <esc>
cnoremap jk <esc> 
" for quickly quit to normal mode
nnoremap <space> za
" for making folding unfolding nice
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
" swap the up/down real lines and display lines in normal mode
nnoremap K kJ
" K as join the current line with above line	
nnoremap x "_x
nnoremap X "_D
nnoremap xx "_dd
" shortcut for delete things into blackhole register

set nu
set relativenumber
set numberwidth=4
set matchtime=5
set wrap
cnoremap <esc> <nop>
vnoremap <esc> <nop>
inoremap <esc> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
" for disable arrow and esc keys 

set diffexpr=MyDiff()
function MyDiff()
let opt = '-a --binary '
if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
let arg1 = v:fname_in
if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
let arg2 = v:fname_new
if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
let arg3 = v:fname_out
if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
if $VIMRUNTIME =~ ' '
if &sh =~ '\<cmd'
if empty(&shellxquote)
let l:shxq_sav = ''
set shellxquote&
endif
let cmd = '"' . $VIMRUNTIME . '\diff"'
else
let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
endif
else
let cmd = $VIMRUNTIME . '\diff'
endif
silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

