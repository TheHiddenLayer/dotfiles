" Syntax highlight
syntax on

" --- SETS
set exrc
set nu
set colorcolumn=80
set cursorline
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
set updatetime=100
set cmdheight=1
set completeopt=menuone,noinsert,noselect
set signcolumn=yes "auto or number"
set noshowmode
set noshowcmd
set shortmess+=F

" --- PLUG-INS 
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'    " javaScript support
Plug 'leafgarland/typescript-vim' " typeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " js and JSX syntax
Plug 'alvan/vim-closetag'         " closing tags
Plug 'jparise/vim-graphql'        " graphQL syntax
Plug 'gruvbox-community/gruvbox'  " colorscheme
Plug 'jremmen/vim-ripgrep'        " pipGrep
Plug 'tpope/vim-fugitive'         " git stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lyuts/vim-rtags'            " great for c++
Plug 'mbbill/undotree'            " epic undo history
Plug 'vim-airline/vim-airline'    " status line
Plug 'jiangmiao/auto-pairs'       " auto brackets
call plug#end()

" --- COLORS 
highlight ColorColumn ctermbg=0 guibg=lightgrey
highlight clear ColorColumn
highlight clear SignColumn
set termguicolors
set background=dark
colorscheme gruvbox

" --- FUNCTIONS 
if executable('rg')
    let g:rg_derive_root='true'
endif

" --- REMAPS / SETINGS
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1

let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_regions =  {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }

:imap jk <Esc>
:imap kj <Esc>

let mapleader = " "
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>
nnoremap <leader>q :q<CR> 
nnoremap <leader>w :w<CR> 
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>u :UndotreeShow<CR>

nnoremap <leader>e :wincmd v<bar> :Ex <bar> :vertical resize 25<CR>
nnoremap <silent> <leader>- :vertical resize +15<CR>
nnoremap <silent> <leader>+ :vertical resize -15<CR>

let g:fzf_buffers_jump = 1

nnoremap <leader>f :Files<CR>
nnoremap <leader>ps :Rg<SPACE>

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-prettier' ] " TypeScript Support
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>af  <Plug>(coc-fix-current)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>

" --- AUTO-COMMANDS 
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
