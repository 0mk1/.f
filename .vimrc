" .vimrc
"
" =============================================================================
" Plugins
" =============================================================================
set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Core plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-markdown'
Plugin 'chase/nginx.vim'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" =============================================================================
" Basic configs
" =============================================================================
syntax on                         " show syntax highlighting
set autoindent                    " set auto indent
set tabstop=2                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set relativenumber                " show relative line numbers
set number
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set nofoldenable                  " disable code folding
set clipboard=unnamedplus             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set list listchars=tab:»»,trail:·,eol:¬ " show extra space characters
set noswapfile
set textwidth=79

" Looks
set background=dark
colorscheme jellybeans
set t_Co=256

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

" CTRL-P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:60,results:60'
let g:ctrlp_show_hidden = 1

" Netrw
" relative numbers in netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" keeping file folder in netrw
let g:netrw_keepdir= 0

" =============================================================================
" Key bindings
" =============================================================================
" set leader key to comma
let mapleader = ","

map <Leader>q :q<cr>
map <Leader>w :w<cr>
map <F3> :nohlsearch<CR>
nmap <Leader>ev :vsp ~/.vimrc<cr>
nmap <Leader>et :vsp ~/.tmux.conf<cr>
nmap <Leader>ez :vsp ~/.zshrc<cr>
nmap <Leader>ea :vsp ~/.aliases<cr>
nmap <Leader>n :e .<CR>
nmap <Leader>cn :cnext<CR>
nmap <Leader>cp :cprev<CR>
nmap <Leader>v :vsp.<CR>
nmap <Leader>fl :vertical resize<CR>
