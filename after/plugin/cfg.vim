let g:mapleader = ' '
set number
set sw=4 ts=4 noet tw=80 cc=80
set spr sb
set pb=12 winbl=12
set nowrap
set ruler
set background=dark
set autoread
set formatoptions+=j
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set gfn=Fira\ Code:h12
set noshowmode

if !has('gui_running')
	colorscheme dim
else
	colorscheme monochrome
endif
