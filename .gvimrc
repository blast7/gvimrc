set nocp
filetype indent plugin on
set nu
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set shiftround
set hlsearch incsearch


" Key Mappings ---------------------- {{{
noremap <leader>eg :sp $MYGVIMRC<cr>
noremap <leader>sg :source $MYGVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>el
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>el
nnoremap <leader>w :match Error /\v\s+$/<cr>
nnoremap <leader>ww :match None<cr>
" nnoremap <leader>g :silent execute "grep! -r " . shellescape(expand("<cword>")) . " ." <cr>:copen<cr>
nnoremap <leader>n :cnext<cr>
nnoremap <leader>b :cprevious<cr>
nnoremap / /\v
noremap <leader>hl :nohlsearch<cr>
inoremap <C-u> <esc>viwUA
nnoremap <C-s> :w<CR>
inoremap <C-s> <esc>:w<CR>a
vnoremap <C-s> <esc>:w<CR>v
nnoremap <leader>h 0
nnoremap <leader>l $
vnoremap <leader>h 0
vnoremap <leader>l $
vnoremap / y<cr>/\v<C-R>"<cr>
vnoremap <C-f> y<cr>/\v<C-R>"<CR>
vnoremap <C-c> "ay
vnoremap <C-v> "ap
noremap <C-c> "ay
noremap <C-v> "ap
inoremap <C-v> <C-o>:set paste<CR><C-i><C-R>"<C-o>:set nopaste<CR><C-i>
inoremap <C-z> <esc>ua
"inoremap <C-f> y<esc>/\v<C-R>"  
vnoremap <tab> >gv
vnoremap <S-tab> <gv

" For omnicppcomplete and source explorer (and Vim supporting tags in general)
" things will work best if we build tags files in every directory from
" devel/src and below. The root tags file will only contain non-static
" references. However, because of the way ctags recurses you will want to
" build the tags files for each of the subdirectories first and then build the
" non-static tags file at the root last (so it overwrites the empty one
" created by the recursive call to ctags). For the recursive call I have
" created a script /usr/local/bin/dirtags that can be used with find like this:
" cd <showstore view>/devel/src
" find * -type d -exec dirtags {} \;
" Then run the following to build the root file:
" ctags --file-scope=no -R
"
" This may look confusing since the root ctags file is being created with the
" '-R' option which recurses through every subdirectory. However it builds a
" single large tags file in the root directory that has references to every
" non-static element in every sub directory. This file may include duplicate
" entries depending on the source files. The dirtags scirpt builds a tags file
" in the passed in directory ONLY for source files in that passed in
" directory. So the call to 'find' will send every line of it's output as an
" argument to dirtags. 
"
" I should probably write a script that changes directories to the devel/src
" of the given showstore view and also runs the find... command written above
" so that I can map this to a key command in Vim or run it from the command
" line

