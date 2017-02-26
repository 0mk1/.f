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

" Plugin Manager
Plugin 'VundleVim/Vundle.vim'

" Colorscheme
Plugin 'arcticicestudio/nord-vim'

" Utils (processing, searching, etc.)
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'

" Syntax highlighting
Plugin 'chase/nginx.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" =============================================================================
" Basic configs
" =============================================================================
syntax on                         " show syntax highlighting
set autoindent                    " set auto indent
set tabstop=2                     " set indent to 2 spaces
set path+=**
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set relativenumber                " show relative line numbers
set number
set showmatch                     " show bracket matches
set showcmd
set noshowmode
set ignorecase                    " ignore case in search
set nohlsearch                    " highlight all search matches
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
" set list listchars=tab:»»,trail:· " show extra space characters

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Looks
set background=dark
set t_Co=256
colorscheme nord

" Statusline
set statusline=
set statusline +=%<%f%*            "full path
set statusline +=%m%r%h%w%q%*        "modified flag
set statusline +=%=[%{ModeStatusline()}]%*  "Mode
set statusline +=%=\[%{&ff}\]%*      "file format
set statusline +=%y%*                "file type
set statusline +=\ %l%*             "current line
set statusline +=/%L\ (%P)%*         "total lines

" Signs colors
hi SignColumn guibg=232 ctermbg=232

" Statusline colors
hi statusline guibg=230 ctermbg=230 guifg=black ctermfg=black
hi statuslineNC guibg=234 ctermbg=234 guifg=240 ctermfg=240

" Insert special hightlight statusline
au InsertEnter * hi statusline guibg=25 ctermbg=25 ctermfg=231
au InsertLeave * hi statusline guibg=230 ctermbg=230 ctermfg=233

" Mode Name in Statusline (Normal, Insert, Visual)
function! ModeStatusline()
  if mode() == 'n'
    return 'Normal'
  elseif mode() == 'i'
    return 'Insert'
  elseif mode() == 'v' || mode() == 'V' || mode() == '^V'
    return 'Visual'
  else
    return mode()
  endif
endfunction


" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

" Netrw
let g:netrw_banner = 0
" relative numbers in netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" keeping file folder in netrw
let g:netrw_keepdir = 1
" Changing netrw listing style to tree
let g:netrw_liststyle = 3

" =============================================================================
" Custom key bindings
" =============================================================================
" set leader key to comma
let mapleader = ","

" Quit/Save bindings
map <Leader>q :q<cr>
map <Leader>w :w<cr>

" Open netrw in current window
nmap <Leader>n :e .<CR>
