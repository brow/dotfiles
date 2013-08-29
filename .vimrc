execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme solarized

" Show line numbers
set number

" Match sign column background to line number column background
hi! link SignColumn LineNr

" Highlight matches during and after entering a search
set incsearch hlsearch

set wildignore+=build

" Configuration for NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['^.DS_Store','build','.o$']

" Configuration for clang_complete
let g:clang_snippets = 1
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" Hit esc to clear search highlighting
nnoremap <esc> :noh<return><esc>

" Use OS X clipboard
set clipboard=unnamed

" Use C-h and C-l to navigate tabs
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

" Ignore Haskell build files
set wildignore+=dist,cabal-dev,*.hi
let NERDTreeIgnore+=['^dist$','^cabal-dev$','.hi$']

" Automatically generate tags for projects with Cabalfile
let g:haskell_autotags = 1
let g:haskell_autotags_generator = 'hothasktags'

" Disable swap files
set noswapfile

" Disable code folding
set nofoldenable
au BufEnter * set nofoldenable

" Don't prompt before reloading files changed outside vim
set autoread

" Delete trailing whitespace before saving
" au BufWritePre * :%s/\s\+$//e

" Save before make
au QuickFixCmdPre make write

" Mappings
:map <leader>n :NERDTreeToggle<CR>
