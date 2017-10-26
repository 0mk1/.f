set encoding=utf-8
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'endel/vim-github-colorscheme'
Plugin 'gregsexton/Muon'
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mileszs/ack.vim'
Plugin 'janko-m/vim-test'
Plugin 'nvie/vim-flake8'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'davidhalter/jedi-vim'
Plugin 'SirVer/ultisnips'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}  " Dockerfile Vim syntax
call vundle#end()

filetype on
filetype plugin indent on
syntax on
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
set nofoldenable
set clipboard=unnamed
set wildmenu
set wildmode=list:longest,full
set nobackup
set nowritebackup
set noswapfile
set colorcolumn=80
set list listchars=tab:»·,trail:·,nbsp:·

colorscheme muon

let g:netrw_banner = 0
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_keepdir = 1
let g:netrw_liststyle = 3

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'

let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:60,results:60'
let g:ctrlp_show_hidden = 1
set wildignore+=*.pyc,node_modules
set wildignore+=node_modules/*

let test#python#runner = 'pytest'
let test#python#pytest#executable = 'docker-compose -f dev.yml run --rm --no-deps django pytest -vv'

autocmd BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter = 1
let g:jedi#use_tabs_not_buffers = 1

let mapleader = ","
map <Leader>q :q<cr>
map <Leader>w :w<cr>
nmap <Leader><F6> :source ~/.vimrc<CR>
nmap <Leader>S :Ack! -i 
nmap <Leader>cn :cnext<CR>
nmap <Leader>co :copen<CR>
nmap <Leader>cp :cprev<CR>
nmap <Leader>cx :cclose<CR>
nmap <Leader>ea :tabnew ~/.aliases<CR>
nmap <Leader>es :tabnew ~/.vim/UltiSnips/<CR>
nmap <Leader>ev :tabnew ~/.vimrc<CR>
nmap <Leader>ez :tabnew ~/.zshrc<CR>
nmap <Leader>f :e .<CR>
nmap <Leader>F :tabnew .<cr>
nmap <Leader><F8> :call Flake8()<cr>
nmap <Leader>v :vsp<cr>
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>ts :TestSuite<CR>
nmap <silent> <Leader>tv :TestVisit<CR>
nmap <silent> <Leader>tl :TestLast<CR>
nmap <silent> <Leader>tn :TestNearest<CR>
nnoremap <F3> :set hlsearch! hlsearch?<cr>
noremap <Leader>ss :resize 10<cr>
noremap <Leader>bs :resize 80<cr>
noremap <Leader>0 :tabnext<cr>
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt
noremap <Leader>7 7gt
noremap <Leader>8 8gt
noremap <Leader>9 9gt
vnoremap < <gv
vnoremap > >gv
