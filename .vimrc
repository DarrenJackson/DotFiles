" .vimrc - Darren Jackson - 2016/11/30
"
" Intro -------------------------------------------------------------------- {{{ 

" za to toggle folds
" zr to unfold all
" zm to fold all
"
"execute pathogen#infect()

" }}}
" Vundle ------------------------------------------------------------------- {{{ 

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible 

filetype plugin indent on

filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
let path='$HOME/.vim/bundle'
call vundle#begin(path)
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'zeis/vim-kolor'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
call vundle#end()
filetype plugin indent on

"}}}
" General ------------------------------------------------------------------ {{{ 

"let $cortex = "C:\\Cortex\\dev\\Jan\\Src\\Net\\Apps\\Gui"
"au BufNewFile,BufRead *.xaml set filetype=xml

" Syntax highlighting
syntax on

"set modelines=0                        "What does this do?
"set encoding=utf-8
set term=xterm

" Misc
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" Hide buffers instead of closing them
set hidden

set foldmethod=marker
"set fileformat=unix

" Set leader to , (comma)
let mapleader = ","

"set undofile	
set undodir=$HOME/.vim/undodir
set directory=$HOME/.vim/swapdir

" shortcut to source the vim.rc
:nnoremap <leader>sv :source $MYVIMRC<cr>

":nnoremap <PageUp> :bnext<CR>
":nnoremap <PageDown> :bprevious<CR>


" }}}
" VIM user interface ------------------------------------------------------- {{{

" Set 7 lines to the curser (top/bottom)
set so=7 

" Relative line numbers
"set relativenumber

" Command menus, start command and press tab
set wildmenu
set wildmode=list:longest,full

" Always show current position
set ruler

" surround word with ()
"noremap <leader>b ysiw) 

" split line at first comma
"noremap <leader>j f,li<cr><esc>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

set whichwrap+=<,>,h,l

"nnoremap <CS-j> <S-j>


" Show matching brackets when cursor is over them
"set showmatch


" No annoying sounds on errors
set noerrorbells
set novisualbell
set vb t_vb=

" Map jj to escape
inoremap jj <esc>

" Show command being entered
"set showcmd


" }}}
" SEARCH ------------------------------------------------------------------- {{{

" Map space to search
map <space> /
map <c-space> ?

" Ignore case when searching
set ignorecase
set smartcase

" highlight search results, clear by typing ,<space>
set incsearch

" Highlight search result
set hlsearch

" Clear highlighted search by pressing ,<space>
nnoremap <leader><space> :noh<cr>

"}}}
" GVim Options ------------------------------------------------------------- {{{ 


" Set extra options when running in GUI mode
if has('gui_running')

    set renderoptions=type:directx,
        \gamma:1.5,contrast:0.5,geom:1,
        \renmode:5,taamode:1,level:0.5set renderoptions=type:directx,
        \gamma:1.5,contrast:0.5,geom:1,
        \renmode:5,taamode:1,level:0.5


    "set anti enc=utf-8
    set guifont=Source_Code_Pro:h11

    " Hide the toolbar
    set guioptions-=T "toolbar
    set guioptions-=m "menu bar
    set guioptions+=r "right scroll bar
    set guioptions-=L "left scrol bar

    set lines=50 columns=100

	autocmd GUIEnter * set vb t_vb=


" term
else
endif

" }}}
" Colors and Fonts --------------------------------------------------------- {{{ 

" color scheme
colorscheme wombat 

" Search color
hi Search cterm=NONE ctermfg=white ctermbg=darkgrey guibg=peru guifg=wheat

" Set line number colour
"highlight LineNr ctermfg=Grey

" Show column 80 in a colour
"hi ColorColumn ctermbg=DarkGrey
"set textwidth=80
"set colorcolumn=+1 

" Cursor line colour
hi clear cursorline
set cursorline
hi CursorLine ctermbg=Darkblue guibg=black 

" }}}
" Text, tabs and indents  -------------------------------------------------- {{{ 

" 1 tab = 4 spaces 
set tabstop=4
set shiftwidth=4

set softtabstop=4

" Use spaces instead of tabs
set expandtab

" }}}
" Moving around ------------------------------------------------------------ {{{ 

" Split screen with ,w
noremap <leader>w <C-w>v<C-w>l

" Easier way to move between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Use tab instead of % to go to matching bracket
nnoremap <tab> %
vnoremap <tab> %

" Treat long lines as breaks
nnoremap j gj
nnoremap k gk

" position cursor at (screen) middle afer search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Makes :s%/foo/bar do :s%/foo/bar/g
set gdefault


" }}}
" C# ----------------------------------------------------------------------- {{{
" Surround word by Mock<>
"map <leader>m biMock<<ESC>ea><space>
"map <leader><leader>m bipublic class <ESC>ea<space>
"}}}
" Editing mappings --------------------------------------------------------- {{{ 

" Move line(s) of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
		
" Yank a word to reg w
noremap <C-a> "wyiw
noremap <leader>a "wyiw

" Overwrite word at cursor with reg w
noremap <C-s> viw"wp 
noremap <leader>s viw"wp 

" Clone a paragraph
noremap cp yap<S-}>p

"nnoremap <leader>b :!.\build.bat<CR>

" }}}

