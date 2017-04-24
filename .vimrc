set encoding=utf-8
set nocompatible        
filetype off             
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'gregsexton/Muon'
Plugin 'endel/vim-github-colorscheme'
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'nvie/vim-flake8'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'davidhalter/jedi-vim'
Plugin 'SirVer/ultisnips'
call vundle#end()

filetype on 
filetype plugin indent on 
syntax on                
set autoindent            
set tabstop=2              
set path+=**
set shiftwidth=2
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
set clipboard=unnamedplus
set wildmenu
set wildmode=list:longest,full
set nobackup
set nowritebackup
set noswapfile
set colorcolumn=80

colorscheme muon

let g:netrw_banner = 0
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_keepdir = 1
let g:netrw_liststyle = 3

let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:60,results:60'
let g:ctrlp_show_hidden = 1
set wildignore+=*.pyc

autocmd BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter = 1
let g:jedi#use_tabs_not_buffers = 1

let mapleader = ","
map <Leader>q :q<cr>
map <Leader>w :w<cr>
nmap <Leader>f :e .<CR>
nmap <Leader><F6> :source ~/.vimrc<CR>
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation
nnoremap <F9> :!ctags -R .<cr>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tabnext<cr>
nmap <leader>v :vsp<cr>
nmap <leader>tn :tabnew .<cr>
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-h> <c-w>h
nmap <Leader>S :Ack! -i 
nmap <Leader>cn :cnext<CR>
nmap <Leader>cp :cprev<CR>
nmap <Leader>co :copen<CR>
nmap <Leader>cx :cclose<CR>
nnoremap <F3> :set hlsearch! hlsearch?<cr>
nmap <Leader>ev :tabnew ~/.vimrc<CR>
nmap <Leader>ez :tabnew ~/.zshrc<CR>
nmap <Leader>ea :tabnew ~/.aliases<CR>
nmap <Leader>es :tabnew ~/.vim/UltiSnips/<CR>
nmap <Leader>csd :colorscheme muon<CR>
nmap <Leader>csl :colorscheme github<CR>
