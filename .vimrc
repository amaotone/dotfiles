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

" ===== キーバインド =====
" 方向キーの無効化
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-sandwich'
Plug 'w0rp/ale'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
call plug#end()


" airline
" let g:airline_theme = 'zenburn'
let laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

