" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

" set background=dark
hi clear Normal
set bg&
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "tom_default"
" hi Normal		guifg=cyan			guibg=black
hi Comment	term=bold		ctermfg=DarkCyan		guifg=DarkGreen
hi Constant	term=underline	ctermfg=Magenta		guifg=Red
hi Special	term=bold		ctermfg=DarkMagenta	guifg=SlateBlue
hi Identifier term=underline	cterm=bold			ctermfg=Cyan guifg=Brown
hi Statement term=bold		ctermfg=Yellow gui=bold	guifg=Blue
hi PreProc	term=underline	ctermfg=LightBlue	guifg=Blue
hi Type	term=underline		ctermfg=LightGreen	guifg=Blue gui=bold


" Common groups that link to default highlighting.
" You can specify other highlighting easily.
" hi link String	Constant
" hi link Character	Constant
" hi link Number	Constant
" hi link Boolean	Constant
" hi link Float		Number
" hi link Conditional	Repeat
" hi link Label		Statement
" hi link Keyword	Statement
" hi link Exception	Statement
" hi link Include	PreProc
" hi link Define	PreProc
" hi link Macro		PreProc
" hi link PreCondit	PreProc
" hi link StorageClass	Type
" hi link Structure	Type
" hi link Typedef	Type
" hi link Tag		Special
" hi link SpecialChar	Special
" hi link Delimiter	Special
" hi link SpecialComment Special
" hi link Debug		Special

