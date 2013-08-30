setlocal noexpandtab

" When completion opens a preview buffer, close it after a completion is
" selected
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