" rebuild ctags file in parent directory of the current buffer
nnoremap ,t :!(cd %:p:h;ctags *.[ch])& 

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>     
onoremap an( :<c-u>normal! f(vt)l<cr>
onoremap al( :<c-u>normal! F)vT(h<cr>

noremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
noremap <silent> <F6> :TlistToggle<CR>
" noremap <F7> :IDE ~/.imbengine_dev<CR>
nnoremap <F8> :SrcExplToggle<CR>

nnoremap <silent> <C-Space> :call ShiftWordInSpace(1)<CR>
nnoremap <silent> <C-BS> :call ShiftWordInSpace(-1)<CR>
nnoremap <silent> \cw :call CenterWordInSpace()<CR>
nnoremap <silent> \va :call AlignWordWithWordInPreviousLine()<CR>
" }}}

" Abbreviations ------------------------------------------------- {{{
augroup filetype_c
    autocmd!
    autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType c iabbrev <buffer> iff if( )<cr>{<cr><cr>}<esc>kkkllli
    autocmd FileType c iabbrev <buffer> ife if( )<cr>{<cr><cr>}<cr>else<cr>{<cr><cr>}<esc>kkkkkkkllli
    autocmd FileType c iabbrev <buffer> ifei if( )<cr>{<cr><cr>}<cr>else if(  )<cr>{<cr><cr>}<esc>kkkkkkkllli
augroup END

augroup filetype_cpp
    autocmd!
    autocmd FileType cpp nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType cpp iabbrev <buffer> iff if( )<cr>{<cr><cr>}<esc>kkkllli
    autocmd FileType cpp iabbrev <buffer> ife if( )<cr>{<cr><cr>}<cr>else<cr>{<cr><cr>}<esc>kkkkkkkllli
    autocmd FileType cpp iabbrev <buffer> ifei if( )<cr>{<cr><cr>}<cr>else if(  )<cr>{<cr><cr>}<esc>kkkkkkkllli
augroup END

let g:dim = [ '3840' ]
autocmd VimEnter * call s:SetWindowSize() 

iabbrev adn and
iabbrev waht what
iabbrev their thier
iabbrev recieve receive
" }}}

" Source Explorer Config ---------------------- {{{
let g:SrcExpl_winHeight = 8 
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>" 
let g:SrcExpl_pluginList = [
	\ "__Tag_List__",
	\ "__IDE_Project__",
	\ "_NERD_tree_",
	\ "BufExplorer",
	\ "Source_Explorer"
	\ ]
let g:SrcExpl_searchLocalDef = 1 
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
let g:SrcExpl_updateTagsKey = "<F11>" 
let g:SrcExpl_prevDefKey = "<F3>" 
let g:SrcExpl_nextDefKey = "<F4>"
" }}} 

" IDE Config ---------------------- {{{
let g:IDE_AdvancedFlags 	= "+fMOSTw"
let g:IDE_ProjectFlags 		= "FgimnsSt"
let g:IDE_IconFolder 		= "~/.vim/icons"
let g:IDE_WindowIncrement 	= 0
if g:dim[0] <= 1960
    let g:IDE_WindowWidth = 50
else
    let g:IDE_WindowWidth = 150
endif 
let g:IDE_MapProjectToggle 	= '<F12>'
let g:IDE_MapMove2RightTab 	= '<C-Right>'
let g:IDE_MapMove2LeftTab 	= '<C-Left>'
let g:IDE_MapMakeMainTarget_1 	= '<F7>r'
let g:IDE_MapMakeMainTarget_2 	= '<F7>d'
let g:IDE_MapMakeMainTarget_3 	= '<F7>c'
let g:IDE_MapMakeThisTarget_1 	= '<C-F7>r'
let g:IDE_MapMakeThisTarget_2 	= '<C-F7>d'
let g:IDE_MapMakeThisTarget_3 	= '<C-F7>c'
let g:IDE_SyntaxScriptFolder = "~/code/gvim-config-files"
let g:IDE_AdditionalCTagsFiles = '~/code/cpp_src/tags,~/code/cpp_src/boost_tags'
" }}}

" Taglist Config ----------------------------- {{{
" let g:Tlist_Auto_Open = 1
let g:Tlist_Show_One_File = 1
let g:Tlist_Sort_Type = "name"
" let g:Tlist_Use_Right_Window = 0
let g:Tlist_Show_Menu = 1
let g:Tlist_Inc_WinWidth = 1
let g:Tlist_WinWidth = 86
let g:Tlist_Process_File_Always = 1
" }}}

" Custom Syntax Highlighting
color tom_default

command! -nargs=0 -range=% SortByLength <line1>,<line2>call QSort('CmpByLineLengthNname', 1)
command! -nargs=0 -range=% RSortByLength <line1>,<line2>call QSort('CmpByLineLengthNname', -1)
command! -nargs=0 -range=% SortJavaImports <line1>,<line2>call QSort('CmpJavaImports', 1)
command! -nargs=1 -bang -complete=customlist,genutils#UserFileComplete2 FindInPath :find<bang> <args> 
command! -nargs=* -complete=command Redir :new | put! =GetVimCmdOutput('<args>') | setl bufhidden=wipe | setl nomodified

" let g:p4ClientRoot = '/home/tpers/code/tpers-showstore-imbengine_dev-ubuntu' 

" runtime perforce/perforceutils.vim
" runtime perforce/perforcemenu.vim

function! s:SetWindowSize()
    if has("unix")
        if has("gui_running")
            " GUI is running or is about to start.
            " Maximize gvim window.
            
            let l:desktopSize = system( "wmctrl -d | tr '\t' ' ' | grep \"Workspace 1\" | cut -d ' ' -f 12" )
            " echo l:desktopSize
            let g:dim = split( l:desktopSize, 'x' )
            " echo l:dim
            " echo l:dim[0]
            " echo l:dim[1]	
            wincmd h
            let l:current_buffer=bufnr("%")
            if bufname( l:current_buffer ) == '__IDE_Project__'
                if g:dim[0] <= 1960
                    set columns=239 lines=70
                    vertical resize 50
                    wincmd w
                    if bufname( bufnr("%") ) == '__Tag_List__'
                        vertical resize 35
                        " quit
                    endif
                else 
                    set columns=468 lines=70
                    vertical resize 150
                    wincmd w
                    if bufname( bufnr("%") ) == '__Tag_List__'
                        vertical resize 86
                    endif
                endif
            else
                set columns=239 lines=70
            endif
        else
            " This is console Vim.
            if exists("+lines")
                set lines=50
            endif
            if exists("+columns")
                set columns=100
            endif
        endif 
    endif
endfunction
