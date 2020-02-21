call plug#begin('~/.vim/plugged')
Plug 'endel/vim-github-colorscheme'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tmhedberg/matchit'
Plug 'danro/rename.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'moby/moby', { 'rtp': 'moby/contrib/syntax/vim/syntax/dockerfile.vim' }
Plug 'chr4/nginx.vim'
Plug 'hashivim/vim-terraform'
Plug 'stephpy/vim-yaml'
call plug#end()

filetype on
filetype plugin indent on
syntax on
scriptencoding utf-8
set termencoding=utf-8
set encoding=utf-8
set autoindent
set tabstop=2
set path+=**
set shiftwidth=2
set backspace=2
set expandtab
set nocompatible
set relativenumber
set number
set showmatch
set showcmd
set noshowmode
set ignorecase
set nohlsearch
set cursorline
set smartcase
set incsearch
set ttimeoutlen=100
set vb
set ruler
set scrolloff=2
set laststatus=2
set foldmethod=indent
set foldnestmax=3
set foldlevel=3
set clipboard=unnamed
set wildmenu
set wildmode=list:longest,full
set nobackup
set nowritebackup
set noswapfile
set colorcolumn=80
" set list listchars=tab:»·,trail:·,nbsp:·
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
set wildignore+=*.pyc
set wildignore+=node_modules/*
set autoread
set lazyredraw
set magic

autocmd Filetype go setlocal smarttab
autocmd Filetype go setlocal shiftwidth=4
autocmd Filetype go setlocal tabstop=4
autocmd Filetype go setlocal lbr
autocmd Filetype go setlocal tw=500
autocmd Filetype go setlocal ai
autocmd Filetype go setlocal si
autocmd Filetype go setlocal wrap

let g:go_fmt_command = "goimports"

colorscheme github
set bg=light
highlight! link SignColumn LineNr

autocmd Filetype gitcommit setlocal spell textwidth=72
" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
" https://vi.stackexchange.com/a/13012
" https://github.com/tpope/vim-vinegar/issues/13#issuecomment-47133890
autocmd FileType netrw setl bufhidden=delete
let g:netrw_banner = 0
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_keepdir = 1
let g:netrw_liststyle = 3

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:python_host_prog  = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1

let mapleader = ","
map <Leader>q :q<cr>
map <Leader>w :w<cr>
nmap <Leader><F6> :source ~/.vimrc<CR>
nmap <Leader>f :e  .<cr>
nmap <Leader>T :tabnew<cr>
nmap <Leader>S :Ack! -i 
nmap <Leader>cn :cnext<CR>
nmap <Leader>co :copen<CR>
nmap <Leader>cp :cprev<CR>
nmap <Leader>cx :cclose<CR>
nmap <Leader>ea :tabnew ~/.aliases<CR>
nmap <Leader>es :tabnew ~/.vim/UltiSnips/<CR>
nmap <Leader>ev :tabnew ~/.vimrc<CR>
nmap <Leader>et :tabnew ~/.tmux.conf<CR>
nmap <Leader>ez :tabnew ~/.zshrc<CR>
nmap <Leader>eg :tabnew ~/.gitconfig<CR>
nmap <c-p> :Files<CR>
nmap <c-g> :GFiles?<CR>
nmap <Leader>v :vnew<cr>
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nnoremap <F3> :set hlsearch! hlsearch?<cr>
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
vnoremap < <gv
noremap > >gv
