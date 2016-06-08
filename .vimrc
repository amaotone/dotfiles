"====================
" Filename: .vimrc
" Description: vim configulation file
" Author: Amane Suzuki
"====================

" basic config
syntax on
set number
set autoindent
set cindent
set wildmenu
set title
set ruler
set tabstop=2
set shiftwidth=2
set expandtab

" encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8

" search
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

" delete highlight with <ESC>*2
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" show command
set showcmd

" auto update
set autoread

" history length
set history=5000

" show match
set showmatch
set matchtime=3

" clipboard sharing
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
