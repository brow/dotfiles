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

" Configuration for NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = []

" Configuration for clang_complete
let g:clang_snippets = 1
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" When completion opens a preview buffer, close it after a completion is
" selected
autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Hit esc to clear search highlighting
nnoremap <esc> :noh<return><esc>

" Use OS X clipboard
set clipboard=unnamed

" Use C-h and C-l to navigate tabs
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

" Ignore Haskell build files
set wildignore+=dist,cabal-dev,*.hi
let NERDTreeIgnore += ['^dist$','^cabal-dev$','.hi$','.o$']

" Use neco-ghc for Haskell completions
au FileType haskell setlocal omnifunc=necoghc#omnifunc

" Automatically generate tags for projects with Cabalfile
let g:haskell_autotags = 1
let g:haskell_autotags_generator = 'hothasktags'

" Default to using cabal for building
au FileType haskell\|cabal compiler cabal

" Disable swap files
set noswapfile

" Disable code folding
set nofoldenable
au BufEnter * set nofoldenable

" Override Markdown editing behavior
au FileType markdown setlocal textwidth=0 spell

" Don't prompt before reloading files changed outside vim
set autoread

" Delete trailing whitespace before saving
au BufWritePre * :%s/\s\+$//e

" Save before make
au QuickFixCmdPre make write

" Mappings
:map <leader>n :NERDTreeToggle<CR>
