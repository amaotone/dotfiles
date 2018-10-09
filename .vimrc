" vimrc
" Author: Amane Suzuki

syntax on

" エンコーディング
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8

" 基本設定
set number
set autoindent
set cindent
set wildmenu
set title
set ruler
set tabstop=2
set shiftwidth=2
set expandtab
set nobackup
set noswapfile
set hidden
set scrolloff=3
set showcmd
set history=5000
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

" 保存時に行末の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge

" ウィンドウ間の移動を楽にする
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

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
set clipboard+=autoselect

" reset ime state
inoremap <silent> <esc> <esc>
inoremap <silent> <c-[> <esc>

"========================================
" プラグイン(vim-plug)
"========================================
call plug#begin('~/.vim/plugged')
Plug 'Shougo/unite.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
call plug#end()
