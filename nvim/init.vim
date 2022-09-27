" hide buffer instead of closing
set hidden

" enable much needed numbering
set nu

" all the search stuff
set incsearch
set hlsearch
set smartcase
set ignorecase

" disable error bells
set noerrorbells

" disable .swp file
set noswapfile
set nobackup

" enable mouse support for cursor movement
set mouse=a

" indentatian defaults
set tabstop=4
set shiftwidth=4
set expandtab

" filetype detection and specifics
filetype on
filetype plugin on
filetype indent on

" natural splits
set splitbelow
set splitright

" for slow ssh -- needs testing
set lazyredraw
set ttyfast

" disable mode - mightneed use
set noshowmode

" insert mode completions
set completeopt=menu,menuone,noselect,preview

" enable sign column
set signcolumn=yes
highlight clear SignColumn

" clipboard setup
set clipboard+=unnamed,unnamedplus

" set leader key
let mapleader=" "

call plug#begin('C:\tools\.js-config\nvim-data\plugged')
" lsp plugins
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'onsails/lspkind.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

" nvim-tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'artur-shaik/jc.nvim'
Plug 'L3MON4D3/LuaSnip'

" nvim for browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" colorscheme
Plug 'UndeadLeech/vim-undead'
Plug 'NLKNguyen/papercolor-theme'

" Nifty plugins
Plug 'karb94/neoscroll.nvim'
Plug 'gosukiwi/vim-smartpairs'
Plug 'luochen1990/rainbow'
Plug 'sunaku/tmux-navigate'
Plug 'junegunn/goyo.vim'
call plug#end()

" lsp and autocomplete setup
lua <<EOF
local nvim_lsp = require('lspconfig')
--local servers = { 'tsserver' }

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    -- gD - go to declaration
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- gd - go to definition
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- K - show info about symbol
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- gi - go to implementation
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- gr - go to references
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

--for _, lsp in ipairs(servers) do
--    nvim_lsp[lsp].setup {
--        on_attach = on_attach
--    }
--end

-- java autocomplete
require('jc').setup{}

-- nvim-cmp
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

-- better autocompletion experience
vim.o.completeopt = 'menuone,noselect'

cmp.setup {
    -- Format the autocomplete menu
    formatting = {
        format = lspkind.cmp_format()
    },
    mapping = {
        -- Use Tab and shift-Tab to navigate autocomplete menu
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}
EOF

" treesitter setup
lua <<EOF
local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    highlight = {
        enable = true
    }
}
EOF

" file tree plugin setup
lua <<EOF
require("nvim-tree").setup({
sync_root_with_cwd = false,
update_cwd = true,
update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
    },
})
EOF
nnoremap <F8> :NvimTreeFindFileToggle<CR>

" telescope plugin setup
lua << EOF
require('telescope').setup {
    defaults = {
    file_ignore_patterns = { ".git/", "node_modules" },
    path_display = { "smart" },
    },
    extensions = {
    fzf = {
        fuzzy = true,
        override_generic_sorter = false,
        override_file_sorter = true,
        case_mode = "smart_case"
        },
    },
    pickers = {
        buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            theme = "dropdown",
            previewer = false
            }
        }
    }
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
EOF
nnoremap <C-p> <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files previewer=false<cr>
nnoremap <leader>fs <cmd>lua require 'telescope'.extensions.file_browser.file_browser( { path = vim.fn.expand('%:p:h') } )<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers <cr>

" colorscheme 
"colorscheme undead
colorscheme PaperColor
set background=dark

" firenvim 
if exists('g:started_by_firenvim')
  set laststatus=0
  colorscheme pyte
  set signcolumn=no
else
  set laststatus=2
endif

let g:firenvim_config = { 
    \ 'localSettings': {
        \ '.*': {
            \ 'priority': 0,
            \ 'takeover': 'never',
            \ 'cmdline' : 'firenvim',
        \ },
    \ }
\ }

" airline config
let g:airline_theme='undead'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_min_count = 2

" enable smooth scrolling
lua require('neoscroll').setup()

" easy escape
inoremap jj <esc>

" to map <space>p as paste last copied
nnoremap <leader>p "0p
nnoremap <leader>P "0P

" colored brackets
let g:rainbow_active = 1

" toggle between relative and absolute numbering
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" easy debugging
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>
