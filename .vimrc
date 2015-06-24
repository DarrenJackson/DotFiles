" .vimrc
"
"
" Intro -------------------------------------------------------------------- {{{ 

" za to toggle folds
" zr to unfold all
" zm to fold all
"
"execute pathogen#infect()
"filetype plugin indent on

" }}}
" Vundle ------------------------------------------------------------------- {{{ 

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
let path='~/.vim/bundle'
call vundle#begin(path)
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'zeis/vim-kolor'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
call vundle#end()
filetype plugin indent on

"}}}
" General ------------------------------------------------------------------ {{{ 

let $cortex = "C:\\Cortex\\dev\\Jan\\Src\\Net\\Apps\\Gui"
"
" enable syntax highlighting
syntax on

" Not a vi
set nocompatible
set modelines=0
set encoding=utf-8
set term=xterm

" Misc
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
set hidden
set foldmethod=marker
set undofile	
set fileformat=unix

" Set leader to , (comma)
let mapleader = ","

" }}}
" VIM user interface ------------------------------------------------------- {{{

" Set 7 lines to the curser (top/bottom)
set so=7

" Relative line numbers
set relativenumber

" Command menus, start command and press tab
set wildmenu
set wildmode=list:longest,full

" Always show current position
set ruler

" surround word with ()
noremap <leader>b ysiw) 

" split line at first comma
noremap <leader>j f,li<cr><esc>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" highlight search results, clear by typing ,<space>
set incsearch

" Show matching brackets when cursor is over them
set showmatch

" Highlight search results
set hlsearch

nnoremap <CS-j> <S-j>


" Clear highlighted search by pressing ,<space>
nnoremap <leader><space> :noh<cr>

" No annoying sounds on errors
set noerrorbells
set novisualbell
set vb t_vb=

" Map jj to escape
inoremap jj <esc>

" Show command being entered
set showcmd

" }}}
" Colors and Fonts --------------------------------------------------------- {{{ 

" Set line number colour
highlight LineNr ctermfg=Grey

" Show column 80 in a colour
highlight ColorColumn ctermbg=DarkGrey
set textwidth=80
set colorcolumn=+1 

" Show cursor line
set cursorline

" Cursor line colour
hi CursorLine cterm=NONE ctermbg=DarkGrey ctermfg=White guibg=darkred guifg=white

" Folding colors
:hi Folded ctermbg=LightGrey ctermfg=Black

" }}}
" GVim Options ------------------------------------------------------------- {{{ 

" Set extra options when running in GUI mode
if has('gui_running')

    set renderoptions=type:directx,
        \gamma:1.5,contrast:0.5,geom:1,
        \renmode:5,taamode:1,level:0.5set renderoptions=type:directx,
        \gamma:1.5,contrast:0.5,geom:1,
        \renmode:5,taamode:1,level:0.5

	colorscheme kolor

    "set anti enc=utf-8
    "set guifont=Source_Code_Pro:h10

    " Hide the toolbar
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L

	autocmd GUIEnter * set vb t_vb=
endif

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

" Map space to search
map <space> /
map <c-space> ?

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
" Plugins ------------------------------------------------------------------ {{{
"   FuzzyFinder {{{
nnoremap `f :FufFile<cr> 
nnoremap `c :FufFile $cortex<cr> 
nnoremap `g :FufFile ~/Google Drive/**/<cr> 
"   }}}
" }}}

