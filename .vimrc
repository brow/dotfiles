execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme solarized

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
set textwidth=79
set colorcolumn=80
set equalalways
set foldmethod=indent
set foldlevelstart=99
set dictionary+=/usr/share/dict/words
set backspace=2

" Allow project-local .vimrc
" https://andrew.stwrt.ca/posts/project-specific-vimrc/
set exrc
set secure

set wildignore+=build,.DS_Store,.git

" Use system clipboard
set clipboard=unnamed

" Recommended by https://github.com/airblade/vim-gitgutter#getting-started
set updatetime=250

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['^\.DS_Store$','^build$','\.o$','^\.netrwhist$','^\.git$']

" NERDCommenter
let NERDSpaceDelims=1

" gitgutter
let g:gitgutter_highlight_lines = 1

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

" Write all buffers before building
au QuickFixCmdPre make wall

" jedi-vim
" Avoid conflict with <leader>n to open NERDTree
let g:jedi#usages_command = "<leader>u"

" Match background to iTerm profile (light vs. dark)
" http://apas.gr/2018/11/dark-mode-macos-safari-iterm-vim/
let iterm_profile = $ITERM_PROFILE
if iterm_profile == "Dark"
    set background=dark
else
    set background=light
endif

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
vnoremap <tab> %
vnoremap < <gv
vnoremap > >gv
noremap ; :
map : <Nop>
map q <Nop>
