" エンコーディング
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8

" 基本設定
set t_Co=256
set number
set autoindent
set cindent
set wildmenu
set title
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set hidden
set scrolloff=3
set showcmd
set history=5000
set backupcopy=yes
set vb t_vb=
set novisualbell
inoremap jk <Esc>

" 検索
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" 置換
nnoremap gs  :<C-u>%s///g<Left><Left><Left>
vnoremap gs  :s///g<Left><Left><Left>

" 保存時に行末の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge

" ウィンドウ間の移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" バッファ
set hidden
set nosol   "buffer間をカーソル位置を保存して移動
nnoremap <Space>bp :bp<CR>
nnoremap <Space>bn :bn<CR>
nnoremap <Space>bb :b#<CR>
nnoremap <Space>bf :bf<CR>
nnoremap <Space>bl :bl<CR>
nnoremap <Space>bd :bp<bar>bd#<CR>

" バックスペースでの削除を有効に
set backspace=indent,eol,start

" auto update
set autoread

" show match
set showmatch
set matchtime=3

" クリップボードを共有
if has("clipboard")
  vmap ,y "+y
  nmap ,p "+gp

  " exclude: {pattern} must be last ^= prepend += append
  if has("gui_running") || has("xterm_clipboard")
    silent! set clipboard^=unnameplus
    set clipboard^=unnamed
  endif
endif
set clipboard+=unnamed

" reset ime state
inoremap <silent> <esc> <esc>
inoremap <silent> <c-[> <esc>

" ----- dein settings start -----
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim/bin/python'
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
if has('nvim')
if &compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

" dein本体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#load_toml('~/.config/nvim/dein_python.toml', {'on_ft': 'python'})
  call dein#load_toml('~/.config/nvim/dein_go.toml', {'on_ft': 'go'})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
endif
" ----- dein settings end -----

filetype plugin indent on
syntax enable
set background=dark
colorscheme gruvbox

