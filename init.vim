
set scrolloff=8
set tabstop=4 softtabstop=4
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set colorcolumn=80

filetype plugin on
"Activate mapping of systemclipboard to "+ register
set clipboard+=unnamedplus


call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'psf/black'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvie/vim-flake8'
call plug#end()

let g:ale_linters = {'python': ['flake8']}
let g:ale_python_black_options='--line-length=80'
colorscheme catppuccin

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader><CR>e :e ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

vnoremap <leader>y "+y
" Shift selection up or down
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Copy pasting
nnoremap <leader>y "+y

" Allow toggling for linenumbers
nnoremap <leader>tn :set rnu!<CR>


