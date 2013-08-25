execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme solarized

" Configuration for NERDTree
let NERDTreeIgnore = []

" Configuration for clang_complete
let g:clang_snippets = 1
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" When completion opens a preview buffer, close it after a completion is
" selected
autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Mappings
:map <leader>n :NERDTreeToggle<CR>
