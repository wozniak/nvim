" Vim color scheme
"
" Name:			 monochrome.vim
" Maintainer:	 Xavier Noria  <fxn@hashref.com>
" Modifications: Michael Smith <mikesmiffy128@gmail.com>
" License:		 MIT

set bg=dark

" TODO: make non-C stuff even less colourful

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'monochrome'

let s:white		= ['White', 15]
let s:black		= ['#06060a', 16]
let s:bgray		= ['#181818', 233]
let s:lgray		= ['LightGray', 255]
let s:cgray		= ['#737373', 243]
let s:dgray		= ['DarkGray', 248]
let s:sblue		= ['#778899', 67]
let s:sgreen	= ['#669988', 67]
let s:yellow	= ['Yellow', 226]
let s:red		= ['#b6403a', 160]
let s:green		= ['#478226', 28]
let s:purple	= ['#a652c6', 28]

let s:italic	= 'italic'
let s:bold		= 'bold'
let s:underline	= 'underline'
let s:none		= 'NONE'
let s:cnone		= [s:none, s:none]

let s:default_fg = s:lgray
" For slight terminal transparency, configure the terminal background to be the
" same - or whatever is actually desired.
" let s:default_bg = s:cnone
let s:default_bg = s:black

function! s:hi(...)
	let group = a:1
	let fg = get(a:, 2, s:cnone)
	let bg = get(a:, 3, s:cnone)
	let attr = get(a:, 4, s:none)
	let cmd = ['hi', group]
	call add(cmd, 'guifg='.fg[0])
	call add(cmd, 'ctermfg='.fg[1])
	call add(cmd, 'guibg='.bg[0])
	call add(cmd, 'ctermbg='.bg[1])
	call add(cmd, 'gui='.attr)
	call add(cmd, 'cterm='.attr)
	exec join(cmd, ' ')
endfunction

" Vim interface
call s:hi('Normal', s:default_fg, s:default_bg)
call s:hi('Cursor', s:black, s:lgray)
call s:hi('CursorLine', s:cnone, s:bgray)
call s:hi('CursorLineNr', s:white, s:default_bg, s:bold)
call s:hi('ColorColumn', s:cnone, s:bgray)
call s:hi('Search', s:white, s:sblue)
call s:hi('Visual', s:white, s:sblue)
call s:hi('ErrorMsg', s:white, s:red)
call s:hi('NonText', s:sblue)
call s:hi('FoldColumn', s:dgray)
call s:hi('Folded')
call s:hi('LineNr', s:dgray)
call s:hi('SpecialKey', s:sblue, s:default_bg, s:bold)
call s:hi('Directory', s:white, s:default_bg, s:bold)
call s:hi('helpSpecial')
call s:hi('helpHyperTextJump', s:sblue, s:default_bg, s:underline)
call s:hi('helpNote')
call s:hi('Pmenu', s:white, s:sblue)
call s:hi('PmenuSel', s:sblue, s:white)
call s:hi('Todo', s:white, s:cnone, s:bold.','.s:italic)
call s:hi('SignColumn', s:black, s:bgray)
call s:hi('VertSplit')
call s:hi('Pmenu', s:default_fg, s:bgray)

" Programming languages
call s:hi('Statement', s:cnone, s:cnone, s:bold)
call s:hi('PreProc', s:cnone, s:cnone, s:italic)
call s:hi('String', s:sgreen)
call s:hi('Comment', s:white, s:default_bg, s:bold)
call s:hi('Constant', s:cnone, s:cnone, s:bold)
call s:hi('Type')
call s:hi('Function')
call s:hi('Identifier')
call s:hi('Special')
call s:hi('MatchParen', s:cnone, s:sblue)

" VimL
call s:hi('vimOption')
call s:hi('vimGroup')
call s:hi('vimHiClear')
call s:hi('vimHiGroup')
call s:hi('vimHiAttrib')
call s:hi('vimHiGui')
call s:hi('vimHiGuiFgBg')
call s:hi('vimHiCTerm')
call s:hi('vimHiCTermFgBg')
call s:hi('vimSynType')
hi link vimCommentTitle Comment

" Ruby
call s:hi('rubyConstant')
call s:hi('rubySharpBang', s:cgray)
call s:hi('rubyStringDelimiter', s:sblue)
call s:hi('rubyStringEscape', s:sblue)
call s:hi('rubyRegexpEscape', s:sblue)
call s:hi('rubyRegexpAnchor', s:sblue)
call s:hi('rubyRegexpSpecial', s:sblue)

" Elixir
call s:hi('elixirAlias')
call s:hi('elixirDelimiter', s:sblue)
call s:hi('elixirSelf')
call s:hi('elixirOperator') " For ||, ->, etc.
hi link elixirVariable Statement " Module attributes like @doc or @type.
" While rendered as comments in other languages, docstrings are strings,
" experimental.
hi link elixirDocString String
hi link elixirDocTest String
hi link elixirStringDelimiter String

" Perl
call s:hi('perlSharpBang', s:cgray)
call s:hi('perlStringStartEnd', s:sblue)
call s:hi('perlStringEscape', s:sblue)
call s:hi('perlMatchStartEnd', s:sblue)

" Python
call s:hi('pythonEscape', s:sblue)

" JavaScript
call s:hi('javaScriptFunction', s:white, s:default_bg, s:bold)

" Diffs and Signify columns
call s:hi('diffFile', s:cgray)
call s:hi('diffNewFile', s:cgray)
call s:hi('diffIndexLine', s:cgray)
call s:hi('diffLine', s:cgray)
call s:hi('diffSubname', s:cgray)
call s:hi('diffAdded', s:white, s:green)
call s:hi('DiffAdd', s:white, s:green)
call s:hi('diffRemoved', s:white, s:red)
call s:hi('DiffDelete', s:white, s:red)
call s:hi('DiffChange', s:white, s:purple)

" Markdown
call s:hi('Title', s:white, s:default_bg, s:bold)
call s:hi('markdownHeadingDelimiter', s:white, s:default_bg, s:bold)
call s:hi('markdownHeadingRule', s:white, s:default_bg, s:bold)
call s:hi('markdownLinkText', s:sblue, s:default_bg, s:underline)

" vim-fugitive
call s:hi('gitcommitComment', s:default_fg, s:default_bg)
call s:hi('gitcommitOnBranch', s:default_fg, s:default_bg)
call s:hi('gitcommitBranch', s:sblue, s:default_bg)
call s:hi('gitcommitHeader', s:white, s:default_bg, s:bold)
call s:hi('gitcommitSelected', s:default_fg, s:default_bg)
call s:hi('gitcommitDiscarded', s:default_fg, s:default_bg)
call s:hi('gitcommitSelectedType', s:default_fg, s:default_bg)
call s:hi('gitcommitDiscardedType', s:default_fg, s:default_bg)

" NeoMake
call s:hi('NeomakeMessageSign')
call s:hi('NeomakeWarningSign', s:sblue)
call s:hi('NeomakeErrorSign', s:yellow)
call s:hi('NeomakeInfoSign')
call s:hi('NeomakeError', s:yellow)
call s:hi('NeomakeInfo', s:default_fg, s:default_bg, s:bold)
call s:hi('NeomakeMessage')
call s:hi('NeomakeWarning', s:yellow)

" vi: sw=4 ts=4 noet tw=80 cc=80
