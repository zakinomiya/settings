set number            
set autoindent         
set smartindent         
set autoread 
set cursorline 
set relativenumber 
set tabstop=2         
set shiftwidth=2     
set expandtab       
set splitright     
set clipboard=unnamed
set hls             
set nowrap
set noswapfile
set noerrorbells                 
set novisualbell                
set incsearch
set hlsearch
set mouse=a
set hidden
let mapleader = ";"

syntax enable

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
inoremap <silent> jj <ESC>

nnoremap <C-t> :tabnew<cr> 
nnoremap <C-L> :tabnext<cr>
nnoremap <C-J> :tabprevious<cr> 
nnoremap <Leader>d :Dash<cr>

" in normal mode paste on Ctrl+v from the system clipboard
nnoremap <silent> <C-p> "+p
" in visual mode copy on Ctrl+c from the system clipboard 
vnoremap <silent> <C-y> "+y

nnoremap <silent> <Leader>n :noh <cr>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap <C-t> <C-O>

filetype plugin indent on
au BufRead,BufNewFile *.jl set filetype=julia

runtime ./plug.vim

"----------------------------------------------
" Colors
"----------------------------------------------
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198s
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

set termguicolors
set background=dark

" Material colorscheme settings
let g:material_theme_style = 'darker-community'

" One colorscheme settings
let g:one_allow_italics = 1

let g:neosolarized_termtrans=1
colorscheme NeoSolarized

" Toggle background with <leader>bg
map <leader>bg :let &background = (&background == "dark"? "light" : "dark")<cr>

"----------------------------------------------
" Language: Go
"----------------------------------------------
let g:go_fmt_command = "goimports"
let g:goimports = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

au filetype go inoremap <buffer> . .<C-x><C-o>

"----------------------------------------------
" Language: Rust
"----------------------------------------------
let g:rustfmt_autosave = 1

"----------------------------------------------
" Language: ProtoBuf
"----------------------------------------------
autocmd FileType proto ClangFormatAutoEnable

