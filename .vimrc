" Syntax highlight
syntax on

" --- SETS
set nu
set colorcolumn=80
set tabstop=2 softtabstop=2
set shiftwidth=2
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
set updatetime=300
set shortmess+=c
set cmdheight=2
set exrc
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
highlight ColorColumn ctermbg=0 guibg=lightgrey

" --- PLUG-INS 
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'gruvbox-community/gruvbox'  " Colorscheme
Plug 'jremmen/vim-ripgrep'        " RipGrep
Plug 'tpope/vim-fugitive'         " git stuff
Plug 'kien/ctrlp.vim'             " fast search
Plug 'vim-utils/vim-man'          " also git stuff
Plug 'lyuts/vim-rtags'            " great for c++
Plug 'mbbill/undotree'            " epic undo history
call plug#end()

" --- COLORS / GIT
colorscheme gruvbox
set background=dark
"set laststatus=2
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

" --- FUNCTIONS 
if executable('rg')
    let g:rg_derive_root='true'
endif

" --- REMAPS
let g:ctrlp_user_command = ['.git/' , 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] 
let mapleader = " "
let g:ctrlp_use_caching = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-prettier' ] " TypeScript Support
:imap jk <Esc>
:imap kj <Esc>
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>
nnoremap <leader>q :q<CR> 
nnoremap <leader>w :w<CR> 
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>e :wincmd v<bar> :Ex <bar> :vertical resize 25<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> <leader>- :vertical resize +15<CR>
nnoremap <silent> <leader>+ :vertical resize -15<CR>
" CoC Remaps
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)
" Rename variables (local || global)
nnoremap rv gd[{V%::s/<C-R>///gc<left><left><left>
nnoremap rvg gD:%s/<C-R>///gc<left><left><left>

" --- AUTO-COMMANDS 
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
