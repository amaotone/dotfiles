" Author: Amane Suzuki

syntax on

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

" 方向キーの無効化
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

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
set clipboard+=autoselect

" reset ime state
inoremap <silent> <esc> <esc>
inoremap <silent> <c-[> <esc>

"========================================
" プラグイン(vim-plug)
"========================================
call plug#begin('~/.vim/plugged')
" カラースキーム
Plug 'romainl/Apprentice', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'morhetz/gruvbox', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'w0ng/vim-hybrid', {'do': 'cp colors/* ~/.vim/colors/'}

Plug 'editorconfig/editorconfig-vim'
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
Plug 'cohama/lexima.vim'
Plug 'ctrlpvim/ctrlp.vim'
" golang
Plug 'fatih/vim-go'
" python
Plug 'davidhalter/jedi-vim'
Plug 'klen/python-mode'
Plug 'nvie/vim-flake8'
Plug 'hynek/vim-python-pep8-indent'
call plug#end()

" theme
colorscheme gruvbox

" ale
let g:ale_lint_on_text_changed = 0

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" nerdtree
nnoremap <silent><C-n> :NERDTreeToggle<CR>

" python
let g:pymode_python = 'python3'
let g:jedi#auto_vim_configuration = 0
let g:jedi#force_by_python = 3
let g:jedi#popup_select_first = 0
autocmd FileType python setlocal completeopt-=preview

" go
let g:go_def_mapping_enabled = 0
let g:go_fmt_autosave = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" unite
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

