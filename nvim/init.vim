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
inoremap <silent> jk <ESC>
inoremap <silent> っj <ESC>

" tab manipulation
nnoremap <C-n> :tabnew %<cr> 
nnoremap <C-h> :tabnext<cr>
nnoremap <C-l> :tabprevious<cr> 

" in normal mode paste on Ctrl+v from the system clipboard
nnoremap <silent> <C-p> "+p
nnoremap <silent> <Leader>n :noh <cr>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap <C-t> <C-O>

filetype plugin indent on
au BufRead,BufNewFile *.jl set filetype=julia

" runtime ./plug.vim

" let g:UltiSnipsExpandTrigger='<c-j>' 
" let g:UltiSnipsJumpForwardTrigger='<c-j>'
" let g:UltiSnipsJumpBackwardTrigger='<c-b>' 
" let g:UltiSnipsEditSplit='vertical'
" let g:completion_enable_snippet = 'UltiSnips'

"----------------------------------------------
" Colors
"----------------------------------------------
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198s
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

set termguicolors
set background=dark

" One colorscheme settings
let g:one_allow_italics = 1

