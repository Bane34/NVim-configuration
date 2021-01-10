set nocompatible
filetype off

"call plug namager
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox' "Apareance
Plug 'tpope/vim-fugitive' "Git integration
Plug 'preservim/nerdtree' "Directory viusalization
Plug 'dense-analysis/ale'
Plug 'tpenguinltg/vim-closing-brackets'

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/nvim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-clang'
Plug 'sbdchd/neoformat'
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}
call plug#end()

set number
colorscheme gruvbox
map <silent> <C-n> :NERDTreeFocus<CR>
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

function! LightlineReadonly()
	return &readonly && filetype !=# 'help' ? 'RO' : ''
endfunction

let g:deoplete#enable_at_startup = 1

let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
\}

" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
