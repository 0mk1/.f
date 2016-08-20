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
Plugin 'nanotech/jellybeans.vim'
" Plugin 'toffi9/luna.vim'

" Utils (processing, searching, etc.)
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'

" Snippets
Plugin 'SirVer/ultisnips'

" Python specific tools
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim' " Using instead of python-mode Rope autocomplate

" Javascript specific tools (i use js only for frontend stuff)

" Go-lang specific tools
Plugin 'fatih/vim-go'

" Syntax highlighting
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
set tabstop=2                     " set indent to 2 spaces
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
set list listchars=tab:»»,trail:·,eol:¬ " show extra space characters

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Looks
set background=dark
set t_Co=256
colorscheme jellybeans

" Statusline
set statusline=
set statusline +=%1*\ %{ModeStatusline()}\ %*  "Mode
set statusline +=%m%r%h%w%q%*        "modified flag
set statusline +=\ %<%f%*            "full path
set statusline +=%=\[%{&ff}\]%*      "file format
set statusline +=%y%*                "file type
set statusline +=\ %l%*             "current line
set statusline +=/%L\ (%P)%*         "total lines

" Insert special hightlight statusline
au InsertEnter * hi statusline guibg=25 ctermbg=25
au InsertLeave * hi statusline guibg=black ctermbg=black

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

" CTRL-P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:60,results:60'
let g:ctrlp_show_hidden = 1
set wildignore+=*.pyc

" Netrw
" relative numbers in netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" keeping file folder in netrw
let g:netrw_keepdir= 0

" Python mode configs, pep8, pyflake, run script, breakpoint, better syntax,
" folding, indent
let g:pymode = 1
let g:pymode_options = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_quickfix_maxheight = 4
let g:pymode_options_colorcolumn = 1
let g:pymode_options_max_line_length = 79
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_doc = 0
let g:pymode_doc_bind = ''
let g:pymode_virtualenv = 0
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_lint_signs = 1
let g:pymode_lint_cwindow = 0
let g:pymode_rope = 0 " Rope Project turned off (no autocomplate, and magic)
let g:pymode_rope_completion = 0 " Using jedi-vim instead
let g:pymode_syntax = 1
let g:pymode_motion = 0 " Dont want to use motions

" Jedi vim no docs preview when autocomplate
autocmd FileType python setlocal completeopt-=preview

" Jedi Vim bindings autocomplate, goto, documentation, rename
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#usages_command = "<leader>u"
let g:jedi#rename_command = ""
let g:jedi#documentation_command = "<F8>"
let g:jedi#completions_command = "<C-Space>"

" UltiSnips config. Snippets for quick text editing
let g:UltiSnipsExpandTrigger="<tab>u"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Vim Markdown Preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_use_xdg_open=0
let vim_markdown_preview_temp_file=0
let vim_markdown_preview_browser='Firefox'


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

" Vertical splits
" two
nmap <Leader>v :vsp.<CR>

" Vimgrep utils
nmap <Leader>cn :cnext<CR>
nmap <Leader>cp :cprev<CR>

" F3 to toggle search hightlight
nnoremap <F3> :set hlsearch! hlsearch?<cr>


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


" Quick config edits
nmap <Leader>ev :tabnew ~/.vimrc<cr>
nmap <Leader>et :tabnew ~/.tmux.conf<cr>
nmap <Leader>ez :tabnew ~/.zshrc<cr>
nmap <Leader>ea :tabnew ~/.aliases<cr>
nmap <Leader>es :tabnew ~/.vim/UltiSnips/<cr>
nmap <Leader>ep :tabnew ~/Projekty/local/.plan/README.md<cr>

" Reload vimrc config
nmap <Leader><F6> :source ~/.vimrc<CR>
