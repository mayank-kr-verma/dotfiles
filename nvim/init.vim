set nu rnu
set tabstop=5 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
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

call plug#begin('~/.config/nvim-data/plugged')
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'rstacruz/vim-closer'
Plug 'luochen1990/rainbow'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'github/copilot.vim'
call plug#end()

" move around easier (might need changes)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easy escape
inoremap jj <esc>

" to map <space>p as paste last copied
let mapleader="/"
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

" for tagbar
nnoremap <F8> :TagbarToggle<CR>

" to run current file with python inside vim terminal
inoremap <F3> <Esc>:w<CR>:!python3 %:p<CR>
nnoremap <F3> :w<CR>:!python3 %:p<CR>
