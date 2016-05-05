execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme solarized
set background=light

set number
set incsearch hlsearch
set noswapfile
set autoread
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nocindent
set nosmartindent
set autoindent
set linebreak
set ignorecase smartcase
set gdefault
set ruler
set textwidth=80
set equalalways
set foldmethod=indent
set foldlevelstart=99
set dictionary+=/usr/share/dict/words
set backspace=2

set wildignore+=build,.DS_Store,.git

" Use system clipboard
set clipboard=unnamed

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['^\.DS_Store$','^build$','\.o$','^\.netrwhist$','^\.git$']

" CtrlP
let g:ctrlp_by_filename=1
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0

" Ignore Haskell build files
set wildignore+=dist,cabal-dev,*.hi
let NERDTreeIgnore+=['^dist$','^cabal-dev$','.hi$']

" Ignore Python build files
set wildignore+=*.pyc
let NERDTreeIgnore+=['.pyc$']

" Automatically generate tags for projects with Cabalfile
let g:haskell_autotags = 1
let g:haskell_autotags_generator = 'hothasktags'

" Delete trailing whitespace before saving
" au BufWritePre * :%s/\s\+$//e

" Write all buffers before building
au QuickFixCmdPre make wall

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
vnoremap <tab> %
vnoremap < <gv
vnoremap > >gv
noremap ; :
map : <Nop>
map q <Nop>
