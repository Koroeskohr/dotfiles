" Enable python support
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python2_host_prog = '/usr/local/bin/python2'

"""""""""""" vim-plug config
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align' " Not configured
Plug 'scrooloose/nerdtree' " Not configured
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline' " Not configured
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround' " Not configured
Plug 'Raimondi/delimitMate' " Not configured
Plug 'ntpeters/vim-better-whitespace' " Not configured
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter' " Not configured
Plug 'derekwyatt/vim-scala'
Plug 'w0rp/ale' " Not configured
Plug 'valloric/YouCompleteMe', { 'do': 'if command -v rust cmake; then python3 ~/.vim/plugged/YouCompleteMe/install.py --rust-completer --ts-completer; else echo \"CMake or Rust is missing\"; exit 1; fi' }
Plug 'posva/vim-vue', {'for': 'vue'} " Not configured
Plug 'mxw/vim-jsx', {'for': 'javascript'} " Not configured
Plug 'pangloss/vim-javascript', {'for': 'javascript'} " Not configured
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

"""""""""""" Display config
set background=dark
colorscheme hybrid_material

"""""""""""" Editor config
set number
set ruler
set colorcolumn=120
set cursorline
set cursorcolumn
set scrolloff=5
"set autochdir
set mouse=a
set completeopt=longest,menuone
set inccommand=nosplit
set wildmode=longest,list,full
set nocompatible
set title
set showcmd
syntax on
filetype plugin indent on


" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab

set autoindent

"""""""""""" Button mapping
" Set leader
let mapleader=","

" Faster scrolling
nnoremap <silent> <C-k> 10k
nnoremap <silent> <C-j> 10j
nnoremap <silent> <C-Up> 10k
nnoremap <silent> <C-Down> 10j

nmap <silent> <leader>h <C-w>h
nmap <silent> <leader>l <C-w>l

" Close buffer, not window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Fuzzy file search
map <leader>t :FZF<CR>

nmap <silent> <C-b> :NERDTreeToggle<CR>

command CDC echo %:p:h | cd %:p:h

"""""""""""" Language specific config
autocmd BufRead,BufNewFile *.py set expandtab
autocmd BufRead,BufNewFile *.md set linebreak

"'"""""""""" Plugin specific config

"""" Vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='violet'

"""" ALE (linter)
let g:airline#extensions#ale#enabled = 1

"""" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

