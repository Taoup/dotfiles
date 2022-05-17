set textwidth=80

:inoremap jk <esc>
:inoremap {} {<esc>o}<esc>
":nnoremap ev :e $MYVIMRC<cr>
":nnoremap et :e ~/LIFE/tech/tools<cr>
":nnoremap sv :source $MYVIMRC<cr>
":nnoremap S" viw<esc>a"<esc>bi"<esc>lel
":nnoremap H 0
":nnoremap L $
":nnoremap <space> o<esc>
:nnoremap / /\v
:nnoremap <F2> oDate:<esc>:r !date<cr>kJ
"operator pending mode mapping: mapping the motion inside parenthesis to p
:onoremap p i(
"compared to previous mapping, the following two is useless, remove it later.
:onoremap in( :<c-u>normal! f(vi(<cr>
:onoremap il( :<c-u>normal! F(vi(<cr>

:cnoremap W w

set cursorcolumn
set cursorline
"normally I use :%s a lot, seldom :s
":nnoremap :s :%s

"exercise in zhejiang univercity pat, using copy whole file a lot
"nnoremap gga ggVG"*y
"nnoremap ,p "*p
"nnoremap [b :bp<CR>
"nnoremap ]b :bn<cr>

:iabbrev adn and
:iabbrev waht what
:iabbrev tehn then
:iabbrev @@ mahongtao0x7e0@163.com
:iabbrev cont count
:iabbrev retuen return
:iabbrev pf printf(

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number
set relativenumber

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
nmap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
 endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else


endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
"packadd matchit

noremap <C-L> <Esc>:TlistToggle<CR><c-w>h
noremap <F5> :NERDTreeToggle<cr>

colorscheme delek
"execute pathogen#infect()

filetype off                  " required!  
  
set rtp+=~/.vim/bundle/vundle/  
call vundle#rc()  
  
" let Vundle manage Vundle  
" required!   
Bundle 'gmarik/vundle' 
" 可以通过以下四种方式指定插件的来源  
" a) 指定Github中vim-scripts仓库中的插件，直接指定插件名称即可，插件明中的空格使用“-”代替。  
"Bundle 'L9'  
  
" b) 指定Github中其他用户仓库的插件，使用“用户名/插件名称”的方式指定  
"Bundle 'tpope/vim-fugitive'  
"Bundle 'Lokaltog/vim-easymotion'  
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}  
"Bundle 'tpope/vim-rails.git'  
Bundle 'scrooloose/nerdtree.git'  
"Bundle 'Valloric/YouCompleteMe'  
Bundle 'yegappan/taglist'
" c) 指定非Github的Git仓库的插件，需要使用git地址  
"Bundle 'git://git.wincent.com/command-t.git'  
  
" d) 指定本地Git仓库中的插件  
"Bundle 'file:///Users/gmarik/path/to/plugin'  
  
filetype plugin indent on     " required!

" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" " ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
