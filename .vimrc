set encoding=utf-8
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'endel/vim-github-colorscheme'
Plugin 'gregsexton/Muon'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mileszs/ack.vim'
Plugin 'janko-m/vim-test'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'tyru/open-browser.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'zchee/deoplete-jedi'
Plugin 'davidhalter/jedi-vim'
" FIX isort to take local apps
Plugin 'fisadev/vim-isort'
Plugin 'SirVer/ultisnips'
Plugin 'sheerun/vim-polyglot'
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
" set nofoldenable
set foldmethod=indent
set foldnestmax=1
set foldlevel=1
set clipboard=unnamed
set wildmenu
set wildmode=list:longest,full
set nobackup
set nowritebackup
set noswapfile
set colorcolumn=80
set list listchars=tab:»·,trail:·,nbsp:·

colorscheme github

let g:netrw_banner = 0
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_keepdir = 1
let g:netrw_liststyle = 3

set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set wildignore+=*.pyc,node_modules
set wildignore+=node_modules/*

let test#python#runner = 'pytest'
let test#python#pytest#executable = 'docker-compose -f dev.yml run --rm --no-deps django pytest -v'

let g:jedi#use_tabs_not_buffers = 1
let g:jedi#completions_enabled = 0
let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['gitbranch', 'relativepath', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok'], ['filetype'],]
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head'
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" FZF colorscheme
function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['Comment',      'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code > 0
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
  autocmd!
  autocmd ColorScheme * call <sid>update_fzf_colors()
augroup END


let mapleader = ","
map <Leader>q :q<cr>
map <Leader>w :w<cr>
nmap ; :Buffers<CR>
nmap <Leader><F6> :source ~/.vimrc<CR>
nmap <Leader>F :tabnew .<cr>
nmap <Leader>S :Ack! -i 
nmap <Leader>na :ALENext<cr>
nmap <Leader>cn :cnext<CR>
nmap <Leader>co :copen<CR>
nmap <Leader>cp :cprev<CR>
nmap <Leader>cx :cclose<CR>
nmap <Leader>ea :tabnew ~/.aliases<CR>
nmap <Leader>es :tabnew ~/.vim/UltiSnips/<CR>
nmap <Leader>ev :tabnew ~/.vimrc<CR>
nmap <Leader>ez :tabnew ~/.zshrc<CR>
nmap <Leader>f :e .<CR>
nmap <c-t> :Tags<CR>
nmap <c-p> :Files<CR>
nmap <Leader>v :vsp<cr>
nmap <Leader>W :OpenBrowserSmartSearch 
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gm :Gcommit<CR>
nmap <Leader>gco :Git checkout 
nmap <Leader>gcb :Git checkout -b 
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>tl :TestLast<CR>
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>ts :TestSuite<CR>
nnoremap <F3> :set hlsearch! hlsearch?<cr>
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
noremap <Leader>bs :resize 90<cr>
noremap <Leader>ss :resize 10<cr>
vnoremap < <gv
noremap > >gv
