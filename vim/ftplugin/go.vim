" vim-go
"
" Enable goimports to automatically insert import paths instead of gofmt:
let g:go_fmt_command = "goimports"

syntax enable  
filetype plugin on  
set number  
let g:go_disable_autoinstall = 0

"
"Sometimes when using both vim-go and syntastic Vim will start lagging 
"while saving and opening files. The following fixes this:
"source: https://github.com/fatih/vim-go#using-with-syntastic
"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


" Syntax highlighting for vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" By default new terminals are opened in a vertical split. To change it
"
let g:go_term_mode = "split"
let g:go_term_enabled = 1


" Quickly navigate through these location lists with :lne for next error and :lp for previous.
"
map <C-n> :lne<CR>
map <C-m> :lp<CR>

setlocal softtabstop=2
setlocal listchars=tab:\ \ ,trail:·,nbsp:·

compiler go
