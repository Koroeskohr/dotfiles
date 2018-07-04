let g:python_host_prog = '/usr/local/bin/python2.7'
let g:python3_host_prog = '/usr/local/bin/python3.6'

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
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' } " Requires nvim with python support
Plug 'vim-syntastic/syntastic' " Not configured
Plug 'posva/vim-vue' " Not configured
Plug 'mxw/vim-jsx' " Not configured
Plug 'pangloss/vim-javascript' " Not configured

call plug#end()

"""""""""""" Display config
set background=dark
colorscheme hybrid_material

"""""""""""" Editor config
set number
set ruler
set textwidth=120
set cursorline
set cursorcolumn
set autochdir
set mouse=a
set completeopt=longest,menuone
set inccommand=nosplit
set wildmode=longest,list,full
syntax on
filetype plugin indent on

" Enable python support
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python2_host_prog = '/usr/local/bin/python'

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
nnoremap <silent> <C-Up> 10k
nnoremap <silent> <C-Down> 10j

" Close buffer, not window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

map <leader>t :FZF<CR>

"""""""""""" Language specific config
au BufRead,BufNewFile *.py set expandtab

" autocmd BufWritePost *.scala silent :EnTypeCheck
" nnoremap <leader>i :EnType<CR>
" au FileType scala nnoremap <leader>df :EnDeclaration<CR>

"'"""""""""" Plugin specific config

"""" Vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='violet'


"""" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
