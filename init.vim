set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu
set incsearch
set nohlsearch
set smartcase
set ignorecase
set hidden
set noerrorbells
set scrolloff=8
set clipboard^=unnamed,unnamedplus
set noswapfile
set nobackup

call plug#begin('C:\Users\MMAYANKK\AppData\Local\nvim-data\plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'ryanoasis/vim-devicons'
Plug 'rstacruz/vim-closer'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim'
Plug 'preservim/tagbar'
call plug#end()

" move around easier (might need changes)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easy escape
inoremap jj <esc>

" to map <space>p as paste last copied
let mapleader=" "
nnoremap <leader>p "0p

" natural splits
set splitbelow
set splitright

nnoremap <F4> :NERDTreeToggle<CR>

colorscheme onehalfdark

let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" colored brackets
let g:rainbow_active = 1

" for COC completions with tab and shift-tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" for tagbar
nnoremap <F8> :TagbarToggle<CR>
