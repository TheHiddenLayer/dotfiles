" Syntax highlight
syntax on

" Sets
set nu
set colorcolumn=80
set tabstop=4 softtabstop=4
set shiftwidth=4
set scrolloff=8
set hidden
set relativenumber
set noerrorbells
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nohlsearch
set expandtab
set smartindent
set updatetime=50
set shortmess+=c
set cmdheight=2
set exrc
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'

call plug#end()

" Colors
colorscheme gruvbox
set background=dark

" Functions
if executable('rg')
    let g:rg_derive_root='true'
endif

" Autocommands
autocmd BufWritePre *.js Neoformat

" Remaps
let g:ctrlp_user_command = ['.git/' , 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] 
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<leader>f'

:imap jk <Esc>
:imap kj <Esc>

nnoremap <leader>q :q<CR> 
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> <leader>- :vertical resize +15<CR>
nnoremap <silent> <leader>+ :vertical resize -15<CR>
