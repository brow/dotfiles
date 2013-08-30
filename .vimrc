execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme slate
set background=dark

set number
set incsearch hlsearch
set noswapfile
set autoread
set wildignore+=build

" Use system clipboard
set clipboard=unnamed

" clang_complete
let g:clang_snippets = 1
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['^.DS_Store$','^build$','.o$','.netrwhist$']

" CtrlP
let g:ctrlp_by_filename=1

" Ignore Haskell build files
set wildignore+=dist,cabal-dev,*.hi
let NERDTreeIgnore+=['^dist$','^cabal-dev$','.hi$']

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
nnoremap <esc> :noh<return><esc>
vnoremap <tab> %
vnoremap < <gv
vnoremap > >gv
inoremap jj <ESC>
nnoremap ; :
map : <Nop>
